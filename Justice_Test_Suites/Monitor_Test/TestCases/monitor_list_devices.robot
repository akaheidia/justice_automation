*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Devices tab of the Monitor List page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
#Confirm Table Paging
#    Go To Last Page
#    Go To First Page
#    Go To Next Page
#    Go To Previous Page
#
#Confirm Table Data Sorting
#    Confirm Sort Not Applied
#    Add Sort  IP Address
#    Add Sort  Name
#    Add Sort  Server:Site
#    Confirm Sort Applied
#    Set Sort Direction  IP Address  Ascending
#    Set Sort Direction  IP Address  Descending
#    Set Sort Direction  Name  Ascending
#    Set Sort Direction  Server:Site  Descending
#    Remove Sort  IP Address
#    Confirm Sort Applied
#    Remove Sort  Server:Site
#    Confirm Sort Applied
#    Remove Sort  Name
#    Confirm Sort Not Applied
#
#Confirm Download Menus
#    Set Server Filter  ${XMC_HOSTNAME}
#
#    Download CSV Visible Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_visible}
#    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_visible}
#
#    Download CSV All Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_all}
#    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_all}
#
#    Download CSV All Filtered Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_filtered}
#    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_filtered}
#
#    Download PDF Visible Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_visible}
#    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_visible}
#
#    Download PDF All Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_all}
#    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_all}
#
#    Download PDF All Filtered Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}
#    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}
#
#Select Device
#    Search Field Enter Text  10.54.142.10
#    Confirm Device In Table  10.54.142.10
#    Select Device In Table  10.54.142.10
#    sleep  2 seconds
#    Deselect Device In Table  10.54.142.10
#    Search Field Clear Text
#
Add Device To Tag
    Search Field Enter Text  10.54.142.10
    Confirm Device In Table  10.54.142.10
    Select Device In Table  10.54.142.10
    Click Add Devices To Tag
    Add Devices To Tag Click Refresh
    Add Devices To Tag Click Add
    Add Tag Set Name  Test Tag
    Add Tag Click Save
    Confirm Add Devices To Tag Panel Contains Tag  Test Tag
    Add Devices To Tag Select Tag  Test Tag
    Add Devices To Tag Click Save
    Add Devices To Tag Deselect Tag  Test Tag
    Add Devices To Tag Click Save
    Add Devices To Tag Click Manage
    Manage Tags Select Tag  Test Tag
    Manage Tags Click Delete
    Tag Confirm Delete Click OK
    Confirm Manage Tags Panel Does Not Contain Tag  Test Tag
    Manage Tags Click Close
    Confirm Add Devices To Tag Panel Does Not Contain Tag  Test Tag
    Add Devices To Tag Click Close
