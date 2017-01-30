Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(nested_case_case))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(nested_case_case))==(Machine(nested_case_case));
  Level(Machine(nested_case_case))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(nested_case_case)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(nested_case_case))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(nested_case_case))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(nested_case_case))==(?);
  List_Includes(Machine(nested_case_case))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(nested_case_case))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(nested_case_case))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(nested_case_case))==(?);
  Context_List_Variables(Machine(nested_case_case))==(?);
  Abstract_List_Variables(Machine(nested_case_case))==(?);
  Local_List_Variables(Machine(nested_case_case))==(?);
  List_Variables(Machine(nested_case_case))==(?);
  External_List_Variables(Machine(nested_case_case))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(nested_case_case))==(?);
  Abstract_List_VisibleVariables(Machine(nested_case_case))==(?);
  External_List_VisibleVariables(Machine(nested_case_case))==(?);
  Expanded_List_VisibleVariables(Machine(nested_case_case))==(?);
  List_VisibleVariables(Machine(nested_case_case))==(?);
  Internal_List_VisibleVariables(Machine(nested_case_case))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(nested_case_case))==(btrue);
  Gluing_List_Invariant(Machine(nested_case_case))==(btrue);
  Expanded_List_Invariant(Machine(nested_case_case))==(btrue);
  Abstract_List_Invariant(Machine(nested_case_case))==(btrue);
  Context_List_Invariant(Machine(nested_case_case))==(btrue);
  List_Invariant(Machine(nested_case_case))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(nested_case_case))==(btrue);
  Abstract_List_Assertions(Machine(nested_case_case))==(btrue);
  Context_List_Assertions(Machine(nested_case_case))==(btrue);
  List_Assertions(Machine(nested_case_case))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(nested_case_case))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(nested_case_case))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(nested_case_case))==(skip);
  Context_List_Initialisation(Machine(nested_case_case))==(skip);
  List_Initialisation(Machine(nested_case_case))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(nested_case_case))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(nested_case_case))==(btrue);
  List_Constraints(Machine(nested_case_case))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(nested_case_case))==(opnested_case_case);
  List_Operations(Machine(nested_case_case))==(opnested_case_case)
END
&
THEORY ListInputX IS
  List_Input(Machine(nested_case_case),opnested_case_case)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(nested_case_case),opnested_case_case)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(nested_case_case),opnested_case_case)==(res1,res2 <-- opnested_case_case(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(nested_case_case),opnested_case_case)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(nested_case_case),opnested_case_case)==(xx: NAT & yy: NAT | not(xx = 1) & xx = 0 ==> (not(yy = 1) & yy = 0 ==> res1,res2:=xx,yy [] not(yy = 0) & yy = 1 ==> res1,res2:=xx,yy [] not(yy = 0) & not(yy = 1) ==> res1,res2:=xx,yy) [] not(xx = 0) & xx = 1 ==> (not(yy = 1) & yy = 0 ==> res1,res2:=xx,yy [] not(yy = 0) & yy = 1 ==> res1,res2:=xx,yy [] not(yy = 0) & not(yy = 1) ==> res1,res2:=xx,yy) [] not(xx = 0) & not(xx = 1) ==> (not(yy = 1) & yy = 0 ==> res1,res2:=xx,yy [] not(yy = 0) & yy = 1 ==> res1,res2:=xx,yy [] not(yy = 0) & not(yy = 1) ==> res1,res2:=xx,yy));
  List_Substitution(Machine(nested_case_case),opnested_case_case)==(CASE xx OF EITHER 0 THEN CASE yy OF EITHER 0 THEN res1:=xx || res2:=yy OR 1 THEN res1:=xx || res2:=yy ELSE res1:=xx || res2:=yy END END OR 1 THEN CASE yy OF EITHER 0 THEN res1:=xx || res2:=yy OR 1 THEN res1:=xx || res2:=yy ELSE res1:=xx || res2:=yy END END ELSE CASE yy OF EITHER 0 THEN res1:=xx || res2:=yy OR 1 THEN res1:=xx || res2:=yy ELSE res1:=xx || res2:=yy END END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(nested_case_case))==(?);
  Inherited_List_Constants(Machine(nested_case_case))==(?);
  List_Constants(Machine(nested_case_case))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(nested_case_case))==(?);
  Context_List_Defered(Machine(nested_case_case))==(?);
  Context_List_Sets(Machine(nested_case_case))==(?);
  List_Valuable_Sets(Machine(nested_case_case))==(?);
  Inherited_List_Enumerated(Machine(nested_case_case))==(?);
  Inherited_List_Defered(Machine(nested_case_case))==(?);
  Inherited_List_Sets(Machine(nested_case_case))==(?);
  List_Enumerated(Machine(nested_case_case))==(?);
  List_Defered(Machine(nested_case_case))==(?);
  List_Sets(Machine(nested_case_case))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(nested_case_case))==(?);
  Expanded_List_HiddenConstants(Machine(nested_case_case))==(?);
  List_HiddenConstants(Machine(nested_case_case))==(?);
  External_List_HiddenConstants(Machine(nested_case_case))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(nested_case_case))==(btrue);
  Context_List_Properties(Machine(nested_case_case))==(btrue);
  Inherited_List_Properties(Machine(nested_case_case))==(btrue);
  List_Properties(Machine(nested_case_case))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(nested_case_case),opnested_case_case)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(nested_case_case)) == (? | ? | ? | ? | opnested_case_case | ? | ? | ? | nested_case_case);
  List_Of_HiddenCst_Ids(Machine(nested_case_case)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(nested_case_case)) == (?);
  List_Of_VisibleVar_Ids(Machine(nested_case_case)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(nested_case_case)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(nested_case_case)) == (Type(opnested_case_case) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(nested_case_case)) == (Type(opnested_case_case) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
