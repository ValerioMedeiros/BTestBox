#ifndef _Arm_h
#define _Arm_h

#include <stdint.h>
#include <stdbool.h>
/* Clause INCLUDES */
#include "Motor.h"

/* Clause IMPORTS */
#include "Motor.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Arm__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Arm__OperationForTestGetpos_xArm(int32_t *Getpos_xForTest);
extern void Arm__SetVariablesForTestArm(int32_t nn1);
extern void Arm__move(void);
extern void Arm__wrongMove(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Arm_h */
