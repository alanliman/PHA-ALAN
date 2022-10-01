*** Settings ***
Documentation        Exercicio PHA cadastro de um novo usuário

Library           SeleniumLibrary

Test Setup        Abrir o meu navegador 
Test Teardown     Fechar navegador


*** Variables ***
${URL}        https://learningprime.com.br/
${BROWSER}    chrome

*** Test Cases ***

Cenario: validar cadastro e login
    Dado que o cliente tenha realizado o cadastro com sucesso
    E realize o logout
    Quando tentar logar com o mesmo usuário cadastro novamente
    Então o login deverá ser realizado com sucesso.

*** Keywords ***
Dado que o cliente tenha realizado o cadastro com sucesso
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element                    xpath=//a[@href='/login']
    Wait Until Element Is Visible    xpath=//a[@href='/signup']
    Click Element                    xpath=//a[@href='/signup']
    Input Text                       xpath=//*[@id="spree_user_email"]                    robot.lima.alan@pha.com.br
    Input Text                       xpath=//*[@id="spree_user_password"]                 123456789
    Input Text                       xpath=//*[@id="spree_user_password_confirmation"]    123456789
    Click Element                    xpath=//*[@id="new_spree_user"]/div/p[2]/input



E realize o logout
    click Element                    xpath=//a[@href='/logout']

Quando tentar logar com o mesmo usuário cadastro novamente 
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element                    xpath=//a[@href='/login']
    Input Text                       xpath=//*[@id="spree_user_email"]                    robot.lima.alan@pha.com.br
    Input Text                       xpath=//*[@id="spree_user_password"]                 123456789
    Click Element                    xpath=//*[@id="new_spree_user"]/p[2]/input

Então o login deverá ser realizado com sucesso.   
    Wait Until Element Is Visible    xpath=//a[@href='/account']

Abrir o meu navegador
    Open Browser                     ${URL}    ${BROWSER}
    Set Selenium Implicit Wait       30
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

  





    

    
    