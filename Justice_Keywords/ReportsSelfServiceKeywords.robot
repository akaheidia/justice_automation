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

Self Service Rename
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_menu}
    Click Element  ${reports_self_service_menu}
    Click Element  xpath://span[text()='Rename']
    Input Text  ${reports_self_service_rename_new_name_field}  ${value}  clear=True
    Click Element  ${reports_self_service_rename_save_button}
    Unselect Frame

Self Service Delete
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_menu}
    Click Element  ${reports_self_service_menu}
    Click Element  xpath://span[text()='Delete']
    Handle Alert
    Unselect Frame

Self Service Select Category
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_select_category_field}
    Click Element  ${reports_self_service_select_category_field}
    Select From List By Label  ${reports_self_service_select_category_field}  ${value}
    Click Element  ${reports_self_service_select_category_field}
    Unselect Frame

Self Service Select Category Click Save
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_select_category_save_button}
    Click Element  ${reports_self_service_select_category_save_button}
    Unselect Frame

Self Service Visual Click Data
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_data_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_data_button}
    Unselect Frame

Self Service Visual Click Formula
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_formula_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_formula_button}
    Unselect Frame

Self Service Visual Click Filter
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_filter_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_filter_button}
    Unselect Frame

Self Service Visual Click Add Chart
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_add_chart_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_add_chart_button}
    Unselect Frame

Self Service Visual Click Add Crosstab
    Select Frame  xpath://iframe
    Wait Until Page Contains Element  ${reports_self_service_visual_add_crosstab_button}  timeout=10 seconds
    Click Element  ${reports_self_service_visual_add_crosstab_button}
    Unselect Frame

Self Service Visual Set Select Data To Hourly Data
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_data_select_data_field}
    Click Element  ${reports_self_service_visual_data_select_data_field}
    Page Should Contain Element  ${reports_self_service_visual_data_hourly_data_option}
    Click Element  ${reports_self_service_visual_data_hourly_data_option}
    Unselect Frame
    sleep  2 seconds

Self Service Visual Set Select Data To Raw Data
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_data_select_data_field}
    Click Element  ${reports_self_service_visual_data_select_data_field}
    Page Should Contain Element  ${reports_self_service_visual_data_raw_data_option}
    Click Element  ${reports_self_service_visual_data_raw_data_option}
    Unselect Frame
    sleep  2 seconds

Self Service Visual Select Filter Column
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_column}
    Click Element  ${reports_self_service_visual_filter_column}
    Select From List By Label  ${reports_self_service_visual_filter_column}  ${value}
    Click Element  ${reports_self_service_visual_filter_column}
    Unselect Frame

Self Service Visual Select Filter Comparison
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_comparison}
    Click Element  ${reports_self_service_visual_filter_comparison}
    Select From List By Label  ${reports_self_service_visual_filter_comparison}  ${value}
    Click Element  ${reports_self_service_visual_filter_comparison}
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

Self Service Visual Filter Click Remove
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_visual_filter_remove_button}
    Click Element  ${reports_self_service_visual_filter_remove_button}
    Handle Alert
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


Self Service Report Add New Visual
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_report_design_new_visual}
    Page Should Contain Element  ${reports_self_service_report_design_content}
    Drag and Drop  ${reports_self_service_report_design_new_visual}  ${reports_self_service_report_design_content}
    Unselect Frame

Self Service Report Confirm Visual Gallery Present
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_report_visual_gallery_title}
    Unselect Frame

Self Service Report Select Gallery Type
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_report_visual_gallery_selector}
    Click Element  ${reports_self_service_report_visual_gallery_selector}
    Select From List By Label  ${reports_self_service_report_visual_gallery_selector}  ${value}
    Click Element  ${reports_self_service_report_visual_gallery_selector}
    Unselect Frame

Self Service Report Set Find Text
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_report_visual_gallery_find_text}
    Input Text  ${reports_self_service_report_visual_gallery_find_text}  ${value}  clear=True
    Unselect Frame

Self Service Report Gallery Click Add
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  xpath://span[text()='${value}']${reports_self_service_report_visual_gallery_add_button_xpath_value}
    Click Element  xpath://span[text()='${value}']${reports_self_service_report_visual_gallery_add_button_xpath_value}
    Unselect Frame

Self Service Report Gallery Click Done
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_report_visual_gallery_done_button}
    Click Element  ${reports_self_service_report_visual_gallery_done_button}
    Unselect Frame

Confirm Self Service Report Gallery Contains Component
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  xpath://span[text()='${value}']
    Unselect Frame

Confirm Self Service Report Gallery Does Not Contain Component
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  xpath://span[text()='${value}']
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Self Service Report Contains Component
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  xpath://span[text()='${value}']
    Unselect Frame

Confirm Self Service Report Does Not Contain Component
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  xpath://span[text()='${value}']
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Self Service Report Name
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  xpath://span[@id='lblBookmarkCaption'][text()='${value}']
    Unselect Frame

Confirm Self Service Select Category Dialog Visible
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_self_service_select_category_dialog}
    Unselect Frame

Confirm Self Service Report In Category
    [Arguments]  ${report}  ${category}
    Select Frame  xpath://iframe
    Page Should Contain Element  xpath://span[@id='rdDmtCaption' and text()='${category}']//following::span[@id='rdDmtCaption' and text()='${report}']
    Unselect Frame

Confirm Self Service Report Not In Category
    [Arguments]  ${report}  ${category}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    Page Should Not Contain Element  xpath://span[@id='rdDmtCaption' and text()='${category}']//following::span[@id='rdDmtCaption' and text()='${report}']
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}
