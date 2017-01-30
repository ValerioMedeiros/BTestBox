/* DET_MCH_CASE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    DET_MCH_CASE

OPERATIONS
    res <-- opDET_MCH_CASE(xx)=
    PRE xx : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                res := xx
            OR 1 THEN
                res := xx
            ELSE
                res := xx
            END
        END
    END
END
