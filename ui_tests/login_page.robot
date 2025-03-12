*** Settings ***
Library           SeleniumLibrary
Resource        hsl_keywords.robot


*** Test Cases ***
Verify HSL Login Page
    Open HSL Page In The Browser
    Open Browser To Login Page
    Input Username    test@demo.com
    Input Password    1test2
    Submit Credentials
    [Teardown]    Close Browser
