MACHINE
    TestSet_PATH_case

OPERATIONS
    verdict <-- TEST_0_opcase =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opcase =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opcase =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END