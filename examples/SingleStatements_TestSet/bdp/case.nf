Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(case))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(case))==(Machine(case));
  Level(Machine(case))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(case)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(case))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(case))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(case))==(?);
  List_Includes(Machine(case))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(case))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(case))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(case))==(?);
  Context_List_Variables(Machine(case))==(?);
  Abstract_List_Variables(Machine(case))==(?);
  Local_List_Variables(Machine(case))==(?);
  List_Variables(Machine(case))==(?);
  External_List_Variables(Machine(case))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(case))==(?);
  Abstract_List_VisibleVariables(Machine(case))==(?);
  External_List_VisibleVariables(Machine(case))==(?);
  Expanded_List_VisibleVariables(Machine(case))==(?);
  List_VisibleVariables(Machine(case))==(?);
  Internal_List_VisibleVariables(Machine(case))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(case))==(btrue);
  Gluing_List_Invariant(Machine(case))==(btrue);
  Expanded_List_Invariant(Machine(case))==(btrue);
  Abstract_List_Invariant(Machine(case))==(btrue);
  Context_List_Invariant(Machine(case))==(btrue);
  List_Invariant(Machine(case))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(case))==(btrue);
  Abstract_List_Assertions(Machine(case))==(btrue);
  Context_List_Assertions(Machine(case))==(btrue);
  List_Assertions(Machine(case))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(case))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(case))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(case))==(skip);
  Context_List_Initialisation(Machine(case))==(skip);
  List_Initialisation(Machine(case))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(case))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(case))==(btrue);
  List_Constraints(Machine(case))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(case))==(opcase);
  List_Operations(Machine(case))==(opcase)
END
&
THEORY ListInputX IS
  List_Input(Machine(case),opcase)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(case),opcase)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(case),opcase)==(res <-- opcase(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(case),opcase)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(case),opcase)==(xx: NAT | not(xx = 1) & xx = 0 ==> res:=xx [] not(xx = 0) & xx = 1 ==> res:=xx [] not(xx = 0) & not(xx = 1) ==> res:=xx);
  List_Substitution(Machine(case),opcase)==(CASE xx OF EITHER 0 THEN res:=xx OR 1 THEN res:=xx ELSE res:=xx END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(case))==(?);
  Inherited_List_Constants(Machine(case))==(?);
  List_Constants(Machine(case))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(case))==(?);
  Context_List_Defered(Machine(case))==(?);
  Context_List_Sets(Machine(case))==(?);
  List_Valuable_Sets(Machine(case))==(?);
  Inherited_List_Enumerated(Machine(case))==(?);
  Inherited_List_Defered(Machine(case))==(?);
  Inherited_List_Sets(Machine(case))==(?);
  List_Enumerated(Machine(case))==(?);
  List_Defered(Machine(case))==(?);
  List_Sets(Machine(case))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(case))==(?);
  Expanded_List_HiddenConstants(Machine(case))==(?);
  List_HiddenConstants(Machine(case))==(?);
  External_List_HiddenConstants(Machine(case))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(case))==(btrue);
  Context_List_Properties(Machine(case))==(btrue);
  Inherited_List_Properties(Machine(case))==(btrue);
  List_Properties(Machine(case))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(case),opcase)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(case)) == (? | ? | ? | ? | opcase | ? | ? | ? | case);
  List_Of_HiddenCst_Ids(Machine(case)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(case)) == (?);
  List_Of_VisibleVar_Ids(Machine(case)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(case)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(case)) == (Type(opcase) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(case)) == (Type(opcase) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
