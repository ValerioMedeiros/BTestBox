MACHINE
    TestSet_CLAUSE_NONDET_MCH_ELSE

OPERATIONS
    verdict <-- TEST_0_opNONDET_MCH_ELSE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opNONDET_MCH_ELSE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END