*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se quando um campo obrigatório nao for preenchido corretamente o sistem exibe uma mensagem de alerta
    Dado que eu clique no botão "Criar Card"
    Então o sistema deve apresentar mensagem de "campo obrigatório"

