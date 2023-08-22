*** Test Cases ***
Test 1
    Run Keyword and Continue on Failure    Should be Equal    1    2
    User Keyword 1

Test 2
    [Tags]    robot:continue-on-failure
    Should be Equal    1    2
    User Keyword 2

Example
    [Tags]    robot:recursive-continue-on-failure
    Should be Equal    1    2
    User Keyword 1
    Log    This is executed

*** Keywords ***
User Keyword 1
    Run Keyword and Continue on Failure    Should be Equal    3    4
    Log    This is executed

User Keyword 2
    [Tags]    robot:continue-on-failure
    Should be Equal    3    4
    Log    This is executed

