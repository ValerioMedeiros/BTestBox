MACHINE
    TestSet_CLAUSE_triseq_while_while_while

OPERATIONS
    verdict <-- TEST_0_optriseq_while_while_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_optriseq_while_while_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END