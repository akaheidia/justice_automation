*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-505: Reports: Clicking back button from Add Report/Visual page gives Unable to Authenticate error.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Browser Back Button From Add New Report Page
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    Click Reports Add Button
    Click Add New Report
    sleep  2 seconds
    Go Back
    Confirm Page Does Not Contain Text  Unable to authenticate
    Confirm Site Availability Reports Page Title

Confirm Browser Back Button From Add New Visual Page
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Click Reports Add Button
    Click Add New Visual
    sleep  2 seconds
    Go Back
    Confirm Page Does Not Contain Text  Unable to authenticate
    Confirm Network Summary Reports Page Title
