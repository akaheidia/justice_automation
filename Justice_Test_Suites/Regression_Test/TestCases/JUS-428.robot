*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-428: Reports - Usability: Top N reports should inidcate it is a Top N type of report.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser


*** Test Cases ***
Confirm Top Device Availability Title
    Navigate to Top N Top Device Availability Report
    Confirm Top N Top Device Availability Reports Page Title
    Confirm Breadcrumb Contains Text  Top Device Availability

Confirm Top Site Availability Title
    Navigate to Top N Top Site Availability Report
    Confirm Top N Top Site Availability Reports Page Title
    Confirm Breadcrumb Contains Text  Top Site Availability

Confirm Top CPU Utilization Title
    Navigate to Top N Top CPU Utilization Report
    Confirm Top N Top CPU Utilization Reports Page Title
    Confirm Breadcrumb Contains Text  Top CPU Utilization

Confirm Top Memory Utilization Title
    Navigate to Top N Top Memory Utilization Report
    Confirm Top N Top Memory Utilization Reports Page Title
    Confirm Breadcrumb Contains Text  Top Memory Utilization

Confirm Top Port Utilization Title
    Navigate to Top N Top Port Utilization Report
    Confirm Top N Top Port Utilization Reports Page Title
    Confirm Breadcrumb Contains Text  Top Port Utilization

Confirm Top Port Error Title
    Navigate to Top N Top Port Error Report
    Confirm Top N Top Port Error Reports Page Title
    Confirm Breadcrumb Contains Text  Top Port Error

Confirm Top APs By Clients Title
    Navigate to Top N Top APs By Clients Report
    Confirm Top N Top APs by Clients Reports Page Title
    Confirm Breadcrumb Contains Text  Top APs by Clients
    Confirm Page Does Not Contain Text  Top Top

Confirm Top APs By Bandwidth Title
    Navigate to Top N Top APs By Bandwidth Report
    Confirm Top N Top APs by Bandwidth Reports Page Title
    Confirm Breadcrumb Contains Text  Top APs by Bandwidth
    Confirm Page Does Not Contain Text  Top Top
