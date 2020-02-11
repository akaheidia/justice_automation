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
    Click Element  ${monitor_tag_icon}


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
    Log To Console  Original Wait is ${orig_wait}
    Page Should Not Contain Element  ${filters_panel_title}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Tags Panel Visible
    Page Should Contain Element  ${tags_panel_title}

Confirm Tags Panel Not Visible
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Log To Console  Original Wait is ${orig_wait}
    Page Should Not Contain Element  ${tags_panel_title}
    Set Selenium Implicit Wait  ${orig_wait}
