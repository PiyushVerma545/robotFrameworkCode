*** Settings ***
Test Timeout       2 minutes

*** Test Cases ***
Default timeout
    [Documentation]    Default timeout from Settings is used.
    Some Keyword    argument

Override
    [Documentation]    Override default, use 10 seconds timeout.
    [Timeout]    10
    Some Keyword    argument

Variables
    [Documentation]    It is possible to use variables too.
    [Timeout]    ${TIMEOUT}
    Some Keyword    argument

No timeout
    [Documentation]    Empty timeout means no timeout even when Test Timeout has been used.
    [Timeout]
    Some Keyword    argument

No timeout 2
    [Documentation]    Disabling timeout with NONE works too and is more explicit.
    [Timeout]    NONE

