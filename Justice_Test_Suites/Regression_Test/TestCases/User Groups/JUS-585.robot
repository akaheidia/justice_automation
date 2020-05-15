*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-585: Settings: Remove NetSight Administrator from the User Groups list / don't allow editing.

Suite Setup      Log In and Navigate To User Group Settings Page
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Test Not Supported
    Log To Console  Settings Page Has Been Removed - Test Commented Out Until It Is Added Back

#Confirm Netsight Administrator Group Cannot Be Edited
#    Settings Select User Group  ${XMC_HOSTNAME}  NetSight Administrator
#    Confirm Settings User Group Edit Button Not Present
#
#Confirm Other Groups Can Be Edited
#    Settings Select User Group  ${XMC_HOSTNAME}  Custom Group
#    sleep  1 second
#    Confirm Settings User Group Edit Button Present
#    Settings User Group Click Edit
#    Confirm Settings User Group Save Button Present
#    Confirm Settings User Group Cancel Button Present
#    Settings User Group Click Cancel

*** Keywords ***
Log In and Navigate To User Group Settings Page
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
#    Click Settings
#    Confirm Settings Page Loaded
#    Click User Groups
#    Confirm User Groups Page Loaded
