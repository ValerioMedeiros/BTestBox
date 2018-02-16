/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_BRANCH_DET_MCH_CASE.h"

/* Clause IMPORTS */
#include "TestSet_BRANCH_DET_MCH_CASE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_BRANCH_DET_MCH_CASE__testopDET_MCH_CASE(bool *verdict);
/* Clause INITIALISATION */
void runTest_BRANCH_DET_MCH_CASE__INITIALISATION(void)
{
    
    TestSet_BRANCH_DET_MCH_CASE__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_BRANCH_DET_MCH_CASE__testopDET_MCH_CASE(bool *verdict)
{
    {
        bool v0;
        bool v1;
        bool v2;
        
        TestSet_BRANCH_DET_MCH_CASE__TEST_0_opDET_MCH_CASE(&v0);
        TestSet_BRANCH_DET_MCH_CASE__TEST_1_opDET_MCH_CASE(&v1);
        TestSet_BRANCH_DET_MCH_CASE__TEST_2_opDET_MCH_CASE(&v2);
        if(((v0 == true) &&
            (v1 == true)) &&
        (v2 == true))
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void runTest_BRANCH_DET_MCH_CASE__testAll(bool *verdict)
{
    {
        bool v0;
        
        runTest_BRANCH_DET_MCH_CASE__testopDET_MCH_CASE(&v0);
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

