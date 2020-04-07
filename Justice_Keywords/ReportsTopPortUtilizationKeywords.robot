*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Top Port Utilization Report page.

*** Keywords ***

Confirm Top Port Utilization Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Page Should Contain Element  ${reports_topn_top_port_utilization_page_title}

    Unselect Frame
    Unselect Frame

Top Port Utilization Drill Into Device
    [Arguments]  ${ip}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Click Element  xpath://a//span[contains(text(), '${ip}')]
    Unselect Frame
    Unselect Frame

Top Port Utilization Drill Into Port
    [Arguments]  ${port}
    sleep  2 seconds
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='resource']

    Click Element  xpath://a//span[contains(text(), '${port}')]
    Unselect Frame
    Unselect Frame
