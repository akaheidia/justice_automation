*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-407: CSV Download: output is unreadable for Device:Alarms data.

Suite Setup      Log In and Navigate to List View
Suite Teardown   Log Out and Close Browser


*** Test Cases ***

Confirm CSV All Rows for Alarms
    Navigate to Alarms and Set Filter
    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  Alarms - All Rows
    Remove File  Alarms - All Rows

Confirm CSV Visible Rows for Alarms
    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  Alarms - Visible Rows
    Remove File  Alarms - Visible Rows

Confirm CSV All Filtered Rows for Alarms
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  Alarms - All Filtered Rows
    Remove File  Alarms - All Filtered Rows

#Confirm CSV All Rows for Events
#    Navigate to Events and Set Filter
#    Download CSV All Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Contents  Events - All Rows
#    Remove File  Events - All Rows
#
#Confirm CSV Visible Rows for Events
#    Download CSV Visible Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Contents  Events - Visible Rows
#    Remove File  Events - Visible Rows
#
#Confirm CSV All Filtered Rows for Events
#    Download CSV All Filtered Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Contents  Events - All Filtered Rows
#    Remove File  Events - All Filtered Rows


*** Keywords ***
Log In and Navigate to List View
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider

Navigate to Alarms and Set Filter
    Click Alarms Tab
    Confirm Alarms Tab Selected
    Set Server Filter

Navigate to Events and Set Filter
    Click Events Tab
    Confirm Events Tab Selected
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
    Should Contain  ${file_contents}  GMT-0500

Remove File
    [Arguments]  ${filename}
    OperatingSystem.File Should Exist      ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.Remove File            ${DOWNLOADS_DIR}/${filename}
    Wait Until Removed                     ${DOWNLOADS_DIR}/${filename}
    OperatingSystem.File Should Not Exist  ${DOWNLOADS_DIR}/${filename}
