*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Top N Device Availability Report page.

*** Keywords ***

Confirm Top N Device Availability Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_device_availability_page_title}

    Unselect Frame
    Unselect Frame

Confirm Top N Device Availability Report Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  xpath://span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame
