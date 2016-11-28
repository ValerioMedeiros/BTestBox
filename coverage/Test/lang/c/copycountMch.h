#ifndef _copycountMch_h
#define _copycountMch_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define copycountMch__max_count 10
/* Array and record constants */

extern void copycountMch__INITIALISATION(void);

/* Clause OPERATIONS */

extern void copycountMch__OperationForTestGetcountcountMch(int32_t *GetcountForTest);
extern void copycountMch__SetVariablesForTestcountMch(int32_t nn1);
extern void copycountMch__Inc(int32_t nn, bool *res);
extern void copycountMch__Dec(int32_t nn, bool *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _copycountMch_h */
