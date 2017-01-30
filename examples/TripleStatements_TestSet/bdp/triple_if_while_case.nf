Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(triple_if_while_case))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(triple_if_while_case))==(Machine(triple_if_while_case));
  Level(Machine(triple_if_while_case))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(triple_if_while_case)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(triple_if_while_case))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(triple_if_while_case))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(triple_if_while_case))==(?);
  List_Includes(Machine(triple_if_while_case))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(triple_if_while_case))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(triple_if_while_case))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(triple_if_while_case))==(?);
  Context_List_Variables(Machine(triple_if_while_case))==(?);
  Abstract_List_Variables(Machine(triple_if_while_case))==(?);
  Local_List_Variables(Machine(triple_if_while_case))==(?);
  List_Variables(Machine(triple_if_while_case))==(?);
  External_List_Variables(Machine(triple_if_while_case))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(triple_if_while_case))==(?);
  Abstract_List_VisibleVariables(Machine(triple_if_while_case))==(?);
  External_List_VisibleVariables(Machine(triple_if_while_case))==(?);
  Expanded_List_VisibleVariables(Machine(triple_if_while_case))==(?);
  List_VisibleVariables(Machine(triple_if_while_case))==(?);
  Internal_List_VisibleVariables(Machine(triple_if_while_case))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(triple_if_while_case))==(btrue);
  Gluing_List_Invariant(Machine(triple_if_while_case))==(btrue);
  Expanded_List_Invariant(Machine(triple_if_while_case))==(btrue);
  Abstract_List_Invariant(Machine(triple_if_while_case))==(btrue);
  Context_List_Invariant(Machine(triple_if_while_case))==(btrue);
  List_Invariant(Machine(triple_if_while_case))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(triple_if_while_case))==(btrue);
  Abstract_List_Assertions(Machine(triple_if_while_case))==(btrue);
  Context_List_Assertions(Machine(triple_if_while_case))==(btrue);
  List_Assertions(Machine(triple_if_while_case))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(triple_if_while_case))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(triple_if_while_case))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(triple_if_while_case))==(skip);
  Context_List_Initialisation(Machine(triple_if_while_case))==(skip);
  List_Initialisation(Machine(triple_if_while_case))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(triple_if_while_case))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(triple_if_while_case))==(btrue);
  List_Constraints(Machine(triple_if_while_case))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(triple_if_while_case))==(?);
  List_Operations(Machine(triple_if_while_case))==(?)
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
  List_Valuable_Constants(Machine(triple_if_while_case))==(?);
  Inherited_List_Constants(Machine(triple_if_while_case))==(?);
  List_Constants(Machine(triple_if_while_case))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(triple_if_while_case))==(?);
  Context_List_Defered(Machine(triple_if_while_case))==(?);
  Context_List_Sets(Machine(triple_if_while_case))==(?);
  List_Valuable_Sets(Machine(triple_if_while_case))==(?);
  Inherited_List_Enumerated(Machine(triple_if_while_case))==(?);
  Inherited_List_Defered(Machine(triple_if_while_case))==(?);
  Inherited_List_Sets(Machine(triple_if_while_case))==(?);
  List_Enumerated(Machine(triple_if_while_case))==(?);
  List_Defered(Machine(triple_if_while_case))==(?);
  List_Sets(Machine(triple_if_while_case))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(triple_if_while_case))==(?);
  Expanded_List_HiddenConstants(Machine(triple_if_while_case))==(?);
  List_HiddenConstants(Machine(triple_if_while_case))==(?);
  External_List_HiddenConstants(Machine(triple_if_while_case))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(triple_if_while_case))==(btrue);
  Context_List_Properties(Machine(triple_if_while_case))==(btrue);
  Inherited_List_Properties(Machine(triple_if_while_case))==(btrue);
  List_Properties(Machine(triple_if_while_case))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(triple_if_while_case)) == (? | ? | ? | ? | ? | ? | ? | ? | triple_if_while_case);
  List_Of_HiddenCst_Ids(Machine(triple_if_while_case)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(triple_if_while_case)) == (?);
  List_Of_VisibleVar_Ids(Machine(triple_if_while_case)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(triple_if_while_case)) == (?: ?)
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
