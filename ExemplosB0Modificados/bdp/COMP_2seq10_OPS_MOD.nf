Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(COMP_2seq10_OPS_MOD))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(COMP_2seq10_OPS_MOD))==(Machine(COMP_2seq10_OPS_MOD));
  Level(Machine(COMP_2seq10_OPS_MOD))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(COMP_2seq10_OPS_MOD)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_Includes(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(COMP_2seq10_OPS_MOD))==(?);
  Context_List_Variables(Machine(COMP_2seq10_OPS_MOD))==(?);
  Abstract_List_Variables(Machine(COMP_2seq10_OPS_MOD))==(?);
  Local_List_Variables(Machine(COMP_2seq10_OPS_MOD))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  List_Variables(Machine(COMP_2seq10_OPS_MOD))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  External_List_Variables(Machine(COMP_2seq10_OPS_MOD))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(COMP_2seq10_OPS_MOD))==(?);
  Abstract_List_VisibleVariables(Machine(COMP_2seq10_OPS_MOD))==(?);
  External_List_VisibleVariables(Machine(COMP_2seq10_OPS_MOD))==(?);
  Expanded_List_VisibleVariables(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_VisibleVariables(Machine(COMP_2seq10_OPS_MOD))==(?);
  Internal_List_VisibleVariables(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Gluing_List_Invariant(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Expanded_List_Invariant(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Abstract_List_Invariant(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Context_List_Invariant(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  List_Invariant(Machine(COMP_2seq10_OPS_MOD))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Abstract_List_Assertions(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Context_List_Assertions(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  List_Assertions(Machine(COMP_2seq10_OPS_MOD))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(COMP_2seq10_OPS_MOD))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(COMP_2seq10_OPS_MOD))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(COMP_2seq10_OPS_MOD))==(counter,max_counter,cond1,check_boolexp,check_BLOCK,check_BECOME,check_IF,check_CASE,check_SEQUENCE,check_WHILE,check_OPER_CALL:=1,1024,TRUE,TRUE,0,0,0,0,0,0,0);
  Context_List_Initialisation(Machine(COMP_2seq10_OPS_MOD))==(skip);
  List_Initialisation(Machine(COMP_2seq10_OPS_MOD))==(counter:=1 || max_counter:=1024 || cond1:=TRUE || check_boolexp:=TRUE || check_BLOCK:=0 || check_BECOME:=0 || check_IF:=0 || check_CASE:=0 || check_SEQUENCE:=0 || check_WHILE:=0 || check_OPER_CALL:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  List_Constraints(Machine(COMP_2seq10_OPS_MOD))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(COMP_2seq10_OPS_MOD))==(ID00000,ID00001,ID00002);
  List_Operations(Machine(COMP_2seq10_OPS_MOD))==(ID00000,ID00001,ID00002)
END
&
THEORY ListInputX IS
  List_Input(Machine(COMP_2seq10_OPS_MOD),ID00000)==(?);
  List_Input(Machine(COMP_2seq10_OPS_MOD),ID00001)==(?);
  List_Input(Machine(COMP_2seq10_OPS_MOD),ID00002)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(COMP_2seq10_OPS_MOD),ID00000)==(?);
  List_Output(Machine(COMP_2seq10_OPS_MOD),ID00001)==(?);
  List_Output(Machine(COMP_2seq10_OPS_MOD),ID00002)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(COMP_2seq10_OPS_MOD),ID00000)==(ID00000);
  List_Header(Machine(COMP_2seq10_OPS_MOD),ID00001)==(ID00001);
  List_Header(Machine(COMP_2seq10_OPS_MOD),ID00002)==(ID00002)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(COMP_2seq10_OPS_MOD),ID00000)==(btrue);
  List_Precondition(Machine(COMP_2seq10_OPS_MOD),ID00001)==(btrue);
  List_Precondition(Machine(COMP_2seq10_OPS_MOD),ID00002)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(COMP_2seq10_OPS_MOD),ID00002)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_2seq10_OPS_MOD),ID00001)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_2seq10_OPS_MOD),ID00000)==(btrue | skip);
  List_Substitution(Machine(COMP_2seq10_OPS_MOD),ID00000)==(skip);
  List_Substitution(Machine(COMP_2seq10_OPS_MOD),ID00001)==(skip);
  List_Substitution(Machine(COMP_2seq10_OPS_MOD),ID00002)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(COMP_2seq10_OPS_MOD))==(?);
  Inherited_List_Constants(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_Constants(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(COMP_2seq10_OPS_MOD))==(?);
  Context_List_Defered(Machine(COMP_2seq10_OPS_MOD))==(?);
  Context_List_Sets(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_Valuable_Sets(Machine(COMP_2seq10_OPS_MOD))==(?);
  Inherited_List_Enumerated(Machine(COMP_2seq10_OPS_MOD))==(?);
  Inherited_List_Defered(Machine(COMP_2seq10_OPS_MOD))==(?);
  Inherited_List_Sets(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_Enumerated(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_Defered(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_Sets(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(COMP_2seq10_OPS_MOD))==(?);
  Expanded_List_HiddenConstants(Machine(COMP_2seq10_OPS_MOD))==(?);
  List_HiddenConstants(Machine(COMP_2seq10_OPS_MOD))==(?);
  External_List_HiddenConstants(Machine(COMP_2seq10_OPS_MOD))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Context_List_Properties(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  Inherited_List_Properties(Machine(COMP_2seq10_OPS_MOD))==(btrue);
  List_Properties(Machine(COMP_2seq10_OPS_MOD))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(COMP_2seq10_OPS_MOD),ID00000)==(?);
  List_ANY_Var(Machine(COMP_2seq10_OPS_MOD),ID00001)==(?);
  List_ANY_Var(Machine(COMP_2seq10_OPS_MOD),ID00002)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(COMP_2seq10_OPS_MOD)) == (? | ? | check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter | ? | ID00000,ID00001,ID00002 | ? | ? | ? | COMP_2seq10_OPS_MOD);
  List_Of_HiddenCst_Ids(Machine(COMP_2seq10_OPS_MOD)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(COMP_2seq10_OPS_MOD)) == (?);
  List_Of_VisibleVar_Ids(Machine(COMP_2seq10_OPS_MOD)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(COMP_2seq10_OPS_MOD)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(COMP_2seq10_OPS_MOD)) == (Type(check_OPER_CALL) == Mvl(btype(INTEGER,?,?));Type(check_WHILE) == Mvl(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvl(btype(INTEGER,?,?));Type(check_CASE) == Mvl(btype(INTEGER,?,?));Type(check_IF) == Mvl(btype(INTEGER,?,?));Type(check_BECOME) == Mvl(btype(INTEGER,?,?));Type(check_BLOCK) == Mvl(btype(INTEGER,?,?));Type(check_boolexp) == Mvl(btype(BOOL,?,?));Type(cond1) == Mvl(btype(BOOL,?,?));Type(max_counter) == Mvl(btype(INTEGER,?,?));Type(counter) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(COMP_2seq10_OPS_MOD)) == (Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type));
  Observers(Machine(COMP_2seq10_OPS_MOD)) == (Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type))
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
)
