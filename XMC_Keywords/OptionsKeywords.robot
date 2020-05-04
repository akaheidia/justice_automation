*** Settings ***
Library    SeleniumLibrary
Variables  ../XMC_Variables/PageLocators.py

Documentation    Keywords specific to the Administration> Options tab in XMC.

*** Keywords ***

XMC Confirm Options Tab Loaded
    Page Should Contain Element  ${xmc_options_tree_title}

XMC Select Options Tree Node
    [Arguments]  ${nodename}
    Page Should Contain Element  xpath://span[contains(text(),'${nodename}')]
    Click Element  xpath://span[contains(text(),'${nodename}')]

XMC Confirm Option Present
    [Arguments]  ${value}
    sleep  1 second
    Element Should Be Visible  xpath://span[contains(text(),'${value}')]

XMC Confirm Option Not Present
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Element Should Not Be Visible  xpath://span[contains(text(),'${value}')]
    Set Selenium Implicit Wait  ${orig_wait}

XMC Options Click Restore Defaults
    Page Should Contain Element  ${xmc_options_restore_defaults_btn}
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_options_restore_defaults_btn_enabled}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_options_restore_defaults_btn}
    ...    ELSE  Log To Console  Restore Defaults button is disabled

XMC Options Click Reset
    Page Should Contain Element  ${xmc_options_reset_btn}
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_options_reset_btn_enabled}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_options_reset_btn}
    ...    ELSE  Log To Console  Reset button is disabled

XMC Options Click Save
    Page Should Contain Element  ${xmc_options_save_btn}
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  ${xmc_options_save_btn_enabled}
    Run Keyword If  ${need_to_click}  Click Element  ${xmc_options_save_btn}
    ...    ELSE  Log To Console  Save button is disabled


XMC Set Option Value XMC Data Pump Enable Sharing
    Page Should Contain Element  ${xmc_options_xmcdatapump_momenabled}
    Select Checkbox  ${xmc_options_xmcdatapump_momenabled}

XMC Set Option Value XMC Data Pump Disable Sharing
    Page Should Contain Element  ${xmc_options_xmcdatapump_momenabled}
    Unselect Checkbox  ${xmc_options_xmcdatapump_momenabled}

XMC Set Option Value XMC Data Pump MoM Enabled
    XMC Set Option Value XMC Data Pump Enable Sharing

XMC Set Option Value XMC Data Pump MoM Disabled
    XMC Set Option Value XMC Data Pump Disable Sharing

XMC Set Option Value XMC Data Pump Domain Node Type
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_domainnodetype}
    Input Text  ${xmc_options_xmcdatapump_domainnodetype}  ${value}

XMC Set Option Value XMC Data Pump Host
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_host}
    Input Text  ${xmc_options_xmcdatapump_host}  ${value}

XMC Set Option Value XMC Data Pump Port
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_port}
    Input Text  ${xmc_options_xmcdatapump_port}  ${value}

XMC Set Option Value XMC Data Pump Username
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_user}
    Input Text  ${xmc_options_xmcdatapump_user}  ${value}

XMC Set Option Value XMC Data Pump Password
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_password}
    Input Text  ${xmc_options_xmcdatapump_password}  ${value}

XMC Set Option Value XMC Data Pump Action Queue Add Delay
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_action_queue_add_delay}
    Input Text  ${xmc_options_xmcdatapump_action_queue_add_delay}  ${value}

XMC Set Option Value XMC Data Pump Action Queue Service Period
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_action_queue_service_period}
    Input Text  ${xmc_options_xmcdatapump_action_queue_service_period}  ${value}

XMC Set Option Value XMC Data Pump Max Action Queue Size
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_max_action_queue_size}
    Input Text  ${xmc_options_xmcdatapump_max_action_queue_size}  ${value}

XMC Set Option Value XMC Data Pump Max Actions Queueable
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_max_actions_queueable}
    Input Text  ${xmc_options_xmcdatapump_max_actions_queueable}  ${value}

XMC Set Option Value XMC Data Pump Max Actions Serviced
    [Arguments]  ${value}
    Page Should Contain Element  ${xmc_options_xmcdatapump_max_actions_serviced}
    Input Text  ${xmc_options_xmcdatapump_max_actions_serviced}  ${value}


XMC Confirm Options Save Warnings Dialog Present
    Page Should Contain Element  ${xmc_options_save_warning_dialog}

XMC Options Save Warnings Dialog Click Yes
    Page Should Contain Element  ${xmc_options_save_warning_dialog}
    Click Element  ${xmc_options_save_warning_dialog_yes_btn}

XMC Options Save Warnings Dialog Click No
    Page Should Contain Element  ${xmc_options_save_warning_dialog}
    Click Element  ${xmc_options_save_warning_dialog_no_btn}


XMC Confirm Option Value XMC Data Pump Domain Node Type
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_domainnodetype}  value
    Should Be Equal As Integers  ${value}  ${elem_value}  XMC Data Pump: Domain Node Type option does not have expected value

XMC Confirm Option Value XMC Data Pump Sharing Enabled
    Checkbox Should Be Selected  ${xmc_options_xmcdatapump_momenabled}

XMC Confirm Option Value XMC Data Pump Sharing Disabled
    Checkbox Should Not Be Selected  ${xmc_options_xmcdatapump_momenabled}

XMC Confirm Option Label XMC Data Pump Enable Sharing
    Page Should Contain Element  ${xmc_options_xmcdatapump_enable_sharing_label}
    Page Should Not Contain  MoM Enabled

XMC Confirm Option Value XMC Data Pump MoM Enabled
    XMC Confirm Option Value XMC Data Pump Sharing Enabled

XMC Confirm Option Value XMC Data Pump MoM Disabled
    XMC Confirm Option Value XMC Data Pump Sharing Disabled

XMC Confirm Option Value XMC Data Pump Host
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_host}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Host option does not have expected value

XMC Confirm Option Value XMC Data Pump Port
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_port}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Port option does not have expected value

XMC Confirm Option Value XMC Data Pump Username
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_user}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Username option does not have expected value

XMC Confirm Option Value XMC Data Pump Password
    [Arguments]  ${value}
    Click Element  ${xmc_options_xmcdatapump_password_eye_show}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_password}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Password option does not have expected value
    Click Element  ${xmc_options_xmcdatapump_password_eye_hide}

XMC Confirm Option Value XMC Data Pump Queue Add Delay
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_action_queue_add_delay}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Queue Add Delay option does not have expected value

XMC Confirm Option Value XMC Data Pump Queue Add Service Period
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_action_queue_service_period}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Queue Add Service Period option does not have expected value

XMC Confirm Option Value XMC Data Pump Max Action Queue Size
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_max_action_queue_size}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Max Action Queue Size option does not have expected value

XMC Confirm Option Value XMC Data Pump Max Actions Queueable
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_max_actions_queueable}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Max Actions Queueable option does not have expected value

XMC Confirm Option Value XMC Data Pump Max Actions Serviced
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_max_actions_serviced}  value
    Should Be Equal  ${value}  ${elem_value}  XMC Data Pump: Max Actions Serviced option does not have expected value


XMC Confirm Option Enabled XMC Data Pump Domain Node Type
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_domainnodetype}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Domain Node Type
    Page Should Contain Element  ${xmc_options_xmcdatapump_domainnodetype}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Host
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_host}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Host
    Page Should Contain Element  ${xmc_options_xmcdatapump_host}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Port
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_port}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Port
    Page Should Contain Element  ${xmc_options_xmcdatapump_port}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump User
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_user}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump User
    Page Should Contain Element  ${xmc_options_xmcdatapump_user}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Password
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_password}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Password
    Page Should Contain Element  ${xmc_options_xmcdatapump_password}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Queue Add Delay
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_action_queue_add_delay}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Queue Add Delay
    Page Should Contain Element  ${xmc_options_xmcdatapump_action_queue_add_delay}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Queue Add Service Period
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_action_queue_service_period}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Queue Add Service Period
    Page Should Contain Element  ${xmc_options_xmcdatapump_action_queue_service_period}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Max Action Queue Size
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_max_action_queue_size}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Max Action Queue Size
    Page Should Contain Element  ${xmc_options_xmcdatapump_max_action_queue_size}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Max Actions Queueable
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_max_actions_queueable}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Max Actions Queueable
    Page Should Contain Element  ${xmc_options_xmcdatapump_max_actions_queueable}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Confirm Option Enabled XMC Data Pump Max Actions Serviced
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${xmc_options_xmcdatapump_max_actions_serviced}${xmc_options_xmcdatapump_disabled_xpath_value}
    Set Selenium Implicit Wait  ${orig_wait}

XMC Confirm Option Disabled XMC Data Pump Max Actions Serviced
    Page Should Contain Element  ${xmc_options_xmcdatapump_max_actions_serviced}${xmc_options_xmcdatapump_disabled_xpath_value}


XMC Wait For Save Button To Be Enabled
    Wait Until Page Contains Element  ${xmc_options_save_btn_enabled}  timeout=5 seconds
