*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
# Test Setup        Start Chrome For Testing
Resource          resource.robot
Test Teardown     Close Browser
# Resource          webdriver.robot

*** Test Cases ***
Open Form
    Open Browser To Form Page
    Form Page Should Be Open
Empty Destination
    Open Browser To Form Page
    Form Page Should Be Open
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input ContactPerson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input PhoneNo    081-111-1234
    Submit Customer Form
    Form Page Should Be Open
    Page Should Contain    Please enter your destination.

Empty Email
    Open Browser To Form Page
    Form Page Should Be Open
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input ContactPerson    Sodsai Sandee
    Input Relationship    Mother
    Input PhoneNo    081-111-1234
    Submit Customer Form
    Form Page Should Be Open
    Page Should Contain    Please enter a valid email address.
Invalid Email
    Open Browser To Form Page
    Form Page Should Be Open
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input ContactPerson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@
    Input PhoneNo    081-111-1234
    Submit Customer Form
    Form Page Should Be Open
    Page Should Contain    Please enter a valid email address.

Empty Phone Number
    Open Browser To Form Page
    Form Page Should Be Open
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input ContactPerson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Submit Customer Form
    Form Page Should Be Open
    Page Should Contain    Please enter a phone number.
Invalid Phone Number
    Open Browser To Form Page
    Form Page Should Be Open
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input ContactPerson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input PhoneNo    191
    Submit Customer Form
    Form Page Should Be Open
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)