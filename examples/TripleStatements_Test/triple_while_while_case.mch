/* triple_while_while_case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_while_while_case

OPERATIONS
    res1, res2, res3 <-- optriple_while_while_case(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        res1 := xx ||
        IF xx > 0 THEN
            res2 := yy
        ELSE
            res2 := 0
        END ||
        CASE zz OF
            EITHER 0 THEN
                res3 := zz
            OR 1 THEN
                res3 := zz
            ELSE
                res3 := zz
            END
        END
    END
END
