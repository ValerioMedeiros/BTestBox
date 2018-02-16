/* case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    case

OPERATIONS
    res <-- opcase ( xx ) =
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
