#ifndef _MchWithVariables_h
#define _MchWithVariables_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define MchWithVariables__max_count 10
/* Array and record constants */

extern void MchWithVariables__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithVariables__OperationForTestGetcountImpMchWithVariables(int32_t *GetcountImpForTest);
extern void MchWithVariables__SetVariablesForTestMchWithVariables(int32_t nn1);
extern void MchWithVariables__opIncCount(int32_t nn, int32_t *res);
extern void MchWithVariables__opRelease(int32_t nn, int32_t *res);
extern void MchWithVariables__resetCount(void);
extern void MchWithVariables__getCount(int32_t *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithVariables_h */
