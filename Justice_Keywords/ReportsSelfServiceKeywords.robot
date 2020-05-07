*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Self Service Reports page.

*** Keywords ***
Confirm Self Service Report Page Title
    sleep  1 second
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_page_title}
    Unselect Frame

Self Service Click Go To Reports Button
    Select Frame  xpath://iframe
    Click Element  ${reports_add_go_to_reports_button}
    Wait Until Page Contains Element  ${reports_add_button}  timeout=10 seconds
    Unselect Frame

Self Service Visual Click Data
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_data_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_data_button}
    Unselect Frame

Self Service Visual Click Filter
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_filter_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_filter_button}
    Unselect Frame

Self Service Visual Set Select Data To Hourly Data
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_data_select_data_field}
    Click Element  ${reports_self_service_visual_data_select_data_field}
    Page Should Contain Element  ${reports_self_service_visual_data_hourly_data_option}
    Click Element  ${reports_self_service_visual_data_hourly_data_option}
    Unselect Frame

Self Service Visual Set Select Data To Raw Data
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_data_select_data_field}
    Click Element  ${reports_self_service_visual_data_select_data_field}
    Page Should Contain Element  ${reports_self_service_visual_data_raw_data_option}
    Click Element  ${reports_self_service_visual_data_raw_data_option}
    Unselect Frame

Self Service Visual Select Filter Column
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_column}
    Click Element  ${reports_self_service_visual_filter_column}
    Select From List By Label  ${value}
#    Page Should Contain Element  xpath://option[contains(text(),'${value}')]
#    Click Element  xpath://select[@id='rdAgCalcDataColumns']//option[contains(text(),'${value}')]
    Unselect Frame

Self Service Visual Select Filter Comparison
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_comparison}
    Click Element  ${reports_self_service_visual_filter_comparison}
    Select From List By Label  ${value}
#    Page Should Contain Element  xpath://option[contains(text(),'${value}')]
#    Click Element  xpath://select[@id='rdAfFilterOperator_rdAgAnalysisFilter']//option[contains(text(),'${value}')]
    Unselect Frame

Self Service Visual Set Filter Value
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_value}
    Input Text  ${reports_self_service_visual_filter_value}  ${value}  clear=True
    Unselect Frame

Self Service Visual Filter Click Add
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_add_button}
    Click Element  ${reports_self_service_visual_filter_add_button}
    Unselect Frame

Confirm Self Service Visual Table Contains Data
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_analysis_table}
    Page Should Contain Element  ${reports_self_service_visual_analysis_table_page_number}
    Unselect Frame

Confirm Self Service Visual Table Contains Value
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_analysis_table}
    Page Should Contain Element  xpath://td/span[contains(text(), '${value}')]
    Unselect Frame

Confirm Self Service Visual Table Does Not Contain Value
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_analysis_table}
    Page Should Not Contain Element  xpath://td/span[contains(text(), '${value}')]
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}
