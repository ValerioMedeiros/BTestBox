/* TestMch
 * Author: Diego Oliveira
 * Creation date: 17/11/2016
 */
MACHINE
    TestMch

OPERATIONS
    verdict <-- test_op_1 = ANY ans WHERE ans : BOOL THEN verdict := ans END

END
