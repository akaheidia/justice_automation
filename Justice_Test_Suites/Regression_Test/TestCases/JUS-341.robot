*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-341: UI: Reports - Menu vs Page Title Inconsistencies.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Network Scorecard Menu and Title
    Navigate to Network Scorecard Report
    Confirm Network Scorecard Reports Page Title

Confirm Site Availability Menu and Title
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title

Confirm Top APs By Clients Menu and Title
    Navigate to Top N Top APs By Clients Report
    Confirm Top N Top APs by Clients Reports Page Title

Confirm Top APs By Bandwidth Menu and Title
    Navigate to Top N Top APs By Bandwidth Report
    Confirm Top N Top APs by Bandwidth Reports Page Title

Confirm Analytics Top Applications By Clients Menu and Title
    Navigate to Analytics Top Applications By Clients Report
    Confirm Analytics Top Applications by Clients Reports Page Title

Confirm Analytics Daily Usage Menu and Title
    Navigate to Analytics Daily Usage Report
    Confirm Analytics Daily Usage Reports Page Title

Confirm Analytics Monthly Usage Menu and Title
    Navigate to Analytics Monthly Usage Report
    Confirm Analytics Monthly Usage Reports Page Title

Confirm Analytics Quarterly Summary Menu and Title
    Navigate to Analytics Quarterly Summary Report
    Confirm Analytics Quarterly Summary Reports Page Title
