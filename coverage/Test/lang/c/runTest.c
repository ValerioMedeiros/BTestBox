#include <stdio.h>
#include <stdlib.h>

#include "TestSet_countMch.h"

int main(int argc, char **argv)
{
    int aux;
    bool result0, result1, result2, result3;
    TestSet_countMch__TEST_0_Inc(&result0);
    TestSet_countMch__TEST_1_Inc(&result1);
    TestSet_countMch__TEST_0_Dec(&result2);
    TestSet_countMch__TEST_1_Dec(&result3);
    if (result0 == true && result1 == true && result2 == true && result3 == true){
        printf("The translation of the implementation countMch_i achieved Path Coverage");
    }
    else{
        printf("The translation of the implementation countMch_i NOT achieved Path Coverage");
    }
    printf("\nPress enter to quit");
    scanf("%d", &aux);
    return 0;
}