*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    XML


*** Variables ***
${URL}                   https://www.saucedemo.com/
${LOGIN}                //input[@id='user-name']
${SENHA}                //input[@id='password']
${BUTTON}               //input[@id='login-button']
${PRODUCT}              //img[@alt='Sauce Labs Bike Light']
${BUTTONPRODUCT}        //button[@id='add-to-cart-sauce-labs-bike-light']
${CARRINHO}             //a[@class='shopping_cart_link']
${CHECKOUT}             //button[@id='checkout']
${FNAME}                //input[@id='first-name']
${LNAME}                //input[@id='last-name']
${ZIP}                  //input[@id='postal-code']
${CONTINUE}             //input[@id='continue']
${FINISH}               //button[@id='finish']

*** Keywords ***

#Cenário 01: Acessar o site Saucedemo
Dado que entre no site Saucedemo
    Open Browser    ${URL}    
    Maximize Browser Window
Quando eu inserir minhas credenciais 
    Wait Until Element Is Visible    ${LOGIN}    5s
    Wait Until Element Is Visible    ${SENHA}    5s
    Input Text                       ${LOGIN}   standard_user
    Input Text                       ${SENHA}   secret_sauce
    Sleep    3s
Então espero realizar o Login no sistema
    Click Element                    ${BUTTON}
    Sleep    3s
    Take Screenshot


#Cenário 02: Realizar a compra de um Produto
Dado que eu esteja logado no sistema
    Wait Until Element Is Visible    ${PRODUCT}
    Sleep    3s
E selecione um produto na tela Home
    Click Element                    ${PRODUCT}
    Sleep    2s
Quando eu ir para o carrinho
    Wait Until Element Is Visible    ${BUTTONPRODUCT}
    Sleep    2s
    Click Element                   ${BUTTONPRODUCT}
    Click Element                   ${CARRINHO}
    Click Element                   ${CHECKOUT}    
    Input Text                      ${FNAME}    Rafael
    Input Text                      ${LNAME}    Siqueira
    Input Password                  ${ZIP}      24451230
    Click Element                   ${CONTINUE}
    Sleep                           3s
Então devo fechar o pedido
    Click Element                   ${FINISH}
    Take Screenshot