*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Network Page in XMC.

*** Keywords ***
XMC Click Dashboard Tab
    Click Element  ${xmc_network_dashboard_tab}

XMC Click Devices Tab
    Click Element  ${xmc_network_devices_tab}
    sleep  1 second

XMC Click Discovered Tab
    Click Element  ${xmc_network_discovered_tab}

XMC Click Firmware Tab
    Click Element  ${xmc_network_firmware_tab}

XMC Click Archives Tab
    Click Element  ${xmc_network_archives_tab}

XMC Click Reports Tab
    Click Element  ${xmc_network_reports_tab}


XMC Confirm Devices Tab Loaded
    Page Should Contain Element  ${xmc_network_devices_view}
