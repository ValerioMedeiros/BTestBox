MACHINE
    TestSet_CLAUSE_nested_if_if

OPERATIONS
    verdict <-- TEST_0_opnested_if_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_if_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_if_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_3_opnested_if_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END