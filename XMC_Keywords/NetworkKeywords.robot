*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Network Page in XMC.

*** Keywords ***
Click XMC Dashboard Tab
    Click Element  ${xmc_network_dashboard_tab}

Click XMC Devices Tab
    Click Element  ${xmc_network_devices_tab}

Click XMC Discovered Tab
    Click Element  ${xmc_network_discovered_tab}

Click XMC Firmware Tab
    Click Element  ${xmc_network_firmware_tab}

Click XMC Archives Tab
    Click Element  ${xmc_network_archives_tab}

Click XMC Reports Tab
    Click Element  ${xmc_network_reports_tab}


Confirm XMC Devices Tab Loaded
    Page Should Contain Element  ${xmc_network_devices_view}
