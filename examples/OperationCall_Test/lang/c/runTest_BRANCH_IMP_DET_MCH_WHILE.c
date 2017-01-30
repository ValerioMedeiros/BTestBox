/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_BRANCH_DET_MCH_WHILE.h"

/* Clause IMPORTS */
#include "TestSet_BRANCH_DET_MCH_WHILE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_BRANCH_DET_MCH_WHILE__testopDET_MCH_WHILE(bool *verdict);
/* Clause INITIALISATION */
void runTest_BRANCH_DET_MCH_WHILE__INITIALISATION(void)
{
    
    TestSet_BRANCH_DET_MCH_WHILE__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_BRANCH_DET_MCH_WHILE__testopDET_MCH_WHILE(bool *verdict)
{
    {
        bool v0;
        
        TestSet_BRANCH_DET_MCH_WHILE__TEST_0_opDET_MCH_WHILE(&v0);
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

void runTest_BRANCH_DET_MCH_WHILE__testAll(bool *verdict)
{
    {
        bool v0;
        
        runTest_BRANCH_DET_MCH_WHILE__testopDET_MCH_WHILE(&v0);
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

