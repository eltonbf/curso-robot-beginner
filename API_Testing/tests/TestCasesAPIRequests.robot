*** Settings ***
Documentation       Suíte de Exemplo de testes API com o Robot Framework
Resource            ../resources/BDDImplementation.robot

*** Test Case ***
Cenário 01: Consulta de endereço existente
    [Tags]  jenkins
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "06243-010"
    Então deve ser mostrado o endereço "Rua Pio XII"
    E deve ser mostrado o bairro "Jardim Elvira"
    E deve ser mostrada a cidade "Osasco"
    E deve ser mostrada a UF "SP"
    E deve ser mostrado o CEP "06243010"

Cenário 02: Consulta de endereço inexistente
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "99999-999"
    Então a mensagem "CEP INVÁLIDO" deve ser retornada