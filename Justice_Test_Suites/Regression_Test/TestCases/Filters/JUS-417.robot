*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-417: Events: Applying Server & Site Filter Removes All Events.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Set Server Filter and Confirm Events Present
    Set Server Filter  ${XMC_HOSTNAME}
    Confirm Events Present

Set Filter to Empty Site and Confirm No Events Present
    Clear All Filters
    Show Filter Panel
    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Set Site Filter  Empty Site
    sleep  2 seconds
    Confirm No Events Present
