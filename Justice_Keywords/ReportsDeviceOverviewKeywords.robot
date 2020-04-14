*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Device Overview Report page.

*** Keywords ***

Confirm Device Overview Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_device_overview_page_title}

    Unselect Frame
    Unselect Frame

Confirm Device Overview Report Contains Value
    [Arguments]  ${value}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  xpath://h4[contains(text(), '${value}')]

    Unselect Frame
    Unselect Frame

Device Overview Drill Into Metric
    [Arguments]  ${metric}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Click Element  xpath://a//span[contains(text(), '${metric}')]

    Unselect Frame
    Unselect Frame
