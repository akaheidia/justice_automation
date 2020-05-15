*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Library   Collections
Library   RequestsLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-432: Usability: inconsistent terminolog between Justice and XMC: End Points vs End-Systems.

Suite Setup      Log In and Navigate to List View
Suite Teardown   Log Out and Close Browser

*** Variables ***
${json_string}
...  {
...    "paginator": {
...      "size": 20,
...      "page": 0
...    }
...  }

*** Test Cases ***
Confirm End-Systems Tab
    Click End-Systems Tab
    Confirm End-Systems Tab Selected
    Confirm Page Does Not Contain Text  End Point

Confirm CSV Download File Name for End-Systems All Rows
    Navigate to End-Systems and Set Filter  ${XMC_2_HOSTNAME}
    Download CSV All Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_endsystems_all}
    Remove File  ${csv_endsystems_all}

Confirm CSV Download File Name for End-Systems Visible Rows
    Download CSV Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_endsystems_visible}
    Remove File  ${csv_endsystems_visible}

Confirm CSV Download File Name for End-Systems All Filtered Rows
    Download CSV All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${csv_endsystems_filtered}
    Remove File  ${csv_endsystems_filtered}


Confirm PDF Download File Name for End-Systems All Rows
    Download PDF All Rows
    Wait Until Download Completes
    Confirm File Exists  ${pdf_endsystems_all}
    Remove File  ${pdf_endsystems_all}

Confirm PDF Download File Name for End-Systems Visible Rows
    Download PDF Visible Rows
    Wait Until Download Completes
    Confirm File Exists  ${pdf_endsystems_visible}
    Remove File  ${pdf_endsystems_visible}

Confirm PDF Download File Name for End-Systems All Filtered Rows
    Download PDF All Filtered Rows
    Wait Until Download Completes
    Confirm File Exists  ${pdf_endsystems_filtered}
    Remove File  ${pdf_endsystems_filtered}


Confirm API For End-Systems
    Set Access Token
    Confirm Post Request Successful  /v1/api/endSystems  ${json_string}


*** Keywords ***
Log In and Navigate to List View
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider

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
