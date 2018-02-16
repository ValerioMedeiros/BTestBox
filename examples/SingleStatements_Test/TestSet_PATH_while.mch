MACHINE
    TestSet_PATH_while

OPERATIONS
    verdict <-- TEST_0_opwhile =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opwhile =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END