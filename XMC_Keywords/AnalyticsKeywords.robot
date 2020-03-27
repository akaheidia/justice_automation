*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Analytics tab in XMC.

*** Keywords ***

XMC Click Analytics Dashboard Tab
    Click Element  ${xmc_analytics_dashboard_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_dashboard_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_dashboard_tab}
    ...       ELSE  Log  Dashboard Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Analytics Browser Tab
    Click Element  ${xmc_analytics_browser_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_browser_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_browser_tab}
    ...       ELSE  Log  Browser Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Analytics Application Flows Tab
    Click Element  ${xmc_analytics_app_flows_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_app_flows_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_app_flows_tab}
    ...       ELSE  Log  Application Flows Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Analytics Fingerprints Tab
    Click Element  ${xmc_analytics_fingerprints_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_fingerprints_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_fingerprints_tab}
    ...       ELSE  Log  Fingerprints Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Analytics Packet Captures Tab
    Click Element  ${xmc_analytics_packet_captures_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_packet_captures_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_packet_captures_tab}
    ...       ELSE  Log  Packet Captures Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Analytics Configuration Tab
    Click Element  ${xmc_analytics_config_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_config_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_config_tab}
    ...       ELSE  Log  Configuration Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Click Analytics Reports Tab
    Click Element  ${xmc_analytics_reports_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_reports_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_reports_tab}
    ...       ELSE  Log  Reports Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}


# Add Engine
XMC Analytics Configuration Click Add
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Contain Element  ${xmc_analytics_config_toolbar_button_add}
    ${need_to_click}=  Run Keyword And Return Status  Element Should Not Be Visible  ${xmc_analytics_add_engine_dialog}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_config_toolbar_button_add}
    ...       ELSE  Log  Add Engine Dialog Already Displayed
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Configuration Confirm Add Engine Dialog Displayed
    Element Should Be Visible  ${xmc_analytics_add_engine_dialog}

XMC Analytics Configuration Confirm Add Engine Dialog Not Displayed
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Element Should Not Be Visible  ${xmc_analytics_add_engine_dialog}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Configuration Add Engine Set IP Address
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_analytics_add_engine_dialog_ip_field}
    Input Text  ${xmc_analytics_add_engine_dialog_ip_field}  ${value}  clear=True

XMC Analytics Configuration Add Engine Set Name
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_analytics_add_engine_dialog_name_field}
    Input Text  ${xmc_analytics_add_engine_dialog_name_field}  ${value}  clear=True

XMC Analytics Configuration Add Engine Select Profile
    [Arguments]   ${value}
    Page Should Contain Element  ${xmc_analytics_add_engine_dialog_profile_field}
    Click Element  ${xmc_analytics_add_engine_dialog_profile_field}
    Click Element  xpath://div[contains(text(),'${value}')]

XMC Analytics Configuration Add Engine Click OK
    # Give the button a chance to become enabled
    : FOR  ${index}  IN RANGE  1  10
    \    ${ok_enabled}=  Run Keyword And Return Status  Page Should Contain Element  ${xmc_analytics_add_engine_dialog_ok_btn}${xmc_btn_enabled_xpath_value}
    \    Exit For Loop If  ${ok_enabled} == True
    Page Should Contain Element  ${xmc_analytics_add_engine_dialog_ok_btn}${xmc_btn_enabled_xpath_value}
    Click Element  ${xmc_analytics_add_engine_dialog_ok_btn}${xmc_btn_enabled_xpath_value}

XMC Analytics Configuration Add Engine Click Cancel
    Page Should Contain Element  ${xmc_analytics_add_engine_dialog_cancel_btn}
    Click Element  ${xmc_analytics_add_engine_dialog_cancel_btn}

