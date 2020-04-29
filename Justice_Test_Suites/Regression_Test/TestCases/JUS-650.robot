*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Resources/AllResources.robot

Documentation  Regression test for JUS-648: Add itemID to ports when they are returned by getTagsByID.

Suite Setup    Set Access Token

Test Setup     Log In and Create Tag and Obtain Tag ID
Test Teardown  Clean Up Tags and Log Out and Close Browser

*** Variables ***
&{headers}=       Content-Type=application/json
${test_device}    10.54.142.10
${test_tag}       Test Tag

*** Test Cases ***
Confirm Get Tag By ID API Works
    Obtain Tag ID

    ${resp}=  Get Request  justice  /v1/api/tags/${tag_id}  ${auth}
    Log  Response For Tag ${tag_id}: ${resp.content}
    Log  ${resp.status_code}
    Should Be Equal As Strings  ${resp.status_code}  200

    # Extract the Items
    ${jsondata}=  To Json  ${resp.content}
    ${items}=  Collections.Get From Dictionary  ${jsondata}  items
    Log  Items: ${items}

    # Extract the Devices
    ${devices}=  Collections.Get From Dictionary  ${items}  device
    Log  Devices: ${devices}
    ${device_info}=  Get From List  ${devices}  0
    Should Contain  ${device_info}  itemId
    ${device_item_id}=  Collections.Get From Dictionary  ${device_info}  itemId
    Log To Console  DEVICE ITEM ID: ${device_item_id}

#    # Extract the Ports
#    ${ports}=  Collections.Get From Dictionary  ${items}  port
#    Log  Ports: ${ports}
#    ${port_info}=  Get From List  ${ports}  0
#    Should Contain  ${port_info}  itemId
#    ${port_item_id}=  Collections.Get From Dictionary  ${port_info}  itemId
#    Log To Console  PORT ITEM ID: ${port_item_id}

*** Keywords ***
Log In and Create Tag and Obtain Tag ID
    Log In and Create Tag
    Obtain Tag ID

Log In and Create Tag
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click List Slider
    Click Devices Tab
    Set Server Filter  ${XMC_HOSTNAME}
    Create Tag For Test
    Assign Test Devices To Test Tag

Create Tag For Test
    Show Tags Panel
    Tags Panel Click Add
    Add Tag Set Name  ${test_tag}
    Add Tag Click Save
    Confirm Tags Panel Contains Tag  ${test_tag}
    Tags Panel Click Close

Assign Test Devices To Test Tag
    Search Field Enter Text  ${test_device}
    Select Device In Table  ${test_device}
    Search Field Clear Text
    Click Add Devices To Tag
    Confirm Add Devices To Tag Panel Visible
    Confirm Add Devices To Tag Panel Contains Tag  ${test_tag}
    Add Devices To Tag Select Tag  ${test_tag}
    Add Devices To Tag Click Save

Obtain Tag ID
    &{auth}=  Create Dictionary  Authorization  Bearer ${access_token}
    Set Suite Variable  ${auth}

    Create Session  alias=justice  url=${JUS_URL}
    ${resp}=  Get Request  justice  /v1/api/tags  ${auth}
    Should Be Equal As Strings  ${resp.status_code}  200

    # Extract the Tag ID for the next test
    ${jsondata}=  To Json  ${resp.content}
    Log  All Tags: ${jsondata}
    ${tag_info}=  Get From List  ${jsondata}  0
    Log  First Tag: ${tag_info}
    ${tag_id}=  Collections.Get From Dictionary  ${tag_info}  tagId
    Log  Tag ID: ${tag_id}
    Set Suite Variable  ${tag_id}

Clean Up Tags and Log Out and Close Browser
    Show Tags Panel
    Tags Panel Select Tag  ${test_tag}
    Edit Tag Click Delete
    Edit Tag Confirm Delete Tag Click OK
    Confirm Tags Panel Does Not Contain Tag  ${test_tag}
    Hide Tags Panel
    Log Out and Close Browser
