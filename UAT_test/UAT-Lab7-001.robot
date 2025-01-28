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
# Open Complete
#     Open Browser To Complete Page
#     Element Should Contain    //h1    Our agent will contact you shortly.
#     Element Should Contain    //h2    Thank you for your patient.

Record Success
    Open Browser To Form Page
    Form Page Should Be Open
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input ContactPerson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input PhoneNo    081-111-1234
    Submit Customer Form
    Complete Page Should Be Open
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.