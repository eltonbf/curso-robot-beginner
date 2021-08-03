*** Settings ***
Resource              base.robot

Test Setup            Nova sessão
Test Teardown         Encerra sessão

***Test Cases***
Login com sucesso
    Go To                            ${url}/login
    Login With                       stark               jarvis!
    Should See Logged User           Tony Stark         

Login inválida
    [tags]                                              login_error
    Go To                                               ${url}/login
    Login With                                          stark                   12345
    Should Contain Login Alert                          Senha é invalida!  

    #${message}=         Get WebElement                  id:flash
    #Should Contain      ${message.text}                 Senha é invalida!

    #Page Should Contain         Senha é invalida!

Usuário não existe
    [tags]                                      login_user404
    Go To                                       ${url}/login
    Login With                                  john            12345
    Should Contain Login Alert                  O usuário informado não está cadastrado!

***Keywords***
Login With
    [Arguments]     ${uname}       ${pass}

    Input Text          css:input[name=username]        ${uname}
    Input Text          css:input[name=password]        ${pass}
    Click Element       class:btn-login

Should Contain Login Alert
    [Arguments]         ${expect_messagem}
    ${message}=         Get WebElement                  id:flash
    Should Contain      ${message.text}                 ${expect_messagem}

Should See Logged User
    [Arguments]         ${full_name}

    Page Should Contain         Olá, ${full_name}. Você acessou a área logada!