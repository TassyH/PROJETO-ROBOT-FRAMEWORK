*** Settings ***
Test Setup      Log To Console    ${\n}
Test Teardown   Log To Console    ${\n}

*** Variables ***
${NUMERO}    ${0}
*** Test Cases ***
Exemplo de bloco com IF 
    IF    ${NUMERO} > 0
        Mostrar mensagem dizendo que o número é maior que zero
        Log    message= Você está vendo essa mensagem porque o bloco IF foi executado e sua condição é verdadeira  console=True 
    ELSE IF    ${NUMERO} < 0 
        Mostrar mensagem dizendo que o número é menor que zero
    ELSE IF    ${NUMERO} == 0 
        Mostrar mensagem dizendo que o número é igual a zero
    END

*** Keywords ***
Mostrar mensagem dizendo que o número é maior que zero
    Log To Console    O número [${NUMERO}] é maior que zero!

Mostrar mensagem dizendo que o número é menor que zero
    Log To Console    O número [${NUMERO}] é menor que zero!

Mostrar mensagem dizendo que o número é igual a zero
    Log To Console    O número [${NUMERO}] é igual a zero!