*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Analytics tab in XMC.

*** Keywords ***

XMC Analytics Click Dashboard Tab
    Click Element  ${xmc_analytics_dashboard_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_dashboard_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_dashboard_tab}
    ...       ELSE  Log To Console  Dashboard Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Click Browser Tab
    Click Element  ${xmc_analytics_browser_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_browser_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_browser_tab}
    ...       ELSE  Log To Console  Browser Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Click Application Flows Tab
    Click Element  ${xmc_analytics_app_flows_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_app_flows_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_app_flows_tab}
    ...       ELSE  Log To Console  Application Flows Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Click Fingerprints Tab
    Click Element  ${xmc_analytics_fingerprints_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_fingerprints_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_fingerprints_tab}
    ...       ELSE  Log To Console  Fingerprints Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Click Packet Captures Tab
    Click Element  ${xmc_analytics_packet_captures_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_packet_captures_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_packet_captures_tab}
    ...       ELSE  Log To Console  Packet Captures Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Click Configuration Tab
    Click Element  ${xmc_analytics_config_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_config_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_config_tab}
    ...       ELSE  Log To Console  Configuration Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

XMC Analytics Click Reports Tab
    Click Element  ${xmc_analytics_reports_tab}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_analytics_reports_tab}${xmc_tab_not_selected_xpath_value}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_analytics_reports_tab}
    ...       ELSE  Log To Console  Reports Tab Already Selected
    Set Selenium Implicit Wait  ${orig_wait}

#XMC Confirm Diagnostics Tab Loaded
#    Page Should Contain Element  ${xmc_diagnostics_level_selector}
