MACHINE
    TestSet_BRANCH_OC_IFELSE

OPERATIONS
    verdict <-- TEST_0_opOC_IFELSE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opOC_IFELSE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END