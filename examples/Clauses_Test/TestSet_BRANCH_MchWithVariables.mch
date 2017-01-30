MACHINE
    TestSet_BRANCH_MchWithVariables

OPERATIONS
    verdict <-- TEST_0_opIncCount =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opIncCount =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_opRelease =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opRelease =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_resetCount =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_getCount =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END