/* WARNING if type checker is not performed, translation could contain errors ! */

#include "NONDET_MCH_CASE.h"

/* Clause IMPORTS */
#include "DET_MCH_CASE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void NONDET_MCH_CASE__INITIALISATION(void)
{
    
    DET_MCH_CASE__INITIALISATION();
}

/* Clause OPERATIONS */

void NONDET_MCH_CASE__opNONDET_MCH_CASE(int32_t xx, int32_t *res)
{
    switch(xx)
    {
        case 0 : {
            
            DET_MCH_CASE__opDET_MCH_CASE(xx, res);
            break;
        }
        case 1 : {
            
            DET_MCH_CASE__opDET_MCH_CASE(xx, res);
            break;
        }
        default : {
            
            DET_MCH_CASE__opDET_MCH_CASE(xx, res);
            break;
        }
    }
}

