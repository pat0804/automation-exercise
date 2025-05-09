*** Settings ***
Library           SeleniumLibrary
Library           String
Variables         ../variables/setting.py
Resource          menu_keyword.robot

*** Keywords ***

Register New User
    [Arguments]          ${firstName}    ${name}=TS    ${gender}=Mr    ${password}=1234
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

