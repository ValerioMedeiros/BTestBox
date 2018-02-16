MACHINE
    runTest_PATH_MchWithLocalOperations

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END