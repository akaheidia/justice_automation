*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-407: CSV Download: output is unreadable for Device:Alarms data.

Suite Setup      Log In and Navigate to Filtered Devices Tab
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm CSV All Rows
    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_devices_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_all}

Confirm CSV Visible Rows
    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_devices_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_visible}

Confirm CSV All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_filtered}


*** Keywords ***
Log In and Navigate to Filtered Devices Tab
    Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Set Server Filter  ${XMC_HOSTNAME}

Confirm File Contents
    [Arguments]  ${filename}
    Wait Until Created  ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Exist  ${DOWNLOADS_DIR}/${filename}
    ${file_contents}=  OperatingSystem.Get File  ${DOWNLOADS_DIR}/${filename}
    Should Not Contain  ${file_contents}  [object Object]
