/* WARNING if type checker is not performed, translation could contain errors ! */

#include "TestSet_countMch.h"

/* Clause IMPORTS */
#include "copycountMch.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void TestSet_countMch__INITIALISATION(void)
{
    
    copycountMch__INITIALISATION();
}

/* Clause OPERATIONS */

void TestSet_countMch__TEST_0_Inc(bool *verdict)
{
    copycountMch__SetVariablesForTestcountMch(0);
    {
        bool aux1;
        int32_t aux2;
        
        copycountMch__Inc(1, &aux1);
        copycountMch__OperationForTestGetcountcountMch(&aux2);
        if((aux1 == true) &&
        (aux2 == 1))
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void TestSet_countMch__TEST_1_Inc(bool *verdict)
{
    copycountMch__SetVariablesForTestcountMch(0);
    {
        bool aux1;
        int32_t aux2;
        
        copycountMch__Inc(11, &aux1);
        copycountMch__OperationForTestGetcountcountMch(&aux2);
        if((aux1 == false) &&
        (aux2 == 0))
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void TestSet_countMch__TEST_0_Dec(bool *verdict)
{
    copycountMch__SetVariablesForTestcountMch(1);
    {
        bool aux1;
        int32_t aux2;
        
        copycountMch__Dec(1, &aux1);
        copycountMch__OperationForTestGetcountcountMch(&aux2);
        if((aux1 == true) &&
        (aux2 == 0))
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

void TestSet_countMch__TEST_1_Dec(bool *verdict)
{
    copycountMch__SetVariablesForTestcountMch(0);
    {
        bool aux1;
        int32_t aux2;
        
        copycountMch__Dec(1, &aux1);
        copycountMch__OperationForTestGetcountcountMch(&aux2);
        if((aux1 == false) &&
        (aux2 == 0))
        {
            (*verdict) = true;
        }
        else
        {
            (*verdict) = false;
        }
    }
}

