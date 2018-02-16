MACHINE
    TestSet_CODE_Skip

OPERATIONS
    verdict <-- TEST_0_opskip =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END