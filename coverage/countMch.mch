/* countMch
 * Author: Diego Oliveira
 * Creation date: 28/11/2016
 */
MACHINE
    countMch

CONSTANTS
    max_count
    
PROPERTIES
    max_count = 10
    
VARIABLES
    count
    
INVARIANT
    count : NAT & count <= max_count
    
INITIALISATION
    count := 0
    
OPERATIONS
    res <-- Inc(nn)=
    PRE nn : NAT & nn >= 1
    THEN
        IF count + nn <= max_count THEN
            res := TRUE || count := count + nn
        ELSE
            res := FALSE
        END
    END;
    
    res <-- Dec(nn)=
    PRE nn : NAT & nn >= 1
    THEN
        IF count - nn >= 0 THEN
            res := TRUE || count := count - nn
        ELSE
            res := FALSE
        END
    END
END