/* MchWithSets
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    MchWithSets

SETS
    answer = { Okay , Out_of_Range }

CONCRETE_CONSTANTS
    max_count

PROPERTIES
    max_count = 10

OPERATIONS
    res <-- opMchWithSets ( nn ) =
    PRE nn : NAT
    THEN
        IF nn < max_count THEN
            res := Okay
        ELSE
            res := Out_of_Range
        END
    END
END
