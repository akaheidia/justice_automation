*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Analytics Summary Report page.

*** Keywords ***
Confirm Analytics Summary Report Page Contains KPI Panel
    [Arguments]  ${title}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='kpi']

    Page Should Contain Element  xpath://span[contains(text(), '${title}')]

    Unselect Frame
    Unselect Frame

Confirm Analytics Summary Report Page Contains Top N Panel
    [Arguments]  ${title}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Contain Element  xpath://h4[contains(text(), '${title}')]

    Unselect Frame
    Unselect Frame

Confirm Analytics Summary Report Page Contains Network Panel
    [Arguments]  ${title}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='network_graph']

    Page Should Contain Element  xpath://h4[contains(text(), '${title}')]

    Unselect Frame
    Unselect Frame
