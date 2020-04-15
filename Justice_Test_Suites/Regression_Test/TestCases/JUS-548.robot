*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-548: Tags: Filtering by tag does not work.

Suite Setup     Log In and Navigate To Devices Page
Suite Teardown  Log Out and Close Browser

Test Setup      Create Test Tag
Test Teardown   Delete Test Tag

*** Variables ***
${test_tag}     Test Tag
${test_device}  10.54.142.10

*** Test Cases ***
Confirm Filtering By Tag Works - No Devices
    Set Tag Filter  ${test_tag}
    Confirm Device Not In Table  ${test_device}
    Clear All Filters

Confirm Filtering By Tag Works - Device Assigned To Tag
    Assign Device To Tag
    Set Tag Filter  ${test_tag}
    Confirm Device In Table  ${test_device}
    Clear All Filters

*** Keywords ***
Log In and Navigate To Devices Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab

Create Test Tag
    Show Tags Panel
    Tags Panel Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Click Save
    Confirm Tags Panel Contains Tag  ${test_tag}

Assign Device To Tag
    Search Field Enter Text  ${test_device}
    Select Device In Table  ${test_device}
    Search Field Clear Text
    Click Add Devices To Tag
    Confirm Add Devices To Tag Panel Visible
    Confirm Add Devices To Tag Panel Contains Tag  ${test_tag}
    Add Devices To Tag Select Tag  ${test_tag}
    Add Devices To Tag Click Save

Delete Test Tag
    Show Tags Panel
    Tags Panel Select Tag  ${test_tag}
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}
