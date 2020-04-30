*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-418: Filters: Clear Filter does not work correctly when partial filter applied.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Clear Filter Correctly Clears the Filters
    Show Filter Panel
    Set Server Filter  ${XMC_HOSTNAME}
    Confirm Full Server Filter Applied  ${XMC_HOSTNAME}
    Clear All Filters
    Confirm No Server Filter Applied  ${XMC_HOSTNAME}
    Expand Servers and Sites Tree Node  ${XMC_HOSTNAME}
    Set Site Filter  ${site_device_down}
    Confirm Partial Server Filter Applied  ${XMC_HOSTNAME}
    Clear All Filters
    Confirm No Server Filter Applied  ${XMC_HOSTNAME}
