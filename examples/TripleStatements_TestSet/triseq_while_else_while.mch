/* triseq_while_else_while
 * Author: Diego Oliveira
 * Creation date: 08/11/2016
 */
MACHINE
    triseq_while_else_while

OPERATIONS
    res1, res2, res3 <-- optriseq_while_else_while(xx)=
    PRE xx : NAT
    THEN
        res1 := xx || res3 := xx ||
        IF xx < 5 THEN
            res2 := 0
        ELSE
            res2 := xx
        END
    END        
END
