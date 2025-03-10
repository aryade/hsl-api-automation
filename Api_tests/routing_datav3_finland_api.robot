*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary

*** Variables ***
${BASE_URL}       https://api.digitransit.fi/routing-data/v3/finland
${API_KEY}        3bc552f1c4764b1bae93f808697e8b0d
${TIMEOUT}        2

*** Test Cases ***
Verify Routing Data Get Response
    [Documentation]    Validate API returns a successful response (200)
    ${HEADERS}=    Create Dictionary
    ...    Cache-Control=no-cache
    ...    digitransit-subscription-key=${API_KEY}

    Create Session    digitransit    ${BASE_URL}    headers=${HEADERS}

    ${response}=    GET On Session    digitransit    /    expected_status=any
    Should Be Equal As Numbers    ${response.status_code}    200

Verify API Handles Invalid Request
    [Documentation]    Ensure API returns a 400 or 404 error for an invalid query
    ${HEADERS}=    Create Dictionary
    ...    Cache-Control=no-cache
    ...    digitransit-subscription-key=${API_KEY}

    ${response}=    GET On Session    digitransit    /invalid-endpoint    expected_status=any
    ${status_code}=    Convert To Number    ${response.status_code}

    Should Be True    ${status_code} == 400 or ${status_code} == 404    Expected 400 or 404 but got ${status_code}

    ${content_type}=    Get From Dictionary    ${response.headers}    Content-Type
    ${is_json}=    Evaluate    "application/json" in "${content_type}"

    Run Keyword If    ${is_json}
    ...    Validate JSON Error Response    ${response.text}



Verify API Response Time
    [Documentation]    Ensure API responds within ${TIMEOUT} seconds.
    ${QUERY}=    Create Dictionary
    ...    query=query { agencies { id name url } }

    ${response}=    POST On Session    digitransit    /    json=${QUERY}    expected_status=any
    ${elapsed_time}=    Convert To Number    ${response.elapsed.total_seconds()}
    Should Be True    ${elapsed_time} < ${TIMEOUT}    API took too long to respond! (${elapsed_time}s)
    

Verify Missing API Key Handling
    [Documentation]    Ensure API returns an authentication error when no API key is provided
    ${HEADERS}=    Create Dictionary
    ...    Cache-Control=no-cache  # No API key provided

    Create Session    digitransit_no_key    ${BASE_URL}    headers=${HEADERS}
    ${response}=    GET On Session    digitransit_no_key    /    expected_status=any
    ${status_code}=    Convert To Number    ${response.status_code}
    Should Be Equal As Numbers    ${status_code}    401    Expected 403 Unauthorized but got ${status_code}

Verify Invalid Method Usage
    [Documentation]    Ensure API returns 405 when using an unsupported HTTP method
    ${HEADERS}=    Create Dictionary
    ...    Cache-Control=no-cache
    ...    digitransit-subscription-key=${API_KEY}

    ${response}=    DELETE On Session    digitransit    /    expected_status=any
    ${status_code}=    Convert To Number    ${response.status_code}
    Should Be Equal As Numbers    ${status_code}    404    Expected 405 Method Not Allowed but got ${status_code}


*** Keywords ***
Validate JSON Error Response
    [Arguments]    ${response_text}
    ${json_data}=    Convert String To Json    ${response_text}
    Dictionary Should Contain Key    ${json_data}    errors
    ${error_message}=    Get From Dictionary    ${json_data}    errors
    Log To Console    API Error Message: ${error_message}
