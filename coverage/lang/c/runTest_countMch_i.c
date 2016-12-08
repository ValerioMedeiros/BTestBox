/* WARNING if type checker is not performed, translation could contain errors ! */

#include "runTest_countMch.h"

/* Clause IMPORTS */
#include "TestSet_countMch.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void runTest_countMch__testInc(bool *verdict);
static void runTest_countMch__testDec(bool *verdict);
/* Clause INITIALISATION */
void runTest_countMch__INITIALISATION(void)
{
    
    TestSet_countMch__INITIALISATION();
}

/* Clause OPERATIONS */

void runTest_countMch__testInc(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        TestSet_countMch__TEST_0_Inc(&v0);
        TestSet_countMch__TEST_1_Inc(&v1);
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

void runTest_countMch__testDec(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        TestSet_countMch__TEST_0_Dec(&v0);
        TestSet_countMch__TEST_1_Dec(&v1);
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

void runTest_countMch__testAll(bool *verdict)
{
    {
        bool v0;
        bool v1;
        
        runTest_countMch__testInc(&v0);
        runTest_countMch__testDec(&v1);
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

