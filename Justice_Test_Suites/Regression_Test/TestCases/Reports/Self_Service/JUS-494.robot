*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-494: Logi self service metadata returns back 0 rows of data.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Self Service Visual Contains Hourly Data
    Navigate to Reports
    Click Reports Add Button
    Click Add New Visual
    Confirm Self Service Report Page Title
    Self Service Visual Set Select Data To Hourly Data
    sleep  2 seconds
    Confirm Self Service Visual Table Contains Data
    Self Service Visual Click Filter
    Self Service Visual Select Filter Column  xmc
    Self Service Visual Select Filter Comparison  =
    Self Service Visual Set Filter Value  ${XMC_HOSTNAME}
    Self Service Visual Filter Click Add
    sleep  3 seconds
    Confirm Self Service Visual Table Contains Value  ${XMC_HOSTNAME}
    Self Service Visual Filter Click Remove
    sleep  3 seconds

Confirm Self Service Visual Contains Raw Data
    Self Service Visual Click Data
    sleep  2 seconds
    Self Service Visual Set Select Data To Raw Data
    sleep  2 seconds
    Confirm Self Service Visual Table Contains Data
    Self Service Visual Click Filter
    Self Service Visual Select Filter Column  xmc
    Self Service Visual Select Filter Comparison  =
    Self Service Visual Set Filter Value  ${XMC_HOSTNAME}
    Self Service Visual Filter Click Add
    sleep  3 seconds
    Confirm Self Service Visual Table Contains Value  ${XMC_HOSTNAME}
    Self Service Visual Filter Click Remove
