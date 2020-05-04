*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Diagnostics tab in XMC.

*** Keywords ***

XMC Confirm Diagnostics Tab Loaded
    Page Should Contain Element  ${xmc_diagnostics_level_selector}

XMC Set Main Diagnostic Level
    [Arguments]  ${value}
    Click Element  ${xmc_diagnostics_level_selector}
    Page Should Contain Element  xpath://a[@class='x-menu-item-link']/span[text()='${value}']
    Click Element  xpath://a[@class='x-menu-item-link']/span[text()='${value}']

XMC Expand Diagnostics Tree Node
    [Arguments]  ${nodename}
    ${need_to_expand}=  Run Keyword And Return Status  Element Should Be Visible  xpath://span[contains(@class,'x-tree-node-text')][text()='${nodename}']${xmc_diagnostics_tree_collapsed_icon_xpath_value}
    Run Keyword If  ${need_to_expand}  XMC Select Diagnostics Tree Node  ${nodename}
    sleep  2 seconds

XMC Select Diagnostics Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(@class,'x-tree-node-text')][text()='${nodename}']
    Click Element  xpath://span[contains(@class,'x-tree-node-text')][text()='${nodename}']

XMC Disable Beta Features
    Page Should Contain Element  ${xmc_diagnostics_disable_beta_features}
    Click Element  ${xmc_diagnostics_disable_beta_features}

XMC Enable Beta Features
    [Arguments]  ${key}
    Page Should Contain Element  ${xmc_diagnostics_enable_beta_features}
    Click Element  ${xmc_diagnostics_enable_beta_features}
    sleep  1 second
    Page Should Contain Element  ${xmc_beta_features_enter_key_dialog_title}
    Input Text  ${xmc_beta_features_key_field}  ${key}  clear=True
    Click Element  ${xmc_beta_features_ok_btn}
    sleep  1 second
    Page Should Contain Element  ${xmc_beta_agreement_dialog_title}
    Click Element  ${xmc_beta_agreement_accept_btn}

XMC Confirm Beta Features Enabled
    Page Should Contain Element  ${xmc_beta_features_enabled}

XMC Confirm Beta Features Disabled
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_beta_features_enabled}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Set XMC Data Pump Diagnostic Level
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_diagnostics_xmc_data_pump_selector}
    Click Element  ${xmc_diagnostics_xmc_data_pump_selector}
    Page Should Contain Element  xpath://li[text()='${value}']
    Click Element  xpath://li[text()='${value}']

XMC Diagnostics Click OK
    Page Should Contain Element  ${xmc_diagnostics_ok_button}
    Click Element  ${xmc_diagnostics_ok_button}
    ${ok_success_dlg}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${xmc_diagnostics_ok_success_dialog}  timeout=5 seconds
    Run Keyword If  ${ok_success_dlg}  Click Element  ${xmc_diagnostics_ok_success_dialog_ok_btn}

XMC Diagnostics Click Reset Defaults
    Page Should Contain Element  ${xmc_diagnostics_reset_defaults_button}
    Click Element  ${xmc_diagnostics_reset_defaults_button}
    ${reset_success_dlg}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${xmc_diagnostics_reset_defaults_success_dialog}  timeout=5 seconds
    Run Keyword If  ${reset_success_dlg}  Click Element  ${xmc_diagnostics_reset_defaults_success_dialog_ok_btn}
