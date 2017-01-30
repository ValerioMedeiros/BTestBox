/* NONDET_MCH_ELSE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    NONDET_MCH_ELSE

OPERATIONS
    res <-- opNONDET_MCH_ELSE ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        CHOICE
            IF xx > yy THEN
                res := xx
            ELSE
                res := yy
            END
        OR
            IF xx > yy THEN
                res := xx
            ELSE
                res := yy
            END
        END
    END
END
