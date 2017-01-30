MACHINE
    TestSet_PATH_OC_WHILE_CHOICE

OPERATIONS
    verdict <-- TEST_0_opOC_WHILE_CHOICE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opOC_WHILE_CHOICE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END