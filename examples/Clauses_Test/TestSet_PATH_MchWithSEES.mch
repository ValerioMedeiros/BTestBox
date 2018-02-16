MACHINE
    TestSet_PATH_MchWithSEES

OPERATIONS
    verdict <-- TEST_0_guestArrived =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_guestLeaved =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_enterHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_leaveHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END