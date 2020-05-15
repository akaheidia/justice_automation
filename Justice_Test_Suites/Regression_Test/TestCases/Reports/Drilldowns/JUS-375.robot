*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-375: Reports - Usability: ring charts should have click zone on label as well as ring.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser
Test Setup       Navigate To Network Scorecard Report

*** Test Cases ***
Confirm Site Availability Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site Availability Drilldown
    sleep  2 seconds
    Confirm Site Availability Reports Page Title

Confirm Site CPU Utilization Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site CPU Utilization Drilldown
    sleep  2 seconds
    Confirm Site CPU Utilization Reports Page Title

Confirm Site Memory Utilization Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site Memory Utilization Drilldown
    sleep  2 seconds
    Confirm Site Memory Utilization Reports Page Title

Confirm Total Clients Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Total Clients Drilldown
    sleep  2 seconds
    Confirm Total Clients Reports Page Title

Confirm Site Port Utilization Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site Port Utilization Drilldown
    sleep  2 seconds
    Confirm Site Port Utilization Reports Page Title

Confirm Site Port Error Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site Port Error Drilldown
    sleep  2 seconds
    Confirm Site Port Error Reports Page Title

Confirm Site Wireless Volume Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site Wireless Volume Drilldown
    sleep  2 seconds
    Confirm Site Wireless Volume Reports Page Title

Confirm Tracked Application Response Time Label Drilldown
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Tracked Application Response Time Drilldown
    sleep  2 seconds
    Confirm Tracked Application Response Time Reports Page Title
