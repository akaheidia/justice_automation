*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-512: CSV/PDF Download for All Filtered Event Rows fails.

Suite Setup      Log In and Navigate to Filtered Events View
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm CSV Download File Name for Events All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_events_filtered}
    Remove File  ${csv_events_filtered}

Confirm PDF Download File Name for Events All Filtered Rows
    Download PDF All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${pdf_events_filtered}
    Remove File  ${pdf_events_filtered}


*** Keywords ***
Log In and Navigate to Filtered Events View
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider
    Click Events Tab
    Confirm Events Tab Selected
    Clear All Filters
    Set Server Filter  ${XMC_HOSTNAME}
    Set Server Filter  ${XMC_2_HOSTNAME}
    sleep  2 seconds
    Confirm Events Present
    Confirm Minimum Number of Events Present  1000

Confirm File Exists
    [Arguments]  ${filename}
    Wait Until Created  ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Exist   ${DOWNLOADS_DIR}/${filename}

Remove File
    [Arguments]  ${filename}
    OperatingSystem.File Should Exist      ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.Remove File            ${DOWNLOADS_DIR}/${filename}
    Wait Until Removed                     ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Not Exist  ${DOWNLOADS_DIR}/${filename}
