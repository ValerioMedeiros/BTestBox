/* WARNING if type checker is not performed, translation could contain errors ! */

#include "NONDET_MCH_WHILE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void NONDET_MCH_WHILE__INITIALISATION(void)
{
    
}

/* Clause OPERATIONS */

void NONDET_MCH_WHILE__opNONDET_MCH_WHILE(int32_t xx, int32_t *res)
{
    {
        int32_t ii;
        
        ii = 0;
        (*res) = 0;
        while((ii) < (xx))
        {
            ii = ii+1;
        }
        (*res) = ii;
    }
}

