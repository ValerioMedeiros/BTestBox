/* triple_case_case_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_case_case_while

OPERATIONS
    res1, res2, res3 <-- optriple_case_case_while(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                CASE yy OF
                    EITHER 0 THEN
                        res1 := xx || res2 := yy || res3 := zz
                    OR 1 THEN
                        res1 := xx || res2 := yy || res3 := zz
                    ELSE
                        res1 := xx || res2 := yy || res3 := zz
                    END
                END
            OR 1 THEN
                CASE yy OF
                    EITHER 0 THEN
                        res1 := xx || res2 := yy || res3 := zz
                    OR 1 THEN
                        res1 := xx || res2 := yy || res3 := zz
                    ELSE
                        res1 := xx || res2 := yy || res3 := zz
                    END
                END
            ELSE
                CASE yy OF
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
END
