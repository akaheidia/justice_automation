*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Alarms tab of the Monitor List page.

Suite Setup      Log In and Navigate to Alarms Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Table Paging
    Go To Last Page
    Go To First Page
    Go To Next Page
    Go To Previous Page

Confirm Table Data Sorting
    Confirm Sort Not Applied
    Add Sort  Severity
    Add Sort  Last Seen
    Add Sort  Source
    Confirm Sort Applied
    Set Sort Direction  Severity  Ascending
    Set Sort Direction  Severity  Descending
    Set Sort Direction  Last Seen  Ascending
    Set Sort Direction  Source  Descending
    Remove Sort  Severity
    Confirm Sort Applied
    Remove Sort  Source
    Confirm Sort Applied
    Remove Sort  Last Seen
    Confirm Sort Not Applied

Confirm Download Menus
    Set Server Filter  ${XMC_HOSTNAME}

    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_alarms_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_alarms_visible}

    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_alarms_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_alarms_all}

    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_alarms_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${csv_alarms_filtered}

    Download PDF Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_alarms_visible}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_alarms_visible}

    Download PDF All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_alarms_all}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_alarms_all}

    Download PDF All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_alarms_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_alarms_filtered}
