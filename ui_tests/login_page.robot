*** Settings ***
Documentation    This test case verifies the login functionality on the HSL login page. It involves opening the page, entering valid credentials, and submitting the login form.
Library           SeleniumLibrary
Resource        hsl_keywords.robot


*** Test Cases ***
Verify HSL Login Page
    [Documentation]    This test case verifies the login functionality on the HSL login page. It includes:
    ...                1. Opening the HSL page in the browser.
    ...                2. Navigating to the login page.
    ...                3. Inputting a valid username and password (test@demo.com and 1test2).
    ...                4. Submitting the login form with the provided credentials.
    ...                5. Ensuring that the login page submits the credentials correctly.
    Open HSL Page In The Browser
    Open Browser To Login Page
    Input Username    test@demo.com
    Input Password    1test2
    Submit Credentials
    [Teardown]    Close Browser
