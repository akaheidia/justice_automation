*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor Map page.

*** Keywords ***

Click Map Slider
    Click Element  ${map_slider}

Confirm Map Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${map_slider}
    Page Should Contain Element  ${list_slider}
    Confirm Map Slider Selected

Confirm Map Slider Selected
    ${selected_slider}=  Get Element Attribute  ${map_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${selected_slider_class}
