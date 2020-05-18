*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Tags Panel.

*** Keywords ***
Tags Panel Create Tag
    [Arguments]  ${tag_name}
    Show Tags Panel
    Tags Panel Click Add
    Add Tag Set Name  ${tag_name}
    Add Tag Click Save
    Confirm Tags Panel Contains Tag  ${tag_name}

Tags Panel Delete Tag
    [Arguments]  ${tag_name}
    Show Tags Panel
    Tags Panel Select Tag  ${tag_name}
    sleep  1 second
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${tag_name}

Tags Panel Click Add
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_add_btn}
    Click Element  ${tags_panel_add_btn}
    Wait Until Element Is Visible  ${tags_add_tag_dialog_title}

Tags Panel Click Manage
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_manage_btn}
    Click Element  ${tags_panel_manage_btn}
    Wait Until Element Is Visible  ${tags_manage_tags_panel_title}

Tags Panel Click Refresh
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_refresh_btn}
    Click Element  ${tags_panel_refresh_btn}

Tags Panel Click Close
    Confirm Tags Panel Visible
    Wait Until Element Is Visible  ${tags_panel_close_btn}
    Click Element  ${tags_panel_close_btn}

Tags Panel Select Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://h3[text()='${value}']
    Click Element  xpath://h3[text()='${value}']


Confirm Tags Panel Contains Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://h3[text()='${value}']

Confirm Tags Panel Does Not Contain Tag
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  xpath://h3[text()='${value}']
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Tags Panel Is Empty
    Wait Until Element Is Visible  ${tags_panel_no_tags_msg}

Confirm Tags Panel Is Not Empty
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${tags_panel_no_tags_msg}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Tags Panel Tag Device Count Value
    [Arguments]  ${tag}  ${value}
    Wait Until Page Contains Element  xpath://div[@class='mat-list-text']/h3[text()='${tag}']/../../mat-chip[contains(@class,'tags-sidenav-count')][text()='${value}']

# Edit Tag Dialog
Edit Tag Set Name
    [Arguments]  ${value}
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_name}
    Input Text  ${tags_panel_edit_tag_dialog_name}  ${value}  clear=True

Edit Tag Select Star
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_star_unselected}
    Click Element  ${tags_panel_edit_tag_dialog_star_unselected}
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_star_selected}

Edit Tag Deselect Star
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_star_selected}
    Click Element  ${tags_panel_edit_tag_dialog_star_selected}
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_star_unselected}

Edit Tag Set Description
    [Arguments]  ${value}
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_description}
    Input Text  ${tags_panel_edit_tag_dialog_description}  ${value}  clear=True

Edit Tag Click Delete
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_delete}
    Click Element  ${tags_panel_edit_tag_dialog_delete}

Edit Tag Click Cancel
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_cancel}
    Click Element  ${tags_panel_edit_tag_dialog_cancel}

Edit Tag Click Save
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog_save}
    Click Element  ${tags_panel_edit_tag_dialog_save}

Confirm Edit Tag Dialog Visible
    Wait Until Element Is Visible  ${tags_panel_edit_tag_dialog}

Confirm Edit Tag Dialog Not Visible
    Wait Until Element Is Not Visible  ${tags_panel_edit_tag_dialog}

Confirm Edit Tag Dialog Name Value
    [Arguments]  ${value}
    Textfield Value Should Be  ${tags_panel_edit_tag_dialog_name}  ${value}

Confirm Edit Tag Dialog Description Value
    [Arguments]  ${value}
    Textarea Value Should Be  ${tags_panel_edit_tag_dialog_description}  ${value}

Confirm Edit Tag Dialog Star Selected
    Element Should Be Visible  ${tags_panel_edit_tag_dialog_star_selected}

Confirm Edit Tag Dialog Star Not Selected
    Element Should Be Visible  ${tags_panel_edit_tag_dialog_star_unselected}


# Add Tag Dialog
Add Tag Set Name
    [Arguments]  ${value}
    Wait Until Element Is Visible  ${tags_add_tag_dialog_name}
    Input Text  ${tags_add_tag_dialog_name}  ${value}  clear=True

Add Tag Select Star
    Wait Until Element Is Visible  ${tags_add_tag_dialog_star_unselected}
    Click Element  ${tags_add_tag_dialog_star_unselected}
    Wait Until Element Is Visible  ${tags_add_tag_dialog_star_selected}

Add Tag Deselect Star
    Wait Until Element Is Visible  ${tags_add_tag_dialog_star_selected}
    Click Element  ${tags_add_tag_dialog_star_selected}
    Wait Until Element Is Visible  ${tags_add_tag_dialog_star_unselected}

Add Tag Set Description
    [Arguments]  ${value}
    Wait Until Element Is Visible  ${tags_add_tag_dialog_description}
    Input Text  ${tags_add_tag_dialog_description}  ${value}  clear=True

Add Tag Click Save
    Wait Until Element Is Visible  ${tags_add_tag_dialog_save_enabled}
    Click Element  ${tags_add_tag_dialog_save}

Add Tag Click Cancel
    Wait Until Element Is Visible  ${tags_add_tag_dialog_cancel}
    Click Element  ${tags_add_tag_dialog_cancel}


# Manage Tags Panel
Confirm Manage Tags Panel Contains Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://app-manage-tags-dialog//div[text()='${value}']

Confirm Manage Tags Panel Does Not Contain Tag
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  xpath://app-manage-tags-dialog//div[text()='${value}']
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Manage Tags Panel Is Empty
    Wait Until Element Is Visible  ${tags_manage_tags_panel_no_tags_msg}

Confirm Manage Tags Panel Is Not Empty
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${tags_manage_tags_panel_no_tags_msg}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Manage Tags Panel Tag Created By
    [Arguments]  ${tag}  ${user}
    Page Should Contain Element  xpath://app-manage-tags-dialog//td[contains(@class, 'column-name')]/div[text()='${tag}']/../..//td[contains(@class, 'column-createdBy')]/div[text()='${user}']

Confirm Manage Tags Panel Tag Last Edit By
    [Arguments]  ${tag}  ${user}
    Page Should Contain Element  xpath://app-manage-tags-dialog//td[contains(@class, 'column-name')]/div[text()='${tag}']/../..//td[contains(@class, 'column-lastEditBy')]/div[text()='${user}']

Confirm Manage Tags Panel Number Tagged Items
    [Arguments]  ${tag}  ${count}
    Page Should Contain Element  xpath://app-manage-tags-dialog//td[contains(@class, 'column-name')]/div[text()='${tag}']/../..//td[contains(@class, 'column-totalItems')]/div[text()='${count}']

Confirm Manage Tags Devices Assigned To Tag Count
    [Arguments]  ${tag}  ${count}
    sleep  1 second
    Manage Tags Expand Row  ${tag}
    sleep  1 second
    Page Should Contain Element  xpath://mat-chip[contains(@class,'items-count')][text()='${count}']

Confirm Manage Tags Device Assigned To Tag
    [Arguments]  ${tag}  ${ip}
    sleep  1 second
    Manage Tags Expand Row  ${tag}
    sleep  1 second
    Page Should Contain Element  xpath://app-manage-tags-dialog//div[text()='${ip}']

Confirm Manage Tags Device Not Assigned To Tag
    [Arguments]  ${tag}  ${ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Manage Tags Expand Row  ${tag}
    sleep  1 second
    Page Should Not Contain Element  xpath://app-manage-tags-dialog//div[text()='${ip}']
    Set Selenium Implicit Wait  ${orig_wait}

Manage Tags Select Tag
    [Arguments]  ${value}
    Log  Select ${value} in Manage Tags View
    Wait Until Element Is Visible  xpath://app-manage-tags-dialog//div[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]//input[@aria-checked='false']
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${value} is already selected

Manage Tags Deselect Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://app-manage-tags-dialog//div[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]//input[@aria-checked='true']
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${value}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${value} is already deselected

Manage Tags Expand Row
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://app-manage-tags-dialog//div[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${value}']${tags_manage_tags_panel_collapsed_btn_xpath_value}
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${value}']${tags_manage_tags_panel_collapsed_btn_xpath_value}
    ...       ELSE  Log  ${value} is already expanded

Manage Tags Collapse Row
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://app-manage-tags-dialog//div[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${value}']${tags_manage_tags_panel_expanded_btn_xpath_value}
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${value}']${tags_manage_tags_panel_expanded_btn_xpath_value}
    ...       ELSE  Log  ${value} is already collapsed

Manage Tags Device Details Click Delete
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://app-manage-tags-dialog//div[text()='${value}']
    Click Element  xpath://div[text()='${value}']${tags_manage_tags_panel_delete_device_icon_xpath_value}

Manage Tags Device Details Click Cancel
    Wait Until Element Is Visible  ${tags_manage_tags_panel_device_details_cancel_enabled}
    Click Element  ${tags_manage_tags_panel_device_details_cancel_enabled}

Manage Tags Device Details Click Save
    Wait Until Element Is Visible  ${tags_manage_tags_panel_device_details_save_enabled}
    Click Element  ${tags_manage_tags_panel_device_details_save_enabled}

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


# Confirm Delete Tags Dialog (this is the Delete from the Manage Tags panel)
Manage Tags Confirm Delete Tags Click OK
    Wait Until Element Is Visible  ${tags_confirm_delete_tags_dialog}
    Click Element  ${tags_confirm_delete_tags_dialog_ok}

Manage Tags Confirm Delete Tags Click Cancel
    Wait Until Element Is Visible  ${tags_confirm_delete_tags_dialog}
    Click Element  ${tags_confirm_delete_tags_dialog_cancel}


# Confirm Delete Tag Dialog (this is the Delete from the Edit Tag dialog)
Edit Tag Confirm Delete Tag Click OK
    Wait Until Element Is Visible  ${tags_confirm_delete_tag_dialog}
    Click Element  ${tags_confirm_delete_tag_dialog_ok}

Edit Tag Confirm Delete Tag Click Cancel
    Wait Until Element Is Visible  ${tags_confirm_delete_tag_dialog}
    Click Element  ${tags_confirm_delete_tag_dialog_cancel}
