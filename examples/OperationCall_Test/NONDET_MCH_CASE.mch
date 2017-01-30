/* NONDET_MCH_CASE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    NONDET_MCH_CASE

OPERATIONS
    res <-- opNONDET_MCH_CASE(xx) =
    PRE xx : NAT 
    THEN
        CHOICE
            res := xx
        OR
            res := xx
        END
    END
END
