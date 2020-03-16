*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Events tab on the Monitor List page.

*** Keywords ***

Refresh Events Table
    Click Element  ${list_refresh_icon}

Confirm Events Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain  No Events Found
    Set Selenium Implicit Wait  ${orig_wait}

Confirm No Events Present
    Page Should Contain  No Events Found
