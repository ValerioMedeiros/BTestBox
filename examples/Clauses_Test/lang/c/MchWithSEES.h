#ifndef _MchWithSEES_h
#define _MchWithSEES_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "LockMachine.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define MchWithSEES__MAX 5
/* Array and record constants */

extern void MchWithSEES__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithSEES__OperationForTestGetinsideIMPMchWithSEES(int32_t *GetinsideIMPForTest);
extern void MchWithSEES__OperationForTestGetoutsideIMPMchWithSEES(int32_t *GetoutsideIMPForTest);
extern void MchWithSEES__OperationForTestGettotalIMPMchWithSEES(int32_t *GettotalIMPForTest);
extern void MchWithSEES__SetVariablesForTestMchWithSEES(int32_t nn1, int32_t nn2, int32_t nn3);
extern void MchWithSEES__guestArrived(int32_t nn);
extern void MchWithSEES__guestLeaved(int32_t nn);
extern void MchWithSEES__enterHouse(int32_t nn);
extern void MchWithSEES__leaveHouse(int32_t nn);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithSEES_h */
