MACHINE
    TestSet_BRANCH_MchWithConstants

OPERATIONS
    verdict <-- TEST_0_opMchWithCConstants =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opMchWithCConstants =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END