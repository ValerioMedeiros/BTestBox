/* nested_while_if
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_while_if

OPERATIONS
    res1 , res2 <-- opnested_while_if ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx ||
        IF yy < 5 THEN
            res2 := 0
        END
    END

END
