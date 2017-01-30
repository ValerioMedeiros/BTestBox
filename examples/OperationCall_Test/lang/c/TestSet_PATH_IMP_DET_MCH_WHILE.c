/* WARNING if type checker is not performed, translation could contain errors ! */

#include "TestSet_PATH_DET_MCH_WHILE.h"

/* Clause IMPORTS */
#include "DET_MCH_WHILE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void TestSet_PATH_DET_MCH_WHILE__INITIALISATION(void)
{
    
    DET_MCH_WHILE__INITIALISATION();
}

/* Clause OPERATIONS */

void TestSet_PATH_DET_MCH_WHILE__TEST_0_opDET_MCH_WHILE(bool *verdict)
{
    {
        int32_t aux1;
        
        DET_MCH_WHILE__opDET_MCH_WHILE(0, &aux1);
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

