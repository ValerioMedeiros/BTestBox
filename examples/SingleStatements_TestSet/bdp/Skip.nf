Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Skip))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Skip))==(Machine(Skip));
  Level(Machine(Skip))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Skip)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Skip))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Skip))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Skip))==(?);
  List_Includes(Machine(Skip))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Skip))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Skip))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Skip))==(?);
  Context_List_Variables(Machine(Skip))==(?);
  Abstract_List_Variables(Machine(Skip))==(?);
  Local_List_Variables(Machine(Skip))==(?);
  List_Variables(Machine(Skip))==(?);
  External_List_Variables(Machine(Skip))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Skip))==(?);
  Abstract_List_VisibleVariables(Machine(Skip))==(?);
  External_List_VisibleVariables(Machine(Skip))==(?);
  Expanded_List_VisibleVariables(Machine(Skip))==(?);
  List_VisibleVariables(Machine(Skip))==(?);
  Internal_List_VisibleVariables(Machine(Skip))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Skip))==(btrue);
  Gluing_List_Invariant(Machine(Skip))==(btrue);
  Expanded_List_Invariant(Machine(Skip))==(btrue);
  Abstract_List_Invariant(Machine(Skip))==(btrue);
  Context_List_Invariant(Machine(Skip))==(btrue);
  List_Invariant(Machine(Skip))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Skip))==(btrue);
  Abstract_List_Assertions(Machine(Skip))==(btrue);
  Context_List_Assertions(Machine(Skip))==(btrue);
  List_Assertions(Machine(Skip))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Skip))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Skip))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Skip))==(skip);
  Context_List_Initialisation(Machine(Skip))==(skip);
  List_Initialisation(Machine(Skip))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Skip))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Skip))==(btrue);
  List_Constraints(Machine(Skip))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Skip))==(opskip);
  List_Operations(Machine(Skip))==(opskip)
END
&
THEORY ListInputX IS
  List_Input(Machine(Skip),opskip)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Skip),opskip)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Skip),opskip)==(opskip)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Skip),opskip)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Skip),opskip)==(btrue | skip);
  List_Substitution(Machine(Skip),opskip)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Skip))==(?);
  Inherited_List_Constants(Machine(Skip))==(?);
  List_Constants(Machine(Skip))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Skip))==(?);
  Context_List_Defered(Machine(Skip))==(?);
  Context_List_Sets(Machine(Skip))==(?);
  List_Valuable_Sets(Machine(Skip))==(?);
  Inherited_List_Enumerated(Machine(Skip))==(?);
  Inherited_List_Defered(Machine(Skip))==(?);
  Inherited_List_Sets(Machine(Skip))==(?);
  List_Enumerated(Machine(Skip))==(?);
  List_Defered(Machine(Skip))==(?);
  List_Sets(Machine(Skip))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Skip))==(?);
  Expanded_List_HiddenConstants(Machine(Skip))==(?);
  List_HiddenConstants(Machine(Skip))==(?);
  External_List_HiddenConstants(Machine(Skip))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Skip))==(btrue);
  Context_List_Properties(Machine(Skip))==(btrue);
  Inherited_List_Properties(Machine(Skip))==(btrue);
  List_Properties(Machine(Skip))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Skip),opskip)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Skip)) == (? | ? | ? | ? | opskip | ? | ? | ? | Skip);
  List_Of_HiddenCst_Ids(Machine(Skip)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Skip)) == (?);
  List_Of_VisibleVar_Ids(Machine(Skip)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Skip)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Skip)) == (Type(opskip) == Cst(No_type,No_type));
  Observers(Machine(Skip)) == (Type(opskip) == Cst(No_type,No_type))
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
