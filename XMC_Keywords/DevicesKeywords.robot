*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Network> Devices tab in XMC.

*** Keywords ***
XMC Click Devices Devices Tab
    Click Element  ${xmc_devices_devices_tab}

XMC Click Devices Site Tab
    Click Element  ${xmc_network_site_tab}

XMC Click Devices Site Summary Tab
    Click Element  ${xmc_network_site_summary_tab}

XMC Click Devices Endpoint Locations Tab
    Click Element  ${xmc_network_endpoint_locations_tab}

XMC Click Devices FlexReports Tab
    Click Element  ${xmc_network_flexreports_tab}

XMC Confirm Devices Devices Tab Loaded
    Page Should Contain Element  ${xmc_network_devices_view}


XMC Click Devices Context Menu
    Click Element  ${xmc_devices_tree_context_icon}

XMC Create Site
    [Arguments]  ${site_name}
    XMC Click Devices Context Menu
    Click Element  ${xmc_devices_tree_context_icon_maps_sites_menu}
    Click Element  ${xmc_devices_tree_context_icon_create_site_menu}
    XMC Create Site Enter Site Name  ${site_name}
    XMC Create Site Click OK

XMC Create Site Enter Site Name
    [Arguments]  ${site_name}
    Input Text  ${xmc_create_site_dialog_name_text}  ${site_name}  clear=True

XMC Create Site Click OK
    Click Element  ${xmc_create_site_dialog_ok_btn}

XMC Create Site Click Cancel
    Click Element  ${xmc_create_site_dialog_cancel_btn}
