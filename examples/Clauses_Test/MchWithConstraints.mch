/* MchWithConstraints
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    MchWithConstraints(max_count)

CONSTRAINTS
    max_count : NAT
    
OPERATIONS
    res <-- opMchWithConstraints(nn)=
    PRE nn : NAT
    THEN
        IF nn < max_count THEN
            res := TRUE
        ELSE
            res := FALSE
        END
    END
END
