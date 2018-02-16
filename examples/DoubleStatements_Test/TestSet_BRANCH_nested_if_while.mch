MACHINE
    TestSet_BRANCH_nested_if_while

OPERATIONS
    verdict <-- TEST_0_opnested_if_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_if_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END