MACHINE
    TestSet_PATH_MchWithCConstants

OPERATIONS
    verdict <-- TEST_0_opMchWithCConstants =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opMchWithCConstants =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END