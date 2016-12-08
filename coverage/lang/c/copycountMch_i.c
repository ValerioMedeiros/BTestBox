/* WARNING if type checker is not performed, translation could contain errors ! */

#include "copycountMch.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

#define copycountMch__max_count 10
/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t copycountMch__count;
/* Clause INITIALISATION */
void copycountMch__INITIALISATION(void)
{
    
    copycountMch__count = 0;
}

/* Clause OPERATIONS */

void copycountMch__OperationForTestGetcountcountMch(int32_t *GetcountForTest)
{
    (*GetcountForTest) = copycountMch__count;
}

void copycountMch__SetVariablesForTestcountMch(int32_t nn1)
{
    copycountMch__count = nn1;
}

void copycountMch__Inc(int32_t nn, bool *res)
{
    {
        int32_t aux;
        
        aux = copycountMch__count+nn;
        if((aux) <= (copycountMch__max_count))
        {
            (*res) = true;
            copycountMch__count = copycountMch__count+nn;
        }
        else
        {
            (*res) = false;
        }
    }
}

void copycountMch__Dec(int32_t nn, bool *res)
{
    {
        int32_t aux;
        
        aux = copycountMch__count-nn;
        if((aux) >= (0))
        {
            (*res) = true;
            copycountMch__count = copycountMch__count-nn;
        }
        else
        {
            (*res) = false;
        }
    }
}

