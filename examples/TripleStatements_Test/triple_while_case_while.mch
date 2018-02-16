/* triple_while_case_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_while_case_while

OPERATIONS
    res1, res2, res3 <-- optriple_while_case_while(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        CASE yy OF
            EITHER 0 THEN
                res1 := xx || res2 := yy || 
                IF xx > 0 THEN
                    res3 := zz
                ELSE
                    res3 := 0
                END
            OR 1 THEN
                res1 := xx || res2 := yy || 
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
END
