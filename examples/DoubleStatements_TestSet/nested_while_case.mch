/* nested_while_case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_while_case

OPERATIONS
    res1, res2 <-- opnested_while_case(xx, yy) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx ||
        CASE yy OF
            EITHER 0 THEN
                res2 := yy
            OR 1 THEN
                res2 := yy
            ELSE
                res2 := yy
            END
        END
    END
END
