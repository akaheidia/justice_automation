*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Devices tab on the Monitor List page.

*** Keywords ***
Confirm Devices Page Loaded
    Page Should Contain Element  ${list_devices_table}

Refresh Devices Table
    Click Element  ${list_refresh_icon}

Is Test Device Present
    [Arguments]  ${ip}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Refresh Devices Table
    Search Field Enter Text  ${ip}
    ${device_present}=  Run Keyword And Return Status  Confirm Device In Table  ${ip}
    Search Field Clear Text
    [Return]  ${device_present}

Select Device In Table
    [Arguments]  ${device_ip}
    Wait Until Element Is Visible  xpath://div[text()='${device_ip}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${device_ip}']/../..//div[contains(@class,'center-checkboxes')]/mat-checkbox[not(contains(@class, 'checkbox-checked'))]
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${device_ip}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${device_ip} is already selected

Deselect Device In Table
    [Arguments]  ${device_ip}
    Wait Until Element Is Visible  xpath://div[text()='${device_ip}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${device_ip}']/../..//div[contains(@class,'center-checkboxes')]/mat-checkbox[contains(@class, 'checkbox-checked')]
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${device_ip}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${device_ip} is already deselected

Confirm Device In Table
    [Arguments]  ${device_ip}
    FOR  ${index}  IN RANGE  1  10
        Refresh Devices Table
        ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
        Exit For Loop If  ${found_device} == True
    END
    Table Should Contain  ${list_devices_table}  ${device_ip}

Confirm Device Not In Table
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    FOR  ${index}  IN RANGE  1  10
        Refresh Devices Table
        ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
        Exit For Loop If  ${found_device} == False
    END
    Element Should Not Contain  ${list_devices_table}  ${device_ip}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Device In Table No Wait
    [Arguments]  ${device_ip}
    Refresh Devices Table
    Table Should Contain  ${list_devices_table}  ${device_ip}

Confirm Device Not In Table No Wait
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Refresh Devices Table
    Element Should Not Contain  ${list_devices_table}  ${device_ip}
    Set Selenium Implicit Wait  ${orig_wait}

Click Device Details Arrow
    [Arguments]  ${device_ip}
    Page Should Contain Element  xpath://td[contains(@class, 'ipAddress')]/div[text()='${device_ip}']/../..//mat-icon[contains(@class, 'ei-arrow_forward')]
    Click Element  xpath://td[contains(@class, 'ipAddress')]/div[text()='${device_ip}']/../..//mat-icon[contains(@class, 'ei-arrow_forward')]

Assign Device To Tag
    [Arguments]  ${ip}  ${tag}
    Search Field Enter Text  ${ip}
    sleep  1 second
    Select Device In Table  ${ip}
    Click Add Devices To Tag
    sleep  1 second
    Confirm Add Devices To Tag Panel Visible
    Confirm Add Devices To Tag Panel Contains Tag  ${tag}
    Add Devices To Tag Select Tag  ${tag}
    Add Devices To Tag Click Save
    Search Field Clear Text

Assign Device To Tags
    [Arguments]  ${ip}  ${tag_list}
    Search Field Enter Text  ${ip}
    sleep  1 second
    Select Device In Table  ${ip}
    Click Add Devices To Tag
    sleep  1 second
    Confirm Add Devices To Tag Panel Visible
    # Loop over the list of tags to select
    @{tags}=  Split String  ${tag_list}  ,
    FOR  ${tag}  IN  @{tags}
        Confirm Add Devices To Tag Panel Contains Tag  ${tag}
        Add Devices To Tag Select Tag  ${tag}
    END
    Add Devices To Tag Click Save
    Search Field Clear Text

Confirm Device Assigned To Tag
    [Arguments]  ${ip}  ${tag}
    Show Tags Panel
    Confirm Tags Panel Contains Tag  ${tag}
    Tags Panel Click Manage
    Confirm Manage Tags Device Assigned To Tag  ${tag}  ${ip}
    Manage Tags Click Close
    Hide Tags Panel

Click Add Devices To Tag
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_button}
    ${btn_enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${tags_add_devices_to_tag_button}${enabled_xpath_value}
    Run Keyword If  ${btn_enabled} == True  Click Element  ${tags_add_devices_to_tag_button}
    ...       ELSE  Fail  Add Devices To Tag button is disabled - please select one or more devices first

Add Devices To Tag Select Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://span[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://app-add-to-tag-dialog//label[@class='mat-checkbox-layout']/span[text()='${value}']/..//input[@type='checkbox'][@aria-checked='false']
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://app-add-to-tag-dialog//label[@class='mat-checkbox-layout']/span[text()='${value}']
    ...       ELSE  Log  ${value} is already selected

Add Devices To Tag Deselect Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://span[text()='${value}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://app-add-to-tag-dialog//label[@class='mat-checkbox-layout']/span[text()='${value}']/..//input[@type='checkbox'][@aria-checked='true']
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://app-add-to-tag-dialog//label[@class='mat-checkbox-layout']/span[text()='${value}']
    ...       ELSE  Log  ${value} is already deselected

Add Devices To Tag Click Save
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel_save}
    ${btn_enabled}=  Run Keyword And Return Status  Element Should Be Visible  ${tags_add_devices_to_tag_panel_save}${enabled_xpath_value}
    Run Keyword If  ${btn_enabled} == True  Click Element  ${tags_add_devices_to_tag_panel_save}
    ...       ELSE  Fail  Save button is disabled - please select one or more tags first

Add Devices To Tag Click Close
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel_close}
    Click Element  ${tags_add_devices_to_tag_panel_close}

Add Devices To Tag Click Add
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel_add_tag}
    Click Element  ${tags_add_devices_to_tag_panel_add_tag}

Add Devices To Tag Click Manage
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel_manage_tags}
    Click Element  ${tags_add_devices_to_tag_panel_manage_tags}

Add Devices To Tag Click Refresh
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel_refresh}
    Click Element  ${tags_add_devices_to_tag_panel_refresh}


Confirm Add Devices To Tag Panel Visible
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel}

Confirm Add Devices To Tag Panel Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${tags_add_devices_to_tag_panel}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Add Devices To Tag Panel Is Empty
    Wait Until Element Is Visible  ${tags_add_devices_to_tag_panel_no_tags_msg}

Confirm Add Devices To Tag Panel Is Not Empty
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${tags_add_devices_to_tag_panel_no_tags_msg}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Add Devices To Tag Panel Contains Tag
    [Arguments]  ${value}
    Wait Until Element Is Visible  xpath://app-add-to-tag-dialog//span[text()='${value}']

Confirm Add Devices To Tag Panel Does Not Contain Tag
    [Arguments]  ${value}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  xpath://app-add-to-tag-dialog//span[text()='${value}']
    Set Selenium Implicit Wait  ${orig_wait}
