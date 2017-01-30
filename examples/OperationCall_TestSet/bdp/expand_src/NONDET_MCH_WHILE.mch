/* NONDET_MCH_WHILE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    NONDET_MCH_WHILE

OPERATIONS
    res <-- opNONDET_MCH_WHILE ( xx ) =
    PRE xx : NAT
    THEN
        CHOICE
            res := xx
        OR
            res := xx
        END
    END
END
