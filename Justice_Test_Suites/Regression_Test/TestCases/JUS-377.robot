*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-377: CSV and PDF Download for All Filtered Rows is a no-op.

Suite Setup      Log In and Navigate to Devices Tab
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm CSV All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_filtered}

Confirm PDF All Filtered Rows
    Download PDF All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}


*** Keywords ***
Log In and Navigate to Devices Tab
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected
    Set Server Filter  ${XMC_HOSTNAME}
#
#Confirm File Exists
#    [Arguments]  ${filename}
#    Wait Until Created  ${DOWNLOADS_DIR}/${filename}
#    OperatingSystem.File Should Exist   ${DOWNLOADS_DIR}/${filename}
#
#Remove File
#    [Arguments]  ${filename}
#    OperatingSystem.File Should Exist      ${DOWNLOADS_DIR}/${filename}
#    OperatingSystem.Remove File            ${DOWNLOADS_DIR}/${filename}
#    Wait Until Removed                     ${DOWNLOADS_DIR}/${filename}
#    OperatingSystem.File Should Not Exist  ${DOWNLOADS_DIR}/${filename}
