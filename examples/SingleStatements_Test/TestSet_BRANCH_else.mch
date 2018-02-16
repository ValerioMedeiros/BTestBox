MACHINE
    TestSet_BRANCH_else

OPERATIONS
    verdict <-- TEST_0_opelse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opelse =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END