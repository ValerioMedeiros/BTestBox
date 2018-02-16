#ifndef _MchIncludingMchWithSEES_h
#define _MchIncludingMchWithSEES_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "LockMachine.h"

/* Clause INCLUDES */
#include "MchWithSEES.h"

/* Clause IMPORTS */
#include "MchWithSEES.h"
#define MchIncludingMchWithSEES__OperationForTestGetinsideIMPMchWithSEES MchWithSEES__OperationForTestGetinsideIMPMchWithSEES
#define MchIncludingMchWithSEES__OperationForTestGetoutsideIMPMchWithSEES MchWithSEES__OperationForTestGetoutsideIMPMchWithSEES
#define MchIncludingMchWithSEES__OperationForTestGettotalIMPMchWithSEES MchWithSEES__OperationForTestGettotalIMPMchWithSEES
#define MchIncludingMchWithSEES__SetVariablesForTestMchWithSEES MchWithSEES__SetVariablesForTestMchWithSEES

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void MchIncludingMchWithSEES__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchIncludingMchWithSEES__OperationForTestGetlightsMchIncludingMchWithSEES(bool *GetlightsForTest);
extern void MchIncludingMchWithSEES__OperationForTestGetinsideIMPMchIncludingMchWithSEES(int32_t *GetinsideIMPForTest);
extern void MchIncludingMchWithSEES__SetVariablesForTestMchIncludingMchWithSEES(bool nn1, int32_t nn2);
extern void MchIncludingMchWithSEES__leavingTheHouse(int32_t nn);
extern void MchIncludingMchWithSEES__enteringTheHouse(int32_t nn);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchIncludingMchWithSEES_h */
