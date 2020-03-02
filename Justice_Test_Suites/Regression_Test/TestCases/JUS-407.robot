*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-407: CSV Download: output is unreadable for Device:Alarms data.

Suite Setup      Log In and Navigate to Devices Tab
Suite Teardown   Log Out and Close Browser


*** Test Cases ***

Confirm CSV All Rows
    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  Devices - All Rows
    Remove File  Devices - All Rows

Confirm CSV Visible Rows
    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  Devices - Visible Rows
    Remove File  Devices - Visible Rows

Confirm CSV All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  Devices - All Filtered Rows
    Remove File  Devices - All Filtered Rows


*** Keywords ***
Log In and Navigate to Devices Tab
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider
    Click Devices Tab
    Confirm Devices Tab Selected
    Set Server Filter

Set Server Filter
    Click Filter Icon
    Confirm Filters Panel Visible
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}

Confirm File Contents
    [Arguments]  ${filename}
    Wait Until Created  ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Exist   ${DOWNLOADS_DIR}/${filename}
    ${file_contents}=  OperatingSystem.Get File  ${DOWNLOADS_DIR}/${filename}
    Should Not Contain  ${file_contents}  [object Object]

Remove File
    [Arguments]  ${filename}
    OperatingSystem.File Should Exist      ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.Remove File            ${DOWNLOADS_DIR}/${filename}
    Wait Until Removed                     ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Not Exist  ${DOWNLOADS_DIR}/${filename}
