*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-387: Reports: The preposition "By" should not be capitalized in labels/titles.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Report Labels Are Correct for Top N: Top APs by Clients
    Navigate to Top N Top APs by Clients Report
    Confirm Top N Top APs by Clients Reports Page Title

Confirm Report Labels Are Correct for Top N: Top APs by Bandwidth
    Navigate to Top N Top APs by Bandwidth Report
    Confirm Top N Top APs by Bandwidth Reports Page Title

Confirm Report Labels Are Correct for Analytics: Top Applications by Clients
    Navigate to Analytics Top Applications by Clients Report
    Confirm Analytics Top Applications by Clients Reports Page Title

Confirm Report Labels Are Correct for Analytics: Top Applications by Volume
    Navigate to Analytics Top Applications by Volume Report
    Confirm Analytics Top Applications by Volume Reports Page Title

Confirm Report Labels Are Correct for Network Summary Page
    Navigate to Network Summary Report
    Log To Console  Remove sleep once JUS-556 is fixed
    sleep  5 seconds
    Click Top APs by Clients Drilldown
    Confirm Top N Top APs by Clients Reports Page Title
    Click Breadcrumb  Network Summary
    Log To Console  Remove sleep once JUS-556 is fixed
    sleep  5 seconds
    Click Top APs by Bandwidth Drilldown
    Confirm Top N Top APs by Bandwidth Reports Page Title

Confirm Report Labels Are Correct for Analytics: Analytics Summary
    Navigate to Analytics Summary Report
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Applications by Clients
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Applications by Volume
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Application Groups by Volume
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Tracked Applications by Clients
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Sites by Clients
    Confirm Analytics Summary Report Page Contains Top N Panel  Top Sites by Volume

Confirm Report Labels Are Correct for Analytics: Quarterly Analytics Summary
    Navigate to Analytics Quarterly Analytics Summary Report
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 1  Top Applications by Clients
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 1  Top Applications by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 1  Top Application Groups by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 1  Total Volume by Day
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 2  Top Applications by Clients
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 2  Top Applications by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 2  Top Application Groups by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 2  Total Volume by Day
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 3  Top Applications by Clients
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 3  Top Applications by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 3  Top Application Groups by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 3  Total Volume by Day
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 4  Top Applications by Clients
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 4  Top Applications by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 4  Top Application Groups by Volume
    Confirm Analytics Quarterly Analytics Summary Report Page Contains Top N Panel Quarter 4  Total Volume by Day
