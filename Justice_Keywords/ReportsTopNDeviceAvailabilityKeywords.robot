*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Top N Device Availability Report page.

*** Keywords ***

Confirm Top N Device Availability Report Page Title
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_top_device_availability_page_title}

    Unselect Frame
    Unselect Frame

Confirm Top N Device Availability Report Contains Value
    [Arguments]  ${value}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  xpath://span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame

Confirm Top N Device Availability Report Does Not Contain Value
    [Arguments]  ${value}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Page Should Not Contain Element  xpath://span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame
