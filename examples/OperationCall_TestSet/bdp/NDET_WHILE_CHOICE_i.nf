Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(NDET_WHILE_CHOICE_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(NDET_WHILE_CHOICE_i))==(Machine(NDET_WHILE_CHOICE));
  Level(Implementation(NDET_WHILE_CHOICE_i))==(1);
  Upper_Level(Implementation(NDET_WHILE_CHOICE_i))==(Machine(NDET_WHILE_CHOICE))
END
&
THEORY LoadedStructureX IS
  Implementation(NDET_WHILE_CHOICE_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Inherited_List_Includes(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Context_List_Variables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Abstract_List_Variables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Local_List_Variables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Variables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  External_List_Variables(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Abstract_List_VisibleVariables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  External_List_VisibleVariables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Expanded_List_VisibleVariables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_VisibleVariables(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Internal_List_VisibleVariables(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Expanded_List_Invariant(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Abstract_List_Invariant(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Context_List_Invariant(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  List_Invariant(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Abstract_List_Assertions(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Context_List_Assertions(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  List_Assertions(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(NDET_WHILE_CHOICE_i))==(skip);
  Context_List_Initialisation(Implementation(NDET_WHILE_CHOICE_i))==(skip);
  List_Initialisation(Implementation(NDET_WHILE_CHOICE_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  List_Context_Constraints(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(NDET_WHILE_CHOICE_i))==(opNDET_WHILE_CHOICE);
  List_Operations(Implementation(NDET_WHILE_CHOICE_i))==(opNDET_WHILE_CHOICE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(res <-- opNDET_WHILE_CHOICE)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(btrue);
  List_Precondition(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(btrue & 10: INT | res:=10);
  List_Substitution(Implementation(NDET_WHILE_CHOICE_i),opNDET_WHILE_CHOICE)==(res:=10)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Inherited_List_Constants(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Constants(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Context_List_Defered(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Context_List_Sets(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Own_Enumerated(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Valuable_Sets(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Inherited_List_Enumerated(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Inherited_List_Defered(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Inherited_List_Sets(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Enumerated(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Defered(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_Sets(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(NDET_WHILE_CHOICE_i))==(?);
  Expanded_List_HiddenConstants(Implementation(NDET_WHILE_CHOICE_i))==(?);
  List_HiddenConstants(Implementation(NDET_WHILE_CHOICE_i))==(?);
  External_List_HiddenConstants(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Context_List_Properties(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  Inherited_List_Properties(Implementation(NDET_WHILE_CHOICE_i))==(btrue);
  List_Properties(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(NDET_WHILE_CHOICE_i))==(aa: aa);
  List_Values(Implementation(NDET_WHILE_CHOICE_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(NDET_WHILE_CHOICE_i))==(Type(opNDET_WHILE_CHOICE) == Cst(btype(INTEGER,?,?),No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(NDET_WHILE_CHOICE_i)) == (? | ? | ? | ? | opNDET_WHILE_CHOICE | ? | ? | ? | NDET_WHILE_CHOICE_i);
  List_Of_HiddenCst_Ids(Implementation(NDET_WHILE_CHOICE_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(NDET_WHILE_CHOICE_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(NDET_WHILE_CHOICE_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(NDET_WHILE_CHOICE_i)) == (?: ?)
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
  List_Local_Operations(Implementation(NDET_WHILE_CHOICE_i))==(?)
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
  TypingPredicate(Implementation(NDET_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
