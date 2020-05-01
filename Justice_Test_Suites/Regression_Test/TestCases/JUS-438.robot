*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-438: Reports: Wireless Volume donut does not have a drilldown.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Wireless Volume Donut Has Drilldown
    Navigate to Reports
    sleep  2 seconds
    Confirm Network Scorecard Reports Page Title
    Click Network Scorecard Site Wireless Volume Drilldown
    sleep  2 seconds
    Confirm Site Wireless Volume Reports Page Title
    Click Breadcrumb  Home
    sleep  2 seconds
#    Click Scorecard Wireless Volume Donut
