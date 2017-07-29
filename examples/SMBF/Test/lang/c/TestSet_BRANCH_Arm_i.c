/* WARNING if type checker is not performed, translation could contain errors ! */

#include "TestSet_BRANCH_Arm.h"

/* Clause IMPORTS */
#include "Arm.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void TestSet_BRANCH_Arm__INITIALISATION(void)
{
    
    Arm__INITIALISATION();
}

/* Clause OPERATIONS */

void TestSet_BRANCH_Arm__TEST_0_move(bool *verdict)
{
    Arm__SetVariablesForTestArm(1);
    {
        int32_t aux1;
        
        Arm__move();
        Arm__OperationForTestGetpos_xArm(&aux1);
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

void TestSet_BRANCH_Arm__TEST_1_move(bool *verdict)
{
    Arm__SetVariablesForTestArm(100);
    {
        int32_t aux1;
        
        Arm__move();
        Arm__OperationForTestGetpos_xArm(&aux1);
        if(aux1 == 100)
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void TestSet_BRANCH_Arm__TEST_2_move(bool *verdict)
{
    Arm__SetVariablesForTestArm(0);
    {
        int32_t aux1;
        
        Arm__move();
        Arm__OperationForTestGetpos_xArm(&aux1);
        if(aux1 == 3)
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void TestSet_BRANCH_Arm__TEST_0_wrongMove(bool *verdict)
{
    Arm__SetVariablesForTestArm(0);
    {
        int32_t aux1;
        
        Arm__wrongMove();
        Arm__OperationForTestGetpos_xArm(&aux1);
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

