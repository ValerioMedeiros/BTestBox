/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_CLAUSE_NONDET_MCH_WHILE.h"

/* Clause IMPORTS */
#include "TestSet_CLAUSE_NONDET_MCH_WHILE.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_CLAUSE_NONDET_MCH_WHILE__testopNONDET_MCH_WHILE(bool *verdict);
/* Clause INITIALISATION */
void runTest_CLAUSE_NONDET_MCH_WHILE__INITIALISATION(void)
{
    
    TestSet_CLAUSE_NONDET_MCH_WHILE__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_CLAUSE_NONDET_MCH_WHILE__testopNONDET_MCH_WHILE(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        TestSet_CLAUSE_NONDET_MCH_WHILE__TEST_0_opNONDET_MCH_WHILE(&v0);
        TestSet_CLAUSE_NONDET_MCH_WHILE__TEST_1_opNONDET_MCH_WHILE(&v1);
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

void runTest_CLAUSE_NONDET_MCH_WHILE__testAll(bool *verdict)
{
    {
        bool v0;
        
        runTest_CLAUSE_NONDET_MCH_WHILE__testopNONDET_MCH_WHILE(&v0);
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

