/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Arm.h"

/* Clause IMPORTS */
#include "Motor.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Arm__pos_x;
/* Clause INITIALISATION */
void Arm__INITIALISATION(void)
{
    
    Motor__INITIALISATION();
    Arm__pos_x = 0;
}

/* Clause OPERATIONS */

void Arm__OperationForTestGetpos_xArm(int32_t *Getpos_xForTest)
{
    (*Getpos_xForTest) = Arm__pos_x;
}

void Arm__SetVariablesForTestArm(int32_t nn1)
{
    Arm__pos_x = nn1;
}

void Arm__move(void)
{
    int32_t xx;
    int32_t aux2;
    
    aux2 = Arm__pos_x % 2;
    if(aux2 == 0)
    {
        xx = 3;
    }
    else
    {
        if((Arm__pos_x) > (97))
        {
            xx = 1;
        }
        else
        {
            xx = -1;
        }
    }
    {
        int32_t aux;
        
        aux = Arm__pos_x+xx;
        if(((aux) <= (100)) &&
        ((aux) >= (0)))
        {
            Arm__pos_x = Arm__pos_x+xx;
        }
    }
}

void Arm__wrongMove(void)
{
    if((Arm__pos_x) < (0))
    {
        Arm__pos_x = 0;
    }
}

