/* MchIncludingMchWithSEES
 * Author: Diego Oliveira
 * Creation date: 24/11/2016
 */
MACHINE
    MchIncludingMchWithSEES

INCLUDES
    MchWithSEES
    
SEES
    LockMachine
    
VARIABLES
    lights
    
INVARIANT
    lights : BOOL & (inside = 0 => lights = FALSE) & (inside > 0 => lights = TRUE)
    
INITIALISATION
    lights := FALSE

OPERATIONS
    leavingTheHouse(nn)=
    PRE isOpen = TRUE & nn : NAT & nn <= inside
    THEN
        leaveHouse(nn) || IF inside - nn = 0 THEN lights := FALSE END
    END;
    
    enteringTheHouse(nn)=
    PRE isOpen = TRUE & nn : NAT & nn <= outside 
    THEN
        enterHouse(nn) || IF inside + nn > 0 THEN lights := TRUE END
    END
    
END
