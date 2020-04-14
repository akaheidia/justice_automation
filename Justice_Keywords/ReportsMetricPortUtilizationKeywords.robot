*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Port Utilization Metric Report page.

*** Keywords ***

Confirm Port Utilization Metric Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    sleep  1 second
    Wait Until Page Contains Element  ${reports_port_utilization_page_title}

    Unselect Frame
    Unselect Frame

Port Utilization Metric Drill Into Port
    [Arguments]  ${port}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Click Element  xpath://a//span[contains(text(), '${port}')]
    Unselect Frame
    Unselect Frame
