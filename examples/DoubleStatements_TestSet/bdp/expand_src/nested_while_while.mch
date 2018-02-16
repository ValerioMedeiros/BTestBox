/* nested_while_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_while_while

OPERATIONS
    res1 , res2 <-- opnested_while_while ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx ||
        IF xx > 0 THEN
            res2 := yy
        ELSE
            res2 := 0
        END
    END


END
