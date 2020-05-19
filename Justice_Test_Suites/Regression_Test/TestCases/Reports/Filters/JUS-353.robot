*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-353: Usability: Analytics Quarterly Summary report should have collapsible panels.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Quarterly Analytics Summary Report Shows All Quarters By Default
    Navigate to Analytics Quarterly Analytics Summary Report
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Reports Page Title
    Show Reports Filter Panel
    Confirm Reports Filter Contains All Months
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm January Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  January
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm February Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  February
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm March Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  March
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm April Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  April
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm May Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  May
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm June Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  June
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm July Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  July
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm August Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  August
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm September Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm October Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm November Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm December Results In Correct Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report First Quarter Only
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  January,February
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  February,March
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report Second Quarter Only
    Show Reports Filter Panel
    Set Reports Filter Months  April,May,June
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  April,May
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  May,June
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report Third Quarter Only
    Show Reports Filter Panel
    Set Reports Filter Months  July,August,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  July,August
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  August,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report Fourth Quarter Only
    Show Reports Filter Panel
    Set Reports Filter Months  October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  October,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report First and Second Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March,April,May,June
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  January,April
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  February,May
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  March,June
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report First and Third Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March,July,August,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  January,July
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  February,August
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  March,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report First and Fourth Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March,October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  January,October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  February,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  March,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report Second and Third Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  April,May,June,July,August,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  April,July
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  May,August
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  June,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report Second and Fourth Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  April,May,June,October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  April,October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  May,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  June,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report Third and Fourth Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  July,August,September,October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  July,October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  August,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  September,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report First Second and Third Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March,April,May,June,July,August,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  January,April,July
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  February,May,August
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter
    Set Reports Filter Months  March,June,September
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Fourth Quarter

Confirm Quarterly Analytics Summary Report First Third and Fourth Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March,July,August,September,October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  January,July,October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  February,August,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  March,September,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report Second Third and Fourth Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  April,May,June,July,August,September,October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  April,July,October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  May,August,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  June,September,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Does Not Contain First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter

Confirm Quarterly Analytics Summary Report First Second Third and Fourth Quarters
    Show Reports Filter Panel
    Set Reports Filter Months  January,February,March,April,May,June,July,August,September,October,November,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Show Reports Filter Panel
    Set Reports Filter Months  January,April,July,October
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  February,May,August,November
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
    Set Reports Filter Months  March,June,September,December
    Apply Reports Filter
    sleep  5 seconds
    Confirm Analytics Quarterly Analytics Summary Report Page Contains First Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Second Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Third Quarter
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Fourth Quarter
