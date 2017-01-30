MACHINE
    TestSet_CLAUSE_OC_CASE

OPERATIONS
    verdict <-- TEST_0_opOC_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opOC_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opOC_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END