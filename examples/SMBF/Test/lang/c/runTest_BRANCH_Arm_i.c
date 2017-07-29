/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_BRANCH_Arm.h"

/* Clause IMPORTS */
#include "TestSet_BRANCH_Arm.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_BRANCH_Arm__testmove(bool *verdict);
static void runTest_BRANCH_Arm__testwrongMove(bool *verdict);
/* Clause INITIALISATION */
void runTest_BRANCH_Arm__INITIALISATION(void)
{
    
    TestSet_BRANCH_Arm__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_BRANCH_Arm__testmove(bool *verdict)
{
    {
        bool v0;
        bool v1;
        bool v2;
        
        TestSet_BRANCH_Arm__TEST_0_move(&v0);
        TestSet_BRANCH_Arm__TEST_1_move(&v1);
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

void runTest_BRANCH_Arm__testwrongMove(bool *verdict)
{
    {
        bool v0;
        
        TestSet_BRANCH_Arm__TEST_0_wrongMove(&v0);
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

void runTest_BRANCH_Arm__testAll(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        runTest_BRANCH_Arm__testmove(&v0);
        runTest_BRANCH_Arm__testwrongMove(&v1);
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

