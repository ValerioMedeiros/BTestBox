#ifndef _TestSet_BRANCH_MchWithVariables_h
#define _TestSet_BRANCH_MchWithVariables_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "MchWithVariables.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_BRANCH_MchWithVariables__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_BRANCH_MchWithVariables__TEST_0_opIncCount(bool *verdict);
extern void TestSet_BRANCH_MchWithVariables__TEST_1_opIncCount(bool *verdict);
extern void TestSet_BRANCH_MchWithVariables__TEST_0_opRelease(bool *verdict);
extern void TestSet_BRANCH_MchWithVariables__TEST_1_opRelease(bool *verdict);
extern void TestSet_BRANCH_MchWithVariables__TEST_0_resetCount(bool *verdict);
extern void TestSet_BRANCH_MchWithVariables__TEST_0_getCount(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_BRANCH_MchWithVariables_h */
