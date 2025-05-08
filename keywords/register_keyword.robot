*** Settings ***
Library           SeleniumLibrary
Library           String
Variables         ../variables/setting.py
Resource          menu_keyword.robot

*** Keywords ***

Register New User
    [Arguments]          ${firstName}    ${name}=TS
    Go to Signup / Login Menu
    Wait Until Element Is Visible                          xpath://input[@data-qa="signup-name"]                   10s
    ${randName}       Fill In First Name And Email         ${firstName}
    Wait Until Element Is Visible        xpath://*[@class="btn btn-default" and contains(text(), "Signup")]        10s
    # Click Element                        xpath://*[@class="btn btn-default" and contains(text(), "Signup")]        #TODO  Delete comment later!!

Fill In First Name And Email
    [Arguments]                     ${firstName}=TS
    ${rand}=                        Generate Random String    6    [LETTERS]
    ${firstName}=                   Set Variable              ${firstName}-${rand}
    ${firstName}=                   Convert To Upper Case     ${firstName}
    ${email}=                       Set Variable              ${firstName.lower()}@example.com

    Press Keys                      xpath://input[@data-qa="signup-name"]              ${firstName}
    Press Keys                      xpath://input[@data-qa="signup-email"]             ${email}
    
    RETURN                          ${email}