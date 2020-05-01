*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-647: Ports: Sorting by Collecting, Policy Role, or PVID results in an empty table.

Suite Setup      Log In and Navigate to Ports View  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10
${test_port}    ge.1.2

*** Test Cases ***
Confirm Sorting By Port Columns Works
    Confirm Device Details Ports Page Loaded
    Confirm Sort Not Applied
    Open Sort Menu
    Open Add Sort Menu
    Select Sort Choice  Status
    Select Sort Choice  Name
    Select Sort Choice  Alias
    Select Sort Choice  Template
    Select Sort Choice  Speed
    Select Sort Choice  Neighbor
    Select Sort Choice  Description
    Close Add Sort Menu
    Close Sort Menu
    Confirm Sort Applied
    Confirm Port In Table  ${test_port}
    Set Sort Direction  Name  Ascending
    Set Sort Direction  Name  Descending
    Set Sort Direction  Description  Ascending
    Set Sort Direction  Status  Descending
    Open Sort Menu
    Click Remove Sort Icon  Description
    Click Remove Sort Icon  Neighbor
    Click Remove Sort Icon  Speed
    Click Remove Sort Icon  Template
    Click Remove Sort Icon  Alias
    Click Remove Sort Icon  Name
    Click Remove Sort Icon  Status
    Close Sort Menu
    Confirm Sort Not Applied
    Confirm Port In Table  ${test_port}

*** Keywords ***
Log In and Navigate to Ports View
    [Arguments]  ${url}  ${browser}  ${user}  ${pwd}
    Open Browser and Log In  ${url}  ${browser}  ${user}  ${pwd}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dashboard Page Loaded
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
