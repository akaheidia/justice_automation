*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the End-Systems tab of the Monitor List page.

Suite Setup      Log In and Navigate to End-Systems Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${xmc_with_endsystems}    ${XMC_2_HOSTNAME}

*** Test Cases ***
Confirm Table Paging
    Go To Last Page
    Go To First Page
    Go To Next Page
    Go To Previous Page

Confirm Table Data Sorting
    Confirm Sort Not Applied
    Add Sort  IP Address
    Add Sort  State
    Add Sort  Last Seen
    Confirm Sort Applied
    Set Sort Direction  IP Address  Ascending
    Set Sort Direction  IP Address  Descending
    Set Sort Direction  State  Ascending
    Set Sort Direction  Last Seen  Descending
    Remove Sort  IP Address
    Confirm Sort Applied
    Remove Sort  Last Seen
    Confirm Sort Applied
    Remove Sort  State
    Confirm Sort Not Applied

Confirm Download Menus
    Set Server Filter  ${xmc_with_endsystems}

    Download CSV Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_endsystems_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_endsystems_visible}

    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_endsystems_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_endsystems_all}

    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_endsystems_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${csv_endsystems_filtered}

    Download PDF Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_endsystems_visible}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_endsystems_visible}

    Download PDF All Rows
    Wait Until Download Completes
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_endsystems_all}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_endsystems_all}

    Download PDF All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_endsystems_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_endsystems_filtered}
