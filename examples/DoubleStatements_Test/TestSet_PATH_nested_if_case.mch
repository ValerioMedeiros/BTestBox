MACHINE
    TestSet_PATH_nested_if_case

OPERATIONS
    verdict <-- TEST_0_opnested_if_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_if_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_if_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_3_opnested_if_case =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END