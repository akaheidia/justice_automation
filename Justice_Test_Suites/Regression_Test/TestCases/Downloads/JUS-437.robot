*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-437: CSV Download: created file does not include .csv extension.

Suite Setup      Log In and Navigate to List View
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm CSV File Extension for Devices All Rows
    Navigate to Devices and Set Filter  ${XMC_HOSTNAME}
    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_devices_all}
    Remove File  ${csv_devices_all}

Confirm CSV File Extension for Devices Visible Rows
    Download CSV Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_devices_visible}
    Remove File  ${csv_devices_visible}

Confirm CSV File Extension for Devices All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_devices_filtered}
    Remove File  ${csv_devices_filtered}


Confirm CSV File Extension for End-Systems All Rows
    Navigate to End-Systems and Set Filter  ${XMC_2_HOSTNAME}
    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_endsystems_all}
    Remove File  ${csv_endsystems_all}

Confirm CSV File Extension for End-Systems Visible Rows
    Download CSV Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_endsystems_visible}
    Remove File  ${csv_endsystems_visible}

Confirm CSV File Extension for End-Systems All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_endsystems_filtered}
    Remove File  ${csv_endsystems_filtered}


Confirm CSV File Extension for Alarms All Rows
    Navigate to Alarms and Set Filter  ${XMC_HOSTNAME}
    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_alarms_all}
    Remove File  ${csv_alarms_all}

Confirm CSV File Extension for Alarms Visible Rows
    Download CSV Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_alarms_visible}
    Remove File  ${csv_alarms_visible}

Confirm CSV File Extension for Alarms All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_alarms_filtered}
    Remove File  ${csv_alarms_filtered}


Confirm CSV File Extension for Events All Rows
    Navigate to Events and Set Filter  ${XMC_2_HOSTNAME}
    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_events_all}
    Remove File  ${csv_events_all}

Confirm CSV File Extension for Events Visible Rows
    Download CSV Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_events_visible}
    Remove File  ${csv_events_visible}

Confirm CSV File Extension for Events All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_events_filtered}
    Remove File  ${csv_events_filtered}


*** Keywords ***
Log In and Navigate to List View
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider

Navigate to Devices and Set Filter
    [Arguments]  ${server}
    Click Devices Tab
    Confirm Devices Tab Selected
    Clear All Filters
    Set Server Filter  ${server}
    sleep  2 seconds

Navigate to Alarms and Set Filter
    [Arguments]  ${server}
    Click Alarms Tab
    Confirm Alarms Tab Selected
    Clear All Filters
    Set Server Filter  ${server}
    sleep  2 seconds

Navigate to Events and Set Filter
    [Arguments]  ${server}
    Click Events Tab
    Confirm Events Tab Selected
    Set Server Filter  ${server}

Navigate to End-Systems and Set Filter
    [Arguments]  ${server}
    Click End-Systems Tab
    Confirm End-Systems Tab Selected
    Clear All Filters
    Set Server Filter  ${server}
    sleep  2 seconds

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
