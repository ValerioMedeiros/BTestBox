#include <stdio.h>
#include <stdlib.h>

#include "runTest_BRANCH_NONDET_MCH_ELSE.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_BRANCH_NONDET_MCH_ELSE__testAll(&result);
    if (result == true){
        printf("The translation of the implementation IMP_OC_NONDET_MCH_ELSE is well performed and achievedBranch Coverage");
    }
    else{
        printf("The translation of the implementation IMP_OC_NONDET_MCH_ELSE is NOT well performed");    
    }
    return 0;
}