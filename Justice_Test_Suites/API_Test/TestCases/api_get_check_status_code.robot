*** Settings ***
Library  Collections
Library  RequestsLibrary
Resource  ../Resources/AllResources.robot

Documentation   This test suite verifies the GET requests return a successful status code.
...
...             The Suite Setup section objtains the access token used in the GET requests
...             for this test suite.
...
...             This test is data driven:  the Test Template section specifies the keyword
...             which will be called for each Test Case.  The Test Case specifies the argument
...             to send to the template's keyword.

Suite Setup    Set Access Token
Test Template  Get Request Should Have Valid Status Code

*** Test Cases ***      API
Get All Sites           /v1/api/allSites
Get Alarms Summary      /v1/api/alarms/summary
Get All Domain Nodes    /v1/api/domainNodes
Get Database Password   /v1/api/settings/security
Get All Tags            /v1/api/tags

*** Keywords ***
Get Request Should Have Valid Status Code
    [Arguments]  ${API}
    Confirm Get Request Successful  ${API}
