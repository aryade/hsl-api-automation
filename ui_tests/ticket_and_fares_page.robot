*** Settings ***
Documentation    Verifying the single ticket functionality, including customer group dropdown and child ticket selection.
Library           SeleniumLibrary
Resource        hsl_keywords.robot




*** Test Cases ***

Verify Single Tickets & Fare Page
    [Documentation]    This test case verifies the functionality of the Single Ticket page. It includes:
    ...                1. Opening the HSL page in the browser.
    ...                2. Navigating to the Tickets and Fares page.
    ...                3. Managing cookies and pop-ups.
    ...                4. Verifying the Customer Group dropdown and selecting "Child" as the customer type.
    ...                5. Confirming that the Child option can be selected correctly from the dropdown.
    Open HSL Page In The Browser
    Open Tickets And Fares Page
    Manage Cookies
    Open Single Ticket Page
    Verify the Customer Group in the DropDown
    Select Child From the Customer Group
    [Teardown]    Close Browser