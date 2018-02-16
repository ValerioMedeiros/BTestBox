Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(OC_CASE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(OC_CASE))==(Machine(OC_CASE));
  Level(Machine(OC_CASE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(OC_CASE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(OC_CASE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(OC_CASE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(OC_CASE))==(?);
  List_Includes(Machine(OC_CASE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(OC_CASE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(OC_CASE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(OC_CASE))==(?);
  Context_List_Variables(Machine(OC_CASE))==(?);
  Abstract_List_Variables(Machine(OC_CASE))==(?);
  Local_List_Variables(Machine(OC_CASE))==(?);
  List_Variables(Machine(OC_CASE))==(?);
  External_List_Variables(Machine(OC_CASE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(OC_CASE))==(?);
  Abstract_List_VisibleVariables(Machine(OC_CASE))==(?);
  External_List_VisibleVariables(Machine(OC_CASE))==(?);
  Expanded_List_VisibleVariables(Machine(OC_CASE))==(?);
  List_VisibleVariables(Machine(OC_CASE))==(?);
  Internal_List_VisibleVariables(Machine(OC_CASE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(OC_CASE))==(btrue);
  Gluing_List_Invariant(Machine(OC_CASE))==(btrue);
  Expanded_List_Invariant(Machine(OC_CASE))==(btrue);
  Abstract_List_Invariant(Machine(OC_CASE))==(btrue);
  Context_List_Invariant(Machine(OC_CASE))==(btrue);
  List_Invariant(Machine(OC_CASE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(OC_CASE))==(btrue);
  Abstract_List_Assertions(Machine(OC_CASE))==(btrue);
  Context_List_Assertions(Machine(OC_CASE))==(btrue);
  List_Assertions(Machine(OC_CASE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(OC_CASE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(OC_CASE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(OC_CASE))==(skip);
  Context_List_Initialisation(Machine(OC_CASE))==(skip);
  List_Initialisation(Machine(OC_CASE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(OC_CASE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(OC_CASE))==(btrue);
  List_Constraints(Machine(OC_CASE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(OC_CASE))==(opOC_CASE);
  List_Operations(Machine(OC_CASE))==(opOC_CASE)
END
&
THEORY ListInputX IS
  List_Input(Machine(OC_CASE),opOC_CASE)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(OC_CASE),opOC_CASE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(OC_CASE),opOC_CASE)==(res <-- opOC_CASE(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(OC_CASE),opOC_CASE)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(OC_CASE),opOC_CASE)==(xx: NAT | not(xx = 1) & xx = 0 ==> res:=xx [] not(xx = 0) & xx = 1 ==> res:=xx [] not(xx = 0) & not(xx = 1) ==> res:=xx);
  List_Substitution(Machine(OC_CASE),opOC_CASE)==(CASE xx OF EITHER 0 THEN res:=xx OR 1 THEN res:=xx ELSE res:=xx END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(OC_CASE))==(?);
  Inherited_List_Constants(Machine(OC_CASE))==(?);
  List_Constants(Machine(OC_CASE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(OC_CASE))==(?);
  Context_List_Defered(Machine(OC_CASE))==(?);
  Context_List_Sets(Machine(OC_CASE))==(?);
  List_Valuable_Sets(Machine(OC_CASE))==(?);
  Inherited_List_Enumerated(Machine(OC_CASE))==(?);
  Inherited_List_Defered(Machine(OC_CASE))==(?);
  Inherited_List_Sets(Machine(OC_CASE))==(?);
  List_Enumerated(Machine(OC_CASE))==(?);
  List_Defered(Machine(OC_CASE))==(?);
  List_Sets(Machine(OC_CASE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(OC_CASE))==(?);
  Expanded_List_HiddenConstants(Machine(OC_CASE))==(?);
  List_HiddenConstants(Machine(OC_CASE))==(?);
  External_List_HiddenConstants(Machine(OC_CASE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(OC_CASE))==(btrue);
  Context_List_Properties(Machine(OC_CASE))==(btrue);
  Inherited_List_Properties(Machine(OC_CASE))==(btrue);
  List_Properties(Machine(OC_CASE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(OC_CASE),opOC_CASE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(OC_CASE)) == (? | ? | ? | ? | opOC_CASE | ? | ? | ? | OC_CASE);
  List_Of_HiddenCst_Ids(Machine(OC_CASE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(OC_CASE)) == (?);
  List_Of_VisibleVar_Ids(Machine(OC_CASE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(OC_CASE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(OC_CASE)) == (Type(opOC_CASE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(OC_CASE)) == (Type(opOC_CASE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
