#ifndef _TestSet_BRANCH_Arm_h
#define _TestSet_BRANCH_Arm_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "Arm.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void TestSet_BRANCH_Arm__INITIALISATION(void);

/* Clause OPERATIONS */

extern void TestSet_BRANCH_Arm__TEST_0_move(bool *verdict);
extern void TestSet_BRANCH_Arm__TEST_1_move(bool *verdict);
extern void TestSet_BRANCH_Arm__TEST_0_wrongMove(bool *verdict);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _TestSet_BRANCH_Arm_h */
