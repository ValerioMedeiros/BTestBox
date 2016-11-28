#ifndef _TestSet_countMch_h
#define _TestSet_countMch_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "copycountMch.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_countMch__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_countMch__TEST_0_Inc(bool *verdict);
extern void TestSet_countMch__TEST_1_Inc(bool *verdict);
extern void TestSet_countMch__TEST_0_Dec(bool *verdict);
extern void TestSet_countMch__TEST_1_Dec(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_countMch_h */
