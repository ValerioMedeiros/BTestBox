#include <stdio.h>
#include <stdlib.h>

#include "runTest_BRANCH_Arm.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_BRANCH_Arm__testAll(&result);
    if (result == true){
        printf("The translation of the implementation Arm_i is well performed and achieved Branch Coverage");
    }
    else{
        printf("The translation of the implementation Arm_i is NOT well performed");    
    }
    return 0;
}