*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor Map page.

*** Keywords ***

Confirm Map Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${monitor_map_slider}
    Page Should Contain Element  ${monitor_list_slider}
    Confirm Map Slider Selected
    Page Should Contain Element  ${map_background_image}
    Page Should Contain Element  ${map_zoom_in_enabled_button}
