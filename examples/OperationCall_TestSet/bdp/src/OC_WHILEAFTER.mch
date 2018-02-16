/* OC_WHILEAFTER
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    OC_WHILEAFTER

OPERATIONS
    res1 , res2 <-- opOC_WHILEAFTER ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx || res2 := yy
    END

END
