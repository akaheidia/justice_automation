*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-585: Settings: Remove NetSight Administrator from the User Groups list / don't allow editing.

Suite Setup      Log In and Navigate To User Group Settings Page
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Netsight Administrator Group Cannot Be Edited
    Settings Select User Group  ${XMC_HOSTNAME}  NetSight Administrator
    sleep  2 seconds
    Confirm Edit Button Not Present

Confirm Other Groups Can Be Edited
    Settings Select User Group  ${XMC_HOSTNAME}  Custom Group
    Confirm Edit Button Present

*** Keywords ***
Log In and Navigate To User Group Settings Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Settings
    Confirm Settings Page Loaded
    Click User Groups
    Confirm User Groups Page Loaded
