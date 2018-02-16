MACHINE
    TestSet_BRANCH_triple_else_while_while

OPERATIONS
    verdict <-- TEST_0_optriple_else_while_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_optriple_else_while_while =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END