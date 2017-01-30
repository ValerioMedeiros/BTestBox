MACHINE
    TestSet_CLAUSE_MchWithSets

OPERATIONS
    verdict <-- TEST_0_opMchWithSets =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opMchWithSets =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END