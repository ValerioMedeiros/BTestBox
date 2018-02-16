/* triseq_while_while_while
 * Author: Diego Oliveira
 * Creation date: 08/11/2016
 */
MACHINE
    triseq_while_while_while

OPERATIONS
    res1, res2, res3 <-- optriseq_while_while_while(xx)=
    PRE xx: NAT
    THEN
       res1 := xx || res2 := xx || res3 := xx
    END
END
