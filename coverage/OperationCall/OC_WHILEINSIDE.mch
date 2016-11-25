/* OC_WHILEINSIDE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    OC_WHILEINSIDE

OPERATIONS
    res1, res2 <-- opOC_WHILEINSIDE(xx,yy)=
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx || res2 := yy
    END

END
