*** Settings ***
Library    SeleniumLibrary
Resource   ../Justice_Keywords/CommonKeywords.robot
Resource   ./LoginKeywords.robot
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords useful to all XMC tests.

*** Keywords ***
Open Browser and Log Into XMC
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open and Maximize Browser  ${url}  ${browser}
    Log Into XMC  ${user}  ${pwd}

Log Out From XMC and Close Browser
    Log Out From XMC
    Close Browser

Log Into XMC
    [Arguments]  ${user}  ${pwd}
    Enter XMC User Name  ${user}
    Enter XMC Password   ${pwd}
    Click XMC Login
    Confirm Successful XMC Login

Log Out From XMC
    Log to Console  Need to implement this
    Page Should Contain Element  ${xmc_main_context_icon}
    Click Element  ${xmc_main_context_icon}
    Page Should Contain Element  ${xmc_main_context_icon_logout_menu}
    Click Element  ${xmc_main_context_icon_logout_menu}
    Confirm Successful XMC Logout
