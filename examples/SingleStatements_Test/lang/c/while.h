#ifndef _while_h
#define _while_h

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
extern void while__INITIALISATION(void);

/* Clause OPERATIONS */

extern void while__opwhile(int32_t xx, int32_t *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _while_h */
