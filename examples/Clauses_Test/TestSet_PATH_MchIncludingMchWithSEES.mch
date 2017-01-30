MACHINE
    TestSet_PATH_MchIncludingMchWithSEES

OPERATIONS
    verdict <-- TEST_0_leavingTheHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_leavingTheHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_enteringTheHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_enteringTheHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END