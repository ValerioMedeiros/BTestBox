Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(IMP_NONDET_MCH_WHILE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(IMP_NONDET_MCH_WHILE))==(Machine(NONDET_MCH_WHILE));
  Level(Implementation(IMP_NONDET_MCH_WHILE))==(1);
  Upper_Level(Implementation(IMP_NONDET_MCH_WHILE))==(Machine(NONDET_MCH_WHILE))
END
&
THEORY LoadedStructureX IS
  Implementation(IMP_NONDET_MCH_WHILE)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Inherited_List_Includes(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Context_List_Variables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Abstract_List_Variables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Local_List_Variables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Variables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  External_List_Variables(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Abstract_List_VisibleVariables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  External_List_VisibleVariables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Expanded_List_VisibleVariables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_VisibleVariables(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Internal_List_VisibleVariables(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Expanded_List_Invariant(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Abstract_List_Invariant(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Context_List_Invariant(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  List_Invariant(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Abstract_List_Assertions(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Context_List_Assertions(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  List_Assertions(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(IMP_NONDET_MCH_WHILE))==(skip);
  Context_List_Initialisation(Implementation(IMP_NONDET_MCH_WHILE))==(skip);
  List_Initialisation(Implementation(IMP_NONDET_MCH_WHILE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  List_Context_Constraints(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(IMP_NONDET_MCH_WHILE))==(opNONDET_MCH_WHILE);
  List_Operations(Implementation(IMP_NONDET_MCH_WHILE))==(opNONDET_MCH_WHILE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(res <-- opNONDET_MCH_WHILE(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(btrue);
  List_Precondition(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(xx: NAT | @ii.(ii:=0;(0: INT | res:=0);WHILE ii<xx DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;(ii: INT | res:=ii)));
  List_Substitution(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(VAR ii IN ii:=0;res:=0;WHILE ii<xx DO ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;res:=ii END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Inherited_List_Constants(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Constants(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Context_List_Defered(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Context_List_Sets(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Own_Enumerated(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Valuable_Sets(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Inherited_List_Enumerated(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Inherited_List_Defered(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Inherited_List_Sets(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Enumerated(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Defered(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_Sets(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  Expanded_List_HiddenConstants(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  List_HiddenConstants(Implementation(IMP_NONDET_MCH_WHILE))==(?);
  External_List_HiddenConstants(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Context_List_Properties(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  Inherited_List_Properties(Implementation(IMP_NONDET_MCH_WHILE))==(btrue);
  List_Properties(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(IMP_NONDET_MCH_WHILE))==(aa: aa);
  List_Values(Implementation(IMP_NONDET_MCH_WHILE))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(IMP_NONDET_MCH_WHILE))==(Type(opNONDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(IMP_NONDET_MCH_WHILE)) == (? | ? | ? | ? | opNONDET_MCH_WHILE | ? | ? | ? | IMP_NONDET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Implementation(IMP_NONDET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(IMP_NONDET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Implementation(IMP_NONDET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(IMP_NONDET_MCH_WHILE)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(IMP_NONDET_MCH_WHILE),opNONDET_MCH_WHILE, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(IMP_NONDET_MCH_WHILE))==(?)
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
  TypingPredicate(Implementation(IMP_NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
