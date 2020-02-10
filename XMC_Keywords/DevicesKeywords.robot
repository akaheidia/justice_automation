*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Network> Devices tab in XMC.

*** Keywords ***
Click XMC Devices Devices Tab
    Click Element  ${xmc_devices_devices_tab}

Click XMC Devices Site Tab
    Click Element  ${xmc_network_dashboard_tab}

Click XMC Devices Site Summary Tab
    Click Element  ${xmc_network_dashboard_tab}

Click XMC Devices Endpoint Locations Tab
    Click Element  ${xmc_network_dashboard_tab}

Click XMC Devices FlexReports Tab
    Click Element  ${xmc_network_dashboard_tab}

Click XMC Devices Context Menu Create Site
    Click Element  ${xmc_devices_tree_context_icon}
    Click Element  ${xmc_devices_tree_context_icon_maps_sites_menu}
    Click Element  ${xmc_devices_tree_context_icon_create_site_menu}

Confirm XMC Devices Devices Tab Loaded
    Page Should Contain Element  ${xmc_network_devices_view}
