MACHINE
    TestSet_BRANCH_nested_while_case

OPERATIONS
    verdict <-- TEST_0_opnested_while_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_while_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_while_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END