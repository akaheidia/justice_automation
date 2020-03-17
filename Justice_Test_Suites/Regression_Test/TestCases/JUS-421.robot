*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-421: Reports - Analytics Summary: Label incorrect for Top Site By Clients panel

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Analytics Summary Top Sites By Clients Title
    Navigate to Analytics Summary Report
    Confirm Analytics Summary Reports Page Title
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Sites By Clients
