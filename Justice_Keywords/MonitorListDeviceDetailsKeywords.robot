*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Device Details page.

*** Keywords ***
Device Details Click Back Arrow
    Page Should Contain Element  ${device_details_back_arrow}
    Click Element  ${device_details_back_arrow}
