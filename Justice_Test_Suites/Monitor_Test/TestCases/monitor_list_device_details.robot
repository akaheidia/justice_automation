*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Device Details page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10
${test_port}    ge.1.2

*** Test Cases ***
Confirm Device Details Page Loads
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Confirm Device Details Page Loaded  ${test_device}
    Confirm Device Details Dahboard Page Loaded

Confirm Ports Page Loads
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded

Confirm Dashboard Page Loads
    Device Details Click Dashboard Link
    Confirm Device Details Dahboard Page Loaded

Confirm Back Arrow Works
    Device Details Click Back Arrow
    Confirm Devices Page Loaded

Confirm Port Selection Works
    Search Field Enter Text  ${test_device}
    Click Device Details Arrow  ${test_device}
    Device Details Click Ports Link
    Confirm Device Details Ports Page Loaded
    Confirm Port In Table  ${test_port}
    Select Port In Table  ${test_port}
    sleep  1 second
    Deselect Port In Table  ${test_port}

Confirm Port List Sorting Works
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

Confirm Download Menus
    Confirm Device Details Ports Page Loaded

    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_ports_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_ports_visible}

    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_ports_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_ports_all}

    Download PDF Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_ports_visible}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_ports_visible}

    Download PDF All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_ports_all}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_ports_all}
