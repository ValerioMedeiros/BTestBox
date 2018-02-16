/* nested_while_whileseq
 * Author: Diego Oliveira
 * Creation date: 15/11/2016
 */
MACHINE
    nested_while_whileseq

OPERATIONS
    res1 , res2 <-- opnested_while_whileseq ( xx , yy ) =
    PRE xx : NAT & yy : NAT
    THEN
        res1 := xx || IF xx < 1 THEN res2 := 0 ELSE res2 := yy END
    END
END
