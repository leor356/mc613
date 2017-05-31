#!/usr/bin/env python

import sys, time, re, os, string;

try: # Windows needs stdio set for binary mode.
    import msvcrt
    msvcrt.setmode (0, os.O_BINARY) # stdin  = 0
    msvcrt.setmode (1, os.O_BINARY) # stdout = 1
except ImportError:
    pass

class BadInstructionError(Exception):
	def __init__(self, value):
		self.value = value
	def __str__(self):
		return repr(self.value)

def num(val, size):
	binary = string.replace(bin(string.atoi(val,16)),'0b','')
	return ("0" * (size - len(binary)) + binary) 

def reg(val):
	binary = string.replace(bin(string.atoi(val,10)),'0b','')
	return ("0" * (5 - len(binary)) + binary)

####### Decode the instructions #######
def decode(ins):
	bits = ""
	instruction = str.lower(ins[0])
	if instruction == "add":
		bits = "001000" + reg(ins[1]) + reg(ins[2]) + reg(ins[3]) + ("0" * 11)
	elif instruction == "sub":
		bits = "001001" + reg(ins[1]) + reg(ins[2]) + reg(ins[3]) + ("0" * 11)
	elif instruction == "and":
		bits = "001010" + reg(ins[1]) + reg(ins[2]) + reg(ins[3]) + ("0" * 11)
	elif instruction == "or":
		bits = "001011" + reg(ins[1]) + reg(ins[2]) + reg(ins[3]) + ("0" * 11)
	elif instruction == "addi":
		bits = "001100" + reg(ins[1]) + reg(ins[2]) + num(ins[3],16)
	elif instruction == "lw":
		bits = "000111" + reg(ins[1]) + reg(ins[2]) + ("0" * 16)
	elif instruction == "sw":
		bits = "010111" + ("0" * 5) + reg(ins[1]) + reg(ins[2]) + ("0" * 11)
	elif instruction == "in":
		bits = "100000" + reg(ins[1]) + ("0" * 21)
	elif instruction == "out":
		bits = "110000" + ("0" * 5) + reg(ins[1]) + ("0" * 16)
	elif instruction == "j":
		bits = "111111" + num(ins[1], 26) 
	elif instruction == "brz":
		bits = "111000" + num(ins[1], 26)
	elif instruction == "brn":
		bits = "111001" + num(ins[1], 26) 
	elif instruction == "brv":
		bits = "111010" + num(ins[1], 26) 
	elif instruction == "brc":
		bits = "111011" + num(ins[1], 26) 
	elif instruction == "brnz":
		bits = "111100" + num(ins[1], 26) 
	elif instruction == "brnn":
		bits = "111101" + num(ins[1], 26)
	elif instruction == "brnv":
		bits = "111110" + num(ins[1], 26) 
	elif instruction == "halt":
		bits = "011000" + ("0" * 26)
	elif instruction == "ret":
		bits = "101000" + ("0" * 10) + "11101" + ("0" * 11)
	elif instruction == "jr":
		bits = "101000" + ("0" * 10) + reg(ins[1]) + ("0" * 11)
		
	return bits 

####### Analyze the instructions #######
def assembler(m1psCode):
	typeArith = '([aA][dD][dD]|[sS][uU][bB]|[aA][nN][dD]|[oO][rR])'
	typeArithImm = '([aA][dD][dD][iI])'
	typeMem = '(([lL]|[sS])[wW])'
	typeIO = '([iI][nN]|[oO][uU][tT])'
	typeBranch = '([jJ]|([bB][rR]([zZ]|[vV]|[cC]|([nN]([zZ]|[nN]|[Vv])?))))'
	typeHalt = '([hH][aA][lL][tT])'
	typeRet = '([rR][eE][tT])'
	typeJr = '([jJ][rR])'
	address = '(0x[0-3]?[0-9A-Fa-f]{1,6})'
	registers = '([rR][0]*([0-2][0-9]?|[4-9]|[3][0-2]?))' 
	immediate = '(0x[0-9A-Fa-f]{1,4})'
	space = '(\t|\ )*'

	program = []
	ret = []
	
	try:
		for codeLine in m1psCode:

			instruction = codeLine[0]
			ins = []

			instrHalt='(' + space + typeHalt + space + '[\r]*$)'
			result = re.findall(instrHalt, instruction);

			if result != []:
				ins.append(result[0][2])
				program.append(decode(ins))

			instrArith='('+ space + typeArith + space + registers + space + ',' + space + registers + space + ',' + space + registers + space + ')'
			result = re.findall(instrArith, instruction);

			if result != []:
				ins.append(result[0][2])
				ins.append(result[0][5])
				ins.append(result[0][9])
				ins.append(result[0][13])
				program.append(decode(ins))

			instrArithImm='('+ space + typeArithImm + space + registers + space + ',' + space + registers + space + ',' + space + immediate + space + ')'
			result = re.findall(instrArithImm, instruction);

			if result != []:
				ins.append(result[0][2])
				ins.append(result[0][5])
				ins.append(result[0][9])
				ins.append(result[0][12])
				program.append(decode(ins))

			instrMem='('+ space + typeMem + space + registers + space + ',' + space + registers + space + ')'
			result = re.findall(instrMem, instruction);

			if result != []:
				ins.append(result[0][2])
				ins.append(result[0][6])
				ins.append(result[0][10])
				program.append(decode(ins))

			instrIO='('+ space + typeIO + space + registers + space + ')'
			result = re.findall(instrIO, instruction)

			if result != []:
				ins.append(result[0][2])
				ins.append(result[0][5])
				program.append(decode(ins))

			instrBranch='('+ space + typeBranch + space + address + space + '[\r]*$)'
			result = re.findall(instrBranch, instruction);

			if result != []:
				ins.append(result[0][2])
				ins.append(result[0][8])
				program.append(decode(ins))

			instrRet='('+ space + typeRet + space + '[\r]*$)'
			result = re.findall(instrRet, instruction);

			if result != []:
				ins.append(result[0][2])
				program.append(decode(ins))

			instrJr='('+ space + typeJr + space + registers + space + '[\r]*$)'
			result = re.findall(instrJr, instruction);

			if result != []:
				ins.append(result[0][2])
				ins.append(result[0][5])
				program.append(decode(ins))

			if len(ins) == 0:
				raise BadInstructionError("Error (line "+ str(codeLine[1]) + "): The instruction \""+ re.sub("(\t)","    ",re.sub("(\n|\r)","",codeLine[2])) + "\" does not exist or has a syntax problem.")
		ret.append("")
		ret.append(program)

	except BadInstructionError as e:
		ret.append(e)
	except Exception as e:
		ret.append(e)
	finally:
		return ret

#######	Removes comments and blank lines.	#########
#		Resolves directives and labels.				#
#		Check the registers.						#
####### Convert decimal numbers to hex.		#########	
def preassembling(m1psFile):
	comment = '(^(\ |\t)*[#][^\$](.*)$)'
	space = '(\t|\ )*'
	blankLine = '(^(\s)*$)'
	directiveStart = '(^(\ |\t)*#\$)'
	directive = '(^(\ |\t)*#\$(\ |\t)*(WIDTH|DEPTH)(\ |\t)*([0-9]+)(\ |\t|\r)*$)'
	label = '(^(\t|\ )*([a-qA-Qs-zS-Z][0-9a-zA-Z_]*|[rR][a-zA-Z_][0-9a-zA-Z_]*|[rR][0-9]{1,2}[a-zA-Z_]+[0-9a-zA-Z_]*)(:))'
	number = '((\ |\t|,)+([-]?[0-9]+)(\ |\t|\r)*$)'
	registers = '([rR][0-9]+)'

	numLines = 0
	lastLabel = 0
	options = []
	program = []
	labels = []
	ret = []
	
	try:
		for line in m1psFile:

			codeLine = True
			numLines += 1

			result = re.findall(blankLine, line)
			if result != []:
				codeLine = False

			result = re.findall(comment, line);
			if result != []:
				codeLine = False

			result = re.findall(directiveStart, line)
			if result != []:
				result = re.findall(directive, line)
				if result != []:
					if len(program) > 1:
						raise BadInstructionError("Error (line "+ str(numLines) + "): Directive has to be placed in the begin of file and before all instructions.")
					else:
						codeLine = False
						value = string.atoi(result[0][5])
						if result[0][3] == "WIDTH":
							if (value != 8) and (value != 16) and (value != 32):
								raise BadInstructionError("Error (line "+ str(numLines) + "): Directive WIDTH has to be one of this values: 8, 16 or 32.")
						options.append([result[0][3],value])
				else:
					raise BadInstructionError("Error (line "+ str(numLines) + "): Bad directive.")

			if codeLine:
				result = re.findall(registers, line)
				for reg in result:
					r = string.atoi(re.sub('([rR])','',reg),10)
					if r > 31:
						raise BadInstructionError("Error (line "+ str(numLines) + "): The instruction \""+ re.sub("\n","",line) +  "\" has register(s) out of range.")	

				newLine = line
				result = re.findall(number, newLine)
				if result != []:
					num = string.atoi(result[0][2],10)
					if (num < 0):
						num = hex(0xffff + num + 1)
					else:
						num = hex(num)
					newLine = string.replace(newLine,result[0][0],string.replace(result[0][0],result[0][2],num))

				result = re.findall(label, newLine)
				if result != []:
					newLine = string.replace(newLine,result[0][0],"")
					chars = re.findall('([^\t]|[^\ ])',newLine)
					codeLine = len(chars) > 1
					labels.append([result[0][2],hex(len(program))])
			
				if codeLine:
					program.append([newLine,numLines,line])
		
		aux = []			
		while program != []:
			line = program.pop(0)
			for l in labels:
				line[0] = string.replace(line[0],l[0],l[1])
			aux.append(line)
			
		ret.append(options)
		ret.append(aux)
	except BadInstructionError as e:
		ret.append(e)
	except Exception as e:
		ret.append(e)
	finally:
		m1psFile.close()
		return ret

filename = sys.argv[1]

# Test if the file was uploaded
if filename:
	fn = re.findall('(.*\.m1ps)', filename)
	if fn == []:
		message = "The file has to be 'namefile'.m1ps"
	else:
		mem = []
	  	data=preassembling(open(filename,'r'))
		if len(data) == 1:
			message = data.pop(0)
		else:
			directives = data.pop(0)

			# Standart values
			width = 32
			depth = 1024
			
			if len(directives) == 1:
				if directives[0][0] == 'WIDTH':
					width = directives[0][1]
				else:
					depth = directives[0][1]
			elif len(directives) == 2:
				if directives[0][0] == 'WIDTH':
					width = directives[0][1]
					depth = directives[1][1]
				else:
					depth = directives[0][1]
					width = directives[1][1]

			message = "WIDTH=" + str(width) + ";\nDEPTH=" + str(depth) + ";\n\nADDRESS_RADIX=UNS;\nDATA_RADIX=BIN;\n\nCONTENT BEGIN\n"

			code=assembler(data.pop(0))
			if len(code) == 1:
				message = code.pop(0)
			else:
				program = code.pop(1)
		
				i = 0
				for line in program:
					numWords = 32/width
					words = re.findall('('+ (('([0-1]{'+str(width)+'})')*numWords)+ ')',line)
					for j in range(1,len(words[0])):
						message = message + "    " + str(i) + " : " + words[0][j]  + ";\n"
						i += 1

				message = message + "    [" + str(i) + ".." + str(depth-1) + "] : " + ("0" * width) + ";\n"
				message = message + "END;"
	
else:
	message = 'No file was uploaded'
   
print message
