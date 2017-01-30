MACHINE
    TestSet_CLAUSE_MchWithConstraints

OPERATIONS
    verdict <-- TEST_0_opMchWithConstraints =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opMchWithConstraints =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END