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
    Wait Until Element Is Visible  ${tags_manage_tags_dialog_title}

Tags Click Refresh
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_refresh_btn}
    Click Element  ${tags_panel_refresh_btn}

Tags Click Close
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_close_btn}
    Click Element  ${tags_panel_close_btn}


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


# Manage Tags Dialog
Manage Tags Select Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://div[text()='${value}']
    Click Element  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]


Manage Tags Click Close
    Wait Until Element Is Visible  ${tags_manage_tags_dialog_close_btn}
    Click Element  ${tags_manage_tags_dialog_close_btn}
