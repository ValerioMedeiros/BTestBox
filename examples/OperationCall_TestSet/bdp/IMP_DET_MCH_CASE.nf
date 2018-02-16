Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(IMP_DET_MCH_CASE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(IMP_DET_MCH_CASE))==(Machine(DET_MCH_CASE));
  Level(Implementation(IMP_DET_MCH_CASE))==(1);
  Upper_Level(Implementation(IMP_DET_MCH_CASE))==(Machine(DET_MCH_CASE))
END
&
THEORY LoadedStructureX IS
  Implementation(IMP_DET_MCH_CASE)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(IMP_DET_MCH_CASE))==(?);
  Inherited_List_Includes(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(IMP_DET_MCH_CASE))==(?);
  Context_List_Variables(Implementation(IMP_DET_MCH_CASE))==(?);
  Abstract_List_Variables(Implementation(IMP_DET_MCH_CASE))==(?);
  Local_List_Variables(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Variables(Implementation(IMP_DET_MCH_CASE))==(?);
  External_List_Variables(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(IMP_DET_MCH_CASE))==(?);
  Abstract_List_VisibleVariables(Implementation(IMP_DET_MCH_CASE))==(?);
  External_List_VisibleVariables(Implementation(IMP_DET_MCH_CASE))==(?);
  Expanded_List_VisibleVariables(Implementation(IMP_DET_MCH_CASE))==(?);
  List_VisibleVariables(Implementation(IMP_DET_MCH_CASE))==(?);
  Internal_List_VisibleVariables(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Expanded_List_Invariant(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Abstract_List_Invariant(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Context_List_Invariant(Implementation(IMP_DET_MCH_CASE))==(btrue);
  List_Invariant(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Abstract_List_Assertions(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Context_List_Assertions(Implementation(IMP_DET_MCH_CASE))==(btrue);
  List_Assertions(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(IMP_DET_MCH_CASE))==(skip);
  Context_List_Initialisation(Implementation(IMP_DET_MCH_CASE))==(skip);
  List_Initialisation(Implementation(IMP_DET_MCH_CASE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(IMP_DET_MCH_CASE))==(btrue);
  List_Context_Constraints(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(IMP_DET_MCH_CASE))==(opDET_MCH_CASE);
  List_Operations(Implementation(IMP_DET_MCH_CASE))==(opDET_MCH_CASE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(res <-- opDET_MCH_CASE(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(btrue);
  List_Precondition(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(xx: NAT | not(xx = 1) & xx = 0 ==> (xx: INT | res:=xx) [] not(xx = 0) & xx = 1 ==> (xx: INT | res:=xx) [] not(xx = 0) & not(xx = 1) ==> (xx: INT | res:=xx));
  List_Substitution(Implementation(IMP_DET_MCH_CASE),opDET_MCH_CASE)==(CASE xx OF EITHER 0 THEN res:=xx OR 1 THEN res:=xx ELSE res:=xx END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(IMP_DET_MCH_CASE))==(?);
  Inherited_List_Constants(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Constants(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(IMP_DET_MCH_CASE))==(?);
  Context_List_Defered(Implementation(IMP_DET_MCH_CASE))==(?);
  Context_List_Sets(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Own_Enumerated(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Valuable_Sets(Implementation(IMP_DET_MCH_CASE))==(?);
  Inherited_List_Enumerated(Implementation(IMP_DET_MCH_CASE))==(?);
  Inherited_List_Defered(Implementation(IMP_DET_MCH_CASE))==(?);
  Inherited_List_Sets(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Enumerated(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Defered(Implementation(IMP_DET_MCH_CASE))==(?);
  List_Sets(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(IMP_DET_MCH_CASE))==(?);
  Expanded_List_HiddenConstants(Implementation(IMP_DET_MCH_CASE))==(?);
  List_HiddenConstants(Implementation(IMP_DET_MCH_CASE))==(?);
  External_List_HiddenConstants(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Context_List_Properties(Implementation(IMP_DET_MCH_CASE))==(btrue);
  Inherited_List_Properties(Implementation(IMP_DET_MCH_CASE))==(btrue);
  List_Properties(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(IMP_DET_MCH_CASE))==(aa: aa);
  List_Values(Implementation(IMP_DET_MCH_CASE))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(IMP_DET_MCH_CASE))==(Type(opDET_MCH_CASE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(IMP_DET_MCH_CASE)) == (? | ? | ? | ? | opDET_MCH_CASE | ? | ? | ? | IMP_DET_MCH_CASE);
  List_Of_HiddenCst_Ids(Implementation(IMP_DET_MCH_CASE)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(IMP_DET_MCH_CASE)) == (?);
  List_Of_VisibleVar_Ids(Implementation(IMP_DET_MCH_CASE)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(IMP_DET_MCH_CASE)) == (?: ?)
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
  List_Local_Operations(Implementation(IMP_DET_MCH_CASE))==(?)
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
  TypingPredicate(Implementation(IMP_DET_MCH_CASE))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
