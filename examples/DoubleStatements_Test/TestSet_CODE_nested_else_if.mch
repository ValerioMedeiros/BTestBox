MACHINE
    TestSet_CODE_nested_else_if

OPERATIONS
    verdict <-- TEST_0_opnested_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END