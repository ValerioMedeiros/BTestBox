/* nested_if_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_if_while

OPERATIONS
    res1 , res2 <-- opnested_if_while ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        IF xx < 5 THEN
            res1 := 0 || res2 := yy
        END
    END
END
