MACHINE
    TestSet_BRANCH_triple_while_else_while

OPERATIONS
    verdict <-- TEST_0_optriple_while_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_optriple_while_else_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END