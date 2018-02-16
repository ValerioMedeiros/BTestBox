MACHINE
    runTest_CLAUSE_nested_case_if

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END