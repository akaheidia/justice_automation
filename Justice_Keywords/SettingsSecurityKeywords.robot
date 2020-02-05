*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Settings - Security page.

*** Keywords ***

Click Security
    Click Element  ${settings_security_menu}

Confirm Security Page Loaded
    Page Should Contain Element  ${security_page_title}
