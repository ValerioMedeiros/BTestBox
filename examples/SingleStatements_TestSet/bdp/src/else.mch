/* else
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    else

OPERATIONS
    res <-- opelse ( xx ) =
    PRE xx : NAT
    THEN
        IF xx < 5 THEN
            res := 0
        ELSE
            res := xx
        END
    END

END
