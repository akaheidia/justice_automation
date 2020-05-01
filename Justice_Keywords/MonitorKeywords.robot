*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor page.

*** Keywords ***

Click List Slider
    Click Element  ${monitor_list_slider}

Click Map Slider
    Click Element  ${monitor_map_slider}


Show Contextual Help
    Click Element  ${monitor_help_icon}
    Click Element  ${help_contextual_help}
    sleep  3 seconds

Show Filter Panel
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_show}=  Run Keyword And Return Status  Element Should Not Be Visible  ${filter_panel_title}
    Run Keyword If  ${need_to_show}  Click Element  ${monitor_filter_icon}
    ...    ELSE  Log  Filter Panel Already Shown
    Set Selenium Implicit Wait  ${orig_wait}
    Wait Until Element Is Visible  ${filter_panel_title}

Hide Filter Panel
    ${need_to_hide}=  Run Keyword And Return Status  Element Should Be Visible  ${filter_panel_title}
    Run Keyword If  ${need_to_hide}  Click Element  ${monitor_filter_icon}
    ...    ELSE  Log  Filter Panel Already Hidden
    Wait Until Element Is Not Visible  ${filter_panel_title}


Show Tags Panel
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_show}=  Run Keyword And Return Status  Element Should Not Be Visible  ${tags_panel_title}
    Run Keyword If  ${need_to_show}  Click Element  ${monitor_tags_icon}
    ...    ELSE  Log  Tags Panel Already Shown
    Set Selenium Implicit Wait  ${orig_wait}
    Wait Until Element Is Visible  ${tags_panel_title}

Hide Tags Panel
    ${need_to_hide}=  Run Keyword And Return Status  Element Should Be Visible  ${tags_panel_title}
    Run Keyword If  ${need_to_hide}  Click Element  ${monitor_tags_icon}
    ...    ELSE  Log  Tags Panel Already Hidden
    Wait Until Element Is Not Visible  ${tags_panel_title}


Show Search Field
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_show}=  Run Keyword And Return Status  Element Should Not Be Visible  ${search_field_text}
    Run Keyword If  ${need_to_show}  Click Element  ${monitor_search_icon}
    ...    ELSE  Log  Search Field Already Shown
    Set Selenium Implicit Wait  ${orig_wait}
    Wait Until Element Is Visible  ${search_field_text}

Hide Search Field
    ${need_to_hide}=  Run Keyword And Return Status  Element Should Be Visible  ${search_field_text}
    Run Keyword If  ${need_to_hide}  Click Element  ${monitor_search_icon}
    ...    ELSE  Log  Search Field Already Hidden
    Wait Until Element Is Not Visible  ${search_field_text}

Search Field Enter Text
    [Arguments]  ${value}
    Show Search Field
    Input Text  ${search_field_text}  ${value}  clear=True

Search Field Clear Text
    Show Search Field
    Input Text  ${search_field_text}  ${empty}  clear=True


Confirm List Slider Selected
    ${selected_slider}=  Get Element Attribute  ${monitor_list_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${monitor_selected_slider_class}

Confirm Map Slider Selected
    ${selected_slider}=  Get Element Attribute  ${monitor_map_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${monitor_selected_slider_class}

Confirm Filter Panel Visible
    Page Should Contain Element  ${filter_panel_title}

Confirm Filter Panel Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${filter_panel_title}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Tags Panel Visible
    Page Should Contain Element  ${tags_panel_title}

Confirm Tags Panel Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${tags_panel_title}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Search Field Visible
    Page Should Contain Element  ${search_field_text}

Confirm Search Field Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${search_field_text}
    Set Selenium Implicit Wait  ${orig_wait}
