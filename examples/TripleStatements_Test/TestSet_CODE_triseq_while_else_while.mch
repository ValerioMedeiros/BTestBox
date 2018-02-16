MACHINE
    TestSet_CODE_triseq_while_else_while

OPERATIONS
    verdict <-- TEST_0_optriseq_while_else_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_optriseq_while_else_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END