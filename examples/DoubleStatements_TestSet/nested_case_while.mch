/* nested_case_while
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_case_while

OPERATIONS
    res1, res2 <-- opnested_case_while(xx, yy)=
    PRE xx : NAT & yy : NAT
    THEN
        CASE xx OF
            EITHER 0 THEN
                res1 := xx || res2 := yy
            OR 1 THEN
                res1 := xx || res2 := yy
            ELSE
                res1 := xx || res2 := yy
            END
        END
    END

END
