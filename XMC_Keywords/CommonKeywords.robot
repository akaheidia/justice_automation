*** Settings ***
Library    SeleniumLibrary
Resource   ../Justice_Keywords/CommonKeywords.robot
Resource   ./LoginKeywords.robot
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords useful to all XMC tests.

*** Keywords ***
XMC Open Browser and Log In
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open and Maximize Browser  ${url}  ${browser}
    XMC Log In  ${user}  ${pwd}

XMC Log Out and Close Browser
    XMC Log Out
    Close Browser

XMC Log In
    [Arguments]  ${user}  ${pwd}
    XMC Enter User Name  ${user}
    XMC Enter Password   ${pwd}
    XMC Click Login
    XMC Confirm Successful Login

XMC Log Out
    Page Should Contain Element  ${xmc_main_context_icon}
    Click Element  ${xmc_main_context_icon}
    Page Should Contain Element  ${xmc_main_context_icon_logout_menu}
    Click Element  ${xmc_main_context_icon_logout_menu}
    XMC Confirm Successful Logout

XMC Confirm Page Does Not Contain Text
    [Arguments]  ${text}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain  ${text}
    Set Selenium Implicit Wait  ${orig_wait}
