/* DET_MCH_ELSE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    DET_MCH_ELSE

OPERATIONS
    res <-- opDET_MCH_ELSE ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        IF xx > yy THEN
            res := xx
        ELSE
            res := yy
        END
    END
END
