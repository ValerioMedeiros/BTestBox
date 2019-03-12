Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(COMP_2seq10_OPS_IMP))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(COMP_2seq10_OPS_IMP))==(Machine(COMP_2seq10_OPS));
  Level(Implementation(COMP_2seq10_OPS_IMP))==(1);
  Upper_Level(Implementation(COMP_2seq10_OPS_IMP))==(Machine(COMP_2seq10_OPS))
END
&
THEORY LoadedStructureX IS
  Implementation(COMP_2seq10_OPS_IMP)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Inherited_List_Includes(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Context_List_Variables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Abstract_List_Variables(Implementation(COMP_2seq10_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  Local_List_Variables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Variables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  External_List_Variables(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Abstract_List_VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  External_List_VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Expanded_List_VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(max_counter,counter,cond1,check_boolexp,check_WHILE,check_SEQUENCE,check_OPER_CALL,check_IF,check_CASE,check_BLOCK,check_BECOME);
  Internal_List_VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(max_counter,counter,cond1,check_boolexp,check_WHILE,check_SEQUENCE,check_OPER_CALL,check_IF,check_CASE,check_BLOCK,check_BECOME)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  Expanded_List_Invariant(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  Abstract_List_Invariant(Implementation(COMP_2seq10_OPS_IMP))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT);
  Context_List_Invariant(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  List_Invariant(Implementation(COMP_2seq10_OPS_IMP))==(check_BECOME: INT & check_BLOCK: INT & check_CASE: INT & check_IF: INT & check_OPER_CALL: INT & check_SEQUENCE: INT & check_WHILE: INT & check_boolexp: BOOL & cond1: BOOL & counter: INT & max_counter: INT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  Abstract_List_Assertions(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  Context_List_Assertions(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  List_Assertions(Implementation(COMP_2seq10_OPS_IMP))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(COMP_2seq10_OPS_IMP))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(COMP_2seq10_OPS_IMP))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(COMP_2seq10_OPS_IMP))==((1: INT | counter:=1);(1024: INT | max_counter:=1024);cond1:=TRUE;check_boolexp:=TRUE;(0: INT | check_BLOCK:=0);(0: INT | check_BECOME:=0);(0: INT | check_IF:=0);(0: INT | check_CASE:=0);(0: INT | check_SEQUENCE:=0);(0: INT | check_WHILE:=0);(0: INT | check_OPER_CALL:=0));
  Context_List_Initialisation(Implementation(COMP_2seq10_OPS_IMP))==(skip);
  List_Initialisation(Implementation(COMP_2seq10_OPS_IMP))==(counter:=1;max_counter:=1024;cond1:=TRUE;check_boolexp:=TRUE;check_BLOCK:=0;check_BECOME:=0;check_IF:=0;check_CASE:=0;check_SEQUENCE:=0;check_WHILE:=0;check_OPER_CALL:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  List_Context_Constraints(Implementation(COMP_2seq10_OPS_IMP))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(COMP_2seq10_OPS_IMP))==(ID00000,ID00001,ID00002);
  List_Operations(Implementation(COMP_2seq10_OPS_IMP))==(ID00000,ID00001,ID00002)
END
&
THEORY ListInputX IS
  List_Input(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(?);
  List_Input(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(?);
  List_Input(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(?);
  List_Output(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(?);
  List_Output(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(ID00000);
  List_Header(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(ID00001);
  List_Header(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(ID00002)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(btrue);
  List_Precondition(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(btrue);
  Own_Precondition(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(btrue);
  List_Precondition(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(btrue);
  Own_Precondition(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(btrue);
  List_Precondition(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3));check_boolexp:=bool(counter = 0);(counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))));WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);(0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))));check_boolexp:=bool(counter = 0);(counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)));check_boolexp:=bool(counter = 0);(counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)));check_boolexp:=bool(counter = 0);(counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)));(not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));check_boolexp:=bool(counter = 0);(counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(btrue | check_boolexp:=bool(counter = 0);(counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)));(not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));check_boolexp:=bool(counter = 0);(counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)));(not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));check_boolexp:=bool(counter = 0);(counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END)));check_boolexp:=bool(counter = 0);(counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))));WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);check_boolexp:=bool(counter = 0);check_boolexp:=bool(counter = 0);(counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END));WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)));WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);check_boolexp:=bool(counter = 0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  List_Substitution(Implementation(COMP_2seq10_OPS_IMP),ID00000)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSE check_BECOME:=check_BECOME+1 END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);BEGIN check_BLOCK:=check_BLOCK+1 END;check_boolexp:=bool(counter = 0);IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq10_OPS_IMP),ID00001)==(BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSE check_BECOME:=check_BECOME+1 END;CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSE check_BECOME:=check_BECOME+1 END;CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);check_boolexp:=bool(counter = 0);BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq10_OPS_IMP),ID00002)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;check_boolexp:=bool(counter = 0);check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSE check_BECOME:=check_BECOME+1 END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSE check_BECOME:=check_BECOME+1 END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSE check_BECOME:=check_BECOME+1 END;CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END END;BEGIN check_boolexp:=bool(counter = 0) END;IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END;counter:=counter+1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Inherited_List_Constants(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Constants(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Context_List_Defered(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Context_List_Sets(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Own_Enumerated(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Valuable_Sets(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Inherited_List_Enumerated(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Inherited_List_Defered(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Inherited_List_Sets(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Enumerated(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Defered(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_Sets(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(COMP_2seq10_OPS_IMP))==(?);
  Expanded_List_HiddenConstants(Implementation(COMP_2seq10_OPS_IMP))==(?);
  List_HiddenConstants(Implementation(COMP_2seq10_OPS_IMP))==(?);
  External_List_HiddenConstants(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  Context_List_Properties(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  Inherited_List_Properties(Implementation(COMP_2seq10_OPS_IMP))==(btrue);
  List_Properties(Implementation(COMP_2seq10_OPS_IMP))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(COMP_2seq10_OPS_IMP))==(aa: aa);
  List_Values(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(COMP_2seq10_OPS_IMP))==(Type(check_BECOME) == Mvv(btype(INTEGER,?,?));Type(check_BLOCK) == Mvv(btype(INTEGER,?,?));Type(check_CASE) == Mvv(btype(INTEGER,?,?));Type(check_IF) == Mvv(btype(INTEGER,?,?));Type(check_OPER_CALL) == Mvv(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvv(btype(INTEGER,?,?));Type(check_WHILE) == Mvv(btype(INTEGER,?,?));Type(check_boolexp) == Mvv(btype(BOOL,?,?));Type(cond1) == Mvv(btype(BOOL,?,?));Type(counter) == Mvv(btype(INTEGER,?,?));Type(max_counter) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(COMP_2seq10_OPS_IMP))==(Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(COMP_2seq10_OPS_IMP)) == (? | ? | ? | ? | ID00000,ID00001,ID00002 | ? | ? | ? | COMP_2seq10_OPS_IMP);
  List_Of_HiddenCst_Ids(Implementation(COMP_2seq10_OPS_IMP)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(COMP_2seq10_OPS_IMP)) == (?);
  List_Of_VisibleVar_Ids(Implementation(COMP_2seq10_OPS_IMP)) == (max_counter,counter,cond1,check_boolexp,check_WHILE,check_SEQUENCE,check_OPER_CALL,check_IF,check_CASE,check_BLOCK,check_BECOME | ?);
  List_Of_Ids_SeenBNU(Implementation(COMP_2seq10_OPS_IMP)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(COMP_2seq10_OPS_IMP)) == (Type(max_counter) == Mvv(btype(INTEGER,?,?));Type(counter) == Mvv(btype(INTEGER,?,?));Type(cond1) == Mvv(btype(BOOL,?,?));Type(check_boolexp) == Mvv(btype(BOOL,?,?));Type(check_WHILE) == Mvv(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvv(btype(INTEGER,?,?));Type(check_OPER_CALL) == Mvv(btype(INTEGER,?,?));Type(check_IF) == Mvv(btype(INTEGER,?,?));Type(check_CASE) == Mvv(btype(INTEGER,?,?));Type(check_BLOCK) == Mvv(btype(INTEGER,?,?));Type(check_BECOME) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(COMP_2seq10_OPS_IMP))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(COMP_2seq10_OPS_IMP))==(check_BECOME: INTEGER & check_BLOCK: INTEGER & check_CASE: INTEGER & check_IF: INTEGER & check_OPER_CALL: INTEGER & check_SEQUENCE: INTEGER & check_WHILE: INTEGER & check_boolexp: BOOL & cond1: BOOL & counter: INTEGER & max_counter: INTEGER)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
