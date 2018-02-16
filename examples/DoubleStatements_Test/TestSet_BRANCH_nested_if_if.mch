MACHINE
    TestSet_BRANCH_nested_if_if

OPERATIONS
    verdict <-- TEST_0_opnested_if_if =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END