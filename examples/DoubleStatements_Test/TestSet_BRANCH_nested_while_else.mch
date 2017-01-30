MACHINE
    TestSet_BRANCH_nested_while_else

OPERATIONS
    verdict <-- TEST_0_opnested_while_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_while_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END