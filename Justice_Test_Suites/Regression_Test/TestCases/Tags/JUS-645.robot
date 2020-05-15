*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-645: Update existing reports to support device tag.

Suite Setup     Log In and Set Up Tags
Suite Teardown  Clean Up Tags and Log Out and Close Browser

*** Variables ***
${test_device_1}  ${device_down_site_device_down}
${test_device_2}  ${device_up_site_device_down}
${test_tag}       Test Tag

*** Test Cases ***
Confirm Report Filter By Tag Functionality
    Navigate to Site Availability Report
    sleep  2 seconds
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
    Confirm Site Availability Report Table Contains Value  ${site_wireless}
    Show Reports Filter Panel
    Set Reports Filter Device Tags  ${test_tag}
    Apply Reports Filter
    sleep  2 seconds
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
    Confirm Site Availability Report Table Does Not Contain Value  ${site_wireless}

*** Keywords ***
Log In and Set Up Tags
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab
    Tags Panel Create Tag  ${test_tag}
    Assign Device To Tags  ${test_device_1}  ${test_tag}
    sleep  1 second
    Assign Device To Tags  ${test_device_2}  ${test_tag}
    Show Tags Panel
    Confirm Tags Panel Tag Device Count Value  ${test_tag}  2
    Hide Tags Panel

Clean Up Tags and Log Out and Close Browser
    Click Monitor
    Click List Slider
    Click Devices Tab
    Tags Panel Delete Tag  ${test_tag}
    Log Out and Close Browser
