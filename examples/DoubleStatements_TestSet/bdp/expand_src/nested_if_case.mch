/* nested_if_case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_if_case

OPERATIONS
    res1 , res2 <-- opnested_if_case ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        IF xx < 5 THEN
            CASE yy OF
                EITHER 0 THEN
                    res1 := 0 || res2 := yy
                OR 1 THEN
                    res1 := 0 || res2 := yy
                ELSE
                    res1 := 0 || res2 := yy
                END
            END
        END
    END
END
