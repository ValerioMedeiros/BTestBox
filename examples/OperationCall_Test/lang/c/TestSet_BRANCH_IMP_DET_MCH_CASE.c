/* WARNING if type checker is not performed, translation could contain errors ! */

#include "TestSet_BRANCH_DET_MCH_CASE.h"

/* Clause IMPORTS */
#include "DET_MCH_CASE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void TestSet_BRANCH_DET_MCH_CASE__INITIALISATION(void)
{
    
    DET_MCH_CASE__INITIALISATION();
}

/* Clause OPERATIONS */

void TestSet_BRANCH_DET_MCH_CASE__TEST_0_opDET_MCH_CASE(bool *verdict)
{
    {
        int32_t aux1;
        
        DET_MCH_CASE__opDET_MCH_CASE(2, &aux1);
        if(aux1 == 2)
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void TestSet_BRANCH_DET_MCH_CASE__TEST_1_opDET_MCH_CASE(bool *verdict)
{
    {
        int32_t aux1;
        
        DET_MCH_CASE__opDET_MCH_CASE(0, &aux1);
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

void TestSet_BRANCH_DET_MCH_CASE__TEST_2_opDET_MCH_CASE(bool *verdict)
{
    {
        int32_t aux1;
        
        DET_MCH_CASE__opDET_MCH_CASE(1, &aux1);
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

