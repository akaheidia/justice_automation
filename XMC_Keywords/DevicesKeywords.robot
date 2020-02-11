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


XMC Select Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(@class,'x-tree-node-text')]//span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(@class,'x-tree-node-text')]//span[contains(text(),'${nodename}')]

XMC Create Site
    [Arguments]  ${site_name}
    XMC Click Devices Context Menu
    Click Element  ${xmc_devices_tree_context_icon_maps_sites_menu}
    Click Element  ${xmc_devices_tree_context_icon_create_site_menu}
    Page Should Contain Element  ${xmc_create_site_dialog}
    XMC Create Site Enter Site Name  ${site_name}
    XMC Create Site Click OK

XMC Create Site Enter Site Name
    [Arguments]  ${site_name}
    Page Should Contain Element  ${xmc_create_site_dialog_name_text}
    Input Text  ${xmc_create_site_dialog_name_text}  ${site_name}  clear=True

XMC Create Site Click OK
    Page Should Contain Element  ${xmc_create_site_dialog_ok_btn}
    Click Element  ${xmc_create_site_dialog_ok_btn}

XMC Create Site Click Cancel
    Page Should Contain Element  ${xmc_create_site_dialog_cancel_btn}
    Click Element  ${xmc_create_site_dialog_cancel_btn}


XMC Delete Site
    [Arguments]  ${site_name}
    XMC Select Tree Node  ${site_name}
    XMC Wait For Site Tab To Load  ${site_name}
    sleep  1 second
    XMC Click Devices Context Menu
    Click Element  ${xmc_devices_tree_context_icon_maps_sites_menu}
    Click Element  ${xmc_devices_tree_context_icon_delete_site_menu}

    Page Should Contain Element  ${xmc_delete_site_dialog}
    XMC Delete Site Confirmation Should Contain Site  ${site_name}
    XMC Delete Site Click Yes

XMC Wait For Site Tab To Load
    [Arguments]  ${site_name}
    Wait Until Page Contains Element  xpath://span[@class='x-tab-inner x-tab-inner-extr-sec-tab-panel'][contains(text(), ${site_name})]

XMC Delete Site Confirmation Should Contain Site
    [Arguments]  ${site_name}
    Page Should Contain Element  xpath://div[contains(@class,'x-component x-window-text x-box-item x-component-default')][contains(text(), ${site_name})]

XMC Delete Site Click Yes
    Page Should Contain Element  ${xmc_delete_site_dialog_yes_btn}
    Click Element  ${xmc_delete_site_dialog_yes_btn}

XMC Delete Site Click No
    Page Should Contain Element  ${xmc_delete_site_dialog_no_btn}
    Click Element  ${xmc_delete_site_dialog_no_btn}
