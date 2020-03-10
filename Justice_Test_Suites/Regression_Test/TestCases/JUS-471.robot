*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-471: Reports: accessing reports page loads secondary Monitor page, then rdSecureKey error on refresh.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Reports Page Loads Correctly
    Click Monitor
    Click List Slider
    Confirm List Page Loaded
    Click Reports
    Confirm Reports Page Loaded
    Confirm Monitor Page Not Loaded

Confirm Refresh Browser Does Not Result In Error
    Reload Page
    Confirm Reports Page Loaded
    Confirm Page Does Not Contain Text  rdSecureKey
