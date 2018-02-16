#ifndef _MchWithConstants_h
#define _MchWithConstants_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define MchWithConstants__max_count 10
/* Array and record constants */

extern void MchWithConstants__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithConstants__opMchWithCConstants(int32_t nn, bool *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithConstants_h */
