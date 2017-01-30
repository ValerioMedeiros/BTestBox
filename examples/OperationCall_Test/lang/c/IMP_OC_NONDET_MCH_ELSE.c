/* WARNING if type checker is not performed, translation could contain errors ! */

#include "NONDET_MCH_ELSE.h"

/* Clause IMPORTS */
#include "DET_MCH_ELSE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void NONDET_MCH_ELSE__INITIALISATION(void)
{
    
    DET_MCH_ELSE__INITIALISATION();
}

/* Clause OPERATIONS */

void NONDET_MCH_ELSE__opNONDET_MCH_ELSE(int32_t xx, int32_t yy, int32_t *res)
{
    if((xx) > (yy))
    {
        DET_MCH_ELSE__opDET_MCH_ELSE(xx, yy, res);
    }
    else
    {
        DET_MCH_ELSE__opDET_MCH_ELSE(xx, yy, res);
    }
}

