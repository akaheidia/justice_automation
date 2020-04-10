*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-621: Reports: Tracked Application Response Time donut is empty.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Tracked Application Response Time Contains Data
    Click Reports
    sleep  2 seconds
    Confirm Reports Page Loaded
    Confirm Network Scorecard Tracked Application Response Time Has Value
