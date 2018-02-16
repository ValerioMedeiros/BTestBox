/* nested_while_else
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_while_else

OPERATIONS
    res1 , res2 <-- opnested_while_else ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx ||
        IF yy < 5 THEN
            res2 := 0
        ELSE
            res2 := yy
        END
    END

END
