/* WARNING if type checker is not performed, translation could contain errors ! */

#include "TestSet_CLAUSE_NONDET_MCH_ELSE.h"

/* Clause IMPORTS */
#include "NONDET_MCH_ELSE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void TestSet_CLAUSE_NONDET_MCH_ELSE__INITIALISATION(void)
{
    
    NONDET_MCH_ELSE__INITIALISATION();
}

/* Clause OPERATIONS */

void TestSet_CLAUSE_NONDET_MCH_ELSE__TEST_0_opNONDET_MCH_ELSE(bool *verdict)
{
    {
        int32_t aux1;
        
        NONDET_MCH_ELSE__opNONDET_MCH_ELSE(1, 0, &aux1);
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

void TestSet_CLAUSE_NONDET_MCH_ELSE__TEST_1_opNONDET_MCH_ELSE(bool *verdict)
{
    {
        int32_t aux1;
        
        NONDET_MCH_ELSE__opNONDET_MCH_ELSE(0, 0, &aux1);
        if(aux1 == 0)
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

