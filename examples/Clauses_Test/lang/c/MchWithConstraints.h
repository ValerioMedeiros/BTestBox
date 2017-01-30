#ifndef _MchWithConstraints_h
#define _MchWithConstraints_h

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
extern void MchWithConstraints__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithConstraints__opMchWithConstraints(int32_t nn, bool *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithConstraints_h */
