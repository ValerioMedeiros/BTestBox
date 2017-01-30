MACHINE
    TestSet_PATH_nested_else_else

OPERATIONS
    verdict <-- TEST_0_opnested_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_3_opnested_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END