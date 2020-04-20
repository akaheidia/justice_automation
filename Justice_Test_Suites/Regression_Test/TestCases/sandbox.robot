#*** Settings ***
#Library   SeleniumLibrary
#Resource  ../Resources/AllResources.robot
#
#Documentation    sandbox test for figuring out test steps
#
#Test Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
#Test Teardown   Log Out and Close Browser
#
##Test Setup       Reload Page
##Test Teardown    Reset Page
#
#*** Variables ***
#${device_ip}    10.54.142.32
#${port_num}     ge.1.8
#${site}         Port Test Site
#
#*** Test Cases ***
#Test 1
#    Navigate to Site Port Utilization Report
#    Confirm Port Utilization Report Page Title
#    Port Utilization Drill Into Site  ${site}
#    Port Utilization Drill Into Device  ${device_ip}
#    Confirm Device Overview Report Page Title
#
#Test 2
#    Navigate to Site Availability Report
#    Confirm Site Availability Report Page Title
#
#Test 3
#    Navigate to Site Port Utilization Report
#    Confirm Port Utilization Report Page Title
#
#
#*** Keywords ***
#Reset Page
#    Open Reports Sidebar Menu
#    Collapse Reports Tree Site Node
#    Collapse Reports Tree Reports Node
##    Click Monitor
