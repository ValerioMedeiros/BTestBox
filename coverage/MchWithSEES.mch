/* MchWithSEES
 * Author: Diego Oliveira
 * Creation date: 23/11/2016
 */
MACHINE
    MchWithSEES

CONSTANTS
    MAX
    
PROPERTIES
    MAX = 5

SEES
    LockMachine
    
VARIABLES
    inside, outside, total
    
INVARIANT
    inside : NAT & inside >= 0 & outside : NAT & outside >= 0 & total : NAT & total = inside + outside & total <= MAX
    
INITIALISATION
    total := 0 || inside := 0 || outside := 0
    
OPERATIONS
    guestArrived(nn) =
    PRE nn : NAT & nn <= MAX - total
    THEN
        total := total + nn || outside := outside + nn
    END;
    
    guestLeaved(nn) =
    PRE nn : NAT & nn <= outside
    THEN
        total := total - nn || outside := outside - nn
    END;
    
    enterHouse(nn) =
    PRE isOpen = TRUE & nn : NAT & nn <= outside 
    THEN
        inside := inside + nn || outside := outside - nn
    END;
    
    leaveHouse(nn) =
    PRE isOpen = TRUE & nn : NAT & nn <= inside
    THEN
        inside := inside - nn || outside := outside + nn
    END
END
