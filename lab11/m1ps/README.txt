1) Cada módulo projetado deve ser incluído dentro da pasta Packages.
2) A pasta mM_toplevel contém o vhd do top level do monitor, neste arquivo serão realizadas modificações para habilitar IO.
3) Qualquer módulo adicional que você queira usar deve ser colocado dentro de Packages.
4) Caso você utilize outro pacote, tenha certeza de incluir a declaração deste no cabeçalho dos vhd que estão utilizando.
5) Inclua a pasta Packages como library do seu projeto: Assignments -> Settings -> Libraries -> Add
6) Inclua todos os arquivos de pacotes que você usou (lembre-se que o pack.vhd é utilizado) no seu projeto: Assignments -> Settings -> Files -> Add
7) Realize a atribuição automática de pinos com o arquivo DE1_pin_assignments: Assignments -> Import Assignments. Após isto compile seu projeto novamente.
8) Para trocar o programa a ser executado: no BDF do processor procure por I-Memory e troque o atributo fibonacci.mif pelo desejado. Após isto, compile o projeto novamente.
9) Confiram qual programa vocês estão rodando em cada momento. Para ver isso leia a observação 8. Nós estamos enviando arquivos xls para realizarem as depurações. Ao depurar seu programa, seja via waverform seja via mM, acompanhe o procedimento com o xls aberto do lado.