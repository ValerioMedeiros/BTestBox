#ifndef _TestSet_BRANCH_OC_IFELSE_h
#define _TestSet_BRANCH_OC_IFELSE_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "OC_IFELSE.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_BRANCH_OC_IFELSE__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_BRANCH_OC_IFELSE__TEST_0_opOC_IFELSE(bool *verdict);
extern void TestSet_BRANCH_OC_IFELSE__TEST_1_opOC_IFELSE(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_BRANCH_OC_IFELSE_h */
