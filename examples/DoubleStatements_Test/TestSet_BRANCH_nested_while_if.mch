MACHINE
    TestSet_BRANCH_nested_while_if

OPERATIONS
    verdict <-- TEST_0_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END