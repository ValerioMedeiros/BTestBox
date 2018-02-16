/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_CLAUSE_DET_MCH_ELSE.h"

/* Clause IMPORTS */
#include "TestSet_CLAUSE_DET_MCH_ELSE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_CLAUSE_DET_MCH_ELSE__testopDET_MCH_ELSE(bool *verdict);
/* Clause INITIALISATION */
void runTest_CLAUSE_DET_MCH_ELSE__INITIALISATION(void)
{
    
    TestSet_CLAUSE_DET_MCH_ELSE__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_CLAUSE_DET_MCH_ELSE__testopDET_MCH_ELSE(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        TestSet_CLAUSE_DET_MCH_ELSE__TEST_0_opDET_MCH_ELSE(&v0);
        TestSet_CLAUSE_DET_MCH_ELSE__TEST_1_opDET_MCH_ELSE(&v1);
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

void runTest_CLAUSE_DET_MCH_ELSE__testAll(bool *verdict)
{
    {
        bool v0;
        
        runTest_CLAUSE_DET_MCH_ELSE__testopDET_MCH_ELSE(&v0);
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

