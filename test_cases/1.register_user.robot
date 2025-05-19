*** Settings ***
Library           SeleniumLibrary
Library           String
Library           ../custom_library/custom_keywords.py

Variables         ../variables/setting.py
Resource          ../keywords/login_keyword.robot
Resource          ../keywords/register_keyword.robot

# Suite Teardown    Close All Browsers
# Test Teardown     Close Browser

*** Test Cases ***
Register User
    Open Automation Exercise Website
    ${days}    ${months}    ${years}=    Generate Random Date
    ${date_of_birth}=    Set Variable    ${days}-${months}-${years}
    Register New User          firstName=TS    gender=Mrs    password=1234567    date_of_birth=${date_of_birth}    newsletter=True    offers=False
    ##TODO  Address Information