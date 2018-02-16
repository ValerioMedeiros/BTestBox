/* WARNING if type checker is not performed, translation could contain errors ! */

#include "NONDET_MCH_WHILE.h"

/* Clause IMPORTS */
#include "DET_MCH_WHILE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void NONDET_MCH_WHILE__INITIALISATION(void)
{
    
    DET_MCH_WHILE__INITIALISATION();
}

/* Clause OPERATIONS */

void NONDET_MCH_WHILE__opNONDET_MCH_WHILE(int32_t xx, int32_t *res)
{
    {
        int32_t ii;
        
        ii = 0;
        (*res) = ii;
        while((ii) < (xx))
        {
            DET_MCH_WHILE__opDET_MCH_WHILE(xx, res);
            ii = ii+1;
        }
    }
}

