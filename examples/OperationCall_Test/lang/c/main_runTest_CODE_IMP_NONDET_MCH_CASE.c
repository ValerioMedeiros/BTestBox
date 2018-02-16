#include <stdio.h>
#include <stdlib.h>

#include "runTest_CODE_NONDET_MCH_CASE.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_CODE_NONDET_MCH_CASE__testAll(&result);
    if (result == true){
        printf("The translation of the implementation IMP_NONDET_MCH_CASE is well performed and achievedCode Coverage");
    }
    else{
        printf("The translation of the implementation IMP_NONDET_MCH_CASE is NOT well performed");    
    }
    return 0;
}