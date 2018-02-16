/* nested_case_if
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_case_if

OPERATIONS
    res1, res2 <-- opnested_case_if(xx, yy)=
    PRE xx : NAT & yy : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                IF yy < 5 THEN
                    res1 := xx || res2 := 0
                END
            OR 1 THEN
                IF yy < 5 THEN
                    res1 := xx || res2 := 0
                END
            ELSE
                IF yy < 5 THEN
                    res1 := xx || res2 := 0
                END
            END
        END
    END

END
