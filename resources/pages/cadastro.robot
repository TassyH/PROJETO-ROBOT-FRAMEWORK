*** Settings ***
Resource    ../main.robot
*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...         //option[contains(.,'Programação')]
...         //option[contains(.,'Front-End')]
...         //option[contains(.,'Data Science')]
...         //option[contains(.,'Devops')] 
...         //option[contains(.,'UX e Design')]
...         //option[contains(.,'Mobile')]
...         //option[contains(.,'Inovação e Gestão')]    

*** Keywords ***
Dado que preencha os campos do formulário
    ${Nome}        FakerLibrary.First Name
    Input Text     ${CAMPO_NOME}      ${Nome}
    ${Cargo}       FakerLibrary.Job
    Input Text     ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}      FakerLibrary.Image Url   width=100    height=100
    Input Text     ${CAMPO_IMAGEM}    ${Imagem}
    Click Element     ${CAMPO_TIME}
    Click Element     ${selecionar_times}[0] 
E cliquei no botão "criar card" 
    Click Element     ${BOTAO_CARD} 
    Sleep    5s
Entao identificar o card no time esperado
    Element Should Be Visible    class:colaborador
    Sleep    5s   
Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE   1    3
    Dado que preencha os campos do formulário
    E cliquei no botão "criar card" 
    END
    Sleep    5s

Então criar e identificar um card em cada time disponível 
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que preencha os campos do formulário
        Click Element    ${time}
        E cliquei no botão "criar card"       
    END
    Sleep    7s
Dado que eu clique no botão "Criar Card"
    Click Element    ${BOTAO_CARD}
    Sleep    6s
Então o sistema deve apresentar mensagem de "campo obrigatório"
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro 
    Element Should Be Visible    id:form-times-erro