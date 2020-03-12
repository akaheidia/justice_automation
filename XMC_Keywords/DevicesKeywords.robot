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


XMC Select Device Tree Node
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
    XMC Select Device Tree Node  ${site_name}
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
    Wait Until Page Contains Element  xpath://span[@class='x-tab-inner x-tab-inner-extr-sec-tab-panel'][contains(text(), '${site_name}')]

XMC Delete Site Confirmation Should Contain Site
    [Arguments]  ${site_name}
    Page Should Contain Element  xpath://div[contains(@class,'x-component x-window-text x-box-item x-component-default')][contains(text(), '${site_name}')]

XMC Delete Site Click Yes
    Page Should Contain Element  ${xmc_delete_site_dialog_yes_btn}
    Click Element  ${xmc_delete_site_dialog_yes_btn}

XMC Delete Site Click No
    Page Should Contain Element  ${xmc_delete_site_dialog_no_btn}
    Click Element  ${xmc_delete_site_dialog_no_btn}


XMC Confirm Site Exists
    [Arguments]  ${site}
    Page Should Contain Element  xpath://span[contains(@class,'x-tree-node-text')]//span[contains(text(),'${site}')]

XMC Confirm Site Does Not Exist
    [Arguments]  ${site}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  xpath://span[contains(@class,'x-tree-node-text')]//span[contains(text(),'${site}')]
    Set Selenium Implicit Wait  ${orig_wait}


XMC Create Device
    [Arguments]  ${device_ip}  ${device_profile}  ${device_nickname}
    XMC Click Add Device
    Page Should Contain Element         ${xmc_create_device_dialog}
    XMC Create Device Enter IP Address  ${device_ip}
    XMC Create Device Select Profile    ${device_profile}
    XMC Create Device Enter Nickname    ${device_nickname}
    XMC Create Device Click OK

XMC Click Add Device
    Page Should Contain Element  ${xmc_devices_toolbar_add_device}
    Click Element  ${xmc_devices_toolbar_add_device}

XMC Create Device Enter IP Address
    [Arguments]  ${device_ip}
    Page Should Contain Element  ${xmc_create_device_dialog_ip_text}
    Input Text  ${xmc_create_device_dialog_ip_text}  ${device_ip}  clear=True

XMC Create Device Select Profile
    [Arguments]  ${device_profile}
    Page Should Contain Element  ${xmc_create_device_dialog_profile_list}
    Click Element  ${xmc_create_device_dialog_profile_list}
    Click Element  xpath://div[contains(text(),'${device_profile}')]

XMC Create Device Enter Nickname
    [Arguments]  ${device_nickname}
    Page Should Contain Element  ${xmc_create_device_dialog_nickname_text}
    Input Text  ${xmc_create_device_dialog_nickname_text}  ${device_nickname}  clear=True

XMC Create Device Click OK
    # Give the button a chance to become enabled
    : FOR  ${index}  IN RANGE  1  1000
    \    ${ok_enabled}=  Run Keyword And Return Status  Page Should Contain Element  ${xmc_create_device_dialog_ok_btn_enabled}
    \    Exit For Loop If  ${ok_enabled} == True
    Page Should Contain Element  ${xmc_create_device_dialog_ok_btn_enabled}
    Click Element  ${xmc_create_device_dialog_ok_btn_enabled}

XMC Create Device Click Apply
    Wait Until Page Contains Element  ${xmc_create_device_dialog_apply_btn}
    Click Element  ${xmc_create_device_dialog_apply_btn}

XMC Create Device Click Close
    Page Should Contain Element  ${xmc_create_device_dialog_close_btn}
    Click Element  ${xmc_create_device_dialog_close_btn}


XMC Refresh Devices Table
    Click Element  ${xmc_devices_table_refresh_icon}

XMC Confirm Device In Table
    [Arguments]  ${device_ip}
    : FOR  ${index}  IN RANGE  1  10
    \    XMC Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Page Should Contain Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]
    \    Log  Found device? ${found_device}
    \    Exit For Loop If  ${found_device} == True
    Page Should Contain Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]

XMC Confirm Device Not In Table
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    : FOR  ${index}  IN RANGE  1  10
    \    XMC Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Page Should Contain Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]
    \    Log  Found device? ${found_device}
    \    Exit For Loop If  ${found_device} == False
    Page Should Not Contain Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]
    Set Selenium Implicit Wait  ${orig_wait}

XMC Select Device In Table
    [Arguments]  ${device_ip}
    Page Should Contain Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]
    Click Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]

XMC Right Click Device In Table
    [Arguments]  ${device_ip}
    Page Should Contain Element  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]
    Open Context Menu  xpath://div[contains(@class,'x-grid-cell-inner')][contains(text(),'${device_ip}')]


XMC Delete Device
    [Arguments]  ${device_ip}
    XMC Right Click Device In Table  ${device_ip}
    Click Element  ${xmc_devices_context_more_actions_menu}
    Click Element  ${xmc_devices_context_delete_device_menu}
    Page Should Contain Element  ${xmc_delete_device_dialog}
    Click Element  ${xmc_delete_device_dialog_delete_data_check_btn}
    Click Element  ${xmc_delete_device_dialog_yes_btn}
