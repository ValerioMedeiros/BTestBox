MACHINE
    TestSet_BRANCH_Example

OPERATIONS
    verdict <-- TEST_0_op1 =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_op1 =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END