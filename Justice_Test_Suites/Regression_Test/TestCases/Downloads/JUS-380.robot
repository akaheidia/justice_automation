*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-380: Usability: Download menu should close when choice selected.

Suite Setup      Log In and Navigate to Filtered Devices Tab
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Download Menu Closes After CSV Visible Rows
    Download CSV Visible Rows
    Confirm Download Menu Closed
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_visible}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_visible}

Confirm Download Menu Closes After CSV All Rows
    Download CSV All Rows
    Confirm Download Menu Closed
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_all}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_all}

Confirm Download Menu Closes After CSV All Filtered Rows
    Download CSV All Filtered Rows
    Confirm Download Menu Closed
    Confirm File Exists  ${DOWNLOADS_DIR}  ${csv_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${csv_devices_filtered}

Confirm Download Menu Closes After PDF Visible Rows
    Download PDF Visible Rows
    Confirm Download Menu Closed
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_visible}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_visible}

Confirm Download Menu Closes After PDF All Rows
    Download PDF All Rows
    Confirm Download Menu Closed
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_all}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_all}

Confirm Download Menu Closes After PDF All Filtered Rows
    Download PDF All Filtered Rows
    Confirm Download Menu Closed
    Confirm File Exists  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}
    Remove File  ${DOWNLOADS_DIR}  ${pdf_devices_filtered}

*** Keywords ***
Log In and Navigate to Filtered Devices Tab
    Log In and Navigate to Devices Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Set Server Filter  ${XMC_HOSTNAME}
