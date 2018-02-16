#ifndef _MchWithCConstants_h
#define _MchWithCConstants_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* TO DO: #define MchWithCConstants__max_count */
/* Array and record constants */

extern void MchWithCConstants__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithCConstants__opMchWithCConstants(int32_t nn, bool *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithCConstants_h */
