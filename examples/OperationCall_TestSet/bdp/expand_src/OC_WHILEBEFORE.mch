/* OC_WHILEBEFORE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    OC_WHILEBEFORE

OPERATIONS
    res1 , res2 <-- opOC_WHILEBEFORE ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx || res2 := yy
    END

END
