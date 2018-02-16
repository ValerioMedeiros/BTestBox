#ifndef _MchWithLocalOperations_h
#define _MchWithLocalOperations_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void MchWithLocalOperations__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithLocalOperations__opMchWithLocalOperations(int32_t nn1, int32_t nn2, int32_t *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithLocalOperations_h */
