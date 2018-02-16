/* triple_case_while_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_case_while_while

OPERATIONS
    res1, res2, res3 <-- optriple_case_while_while(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                res1 := xx || res2 := yy || 
                IF yy <= 0 THEN
                    res3 := 0
                ELSE
                    res3 := zz
                END
            OR 1 THEN
                res1 := xx || res2 := yy || 
                IF yy <= 0 THEN
                    res3 := 0
                ELSE
                    res3 := zz
                END
            ELSE
                res1 := xx || res2 := yy || 
                IF yy <= 0 THEN
                    res3 := 0
                ELSE
                    res3 := zz
                END
            END
        END
        
    END
END
