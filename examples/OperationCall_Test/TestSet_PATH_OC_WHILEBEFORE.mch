MACHINE
    TestSet_PATH_OC_WHILEBEFORE

OPERATIONS
    verdict <-- TEST_0_opOC_WHILEBEFORE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_1_opOC_WHILEBEFORE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_opOC_WHILEBEFORE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_3_opOC_WHILEBEFORE =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END