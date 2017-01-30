/* MchWithCConstants
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    MchWithCConstants

CONCRETE_CONSTANTS
    max_count
    
PROPERTIES
    max_count = 10
    
OPERATIONS
    res <-- opMchWithCConstants(nn)=
    PRE nn : NAT
    THEN
        IF nn < max_count THEN
            res := TRUE
        ELSE
            res := FALSE
        END
    END
END
