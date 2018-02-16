/* triple_case_case_if
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_case_case_if

OPERATIONS
    res1, res2, res3 <-- optriple_case_case_if(xx, yy, zz)=
    BEGIN
        CASE xx OF
            EITHER 0 THEN
                CASE yy OF
                    EITHER 0 THEN
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    OR 1 THEN
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    ELSE
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    END
                END
            OR 1 THEN
                CASE yy OF
                    EITHER 0 THEN
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    OR 1 THEN
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    ELSE
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    END
                END
            ELSE
                CASE yy OF
                    EITHER 0 THEN
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    OR 1 THEN
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    ELSE
                        IF zz < 5 THEN
                            res1 := xx || res2 := yy || res3 := 0 
                        END
                    END
                END
            END
        END
        
    END
END
