/* OC_WHILE_CHOICE
 * Author: Diego Oliveira
 * Creation date: 17/11/2016
 */
MACHINE
    OC_WHILE_CHOICE

OPERATIONS
    res <-- opOC_WHILE_CHOICE(nn)=
    PRE nn : NAT
    THEN
        CHOICE
            res := nn
        OR
            res := 0
        END
    END
    
END
