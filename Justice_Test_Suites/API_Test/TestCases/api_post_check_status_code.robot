*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies the POST requests return a successful status code.
...
...             The Suite Setup section objtains the access token used in the POST requests
...             for this test suite.
...
...             This test is data driven:  the Test Template section specifies the keyword
...             which will be called for each Test Case.  The Test Case specifies the argument
...             to send to the template's keyword.

Suite Setup    Set Access Token
Test Template  Post Request Should Have Valid Status Code

*** Variables ***
${json_string}
...  {
...    "paginator": {
...      "size": 20,
...      "page": 0
...    }
...  }

*** Test Cases ***      API
Post Map               /v1/api/map
Post Devices           /v1/api/devices
Post Endpoints         /v1/api/endpoints
Post Events            /v1/api/events

*** Keywords ***
Post Request Should Have Valid Status Code
    [Arguments]  ${API}
    Confirm Post Request Successful  ${API}  ${json_string}
