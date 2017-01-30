/* duoseq_while_nestedwhile
 * Author: Diego Oliveira
 * Creation date: 15/11/2016
 */
MACHINE
    duoseq_while_nestedwhile
    
OPERATIONS
    res1, res2 <-- opduoseq_while_nestedwhile(nn1 , nn2)=
    PRE nn1 : NAT & nn2 : NAT
    THEN
        res1 := nn1 ||
        IF nn1 > 0 THEN
            res2 := nn2
        ELSE
            res2 := 0
        END
    END
END
