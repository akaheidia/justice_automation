*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Top Site Availability Report page.

*** Keywords ***

Confirm Top N Top Site Availability Reports Page Contains Value
    [Arguments]  ${site}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain  ${site}

    UnSelect Frame
    Unselect Frame
