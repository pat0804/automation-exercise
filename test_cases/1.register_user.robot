*** Settings ***
Library           SeleniumLibrary
Library           String
# Library           ../custom_library/custom_keywords.py

Variables         ../variables/setting.py
Resource          ../keywords/login_keyword.robot
Resource          ../keywords/register_keyword.robot

# Suite Teardown    Close All Browsers
# Test Teardown     Close Browser

*** Test Cases ***
Register User
    Open Automation Exercise Website
    Register New User          firstName=TS    gender=Mrs    password=1234567
    