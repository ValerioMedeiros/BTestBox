/* nested_if_if
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_if_if

OPERATIONS
    res1 , res2 <-- opnested_if_if ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        IF xx < 5 THEN
            IF yy < 5 THEN
                res1 := 0 || res2 := 0
            END
        END
    END

END
