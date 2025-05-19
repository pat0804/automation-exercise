*** Settings ***
Library           SeleniumLibrary
Library           String
Variables         ../variables/setting.py
Resource          menu_keyword.robot

*** Keywords ***

Register New User
    [Arguments]          ${firstName}    ${name}=TS    ${gender}=Mr    ${password}=1234    ${date_of_birth}=${EMPTY}    
    ...    ${newsletter}=${EMPTY}    ${offers}=${EMPTY}
    Go to Signup / Login Menu
    Wait Until Element Is Visible                          xpath://input[@data-qa="signup-name"]                   10s
    ${randName}       Fill In First Name And Email         ${firstName}
    Wait Until Element Is Visible        xpath://*[@class="btn btn-default" and contains(text(), "Signup")]        10s
    Click Element                        xpath://*[@class="btn btn-default" and contains(text(), "Signup")]
    ###Go to Enter Account Information
    Wait Until Element Is Visible        xpath://h2[b[contains(text(), "Enter Account Information")]]              10s
    ###Select Gender
    Wait Until Element Is Visible        xpath://input[@value="Mr"]                                                10s
    IF  '${gender}' != '${EMPTY}'
        Select in Gender        ${gender}
    END
    ###Password
    IF  '${password}' != '${EMPTY}'
        Fill Password           ${password}
    END
    ###Birthdate
    IF  '${date_of_birth}' != '${EMPTY}'
        Fill Birthdate           ${date_of_birth}
    END
    ###Newsletter
    IF  "${newsletter}" == "True"
        Wait Until Element Is Visible    css:#newsletter                            10s
        Click Element                    css:#newsletter
    ELSE
        Wait Until Element Is Visible    css:#newsletter                            10s
    END
    ###Offers
    IF  "${offers}" == "True"
        Wait Until Element Is Visible    css:#optin                                 10s
        Click Element                    css:#optin
    ELSE
        Wait Until Element Is Visible    css:#optin                                 10s
    END

Fill In First Name And Email
    [Arguments]                     ${firstName}=TS
    ${rand}=                        Generate Random String    6    [LETTERS]
    ${firstName}=                   Set Variable              ${firstName}-${rand}
    ${firstName}=                   Convert To Upper Case     ${firstName}
    ${email}=                       Set Variable              ${firstName.lower()}@example.com
    Press Keys                      xpath://input[@data-qa="signup-name"]              ${firstName}
    Press Keys                      xpath://input[@data-qa="signup-email"]             ${email}
    RETURN                          ${email}

Select in Gender
    [Arguments]        ${gender}=Mr
    Wait Until Element Is Visible    xpath://input[@value="${gender}"]          10s
    Click Element                    xpath://input[@value="${gender}"]

Fill Password
    [Arguments]        ${password}=${EMPTY}
    Wait Until Element Is Visible    id:password                                10s
    Press Keys                       id:password                                ${password}

Fill Birthdate
    [Arguments]    ${date_of_birth}=${EMPTY}
    ${days}    ${months}    ${years}=    Split String    ${date_of_birth}    -
    Wait Until Element Is Visible    css:#days        10s
    Click Element                    css:#days
    Select From List By Value        css:#days        ${days}
    Wait Until Element Is Visible    css:#months      10s
    Click Element                    css:#months
    Select From List By Value        css:#months      ${months}
    Wait Until Element Is Visible    css:#years       10s
    Click Element                    css:#years
    Select From List By Value        css:#years       ${years}
    Click Element                    xpath://b[contains(text(), "Enter Account Information")]