*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-420: Reports: "Error # Undefined" error on Analytics Summary page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Analytics Summary Page Does Not Contain Error Message In Panels
    Navigate to Analytics Summary Report
    Confirm Analytics Summary Reports Page Title
    Confirm Analytics Summary Report Page Top N Panel Does Not Contain Message  ERROR
    Confirm Analytics Summary Report Page Top N Panel Does Not Contain Message  undefined
