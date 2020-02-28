*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-404: Reports: Site Availability repeats parent site for each child site.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${server_name}  ${XMC_HOSTNAME}
${site_name}    Parent Site

*** Test Cases ***
Confirm Site Availability Does Not Have Duplicated Sites
    Navigate to Site Availability Report
    Confirm Site Availability Report Table Contains Value  ${server_name}: /${site_name}
    ${site_count}=  Get Site Availability Report Table Value Count  ${server_name}: /${site_name}
    Log  Number of rows with ${server_name}: /${site_name} is ${site_count}
    Should Be True  ${site_count} == 1
