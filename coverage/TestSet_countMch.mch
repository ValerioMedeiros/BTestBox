MACHINE
    TestSet_countMch

OPERATIONS
    verdict <-- TEST_0_Inc =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_Inc =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_Dec =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_Dec =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END