*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-514: Reports: Clicking "Total Clients" donut drills down into a page with the title "End Systems".

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser
Test Setup       Navigate To Network Scorecard Report

*** Test Cases ***
Confirm Total Clients Drilldown Resulting Page Title
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Total Clients Drilldown
    Confirm Total Clients Reports Page Title
