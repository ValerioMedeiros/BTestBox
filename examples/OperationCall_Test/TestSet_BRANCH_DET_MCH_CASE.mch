MACHINE
    TestSet_BRANCH_DET_MCH_CASE

OPERATIONS
    verdict <-- TEST_0_opDET_MCH_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opDET_MCH_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opDET_MCH_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END