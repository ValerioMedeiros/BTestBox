/* nested_case_else
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_case_else

OPERATIONS
    res1 , res2 <-- opnested_case_else ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                IF yy < 5 THEN
                    res1 := xx || res2 := 0
                ELSE
                    res1 := xx || res2 := yy
                END
            OR 1 THEN
                IF yy < 5 THEN
                    res1 := xx || res2 := 0
                ELSE
                    res1 := xx || res2 := yy
                END
            ELSE
                IF yy < 5 THEN
                    res1 := xx || res2 := 0
                ELSE
                    res1 := xx || res2 := yy
                END
            END
        END
    END


END
