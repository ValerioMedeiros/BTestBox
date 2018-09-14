MACHINE
    TestSet_BRANCH_Arm

OPERATIONS
    verdict <-- TEST_1_move =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;

    verdict <-- TEST_2_move =
        ANY kk WHERE kk : BOOL THEN verdict := kk END;
        
    verdict <-- TEST_1_wrongMove =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END
