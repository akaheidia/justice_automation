*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Devices tab of the Monitor List page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${test_device}  10.54.142.10
${test_tag}     Test Tag

*** Test Cases ***
Confirm Table Paging
    Go To Last Page
    Go To First Page
    Go To Next Page
    Go To Previous Page

Confirm Table Data Sorting
    Confirm Sort Not Applied
    Add Sort  IP Address
    Add Sort  Name
    Add Sort  Server:Site
    Confirm Sort Applied
    Set Sort Direction  IP Address  Ascending
    Set Sort Direction  IP Address  Descending
    Set Sort Direction  Name  Ascending
    Set Sort Direction  Server:Site  Descending
    Remove Sort  IP Address
    Confirm Sort Applied
    Remove Sort  Server:Site
    Confirm Sort Applied
    Remove Sort  Name
    Confirm Sort Not Applied

Confirm Download Menus
    Set Server Filter  ${XMC_HOSTNAME}

    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_visible}

    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_all}

    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_filtered}

    Download PDF Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_visible}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_visible}

    Download PDF All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_all}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_all}

    Download PDF All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}

Select Device
    Search Field Enter Text  ${test_device}
    Confirm Device In Table  ${test_device}
    Select Device In Table  ${test_device}
    sleep  2 seconds
    Deselect Device In Table  ${test_device}
    Search Field Clear Text

Add Device To Tag
    Search Field Enter Text  ${test_device}
    Confirm Device In Table  ${test_device}
    Select Device In Table  ${test_device}
    Click Add Devices To Tag
    Confirm Add Devices To Tag Panel Visible
    Add Devices To Tag Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Click Save
    Confirm Add Devices To Tag Panel Contains Tag  ${test_tag}
    Add Devices To Tag Select Tag  ${test_tag}
    Add Devices To Tag Click Save
    Confirm Add Devices To Tag Panel Not Visible
    Show Tags Panel
    Tags Panel Click Manage
    Manage Tags Expand Row  ${test_tag}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device}

Remove Device From Tag and Delete Tag
    Manage Tags Expand Row  ${test_tag}
    Manage Tags Device Details Click Delete  ${test_device}
    Manage Tags Device Details Click Save
    Manage Tags Click Close
    Tags Panel Click Manage
    Manage Tags Expand Row  ${test_tag}
    Confirm Manage Tags Device Not Assigned To Tag  ${test_tag}  ${test_device}
    Manage Tags Collapse Row  ${test_tag}
    Manage Tags Select Tag  ${test_tag}
    Manage Tags Click Delete
    Manage Tags Confirm Delete Tags Click OK
    Confirm Manage Tags Panel Does Not Contain Tag  ${test_tag}
    Manage Tags Click Close
    Hide Tags Panel
