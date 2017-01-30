/* triple_while_while_else
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_while_while_else

OPERATIONS
    res1 , res2 , res3 <-- optriple_while_while_else ( xx , yy , zz ) =
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        res1 := xx ||
        IF xx > 0 THEN
            res2 := yy
        ELSE
            res2 := 0
        END ||
        IF zz < 5 THEN
            res3 := 0
        ELSE
            res3 := zz
        END
    END
END
