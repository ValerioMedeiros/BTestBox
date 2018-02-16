Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(triple_case_while_if))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(triple_case_while_if))==(Machine(triple_case_while_if));
  Level(Machine(triple_case_while_if))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(triple_case_while_if)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(triple_case_while_if))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(triple_case_while_if))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(triple_case_while_if))==(?);
  List_Includes(Machine(triple_case_while_if))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(triple_case_while_if))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(triple_case_while_if))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(triple_case_while_if))==(?);
  Context_List_Variables(Machine(triple_case_while_if))==(?);
  Abstract_List_Variables(Machine(triple_case_while_if))==(?);
  Local_List_Variables(Machine(triple_case_while_if))==(?);
  List_Variables(Machine(triple_case_while_if))==(?);
  External_List_Variables(Machine(triple_case_while_if))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(triple_case_while_if))==(?);
  Abstract_List_VisibleVariables(Machine(triple_case_while_if))==(?);
  External_List_VisibleVariables(Machine(triple_case_while_if))==(?);
  Expanded_List_VisibleVariables(Machine(triple_case_while_if))==(?);
  List_VisibleVariables(Machine(triple_case_while_if))==(?);
  Internal_List_VisibleVariables(Machine(triple_case_while_if))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(triple_case_while_if))==(btrue);
  Gluing_List_Invariant(Machine(triple_case_while_if))==(btrue);
  Expanded_List_Invariant(Machine(triple_case_while_if))==(btrue);
  Abstract_List_Invariant(Machine(triple_case_while_if))==(btrue);
  Context_List_Invariant(Machine(triple_case_while_if))==(btrue);
  List_Invariant(Machine(triple_case_while_if))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(triple_case_while_if))==(btrue);
  Abstract_List_Assertions(Machine(triple_case_while_if))==(btrue);
  Context_List_Assertions(Machine(triple_case_while_if))==(btrue);
  List_Assertions(Machine(triple_case_while_if))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(triple_case_while_if))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(triple_case_while_if))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(triple_case_while_if))==(skip);
  Context_List_Initialisation(Machine(triple_case_while_if))==(skip);
  List_Initialisation(Machine(triple_case_while_if))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(triple_case_while_if))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(triple_case_while_if))==(btrue);
  List_Constraints(Machine(triple_case_while_if))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(triple_case_while_if))==(?);
  List_Operations(Machine(triple_case_while_if))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(triple_case_while_if))==(?);
  Inherited_List_Constants(Machine(triple_case_while_if))==(?);
  List_Constants(Machine(triple_case_while_if))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(triple_case_while_if))==(?);
  Context_List_Defered(Machine(triple_case_while_if))==(?);
  Context_List_Sets(Machine(triple_case_while_if))==(?);
  List_Valuable_Sets(Machine(triple_case_while_if))==(?);
  Inherited_List_Enumerated(Machine(triple_case_while_if))==(?);
  Inherited_List_Defered(Machine(triple_case_while_if))==(?);
  Inherited_List_Sets(Machine(triple_case_while_if))==(?);
  List_Enumerated(Machine(triple_case_while_if))==(?);
  List_Defered(Machine(triple_case_while_if))==(?);
  List_Sets(Machine(triple_case_while_if))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(triple_case_while_if))==(?);
  Expanded_List_HiddenConstants(Machine(triple_case_while_if))==(?);
  List_HiddenConstants(Machine(triple_case_while_if))==(?);
  External_List_HiddenConstants(Machine(triple_case_while_if))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(triple_case_while_if))==(btrue);
  Context_List_Properties(Machine(triple_case_while_if))==(btrue);
  Inherited_List_Properties(Machine(triple_case_while_if))==(btrue);
  List_Properties(Machine(triple_case_while_if))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(triple_case_while_if)) == (? | ? | ? | ? | ? | ? | ? | ? | triple_case_while_if);
  List_Of_HiddenCst_Ids(Machine(triple_case_while_if)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(triple_case_while_if)) == (?);
  List_Of_VisibleVar_Ids(Machine(triple_case_while_if)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(triple_case_while_if)) == (?: ?)
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
