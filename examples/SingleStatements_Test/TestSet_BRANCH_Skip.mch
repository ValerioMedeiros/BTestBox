MACHINE
    TestSet_BRANCH_Skip

OPERATIONS
    verdict <-- TEST_0_opskip =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END