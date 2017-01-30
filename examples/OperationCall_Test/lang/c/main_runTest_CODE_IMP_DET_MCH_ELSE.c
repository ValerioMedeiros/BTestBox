#include <stdio.h>
#include <stdlib.h>

#include "runTest_CODE_DET_MCH_ELSE.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_CODE_DET_MCH_ELSE__testAll(&result);
    if (result == true){
        printf("The translation of the implementation IMP_DET_MCH_ELSE is well performed and achievedCode Coverage");
    }
    else{
        printf("The translation of the implementation IMP_DET_MCH_ELSE is NOT well performed");    
    }
    return 0;
}