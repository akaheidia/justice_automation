*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-399: Usability: Maintain Slider selection on Monitor page (Map vs List).

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Slider Selection Persists For List
    Click Monitor
    Click List Slider
    Click Reports
    Confirm Reports Page Loaded
    Click Monitor
    Confirm List Page Loaded

Confirm Slider Selection Persists For Map
    Click Monitor
    Click Map Slider
    Click Reports
    Confirm Reports Page Loaded
    Click Monitor
    Confirm Map Page Loaded

Confirm Slider Selection Persists On Logout/Login
    Click Monitor
    Click List Slider
    Confirm List Page Loaded
    Log Out
    Log In  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Confirm List Page Loaded
