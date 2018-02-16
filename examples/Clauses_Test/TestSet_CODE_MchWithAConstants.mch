MACHINE
    TestSet_CODE_MchWithAConstants

OPERATIONS
    verdict <-- TEST_0_opMchWithAConstants =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opMchWithAConstants =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END