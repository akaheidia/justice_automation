*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Tags Panel.

*** Keywords ***
Tags Click Add
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_add_btn}
    Click Element  ${tags_panel_add_btn}
    Wait Until Element Is Visible  ${tags_add_tag_dialog_title}

Tags Click Manage
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_manage_btn}
    Click Element  ${tags_panel_manage_btn}
    Wait Until Element Is Visible  ${tags_manage_tags_panel_title}

Tags Click Refresh
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_refresh_btn}
    Click Element  ${tags_panel_refresh_btn}

Tags Click Close
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_close_btn}
    Click Element  ${tags_panel_close_btn}

Confirm Tags Panel Is Empty
    Wait Until Element Is Visible  ${tags_panel_no_tags_msg}

Confirm Tags Panel Is Not Empty
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${tags_panel_no_tags_msg}
    Set Selenium Implicit Wait  ${orig_wait}


# Add Tag Dialog
Add Tag Set Name
    [Arguments]  ${value}
    Element Should Be Visible  ${tags_add_tag_dialog_name}
    Input Text  ${tags_add_tag_dialog_name}  ${value}  clear=True

Add Tag Select Star
    Element Should Be Visible  ${tags_add_tag_dialog_star_unselected}
    Click Element  ${tags_add_tag_dialog_star_unselected}
    Element Should Be Visible  ${tags_add_tag_dialog_star_selected}

Add Tag Deselect Star
    Element Should Be Visible  ${tags_add_tag_dialog_star_selected}
    Click Element  ${tags_add_tag_dialog_star_selected}
    Element Should Be Visible  ${tags_add_tag_dialog_star_unselected}

Add Tag Set Description
    [Arguments]  ${value}
    Element Should Be Visible  ${tags_add_tag_dialog_description}
    Input Text  ${tags_add_tag_dialog_description}  ${value}  clear=True

Add Tag Click Save
    Element Should Be Visible  ${tags_add_tag_dialog_save_enabled}
    Click Element  ${tags_add_tag_dialog_save}

Add Tag Click Cancel
    Element Should Be Visible  ${tags_add_tag_dialog_cancel}
    Click Element  ${tags_add_tag_dialog_cancel}


# Manage Tags Panel
Confirm Manage Tags Panel Contains Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://div[text()='${value}']

Confirm Manage Tags Panel Does Not Contain Tag
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  xpath://div[text()='${value}']
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Manage Tags Panel Is Empty
    Wait Until Element Is Visible  ${tags_manage_tags_panel_no_tags_msg}

Confirm Manage Tags Panel Is Not Empty
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${tags_manage_tags_panel_no_tags_msg}
    Set Selenium Implicit Wait  ${orig_wait}

Manage Tags Select Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://div[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]//input[@aria-checked='false']
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${value} is already selected

Manage Tags Deselect Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://div[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]//input[@aria-checked='true']
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${value} is already deselected

Manage Tags Click Delete
    Wait Until Element Is Visible  ${tags_manage_tags_panel_delete_btn}
    ${btn_enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${tags_manage_tags_panel_delete_btn}${enabled_xpath_value}
    Run Keyword If  ${btn_enabled} == True  Click Element  ${tags_manage_tags_panel_delete_btn}
    ...       ELSE  Fail  Delete Tag button is disabled - please select one or more tags first

Manage Tags Click Refresh
    Wait Until Element Is Visible  ${tags_manage_tags_panel_refresh_btn}
    Click Element  ${tags_manage_tags_panel_refresh_btn}

Manage Tags Click Close
    Wait Until Element Is Visible  ${tags_manage_tags_panel_close_btn}
    Click Element  ${tags_manage_tags_panel_close_btn}


# Confirm Delete Tag Dialog
Tag Confirm Delete Click OK
    Wait Until Element Is Visible  ${tags_confirm_delete_tags_dialog}
    Click Element  ${tags_confirm_delete_tags_dialog_ok}

Tag Confirm Delete Click Cancel
    Wait Until Element Is Visible  ${tags_confirm_delete_tags_dialog}
    Click Element  ${tags_confirm_delete_tags_dialog_cancel}
