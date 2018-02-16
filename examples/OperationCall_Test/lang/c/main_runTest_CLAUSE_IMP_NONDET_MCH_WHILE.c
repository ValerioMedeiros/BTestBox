#include <stdio.h>
#include <stdlib.h>

#include "runTest_CLAUSE_NONDET_MCH_WHILE.h"

int main(int argc, char **argv)
{
    bool result;
    runTest_CLAUSE_NONDET_MCH_WHILE__testAll(&result);
    if (result == true){
        printf("The translation of the implementation IMP_NONDET_MCH_WHILE is well performed and achievedClause Coverage");
    }
    else{
        printf("The translation of the implementation IMP_NONDET_MCH_WHILE is NOT well performed");    
    }
    return 0;
}