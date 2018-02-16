Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Skip_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Skip_i))==(Machine(Skip));
  Level(Implementation(Skip_i))==(1);
  Upper_Level(Implementation(Skip_i))==(Machine(Skip))
END
&
THEORY LoadedStructureX IS
  Implementation(Skip_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Skip_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Skip_i))==(?);
  Inherited_List_Includes(Implementation(Skip_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Skip_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Skip_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Skip_i))==(?);
  Context_List_Variables(Implementation(Skip_i))==(?);
  Abstract_List_Variables(Implementation(Skip_i))==(?);
  Local_List_Variables(Implementation(Skip_i))==(?);
  List_Variables(Implementation(Skip_i))==(?);
  External_List_Variables(Implementation(Skip_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Skip_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Skip_i))==(?);
  External_List_VisibleVariables(Implementation(Skip_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Skip_i))==(?);
  List_VisibleVariables(Implementation(Skip_i))==(?);
  Internal_List_VisibleVariables(Implementation(Skip_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Skip_i))==(btrue);
  Expanded_List_Invariant(Implementation(Skip_i))==(btrue);
  Abstract_List_Invariant(Implementation(Skip_i))==(btrue);
  Context_List_Invariant(Implementation(Skip_i))==(btrue);
  List_Invariant(Implementation(Skip_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Skip_i))==(btrue);
  Abstract_List_Assertions(Implementation(Skip_i))==(btrue);
  Context_List_Assertions(Implementation(Skip_i))==(btrue);
  List_Assertions(Implementation(Skip_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Skip_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Skip_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Skip_i))==(skip);
  Context_List_Initialisation(Implementation(Skip_i))==(skip);
  List_Initialisation(Implementation(Skip_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Skip_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Skip_i))==(btrue);
  List_Context_Constraints(Implementation(Skip_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Skip_i))==(opskip);
  List_Operations(Implementation(Skip_i))==(opskip)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Skip_i),opskip)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Skip_i),opskip)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Skip_i),opskip)==(opskip)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Skip_i),opskip)==(btrue);
  List_Precondition(Implementation(Skip_i),opskip)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Skip_i),opskip)==(btrue | skip);
  List_Substitution(Implementation(Skip_i),opskip)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Skip_i))==(?);
  Inherited_List_Constants(Implementation(Skip_i))==(?);
  List_Constants(Implementation(Skip_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(Skip_i))==(?);
  Context_List_Defered(Implementation(Skip_i))==(?);
  Context_List_Sets(Implementation(Skip_i))==(?);
  List_Own_Enumerated(Implementation(Skip_i))==(?);
  List_Valuable_Sets(Implementation(Skip_i))==(?);
  Inherited_List_Enumerated(Implementation(Skip_i))==(?);
  Inherited_List_Defered(Implementation(Skip_i))==(?);
  Inherited_List_Sets(Implementation(Skip_i))==(?);
  List_Enumerated(Implementation(Skip_i))==(?);
  List_Defered(Implementation(Skip_i))==(?);
  List_Sets(Implementation(Skip_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Skip_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Skip_i))==(?);
  List_HiddenConstants(Implementation(Skip_i))==(?);
  External_List_HiddenConstants(Implementation(Skip_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Skip_i))==(btrue);
  Context_List_Properties(Implementation(Skip_i))==(btrue);
  Inherited_List_Properties(Implementation(Skip_i))==(btrue);
  List_Properties(Implementation(Skip_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Skip_i))==(aa: aa);
  List_Values(Implementation(Skip_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(Skip_i))==(Type(opskip) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Skip_i)) == (? | ? | ? | ? | opskip | ? | ? | ? | Skip_i);
  List_Of_HiddenCst_Ids(Implementation(Skip_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Skip_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Skip_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Skip_i)) == (?: ?)
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
  List_Local_Operations(Implementation(Skip_i))==(?)
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
  TypingPredicate(Implementation(Skip_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
