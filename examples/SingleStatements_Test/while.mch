/* while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    while

OPERATIONS
    res <-- opwhile(xx)=
    PRE xx : NAT
    THEN
        res := xx
    END
    

END
