#ifndef _MchToExtend_h
#define _MchToExtend_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */

extern int32_t MchToExtend__count;

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void MchToExtend__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchToExtend__OperationForTestGetcountMchToExtend(int32_t *GetcountForTest);
extern void MchToExtend__SetVariablesForTestMchToExtend(int32_t nn1);
extern void MchToExtend__Inc(int32_t nn);
extern void MchToExtend__Dec(int32_t nn);
extern void MchToExtend__RandomInc(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchToExtend_h */
