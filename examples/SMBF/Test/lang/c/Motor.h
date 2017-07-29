#ifndef _Motor_h
#define _Motor_h

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
extern void Motor__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Motor__get_detachment(int32_t inputValue, int32_t *returnValue);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Motor_h */
