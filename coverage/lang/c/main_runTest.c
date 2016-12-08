#include <stdio.h>
#include <stdlib.h>

#include "runTest_countMch.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_countMch__testAll(&result);
    if (result == true){
        printf("The translation of the implementation countMch_i achieved Code Coverage");
    }
    else{
        printf("The translation of the implementation countMch_i NOT achieved Code Coverage");
    }
    return 0;
}