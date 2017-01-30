/* OC_CASE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    OC_CASE

OPERATIONS
    res <-- opOC_CASE ( xx ) =
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
