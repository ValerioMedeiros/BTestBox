/* assig
 * Author: Diego Oliveira
 * Creation date: 03/01/2017
 */
MACHINE
    assig

OPERATIONS
    res <-- opassig(xx)=
    PRE xx : NAT
    THEN
        res := xx
    END

 END
