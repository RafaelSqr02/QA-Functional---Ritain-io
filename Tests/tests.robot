*** Settings ***
Documentation    QA Funcional
Resource         ../resource/rsc.robot

*** Test Cases ***    
Cenário 01: Acessar o site Saucedemo
    Dado que entre no site Saucedemo
    Quando eu inserir minhas credenciais 
    Então espero realizar o Login no sistema

Cenário 02: Realizar a compra de um Produto
    Dado que eu esteja logado no sistema
    E selecione um produto na tela Home
    Quando eu ir para o carrinho 
    Então devo fechar o pedido