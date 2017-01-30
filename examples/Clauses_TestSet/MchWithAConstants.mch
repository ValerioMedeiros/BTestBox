/* MchWithAConstants
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    MchWithAConstants

ABSTRACT_CONSTANTS
    max_count
    
PROPERTIES
    max_count = 10
    
OPERATIONS
    res <-- opMchWithAConstants(nn) =
    PRE nn : NAT
    THEN
        IF nn < max_count THEN
            res := TRUE
        ELSE
            res := FALSE
        END
    END
END
