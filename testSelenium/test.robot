*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
# Test Setup        Start Chrome For Testing\
# Resource          webdriver.robot
Library    SeleniumLibrary

*** Test Cases ***
Open Form
    Open Browser    url=https://cranky_clarke:7272   browser=Chrome