*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-644: Tags - Manage Tags: No Cancel Button in Device Details.

Suite Setup      Log In and Create Tag and Assign Devices To Tag
Suite Teardown   Clean Up Tags and Log Out and Close Browser

Test Setup       Open Manage Tags And Expand Test Tag Row
Test Teardown    Close Manage Tags and Hide Tags Panel

*** Variables ***
${device_filter}  10.54.142.1
${test_device_1}  10.54.142.10
${test_device_2}  10.54.142.11
${test_tag}       Test Tag

*** Test Cases ***
Confirm Manage Tags Device Details Delete Allows Cancel
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_1}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_2}
    Manage Tags Device Details Click Delete  ${test_device_1}
    Confirm Manage Tags Device Not Assigned To Tag  ${test_tag}  ${test_device_1}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_2}
    Manage Tags Device Details Click Cancel
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_1}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_2}

Confirm Manage Tags Device Details Delete Save Still Works
    Manage Tags Device Details Click Delete  ${test_device_1}
    Confirm Manage Tags Device Not Assigned To Tag  ${test_tag}  ${test_device_1}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_2}
    Manage Tags Device Details Click Save
    Confirm Manage Tags Device Not Assigned To Tag  ${test_tag}  ${test_device_1}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_2}

Confirm Reopening Manage Tags Panel Has Correct Device Assignments
    Confirm Manage Tags Device Not Assigned To Tag  ${test_tag}  ${test_device_1}
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device_2}

*** Keywords ***
Log In and Create Tag and Assign Devices To Tag
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab
    Set Server Filter  ${XMC_HOSTNAME}
    Tags Panel Create Tag  ${test_tag}
    Assign Test Devices To Test Tag

Assign Test Devices To Test Tag
    Search Field Enter Text  ${device_filter}
    sleep  1 second
    Select Device In Table  ${test_device_1}
    Select Device In Table  ${test_device_2}
    Search Field Clear Text
    Click Add Devices To Tag
    Confirm Add Devices To Tag Panel Visible
    Confirm Add Devices To Tag Panel Contains Tag  ${test_tag}
    Add Devices To Tag Select Tag  ${test_tag}
    Add Devices To Tag Click Save

Clean Up Tags and Log Out and Close Browser
    Show Tags Panel
    sleep  1 second
    Tags Panel Select Tag  ${test_tag}
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}
    Hide Tags Panel
    Log Out and Close Browser

Open Manage Tags And Expand Test Tag Row
    Show Tags Panel
    sleep  1 second
    Tags Panel Click Manage
    sleep  1 second
    Confirm Manage Tags Panel Contains Tag  ${test_tag}
    Manage Tags Expand Row  ${test_tag}

Close Manage Tags and Hide Tags Panel
    Manage Tags Collapse Row  ${test_tag}
    Manage Tags Click Close
    Hide Tags Panel
