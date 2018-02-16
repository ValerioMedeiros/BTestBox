/* triple_while_else_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_while_else_while

OPERATIONS
    res1 , res2 , res3 <-- optriple_while_else_else ( xx , yy , zz ) =
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        IF yy < 5 THEN
            res1 := xx || res2 := 0 ||
            IF xx > 0 THEN
                res3 := zz
            ELSE
                res3 := 0
            END
        ELSE
            res1 := xx || res2 := yy ||
            IF xx > 0 THEN
                res3 := zz
            ELSE
                res3 := 0
            END
        END
    END
END
