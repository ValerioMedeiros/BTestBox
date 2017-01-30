/* MchToBeImported
 * Author: Diego Oliveira
 * Creation date: 17/11/2016
 */
MACHINE
    MchToBeImported

ABSTRACT_VARIABLES
    count

INVARIANT
    count : NAT & count <= 10

INITIALISATION
    count := 0

OPERATIONS
    Inc ( nn ) =
    PRE nn : NAT & count + nn <= 10
    THEN
        count := count + nn
    END ;

    Dec ( nn ) =
    PRE nn : NAT & count - nn >= 0
    THEN
        count := count - nn
    END
END
