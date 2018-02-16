#include <stdio.h>
#include <stdlib.h>

#include "runTest_CODE_NONDET_MCH_WHILE.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_CODE_NONDET_MCH_WHILE__testAll(&result);
    if (result == true){
        printf("The translation of the implementation IMP_OC_NONDET_MCH_WHILEINSIDE is well performed and achievedCode Coverage");
    }
    else{
        printf("The translation of the implementation IMP_OC_NONDET_MCH_WHILEINSIDE is NOT well performed");    
    }
    return 0;
}