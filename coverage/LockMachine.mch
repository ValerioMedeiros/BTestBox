/* LockMachine
 * Author: Diego Oliveira
 * Creation date: 23/11/2016
 */
MACHINE
    LockMachine

VARIABLES
    isOpen
    
INVARIANT
    isOpen : BOOL
    
INITIALISATION
    isOpen:= FALSE

OPERATIONS
    openVault =
    PRE isOpen= FALSE
    THEN
        isOpen:= TRUE
    END;
    
    closeVault = 
    PRE isOpen= TRUE
    THEN
        isOpen:= FALSE
    END

END