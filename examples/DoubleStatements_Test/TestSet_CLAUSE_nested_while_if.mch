MACHINE
    TestSet_CLAUSE_nested_while_if

OPERATIONS
    verdict <-- TEST_0_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_3_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_4_opnested_while_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END