MACHINE
    TestSet_CLAUSE_MchToExtend

OPERATIONS
    verdict <-- TEST_0_Inc =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_Dec =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_RandomInc =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END