*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation   Regression test for JUS-668: Tags: Panel data out of sync after manage tags update.

Suite Setup     Log In and Set Up Tags
Suite Teardown  Clean Up Tags and Log Out and Close Browser

*** Variables ***
${test_tag}     Test Tag
${test_device}  10.54.142.10

*** Test Cases ***
Confirm Manage Tags Dialog Data Correct After Device Deleted From Tag
    Show Tags Panel
    Tags Panel Click Manage
    sleep  1 second
    Manage Tags Expand Row  ${test_tag}
    Manage Tags Device Details Click Delete  ${test_device}
    Manage Tags Device Details Click Save
    sleep  1 second
    Manage Tags Expand Row  ${test_tag}
    Confirm Manage Tags Panel Number Tagged Items  ${test_tag}  0
    Confirm Manage Tags Devices Assigned To Tag Count  ${test_tag}  0
    Manage Tags Click Close

Confirm Tags Panel Data Is Correct After Device Deleted From Tag
    Show Tags Panel
    Confirm Tags Panel Tag Device Count Value  ${test_tag}  0

*** Keywords ***
Log In and Set Up Tags
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab
    Tags Panel Create Tag  ${test_tag}
    Assign Device To Tags  ${test_device}  ${test_tag}
    Show Tags Panel
    Confirm Tags Panel Tag Device Count Value  ${test_tag}  1
    Tags Panel Click Manage
    Confirm Manage Tags Panel Number Tagged Items  ${test_tag}  1
    Confirm Manage Tags Devices Assigned To Tag Count  ${test_tag}  1
    Confirm Manage Tags Device Assigned To Tag  ${test_tag}  ${test_device}
    Manage Tags Click Close

Clean Up Tags and Log Out and Close Browser
    Tags Panel Delete Tag  ${test_tag}
    Log Out and Close Browser
