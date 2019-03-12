/* whileSimplesUnico
 * Author: diego
 * Creation date: 05/10/2018
 */
MACHINE
    whileSimplesUnico

OPERATIONS
    total <-- testSimples ( xx , yy ) =
    PRE xx : NAT & xx > 0 & xx < 5 & yy : NAT & yy > 0 & yy < 5 & total : NAT
    THEN
        total := xx + yy
    END
END
