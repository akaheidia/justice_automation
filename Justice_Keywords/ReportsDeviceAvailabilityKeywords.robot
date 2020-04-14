*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Device Availability Report page.

*** Keywords ***

Confirm Device Availability Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_device_availability_page_title}

    Unselect Frame
    Unselect Frame

Confirm Device Availability Report Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    sleep  1 second
    Wait Until Page Contains Element  xpath://span[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame


Device Availability Drill Into Device
    [Arguments]  ${ip}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='availability']

    Click Element  xpath://span[contains(text(), '${ip}')]

    Unselect Frame
    Unselect Frame
