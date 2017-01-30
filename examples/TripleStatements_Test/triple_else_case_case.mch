/* triple_else_case_case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    triple_else_case_case

OPERATIONS
    res1 <-- optriple_else_case_case(xx, yy, zz)=
    PRE xx : NAT & yy : NAT & zz : NAT
    THEN
        IF xx < 5 THEN
            CASE yy OF
                EITHER 0 THEN
                    CASE zz OF
                        EITHER 0 THEN
                            res1 := 0
                        OR 1 THEN
                            res1 := 0                                
                        ELSE
                            res1 := 0
                        END
                    END
                OR 1 THEN
                    CASE zz OF
                        EITHER 0 THEN
                            res1 := 0
                        OR 1 THEN
                            res1 := 0                                
                        ELSE
                            res1 := 0
                        END
                    END
                ELSE
                    CASE zz OF
                        EITHER 0 THEN
                            res1 := 0
                        OR 1 THEN
                            res1 := 0                                
                        ELSE
                            res1 := 0
                        END
                    END
                END
            END
        ELSE
           CASE yy OF
                EITHER 0 THEN
                    CASE zz OF
                        EITHER 0 THEN
                            res1 := xx 
                        OR 1 THEN
                            res1 := xx                              
                        ELSE
                            res1 := xx
                        END
                    END
                OR 1 THEN
                    CASE zz OF
                        EITHER 0 THEN
                            res1 := xx 
                        OR 1 THEN
                            res1 := xx                              
                        ELSE
                            res1 := xx
                        END
                    END
                ELSE
                    CASE zz OF
                        EITHER 0 THEN
                            res1 := xx 
                        OR 1 THEN
                            res1 := xx                              
                        ELSE
                            res1 := xx
                        END
                    END
                END
            END
        END
    END
END
