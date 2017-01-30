MACHINE
    runTest_PATH_NONDET_MCH_CASE

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END