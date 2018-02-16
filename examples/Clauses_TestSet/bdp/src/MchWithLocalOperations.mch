/* MchWithLocalOperations
 * Author: Diego Oliveira
 * Creation date: 17/11/2016
 */
MACHINE
    MchWithLocalOperations

OPERATIONS
    res <-- opMchWithLocalOperations ( nn1 , nn2 ) =
    PRE nn1 : NAT & nn2 : NAT
    THEN
        IF nn1 > nn2 THEN
            res := nn1
        ELSE
            res := nn2
        END
    END
END
