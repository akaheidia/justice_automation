*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Devices tab of the Monitor List page.

Suite Setup      Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
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
