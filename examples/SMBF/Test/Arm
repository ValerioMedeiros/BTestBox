MACHINE 
  Arm
INCLUDES 
  Motor
ABSTRACT_VARIABLES
  pos_x
INVARIANT
  pos_x : 0 .. 100 
INITIALISATION
  pos_x := 0
OPERATIONS
  Getpos_xForTest <-- OperationForTestGetpos_xArm = 
    ANY aux WHERE aux : 0..100 THEN Getpos_xForTest := aux END;

  SetVariablesForTestArm(nn1) = 
  PRE nn1 : NAT
  THEN
      skip
  END;

  move =
    ANY xx WHERE
      xx : -100 .. 100 &
      pos_x + xx <= 100 &
      pos_x + xx >= 0
    THEN
      pos_x := pos_x + xx
    END;
    
  wrongMove =
    IF pos_x < 0 THEN
      pos_x := 0
    END
END
