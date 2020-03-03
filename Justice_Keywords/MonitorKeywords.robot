*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor page.

*** Keywords ***

Click List Slider
    Click Element  ${monitor_list_slider}

Click Map Slider
    Click Element  ${monitor_map_slider}

Click Filter Icon
    Click Element  ${monitor_filter_icon}

Click Tag Icon
    Click Element  ${monitor_tags_icon}


Confirm List Slider Selected
    ${selected_slider}=  Get Element Attribute  ${monitor_list_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${monitor_selected_slider_class}

Confirm Map Slider Selected
    ${selected_slider}=  Get Element Attribute  ${monitor_map_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${monitor_selected_slider_class}

Confirm Filters Panel Visible
    Page Should Contain Element  ${filters_panel_title}

Confirm Filters Panel Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${filters_panel_title}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Tags Panel Visible
    Page Should Contain Element  ${tags_panel_title}

Confirm Tags Panel Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${tags_panel_title}
    Set Selenium Implicit Wait  ${orig_wait}

Show Filter Panel
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    ${need_to_show}=  Run Keyword And Return Status  Element Should Not Be Visible  ${filters_panel_title}
    Run Keyword If  ${need_to_show}  Click Filter Icon
    Set Selenium Implicit Wait  ${orig_wait}

Hide Filter Panel
    ${need_to_hide}=  Run Keyword And Return Status  Element Should Be Visible  ${filters_panel_title}
    Run Keyword If  ${need_to_hide}  Click Filter Icon
