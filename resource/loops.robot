*** Test Cases ***
check Loops table
    Handle Table
    Multiple nesting levels



Example
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop

Second Example
    FOR    ${var}    IN    one    two    ${3}   four  ${5}
    ...    kuusi    7    eight    nine
        Log    ${var}
         Log    2nd keyword
    END


Third Example
    @{ELEMENTS}       cat     dog     mouse
    FOR    ${element}  dog   IN    ${ELEMENTS}   cat     dog     mouse
        Start Element    ${element}
    END

*** Keywords ***
Handle Table
    [Arguments]    @{table}
    FOR    ${row}    IN    @{table}
        FOR    ${cell}    IN    @{row}
            Handle Cell    ${cell}
        END
    END

Multiple nesting levels
    FOR    ${root}    IN    r1    r2
        FOR    ${child}    IN    c1   c2    c3
            FOR    ${grandchild}    IN    g1    g2
                Log Many    ${root}    ${child}    ${grandchild}
            END
        END
        FOR    ${sibling}    IN    s1    s2    s3
            IF    '${sibling}' != 's2'
                Log Many    ${root}    ${sibling}
            END
        END
    END