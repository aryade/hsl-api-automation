## Routing API ##
The Routing API provides a way to plan itineraries and query public transportation-related information, such as stops, routes, and timetables, using GraphQL. This API contains data for Finland and Estonia.

### Test Scenarios: ###
1. Verify GraphQL API Response
Objective: To test if a valid GraphQL query returns a successful response with a 200 status code.
Description: A simple query will be sent to fetch details about agencies. The status code of the response is then validated to ensure it equals 200.

2. Verify API Response Time
Objective: To ensure the API responds within an acceptable time limit (2 seconds).
Description: A GraphQL query is sent, and the response time is measured to ensure it is below the threshold.

3. Verify API Handles Invalid Request
Objective: To test how the API handles invalid GraphQL queries and returns an error response.
Description: A query with an invalid field is sent. The API is expected to return a response containing an errors key indicating the invalid query, but not a 400 status code. The test checks if the response includes errors.

4. Verify GTFS Routes
Objective: To test if the routes data can be fetched from the GTFS endpoint.
Description: A query is sent to fetch route details from the API. The response is checked to ensure that it includes the routes data.