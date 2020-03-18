*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-386: Endpoints: site filters are not working.

Suite Setup      Log In and Navigate to End-Systems Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${xmc_with_endsystems}    ${XMC_2_HOSTNAME}

*** Test Cases ***
Confirm Error Not Seen When Filtering End-Systems By Site
    Set Server Filter  ${xmc_with_endsystems}
    Confirm Page Does Not Contain Text  404
