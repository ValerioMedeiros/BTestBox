/* duoseq_while_else
 * Author: Diego Oliveira
 * Creation date: 15/11/2016
 */
MACHINE
    duoseq_while_else

OPERATIONS
    res1, res2 <-- opduoseq_while_else(xx)=
    PRE xx : NAT
    THEN
        res1 := xx ||
        IF xx < 5 THEN
            res2 := 0
        ELSE
            res2 := xx
        END
    END
END
