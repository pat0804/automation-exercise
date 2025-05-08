*** Settings ***
Library                    SeleniumLibrary
Variables                  ../variables/setting.py

*** Keywords ***
Go to Signup / Login Menu
    Wait Until Element Is Visible        xpath://a[contains(., "Signup / Login")]                   10s
    Click Element                        xpath://a[contains(., "Signup / Login")]
    Wait Until Element Is Visible        xpath://h2[contains(text(), "Login to your account")]      10s
    Element Should Be Visible            xpath://h2[contains(text(), "Login to your account")]
    Wait Until Element Is Visible        xpath://h2[contains(text(), "New User Signup!")]           10s
    Element Should Be Visible            xpath://h2[contains(text(), "New User Signup!")]