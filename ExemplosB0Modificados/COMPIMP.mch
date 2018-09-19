MACHINE COMPIMP

/*CONCRETE_VARIABLES
    step
INVARIANT
    step : INT
INITIALISATION
    step := 1
*/
OPERATIONS

    res <-- do_int (value)  =
    PRE value : NAT THEN
     res := (value + 1 ) mod 1024
    END



END
