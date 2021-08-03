*** Settings ***
Resource              base.robot

Test Setup            Nova sessão
Test Teardown         Encerra sessão

***Variables***

${check_thor}           id:thor
${check_iron}           css:input[value='iron-man']
${check_panther}        xpath://*[@id="checkboxes"]/input[7]

***Test Cases***
Marcando opção com ID
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}


Marcando opção com CSS Selector
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_iron} 
    Checkbox Should Be Selected     ${check_iron}


Marcando opção com Xpath
    [tags]                          ironman
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_panther}
    Checkbox Should Be Selected     ${check_panther}


