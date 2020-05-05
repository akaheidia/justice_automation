*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    This test suite performs steps necessary to get the test environment created for remainder of tests.
...              The following Sites and Devices are created in XMC:
...              World
...                  10.54.142.14  (7100)
...                  Device Down Test Site
...                      10.54.142.31  (B5)
...                      10.54.142.53  (B5_2;  device is set to "bad profile" to have device status down)
...                  Empty Site  (no devices)
...                  Level 1 Site
...                      Level 2 Site
...                          Level 3 Site
...                              Level 4 Site
...                                  Level 5 Site
...                                      10.54.142.55  (SSA_2)
...                  Parent Site
...                      Child 1 Site
...                          Test Site
...                              10.54.142.10  (C5)
...                          10.54.152.17  (X460)
...                      Child 2 Site
...                          Test Site
...                              10.54.142.11  (C5_2)
...                          10.54.152.18  (X460_2)
...                      10.54.142.54  (C5_3)
...                  Port Test Site
...                      10.54.142.32  (SSA)
...                  Wireless Site
...                      10.54.142.50   (Wireless Controll C5215)
...                      10.54.142.60   (XCA)
...                      10.54.142.70   (WING)
...                      10.54.147.111  (Wireless Controller V2110)

Suite Setup      XMC Open Browser and Log In  ${XMC_URL}  ${BROWSER}  ${XMC_USERNAME}  ${XMC_PASSWORD}
#Suite Setup      XMC Open Browser and Log In  ${XMC_2_URL}  ${BROWSER}  ${XMC_2_USERNAME}  ${XMC_2_PASSWORD}
Suite Teardown   XMC Log Out and Close Browser

*** Test Cases ***

#Enable Beta Features for XMC
#    Navigate to Diagnostics Tab
#    XMC Confirm Diagnostics Tab Loaded
#    XMC Set Main Diagnostic Level  Diagnostic
#    sleep  1 second
#    XMC Expand Diagnostics Tree Node  Beta Features
#    XMC Select Diagnostics Tree Node  Enable/Disable Beta Features
#    Wait Until Page Contains  Enable/Disable Beta Features  timeout=5 seconds
#    XMC Enable Beta Features  netsight
#    sleep  1 second
#    XMC Confirm Beta Features Enabled

#Set XMC Data Pump Options
#    Navigate to Options Tab
#    XMC Select Options Tree Node  XMC Data Pump
#    XMC Set Option Value XMC Data Pump Enable Sharing
#    XMC Set Option Value XMC Data Pump Host  ${JUS_HOST_IP}
#    XMC Set Option Value XMC Data Pump Username  guest
#    XMC Set Option Value XMC Data Pump Password  extreme
#    XMC Options Click Save
#    Reload Page
#    XMC Select Options Tree Node  XMC Data Pump
#    XMC Confirm Option Value XMC Data Pump Sharing Enabled
#    XMC Confirm Option Value XMC Data Pump Host  ${JUS_HOST_IP}
#    XMC Confirm Option Value XMC Data Pump Port  5672
#    XMC Confirm Option Value XMC Data Pump Username  guest
#    XMC Confirm Option Value XMC Data Pump Password  extreme

#Create Sites in XMC
#    Navigate to Devices Tab
#    Create Site  World  ${site_device_down}
#    Create Site  World  ${site_empty}
#    Create Site  World  ${site_level_1}
#    Create Site  ${site_level_1}  ${site_level_2}
#    Create Site  ${site_level_2}  ${site_level_3}
#    Create Site  ${site_level_3}  ${site_level_4}
#    Create Site  ${site_level_4}  ${site_level_5}
#    Create Site  World  ${site_parent}
#    Create Site  ${site_parent}  ${site_child_1}
#    Create Site  ${site_parent}  ${site_child_2}
#    Create Site  ${site_child_1}  ${site_test}
#    Create Site  ${site_child_2}  ${site_test}
#    Create Site  World  ${site_port}
#    Create Site  World  ${site_wireless}
#
#Create Devices in XMC
#    Navigate to Devices Tab
#    Create Device in Site  World  ${device_site_world}  ${device_site_world_profile}  ${device_site_world_nickname}
#    Create Device in Site  ${site_device_down}  ${device_up_site_device_down}    ${device_up_site_device_down_profile}  ${device_up_site_device_down_nickname}
#    Create Device in Site  ${site_device_down}  ${device_down_site_device_down}  ${device_down_site_device_down_profile}  ${device_down_site_device_down_nickname}
#    Create Device in Site  ${site_level_5}  ${device_site_level_5}  ${device_site_level_5_profile}  ${device_site_level_5_nickname}
#    Create Device in Site  ${site_parent}  ${device_site_parent}  ${device_site_parent_profile}  ${device_site_parent_nickname}
#    Create Device in Site  ${site_child_1}  ${device_site_child_1}  ${device_site_child_1_profile}  ${device_site_child_1_nickname}
#    Create Device in Site  ${site_child_2}  ${device_site_child_2}  ${device_site_child_2_profile}  ${device_site_child_2_nickname}
##${device_1_site_test}            10.54.142.11
##${device_2_site_test}            10.54.142.54
#    Create Device in Site  ${site_port}  ${device_site_port}  ${device_site_port_profile}  ${device_site_port_nickname}
#    Create Device in Site  ${site_wireless}  ${device_1_site_wireless}  ${device_1_site_wireless_profile}  ${device_1_site_wireless_nickname}
#    Create Device in Site  ${site_wireless}  ${device_2_site_wireless}  ${device_2_site_wireless_profile}  ${device_2_site_wireless_nickname}
#    Create Device in Site  ${site_wireless}  ${device_3_site_wireless}  ${device_3_site_wireless_profile}  ${device_3_site_wireless_nickname}
#    Create Device in Site  ${site_wireless}  ${device_4_site_wireless}  ${device_4_site_wireless_profile}  ${device_4_site_wireless_nickname}

Collect Device Statistics
    Navigate to Devices Tab
    XMC Collect Device Statistics  ${device_up_site_device_down}  Historical
    XMC Collect Controller Statistics  ${device_4_site_wireless}  true

*** Keywords ***
Navigate to Options Tab
    XMC Navigate to Administration Page
    XMC Click Options Tab
    XMC Confirm Options Tab Loaded

Navigate to Diagnostics Tab
    XMC Navigate to Administration Page
    XMC Click Diagnostics Tab
    XMC Confirm Diagnostics Tab Loaded

Navigate to Devices Tab
    XMC Navigate To Network Page
    XMC Click Devices Tab
    XMC Confirm Devices Tab Loaded

Create Site
    [Arguments]  ${parent}  ${site}
    XMC Select Device Tree Node  ${parent}
    sleep  2 seconds
    XMC Create Site  ${site}
    sleep  2 seconds

Create Device in Site
    [Arguments]  ${site}  ${ip}  ${profile}  ${nickname}
    XMC Select Device Tree Node  ${site}
    sleep  2 seconds
    XMC Create Device  ${ip}  ${profile}  ${nickname}
