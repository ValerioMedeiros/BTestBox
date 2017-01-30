/* if
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    if

OPERATIONS
    res <-- opif(xx)=
    PRE xx : NAT
    THEN
        IF xx < 5 THEN
            res := 0
        END
    END
    

END
