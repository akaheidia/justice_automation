*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-425: Reports: Top APs is empty even though APs exist in system.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Top APs Reports Contain Data
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Confirm Top APs by Clients Panel Has Data
    Confirm Top APs by Bandwidth Panel Has Data
