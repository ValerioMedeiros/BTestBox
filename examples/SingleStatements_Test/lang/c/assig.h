#ifndef _assig_h
#define _assig_h

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
extern void assig__INITIALISATION(void);

/* Clause OPERATIONS */

extern void assig__opassig(int32_t xx, int32_t *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _assig_h */
