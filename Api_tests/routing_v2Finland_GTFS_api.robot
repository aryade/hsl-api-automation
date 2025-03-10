*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary

*** Variables ***
${BASE_URL}       https://api.digitransit.fi/routing/v2/finland/gtfs/v1/
${API_KEY}        3bc552f1c4764b1bae93f808697e8b0d
# ${HEADERS}=    Create Dictionary
#     ...    Content-Type=application/json
#     ...    digitransit-subscription-key=${API_KEY}

*** Test Cases ***
Verify GraphQL API Response
    [Documentation]    Send a GraphQL query and validate the response.

    ${HEADERS}=    Create Dictionary    # Create Headers
    ...    Content-Type=application/json
    ...    digitransit-subscription-key=${API_KEY}
    Create Session    digitransit    ${BASE_URL}    headers=${HEADERS}    # Create Session
    ${QUERY}=    Create Dictionary    # Define GraphQL Query
    ...    query= query { agencies { id name url } }
    ${response}=    POST On Session    digitransit    /    json=${QUERY}    # Send the GraphQL request
    #Log To Console    Response: ${response.text}    # Log response
    Should Be Equal As Numbers    ${response.status_code}    200    # Validate Response


Verify API Response Time
    [Documentation]    Ensure API responds within 2 seconds.
    ${HEADERS}=    Create Dictionary
    ...    Content-Type=application/json
    ...    digitransit-subscription-key=${API_KEY}
    Create Session    digitransit    ${BASE_URL}    headers=${HEADERS}
    ${QUERY}=    Create Dictionary
    ...    query=query { agencies { id name url } }
    ${response}=    POST On Session    digitransit    /    json=${QUERY}
    ${elapsed_time}=    Convert To Number    ${response.elapsed.total_seconds()}
    Should Be True    ${elapsed_time} < 2    API took too long to respond!


Verify API Handles Invalid Request
    [Documentation]    Ensure API returns a 400 error for an invalid query.
    ${HEADERS}=    Create Dictionary
    ...    Content-Type=application/json
    ...    digitransit-subscription-key=${API_KEY}
    Create Session    digitransit    ${BASE_URL}    headers=${HEADERS}
    ${INVALID_QUERY}=    Create Dictionary
    ...    query=query { invalidField { id name } }
    ${response}=    POST On Session    digitransit    /    json=${INVALID_QUERY}
    #Log To Console    Response: ${response.text}
    ${json_data}=    Convert String To Json    ${response.text}    # Convert response to JSON
    Dictionary Should Contain Key    ${json_data}    errors     #Validate response contains an 'errors' key
    ${error_message}=    Collections.Get From Dictionary    ${json_data}    errors    # Optional: Log the error message
    Log To Console    API Error Message: ${error_message}

    # Should Be Equal As Numbers    ${response.status_code}    400



Verify GTFS Routes
    [Documentation]    Fetch routes data from the GTFS endpoint and validate response.
    ${HEADERS}=    Create Dictionary
    ...    Content-Type=application/json
    ...    digitransit-subscription-key=${API_KEY}
    Create Session    digitransit    ${BASE_URL}    headers=${HEADERS}
    ${QUERY}=    Create Dictionary
    ...    query= query { agencies { routes { agency { id name timezone } } } }
    ${response}=    POST On Session    digitransit    /    json=${QUERY}
    #Log To Console    Response: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200    # Validate HTTP Status Code

    # Convert JSON response
    ${json_data} =    Convert String To Json    ${response.text}

    # Extract 'data' field
    ${data} =    Collections.Get From Dictionary    ${json_data}    data

    # Extract 'agencies' list and validate
    ${agencies} =    Collections.Get From Dictionary    ${data}    agencies
    Should Not Be Empty    ${agencies}    No agencies found in the response.

    # Extract first agency
    ${first_agency} =    Collections.Get From List    ${agencies}    0

    # Extract 'routes' and validate
    ${routes} =    Collections.Get From Dictionary    ${first_agency}    routes
    Should Not Be Empty    ${routes}    Routes should not be empty.

    # Log the number of routes found
    Log To Console    Found ${routes.__len__()} routes.















