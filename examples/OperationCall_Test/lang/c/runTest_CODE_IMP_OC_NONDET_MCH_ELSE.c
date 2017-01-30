/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_CODE_NONDET_MCH_ELSE.h"

/* Clause IMPORTS */
#include "TestSet_CODE_NONDET_MCH_ELSE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_CODE_NONDET_MCH_ELSE__testopNONDET_MCH_ELSE(bool *verdict);
/* Clause INITIALISATION */
void runTest_CODE_NONDET_MCH_ELSE__INITIALISATION(void)
{
    
    TestSet_CODE_NONDET_MCH_ELSE__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_CODE_NONDET_MCH_ELSE__testopNONDET_MCH_ELSE(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        TestSet_CODE_NONDET_MCH_ELSE__TEST_0_opNONDET_MCH_ELSE(&v0);
        TestSet_CODE_NONDET_MCH_ELSE__TEST_1_opNONDET_MCH_ELSE(&v1);
        if((v0 == true) &&
        (v1 == true))
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void runTest_CODE_NONDET_MCH_ELSE__testAll(bool *verdict)
{
    {
        bool v0;
        
        runTest_CODE_NONDET_MCH_ELSE__testopNONDET_MCH_ELSE(&v0);
        if(v0 == true)
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

