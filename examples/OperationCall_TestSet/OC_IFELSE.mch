/* OC_IFELSE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    OC_IFELSE

OPERATIONS
    res <-- opOC_IFELSE(xx, yy)=
    PRE xx : NAT & yy : NAT
    THEN
        IF xx > yy THEN
            res := xx
        ELSE
            res := yy
        END
    END
END
