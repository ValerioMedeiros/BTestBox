MACHINE
    TestSet_PATH_OC_WHILEAFTER

OPERATIONS
    verdict <-- TEST_0_opOC_WHILEAFTER =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opOC_WHILEAFTER =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END