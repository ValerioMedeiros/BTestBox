MACHINE
    runTest_PATH_OC_IFELSE

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END