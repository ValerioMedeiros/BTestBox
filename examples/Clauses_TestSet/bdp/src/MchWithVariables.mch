/* MchWithVariables
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    MchWithVariables

CONCRETE_CONSTANTS
    max_count

PROPERTIES
    max_count = 10

ABSTRACT_VARIABLES
    count

INVARIANT
    count : NAT & count <= max_count

INITIALISATION
    count := 0

OPERATIONS
    res <-- opIncCount ( nn ) =
    PRE nn : NAT & nn > 0
    THEN
        IF count + nn < max_count THEN
            res := 1 ||
            count := count + nn
        ELSE
            res := 0
        END
    END ;

    res <-- opRelease ( nn ) =
    PRE nn : NAT
    THEN
        IF count - nn < 0 THEN
            res := 0
        ELSE
            res := 1 || count := count - nn
        END
    END ;

    resetCount = count := 0 ;

    res <-- getCount = res := count
END
