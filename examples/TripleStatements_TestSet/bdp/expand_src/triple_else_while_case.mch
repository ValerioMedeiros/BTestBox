/* triple_else_while_case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_else_while_case

OPERATIONS
    res1 , res2 , res3 <-- optriple_else_while_case ( xx , yy , zz ) =
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        IF xx < 5 THEN
            CASE zz OF
                EITHER 0 THEN
                    res1 := 0 || res2 := yy || res3 := zz
                OR 1 THEN
                    res1 := 0 || res2 := yy || res3 := zz
                ELSE
                    res1 := 0 || res2 := yy || res3 := zz
                END
            END
        ELSE
            CASE zz OF
                EITHER 0 THEN
                    res1 := xx || res2 := yy || res3 := zz
                OR 1 THEN
                    res1 := xx || res2 := yy || res3 := zz
                ELSE
                    res1 := xx || res2 := yy || res3 := zz
                END
            END
        END
    END
END
