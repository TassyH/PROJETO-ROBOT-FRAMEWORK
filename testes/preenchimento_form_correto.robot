*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo 
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados sao inseridos na lista e se um novo card vai ser criado corretamente
   Dado que preencha os campos do formulário
   E cliquei no botão "criar card"  
   Entao identificar o card no time esperado

Verificar se é possível criar mais de um card sem preencher corretamente
    Dado que preencha os campos do formulário
    E cliquei no botão "criar card"  
    Então identificar 3 cards no time esperado

Verificar se é possível criar um card para cada time disponível se preenchermos os campos corretamente
    Dado que preencha os campos do formulário
    Então criar e identificar um card em cada time disponível 

