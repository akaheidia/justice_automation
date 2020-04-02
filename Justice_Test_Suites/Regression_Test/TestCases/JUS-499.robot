*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-499: Add support to display the clients and tracked application response time in score card.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser
Test Setup       Navigate To Network Scorecard Report

*** Test Cases ***
Confirm Total Clients Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Total Clients Drilldown
    Confirm Total Clients Reports Page Title

Confirm Tracked Application Response Time Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Tracked Application Response Time Drilldown
    Confirm Tracked Application Response Time Reports Page Title
