***Settings***
Library     app.py

***Test Cases***
Deve retornar mensagem de boas vindas
    ${result}=      welcome     Elton
    #Log To Console  ${result}
    Should Be Equal  ${result}   Olá Elton, bem vindo ao curso basico de robot framework!