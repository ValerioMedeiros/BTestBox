MACHINE
    TestSet_CODE_MchIncludingMchWithSEES

OPERATIONS
    verdict <-- TEST_0_leavingTheHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_enteringTheHouse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END