# Test Automation Suite

This project contains automated test cases for validating the **Digitransit APIs** and the **HSL UI** using Robot Framework. The tests cover various API endpoints for the Digitransit service and also perform basic UI testing on the HSL website.

## Test Files (API & UI)

### API Test Cases

#### Key Libraries:
- `RequestsLibrary`: For sending HTTP requests.
- `Collections`: For handling data extraction from dictionaries and lists.
- `JSONLibrary`: For parsing JSON responses.

### 1.Routing v2 Finland GTFS - v1

#### Overview:
These tests validate the functionality of the Routing v2 Finland GTFS - v1 APIs, focusing on endpoints for GraphQL queries and routing data.

#### Test Suite:
- **Verify GraphQL API Response**: Sends a GraphQL query to validate the response for agencies' data.
- **Verify API Response Time**: Validates the response time from the API, ensuring it responds within 2 seconds.
- **Verify API Handles Invalid Request**: Tests how the API handles an invalid query by checking for a 400 error.
- **Verify GTFS Routes**: Fetches routes data from the GTFS endpoint and validates the response.


### 2.Routing Data v3-v3

#### Overview:
These tests validate the Routing Data API provided by Digitransit, ensuring correct responses and behavior under different scenarios.

#### Test Suite:
- **Verify Routing Data Get Response**: Validates a successful GET response from the routing endpoint.
- **Verify API Handles Invalid Request**: Ensures that invalid requests return 400 or 404 errors.
- **Verify API Response Time**: Ensures that the API responds within a specified timeout.
- **Verify Missing API Key Handling**: Verifies that the API returns a 401 Unauthorized error when the API key is missing.
- **Verify Invalid Method Usage**: Tests how the API responds when an unsupported HTTP method is used.



### UI Test Case

#### Key Libraries:
- `SeleniumLibrary`: For browser automation and interaction with UI elements.
### 1. HSL Login Page

#### Overview:
This test suite performs a simple UI validation on the HSL website, focusing on login page functionality.

#### Test Suite:
- **Verify HSL Login Page**: Opens the HSL website, waits for the login button to appear, and clicks the login button.




## Prerequisites

Before running these test cases, ensure the following:

1. **Robot Framework Installation**:

   pip install robotframework


2. **Library Installation**:
   Install the required libraries for both API and UI tests:


   pip install robotframework-requests
   pip install robotframework-seleniumlibrary
   pip install robotframework-jsonlibrary


3. **Selenium WebDriver**:
   For the UI tests, you need a web driver (e.g., ChromeDriver for Chrome)

4. **API Key**:
   Ensure you have a valid API key for Digitransit (as used in the test scripts). Replace `${API_KEY}` in the variables section with your valid API key.

## Running the Tests

### Running API Tests

To run the API test cases for Digitransit, use the following command:

robot api_tests/routing_datav3_finland_api.robot
robot api_tests/routing_v2Finland_GTFS_api.robot



### Running UI Test

To run the UI test case for the HSL login page, use the following command:


robot ui_test/login_page.robot
robot ticket_and_fares_page.robot

## Reporting

Robot Framework generates a report and log by default after each test run. After execution, you will find the following files:

- `report.html`: A summary of the test run with overall results.
- `log.html`: A detailed log of the test run, including test steps and outcomes.
- `output.xml`: A machine-readable file with the test results (useful for CI/CD pipelines).

