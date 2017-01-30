/* triple_while_while_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_while_while_while

OPERATIONS
    res1, res2, res3 <-- optriple_while_while_while(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
       res1 := xx ||
        IF xx > 0 THEN
            res2 := yy
        ELSE
            res2 := 0
        END || 
        IF xx > 0 & yy > 0 THEN
            res3 := zz
        ELSE
            res3 := 0
        END
    END
END
