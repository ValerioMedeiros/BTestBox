#ifndef _TestSet_PATH_LockMachine_h
#define _TestSet_PATH_LockMachine_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "LockMachine.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_PATH_LockMachine__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_PATH_LockMachine__TEST_0_openVault(bool *verdict);
extern void TestSet_PATH_LockMachine__TEST_0_closeVault(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_PATH_LockMachine_h */
