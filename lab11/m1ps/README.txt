1) Cada m�dulo projetado deve ser inclu�do dentro da pasta Packages.
2) A pasta mM_toplevel cont�m o vhd do top level do monitor, neste arquivo ser�o realizadas modifica��es para habilitar IO.
3) Qualquer m�dulo adicional que voc� queira usar deve ser colocado dentro de Packages.
4) Caso voc� utilize outro pacote, tenha certeza de incluir a declara��o deste no cabe�alho dos vhd que est�o utilizando.
5) Inclua a pasta Packages como library do seu projeto: Assignments -> Settings -> Libraries -> Add
6) Inclua todos os arquivos de pacotes que voc� usou (lembre-se que o pack.vhd � utilizado) no seu projeto: Assignments -> Settings -> Files -> Add
7) Realize a atribui��o autom�tica de pinos com o arquivo DE1_pin_assignments: Assignments -> Import Assignments. Ap�s isto compile seu projeto novamente.
8) Para trocar o programa a ser executado: no BDF do processor procure por I-Memory e troque o atributo fibonacci.mif pelo desejado. Ap�s isto, compile o projeto novamente.
9) Confiram qual programa voc�s est�o rodando em cada momento. Para ver isso leia a observa��o 8. N�s estamos enviando arquivos xls para realizarem as depura��es. Ao depurar seu programa, seja via waverform seja via mM, acompanhe o procedimento com o xls aberto do lado.