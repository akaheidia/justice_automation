*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-507: Reports: Port Error drilldown loads new report within page instead of in new page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Browser Back Button From Add New Report Page
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Click Port Error Drilldown
    Confirm Top N Top Port Error Reports Page Title
