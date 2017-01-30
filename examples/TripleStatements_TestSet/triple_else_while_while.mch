/* triple_else_while_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_else_while_while

OPERATIONS
    res1, res2, res3 <-- optriple_else_while_while(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        IF xx < 5 THEN
            res1 := 0 || res2 := yy || 
            IF yy > 0 THEN 
                res3 := zz
            ELSE
                res3 := 0
            END
        ELSE
            res1 := xx || res2 := yy || 
            IF yy > 0 THEN 
                res3 := zz
            ELSE
                res3 := 0
            END
        END    
    END
END
