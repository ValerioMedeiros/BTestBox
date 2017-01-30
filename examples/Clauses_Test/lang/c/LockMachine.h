#ifndef _LockMachine_h
#define _LockMachine_h

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
extern void LockMachine__INITIALISATION(void);

/* Clause OPERATIONS */

extern void LockMachine__OperationForTestGetisOpenIMPLockMachine(bool *GetisOpenIMPForTest);
extern void LockMachine__SetVariablesForTestLockMachine(bool nn1);
extern void LockMachine__openVault(void);
extern void LockMachine__closeVault(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _LockMachine_h */
