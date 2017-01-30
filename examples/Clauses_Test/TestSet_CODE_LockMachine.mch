MACHINE
    TestSet_CODE_LockMachine

OPERATIONS
    verdict <-- TEST_0_openVault =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_0_closeVault =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END