/* MchToExtend
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    MchToExtend

CONCRETE_VARIABLES
    count

INVARIANT
    count : NAT

INITIALISATION
    count := 0

OPERATIONS
    Inc ( nn ) =
    PRE nn : NAT & count + nn < 50
    THEN
        count := count + nn
    END ;

    Dec ( nn ) =
    PRE nn : NAT & count - nn >= 0
    THEN
        count := count - nn
    END ;

    RandomInc = ANY nn WHERE nn : 0 .. ( 50 - count ) THEN count := count + nn END

END
