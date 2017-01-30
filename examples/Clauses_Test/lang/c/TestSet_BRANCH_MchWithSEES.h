#ifndef _TestSet_BRANCH_MchWithSEES_h
#define _TestSet_BRANCH_MchWithSEES_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "MchWithSEES.h"
#include "LockMachine.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_BRANCH_MchWithSEES__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_BRANCH_MchWithSEES__TEST_0_guestArrived(bool *verdict);
extern void TestSet_BRANCH_MchWithSEES__TEST_0_guestLeaved(bool *verdict);
extern void TestSet_BRANCH_MchWithSEES__TEST_0_enterHouse(bool *verdict);
extern void TestSet_BRANCH_MchWithSEES__TEST_0_leaveHouse(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_BRANCH_MchWithSEES_h */
