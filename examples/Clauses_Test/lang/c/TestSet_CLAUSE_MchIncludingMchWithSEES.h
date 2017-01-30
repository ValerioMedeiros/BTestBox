#ifndef _TestSet_CLAUSE_MchIncludingMchWithSEES_h
#define _TestSet_CLAUSE_MchIncludingMchWithSEES_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "MchIncludingMchWithSEES.h"
#include "LockMachine.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_CLAUSE_MchIncludingMchWithSEES__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_CLAUSE_MchIncludingMchWithSEES__TEST_0_leavingTheHouse(bool *verdict);
extern void TestSet_CLAUSE_MchIncludingMchWithSEES__TEST_1_leavingTheHouse(bool *verdict);
extern void TestSet_CLAUSE_MchIncludingMchWithSEES__TEST_0_enteringTheHouse(bool *verdict);
extern void TestSet_CLAUSE_MchIncludingMchWithSEES__TEST_1_enteringTheHouse(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_CLAUSE_MchIncludingMchWithSEES_h */
