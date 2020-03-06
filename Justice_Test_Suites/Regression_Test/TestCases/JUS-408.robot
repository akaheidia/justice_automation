*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-407: CSV Download: output is unreadable for Device:Alarms data.

Suite Setup      Log In and Navigate to List View
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm CSV All Rows for Alarms
    Navigate to Alarms and Set Filter  ${XMC_HOSTNAME}
    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_alarms_all}
    Remove File  ${csv_alarms_all}

Confirm CSV Visible Rows for Alarms
    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_alarms_visible}
    Remove File  ${csv_alarms_visible}

Confirm CSV All Filtered Rows for Alarms
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_alarms_filtered}
    Remove File  ${csv_alarms_filtered}


Confirm CSV All Rows for Events
    Log to Console  Commented out until JUS-445 is fixed
    Navigate to Events and Set Filter  ${XMC_HOSTNAME}
#    Download CSV All Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Contents  ${csv_events_all}
#    Remove File  ${csv_events_all}

Confirm CSV Visible Rows for Events
    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_events_visible}
    Remove File  ${csv_events_visible}

Confirm CSV All Filtered Rows for Events
    Log to Console  Commented out until JUS-417 is fixed
#    Download CSV All Filtered Rows
#    Wait Until Page Contains  Download Complete
#    Confirm File Contents  ${csv_events_filtered}
#    Remove File  ${csv_events_filtered}


Confirm CSV All Rows for End Points
    Navigate to End Points and Set Filter  ${XMC_2_HOSTNAME}
    Download CSV All Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_endsystems_all}
    Remove File  ${csv_endsystems_all}

Confirm CSV Visible Rows for End Points
    Download CSV Visible Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_endsystems_visible}
    Remove File  ${csv_endsystems_visible}

Confirm CSV All Filtered Rows for End Points
    Download CSV All Filtered Rows
    Wait Until Page Contains  Download Complete
    Confirm File Contents  ${csv_endsystems_filtered}
    Remove File  ${csv_endsystems_filtered}


*** Keywords ***
Log In and Navigate to List View
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider

Navigate to Alarms and Set Filter
    [Arguments]  ${server}
    Click Alarms Tab
    Confirm Alarms Tab Selected
    Set Server Filter  ${server}

Navigate to Events and Set Filter
    [Arguments]  ${server}
    Click Events Tab
    Confirm Events Tab Selected
    Log to Console  Clearing Filter and sleeping two seconds until JUS-417 is fixed
    Clear All Filters
    sleep  2 seconds
#    Set Server Filter  ${server}

Navigate to End Points and Set Filter
    [Arguments]  ${server}
    Click Endpoints Tab
    Confirm Endpoints Tab Selected
    Set Server Filter  ${server}
    sleep  2 seconds

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
