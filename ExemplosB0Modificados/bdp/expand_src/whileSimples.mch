/* whileSimples
 * Author: diego
 * Creation date: 05/10/2018
 */
MACHINE
    whileSimples

OPERATIONS
    total <-- testSimples ( xx , yy ) =
    PRE xx : NAT & xx > 0 & xx < 5 & yy : NAT & yy > 0 & yy < 5 & total : NAT
    THEN
        total := xx + yy
    END ;

    totales <-- testSimples1 ( xx , yy ) =
    PRE xx : NAT & xx > 0 & xx < 5 & yy : NAT & yy > 0 & yy < 5 & totales : NAT
    THEN
        totales := xx + yy
    END


END
