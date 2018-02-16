#ifndef _MchWithSets_h
#define _MchWithSets_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    MchWithSets__Okay,
    MchWithSets__Out_of_Range
    
} MchWithSets__answer;
#define MchWithSets__answer__max 2

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define MchWithSets__max_count 10
/* Array and record constants */

extern void MchWithSets__INITIALISATION(void);

/* Clause OPERATIONS */

extern void MchWithSets__opMchWithSets(int32_t nn, MchWithSets__answer *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _MchWithSets_h */
