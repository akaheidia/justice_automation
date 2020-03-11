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

XMC Set Option Value XMC Data Pump MoM Enabled
    Page Should Contain Element  ${xmc_options_xmcdatapump_momenabled}
    Select Checkbox  ${xmc_options_xmcdatapump_momenabled}

XMC Set Option Value XMC Data Pump MoM Disabled
    Page Should Contain Element  ${xmc_options_xmcdatapump_momenabled}
    Unselect Checkbox  ${xmc_options_xmcdatapump_momenabled}

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

XMC Confirm Option Value XMC Data Pump Domain Node Type
    [Arguments]  ${value}
    ${elem_value}=  Get Element Attribute  ${xmc_options_xmcdatapump_domainnodetype}  value
    Should Be Equal As Integers  ${value}  ${elem_value}  XMC Data Pump: Domain Node Type option does not have expected value

XMC Confirm Option Value XMC Data Pump MoM Enabled
    Checkbox Should Be Selected  ${xmc_options_xmcdatapump_momenabled}

XMC Confirm Option Value XMC Data Pump MoM Disabled
    Checkbox Should Not Be Selected  ${xmc_options_xmcdatapump_momenabled}

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
