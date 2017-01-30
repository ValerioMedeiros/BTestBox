/* WARNING if type checker is not performed, translation could contain errors ! */

#include "TestSet_CODE_NONDET_MCH_WHILE.h"

/* Clause IMPORTS */
#include "NONDET_MCH_WHILE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void TestSet_CODE_NONDET_MCH_WHILE__INITIALISATION(void)
{
    
    NONDET_MCH_WHILE__INITIALISATION();
}

/* Clause OPERATIONS */

void TestSet_CODE_NONDET_MCH_WHILE__TEST_0_opNONDET_MCH_WHILE(bool *verdict)
{
    {
        int32_t aux1;
        
        NONDET_MCH_WHILE__opNONDET_MCH_WHILE(1, &aux1);
        if(aux1 == 1)
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

