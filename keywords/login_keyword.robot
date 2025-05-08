*** Settings ***
Library    SeleniumLibrary
Variables         ../variables/setting.py

*** Keywords ***

Login to website
    IF  ${DEBUG_MODE}
        Open Browser       url=${BASE_URL}      browser=${BROWSER}    options=add_experimental_option("detach", True);add_experimental_option("excludeSwitches", ["enable-logging"])
    ELSE
        Open Browser       url=${BASE_URL}      browser=${BROWSER}    options=add_argument("--headless=new");add_experimental_option("excludeSwitches", ["enable-logging"])
    END
    