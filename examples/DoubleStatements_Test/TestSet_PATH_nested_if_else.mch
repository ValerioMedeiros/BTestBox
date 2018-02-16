MACHINE
    TestSet_PATH_nested_if_else

OPERATIONS
    verdict <-- TEST_0_opnested_if_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_if_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_if_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END