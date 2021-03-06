*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Analytics Summary Report page.

*** Keywords ***
Wait For Analytics Summary Report Page To Load
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='top_n']

    Wait Until Page Contains Element  ${reports_top_applications_by_clients_drilldown}  timeout=10 seconds

    Unselect Frame
    Unselect Frame

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


Confirm Analytics Summary Report Page KPI Panel Contains Message
    [Arguments]  ${msg}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='kpi']

    Page Should Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame

Confirm Analytics Summary Report Page KPI Panel Does Not Contain Message
    [Arguments]  ${msg}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='kpi']

    Page Should Not Contain  ${msg}
    Page Should Not Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Summary Report Page Top N Panel Contains Message
    [Arguments]  ${msg}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame

Confirm Analytics Summary Report Page Top N Panel Does Not Contain Message
    [Arguments]  ${msg}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Not Contain  ${msg}
    Page Should Not Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Analytics Summary Report Page Network Panel Contains Message
    [Arguments]  ${msg}
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='network_graph']

    Page Should Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame

Confirm Analytics Summary Report Page Network Panel Does Not Contain Message
    [Arguments]  ${msg}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    sleep  1 second
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='network_graph']

    Page Should Not Contain  ${msg}
    Page Should Not Contain Element  xpath://*[contains(text(), '${msg}')]

    Unselect Frame
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Top Sites by Clients Site Label
    [Arguments]  ${site}
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Contain Element  xpath://div[@id='client_sites']//span[contains(text(), '${site}')]

    Unselect Frame
    Unselect Frame

Confirm Top Sites by Volume Site Label
    [Arguments]  ${site}
    Select Frame  xpath://iframe
    Select Frame  xpath://iframe[@id='top_n']

    Page Should Contain Element  xpath://div[@id='volume_sites']//span[contains(text(), '${site}')]

    Unselect Frame
    Unselect Frame
