*** Settings ***
Library           SeleniumLibrary
Library           ../../custom_library/custom_keywords.py

Variables         ../../variables/setting.py
Resource          ../../shared_keywords/register_opd_keywords.robot

*** Test case ***
