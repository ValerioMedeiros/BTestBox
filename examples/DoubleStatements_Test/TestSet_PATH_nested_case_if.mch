MACHINE
    TestSet_PATH_nested_case_if

OPERATIONS
    verdict <-- TEST_0_opnested_case_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_case_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_case_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END