/* DET_MCH_WHILE
 * Author: Diego Oliveira
 * Creation date: 10/11/2016
 */
MACHINE
    DET_MCH_WHILE

OPERATIONS
    res <-- opDET_MCH_WHILE ( nn ) =
    PRE nn : NAT
    THEN
        res := nn
    END
END
