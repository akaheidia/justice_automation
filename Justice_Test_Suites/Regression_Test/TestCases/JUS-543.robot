*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-543: Tags: adding device to more than one tag results in multiple instances of the device reported in each tag.

Suite Setup     Log In and Set Up Tags
Suite Teardown  Clean Up Tags and Log Out and Close Browser

*** Variables ***
${tag_1}        Test Tag 1
${tag_2}        Test Tag 2
${tag_3}        Test Tag 3
${test_device}  10.54.142.10

*** Test Cases ***
Confirm Tags Panel Device Count
    Show Tags Panel
    Confirm Tags Panel Tag Device Count Value  ${tag_1}  1
    Confirm Tags Panel Tag Device Count Value  ${tag_2}  1
    Confirm Tags Panel Tag Device Count Value  ${tag_3}  1

Confirm Details Panel Device Count
    Show Tags Panel
    Tags Panel Click Manage
    Confirm Manage Tags Devices Assigned To Tag Count  ${tag_1}  1
    Confirm Manage Tags Device Assigned To Tag  ${tag_1}  ${test_device}
    Confirm Manage Tags Devices Assigned To Tag Count  ${tag_2}  1
    Confirm Manage Tags Device Assigned To Tag  ${tag_2}  ${test_device}
    Confirm Manage Tags Devices Assigned To Tag Count  ${tag_3}  1
    Confirm Manage Tags Device Assigned To Tag  ${tag_3}  ${test_device}
    Manage Tags Click Close

Confirm Deleting Device From One Tag Does Not Affect Other Tags
    Show Tags Panel
    Tags Panel Click Manage
    sleep  1 second
    Manage Tags Expand Row  ${tag_2}
    Manage Tags Device Details Click Delete  ${test_device}
    Manage Tags Device Details Click Save
    Manage Tags Click Close
    Tags Panel Click Refresh
    Confirm Tags Panel Tag Device Count Value  ${tag_1}  1
    Confirm Tags Panel Tag Device Count Value  ${tag_2}  0
    Confirm Tags Panel Tag Device Count Value  ${tag_3}  1
    Tags Panel Click Manage
    Confirm Manage Tags Devices Assigned To Tag Count  ${tag_1}  1
    Confirm Manage Tags Device Assigned To Tag  ${tag_1}  ${test_device}
    Confirm Manage Tags Devices Assigned To Tag Count  ${tag_2}  0
    Confirm Manage Tags Device Not Assigned To Tag  ${tag_2}  ${test_device}
    Confirm Manage Tags Devices Assigned To Tag Count  ${tag_3}  1
    Confirm Manage Tags Device Assigned To Tag  ${tag_3}  ${test_device}
    Manage Tags Click Close

*** Keywords ***
Log In and Set Up Tags
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab
    Tags Panel Create Tag  ${tag_1}
    Tags Panel Create Tag  ${tag_2}
    Tags Panel Create Tag  ${tag_3}
    Assign Device To Tags  ${test_device}  ${tag_1},${tag_2},${tag_3}

Clean Up Tags and Log Out and Close Browser
    Tags Panel Delete Tag  ${tag_1}
    Tags Panel Delete Tag  ${tag_2}
    Tags Panel Delete Tag  ${tag_3}
    Log Out and Close Browser
