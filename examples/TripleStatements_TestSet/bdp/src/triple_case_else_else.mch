/* triple_case_else_else
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_case_else_else

OPERATIONS
    res1 , res2 , res3 <-- optriple_case_else_else ( xx , yy , zz ) =
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                IF yy < 5 THEN
                    IF zz < 5 THEN
                        res1 := xx || res2 := 0 || res3 := 0
                    ELSE
                        res1 := xx || res2 := 0 || res3 := zz
                    END
                ELSE
                    IF zz < 5 THEN
                        res1 := xx || res2 := yy || res3 := 0
                    ELSE
                        res1 := xx || res2 := yy || res3 := zz
                    END
                END
            OR 1 THEN
                IF yy < 5 THEN
                    IF zz < 5 THEN
                        res1 := xx || res2 := 0 || res3 := 0
                    ELSE
                        res1 := xx || res2 := 0 || res3 := zz
                    END
                ELSE
                    IF zz < 5 THEN
                        res1 := xx || res2 := yy || res3 := 0
                    ELSE
                        res1 := xx || res2 := yy || res3 := zz
                    END
                END
            ELSE
                IF yy < 5 THEN
                    IF zz < 5 THEN
                        res1 := xx || res2 := 0 || res3 := 0
                    ELSE
                        res1 := xx || res2 := 0 || res3 := zz
                    END
                ELSE
                    IF zz < 5 THEN
                        res1 := xx || res2 := yy || res3 := 0
                    ELSE
                        res1 := xx || res2 := yy || res3 := zz
                    END
                END
            END
        END

    END
END
