/* COMP_2seq10_OPS_MOD
 * Author: diego
 * Creation date: 12/03/2019
 */
MACHINE
    COMP_2seq10_OPS_MOD
    
ABSTRACT_VARIABLES counter, max_counter, cond1, check_boolexp, check_BLOCK, check_BECOME, check_IF, check_CASE, check_SEQUENCE, check_WHILE, check_OPER_CALL
INVARIANT counter : NAT & max_counter : NAT& cond1 : BOOL & check_boolexp : BOOL & check_BLOCK: INT &  check_BECOME: INT &  check_IF: INT &  check_CASE: INT &  check_SEQUENCE: INT &  check_WHILE : INT & check_OPER_CALL : INT
INITIALISATION counter:= 1|| max_counter:= 1024|| cond1:=TRUE|| check_boolexp:=TRUE|| check_BLOCK:= 0 ||  check_BECOME:= 0 ||   check_IF:= 0 ||   check_CASE:= 0 ||   check_SEQUENCE:= 0 ||   check_WHILE := 0|| check_OPER_CALL := 0
OPERATIONS
    ID00000=
    BEGIN skip 
    END;
    
    ID00001=
    BEGIN skip 
    END;
    
    ID00002=
    BEGIN skip 
    END
END

