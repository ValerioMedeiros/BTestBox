Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(COMPIMP_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(COMPIMP_i))==(Machine(COMPIMP));
  Level(Implementation(COMPIMP_i))==(1);
  Upper_Level(Implementation(COMPIMP_i))==(Machine(COMPIMP))
END
&
THEORY LoadedStructureX IS
  Implementation(COMPIMP_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(COMPIMP_i))==(?);
  Inherited_List_Includes(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(COMPIMP_i))==(?);
  Context_List_Variables(Implementation(COMPIMP_i))==(?);
  Abstract_List_Variables(Implementation(COMPIMP_i))==(?);
  Local_List_Variables(Implementation(COMPIMP_i))==(?);
  List_Variables(Implementation(COMPIMP_i))==(?);
  External_List_Variables(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(COMPIMP_i))==(?);
  Abstract_List_VisibleVariables(Implementation(COMPIMP_i))==(?);
  External_List_VisibleVariables(Implementation(COMPIMP_i))==(?);
  Expanded_List_VisibleVariables(Implementation(COMPIMP_i))==(?);
  List_VisibleVariables(Implementation(COMPIMP_i))==(?);
  Internal_List_VisibleVariables(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(COMPIMP_i))==(btrue);
  Expanded_List_Invariant(Implementation(COMPIMP_i))==(btrue);
  Abstract_List_Invariant(Implementation(COMPIMP_i))==(btrue);
  Context_List_Invariant(Implementation(COMPIMP_i))==(btrue);
  List_Invariant(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(COMPIMP_i))==(btrue);
  Abstract_List_Assertions(Implementation(COMPIMP_i))==(btrue);
  Context_List_Assertions(Implementation(COMPIMP_i))==(btrue);
  List_Assertions(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(COMPIMP_i))==(skip);
  Context_List_Initialisation(Implementation(COMPIMP_i))==(skip);
  List_Initialisation(Implementation(COMPIMP_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(COMPIMP_i))==(btrue);
  List_Context_Constraints(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(COMPIMP_i))==(do_int);
  List_Operations(Implementation(COMPIMP_i))==(do_int)
END
&
THEORY ListInputX IS
  List_Input(Implementation(COMPIMP_i),do_int)==(value)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(COMPIMP_i),do_int)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(COMPIMP_i),do_int)==(res <-- do_int(value))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(COMPIMP_i),do_int)==(btrue);
  List_Precondition(Implementation(COMPIMP_i),do_int)==(value: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(COMPIMP_i),do_int)==(value: NAT & (value+1) mod 1024: INT & value+1: INT & value: INT & 1: INT & (value+1) mod 1024: NAT & value+1: NAT & 1024: NAT1 | res:=(value+1) mod 1024);
  List_Substitution(Implementation(COMPIMP_i),do_int)==(res:=(value+1) mod 1024)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(COMPIMP_i))==(?);
  Inherited_List_Constants(Implementation(COMPIMP_i))==(?);
  List_Constants(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(COMPIMP_i))==(?);
  Context_List_Defered(Implementation(COMPIMP_i))==(?);
  Context_List_Sets(Implementation(COMPIMP_i))==(?);
  List_Own_Enumerated(Implementation(COMPIMP_i))==(?);
  List_Valuable_Sets(Implementation(COMPIMP_i))==(?);
  Inherited_List_Enumerated(Implementation(COMPIMP_i))==(?);
  Inherited_List_Defered(Implementation(COMPIMP_i))==(?);
  Inherited_List_Sets(Implementation(COMPIMP_i))==(?);
  List_Enumerated(Implementation(COMPIMP_i))==(?);
  List_Defered(Implementation(COMPIMP_i))==(?);
  List_Sets(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(COMPIMP_i))==(?);
  Expanded_List_HiddenConstants(Implementation(COMPIMP_i))==(?);
  List_HiddenConstants(Implementation(COMPIMP_i))==(?);
  External_List_HiddenConstants(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(COMPIMP_i))==(btrue);
  Context_List_Properties(Implementation(COMPIMP_i))==(btrue);
  Inherited_List_Properties(Implementation(COMPIMP_i))==(btrue);
  List_Properties(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(COMPIMP_i))==(aa: aa);
  List_Values(Implementation(COMPIMP_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(COMPIMP_i))==(Type(do_int) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(COMPIMP_i)) == (? | ? | ? | ? | do_int | ? | ? | ? | COMPIMP_i);
  List_Of_HiddenCst_Ids(Implementation(COMPIMP_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(COMPIMP_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(COMPIMP_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(COMPIMP_i)) == (?: ?)
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
  List_Local_Operations(Implementation(COMPIMP_i))==(?)
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
  TypingPredicate(Implementation(COMPIMP_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
