/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Motor.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void Motor__INITIALISATION(void)
{
    
}

/* Clause OPERATIONS */

void Motor__get_detachment(int32_t inputValue, int32_t *returnValue)
{
    {
        int32_t aux;
        
        aux = inputValue % 2;
        if(aux == 0)
        {
            (*returnValue) = 3;
        }
        else
        {
            if((inputValue) > (97))
            {
                (*returnValue) = 1;
            }
            else
            {
                (*returnValue) = -1;
            }
        }
    }
}

