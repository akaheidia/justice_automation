*** Settings ***
Library   SSHLibrary
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation   Regression test for JUS-607: Filters: Server & Sites panel is empty even when servers are present.

Suite Setup     Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown  Log Out and Close Browser


*** Test Cases ***
Confirm XMC Server Present In List Filter Panel
    Click Monitor
    Show Filter Panel
    Confirm Filter Panel Contains Server  ${XMC_HOSTNAME}
    Confirm Filter Panel Contains Server  ${XMC_2_HOSTNAME}
