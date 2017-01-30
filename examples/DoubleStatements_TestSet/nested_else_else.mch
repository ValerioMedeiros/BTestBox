/* nested_else_else
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_else_else

OPERATIONS
    res1, res2 <-- opnested_else_else(xx ,yy)=
    PRE xx : NAT & yy : NAT
    THEN
        IF xx < 5 THEN
            IF yy < 5 THEN
                res1 := 0 || res2 := 0
            ELSE
                res1 := 0 || res2 := yy
            END
        ELSE
            IF yy < 5 THEN
                res1 := xx || res2 := 0
            ELSE
                res1 := xx || res2 := yy
            END
        END    
    END

END
