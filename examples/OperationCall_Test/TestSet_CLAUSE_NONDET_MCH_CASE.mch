MACHINE
    TestSet_CLAUSE_NONDET_MCH_CASE

OPERATIONS
    verdict <-- TEST_0_opNONDET_MCH_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opNONDET_MCH_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opNONDET_MCH_CASE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END