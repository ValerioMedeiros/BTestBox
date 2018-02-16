MACHINE
    TestSet_BRANCH_duoseq_while_else

OPERATIONS
    verdict <-- TEST_0_opduoseq_while_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opduoseq_while_else =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END