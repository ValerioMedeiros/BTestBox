MACHINE
    TestSet_CODE_nested_case_while

OPERATIONS
    verdict <-- TEST_0_opnested_case_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opnested_case_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opnested_case_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END