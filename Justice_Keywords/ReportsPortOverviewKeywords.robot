*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Port Overview Report page.

*** Keywords ***

Confirm Port Overview Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_port_overview_page_title}

    Unselect Frame
    Unselect Frame

Port Overview Drill Into Metric
    [Arguments]  ${metric}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Click Element  xpath://a//span[contains(text(), '${metric}')]

    Unselect Frame
    Unselect Frame
