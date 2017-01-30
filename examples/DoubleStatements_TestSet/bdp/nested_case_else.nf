Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(nested_case_else))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(nested_case_else))==(Machine(nested_case_else));
  Level(Machine(nested_case_else))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(nested_case_else)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(nested_case_else))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(nested_case_else))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(nested_case_else))==(?);
  List_Includes(Machine(nested_case_else))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(nested_case_else))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(nested_case_else))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(nested_case_else))==(?);
  Context_List_Variables(Machine(nested_case_else))==(?);
  Abstract_List_Variables(Machine(nested_case_else))==(?);
  Local_List_Variables(Machine(nested_case_else))==(?);
  List_Variables(Machine(nested_case_else))==(?);
  External_List_Variables(Machine(nested_case_else))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(nested_case_else))==(?);
  Abstract_List_VisibleVariables(Machine(nested_case_else))==(?);
  External_List_VisibleVariables(Machine(nested_case_else))==(?);
  Expanded_List_VisibleVariables(Machine(nested_case_else))==(?);
  List_VisibleVariables(Machine(nested_case_else))==(?);
  Internal_List_VisibleVariables(Machine(nested_case_else))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(nested_case_else))==(btrue);
  Gluing_List_Invariant(Machine(nested_case_else))==(btrue);
  Expanded_List_Invariant(Machine(nested_case_else))==(btrue);
  Abstract_List_Invariant(Machine(nested_case_else))==(btrue);
  Context_List_Invariant(Machine(nested_case_else))==(btrue);
  List_Invariant(Machine(nested_case_else))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(nested_case_else))==(btrue);
  Abstract_List_Assertions(Machine(nested_case_else))==(btrue);
  Context_List_Assertions(Machine(nested_case_else))==(btrue);
  List_Assertions(Machine(nested_case_else))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(nested_case_else))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(nested_case_else))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(nested_case_else))==(skip);
  Context_List_Initialisation(Machine(nested_case_else))==(skip);
  List_Initialisation(Machine(nested_case_else))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(nested_case_else))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(nested_case_else))==(btrue);
  List_Constraints(Machine(nested_case_else))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(nested_case_else))==(opnested_case_else);
  List_Operations(Machine(nested_case_else))==(opnested_case_else)
END
&
THEORY ListInputX IS
  List_Input(Machine(nested_case_else),opnested_case_else)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(nested_case_else),opnested_case_else)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(nested_case_else),opnested_case_else)==(res1,res2 <-- opnested_case_else(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(nested_case_else),opnested_case_else)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(nested_case_else),opnested_case_else)==(xx: NAT & yy: NAT | not(xx = 1) & xx = 0 ==> (yy<5 ==> res1,res2:=xx,0 [] not(yy<5) ==> res1,res2:=xx,yy) [] not(xx = 0) & xx = 1 ==> (yy<5 ==> res1,res2:=xx,0 [] not(yy<5) ==> res1,res2:=xx,yy) [] not(xx = 0) & not(xx = 1) ==> (yy<5 ==> res1,res2:=xx,0 [] not(yy<5) ==> res1,res2:=xx,yy));
  List_Substitution(Machine(nested_case_else),opnested_case_else)==(CASE xx OF EITHER 0 THEN IF yy<5 THEN res1:=xx || res2:=0 ELSE res1:=xx || res2:=yy END OR 1 THEN IF yy<5 THEN res1:=xx || res2:=0 ELSE res1:=xx || res2:=yy END ELSE IF yy<5 THEN res1:=xx || res2:=0 ELSE res1:=xx || res2:=yy END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(nested_case_else))==(?);
  Inherited_List_Constants(Machine(nested_case_else))==(?);
  List_Constants(Machine(nested_case_else))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(nested_case_else))==(?);
  Context_List_Defered(Machine(nested_case_else))==(?);
  Context_List_Sets(Machine(nested_case_else))==(?);
  List_Valuable_Sets(Machine(nested_case_else))==(?);
  Inherited_List_Enumerated(Machine(nested_case_else))==(?);
  Inherited_List_Defered(Machine(nested_case_else))==(?);
  Inherited_List_Sets(Machine(nested_case_else))==(?);
  List_Enumerated(Machine(nested_case_else))==(?);
  List_Defered(Machine(nested_case_else))==(?);
  List_Sets(Machine(nested_case_else))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(nested_case_else))==(?);
  Expanded_List_HiddenConstants(Machine(nested_case_else))==(?);
  List_HiddenConstants(Machine(nested_case_else))==(?);
  External_List_HiddenConstants(Machine(nested_case_else))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(nested_case_else))==(btrue);
  Context_List_Properties(Machine(nested_case_else))==(btrue);
  Inherited_List_Properties(Machine(nested_case_else))==(btrue);
  List_Properties(Machine(nested_case_else))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(nested_case_else),opnested_case_else)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(nested_case_else)) == (? | ? | ? | ? | opnested_case_else | ? | ? | ? | nested_case_else);
  List_Of_HiddenCst_Ids(Machine(nested_case_else)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(nested_case_else)) == (?);
  List_Of_VisibleVar_Ids(Machine(nested_case_else)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(nested_case_else)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(nested_case_else)) == (Type(opnested_case_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(nested_case_else)) == (Type(opnested_case_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
