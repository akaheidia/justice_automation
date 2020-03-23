*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Events tab of the Monitor List page.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
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
    Add Sort  Category
    Add Sort  Source
    Confirm Sort Applied
    Set Sort Direction  Severity  Ascending
    Set Sort Direction  Severity  Descending
    Set Sort Direction  Category  Ascending
    Set Sort Direction  Source  Descending
    Remove Sort  Severity
    Confirm Sort Applied
    Remove Sort  Source
    Confirm Sort Applied
    Remove Sort  Category
    Confirm Sort Not Applied

Confirm Download Menus
    Set Server Filter  ${XMC_HOSTNAME}

    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_events_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_events_visible}

    Log To Console  Download CSV All Rows Fails - JUS-445
#    Download CSV All Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_events_all}
#    Remove File  ${DOWNLOADS_DIR}  ${csv_events_all}

    Log To Console  Download CSV All Filtered Rows Fails - JUS-512
#    Download CSV All Filtered Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_events_filtered}
#    Remove File  ${DOWNLOADS_DIR}  ${csv_events_filtered}

    Download PDF Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_events_visible}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_events_visible}

    Log To Console  Download PDF All Rows Fails - JUS-445
#    Download PDF All Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_events_all}
#    Remove File  ${DOWNLOADS_DIR}  ${pdf_events_all}

    Log To Console  Download PDF All Filtered Rows Fails - JUS-512
#    Download PDF All Filtered Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_events_filtered}
#    Remove File  ${DOWNLOADS_DIR}  ${pdf_events_filtered}
