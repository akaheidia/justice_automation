*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor List page.

*** Keywords ***

Click List Slider
    Click Element  ${list_slider}

Click Map Slider
    Click Element  ${map_slider}

Click Filter Icon
    Click Element  ${filter_icon}


Confirm List Slider Selected
    ${selected_slider}=  Get Element Attribute  ${list_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${selected_slider_class}

Confirm Map Slider Selected
    ${selected_slider}=  Get Element Attribute  ${map_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${selected_slider_class}
