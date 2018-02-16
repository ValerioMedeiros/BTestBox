Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(case_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(case_i))==(Machine(case));
  Level(Implementation(case_i))==(1);
  Upper_Level(Implementation(case_i))==(Machine(case))
END
&
THEORY LoadedStructureX IS
  Implementation(case_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(case_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(case_i))==(?);
  Inherited_List_Includes(Implementation(case_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(case_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(case_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(case_i))==(?);
  Context_List_Variables(Implementation(case_i))==(?);
  Abstract_List_Variables(Implementation(case_i))==(?);
  Local_List_Variables(Implementation(case_i))==(?);
  List_Variables(Implementation(case_i))==(?);
  External_List_Variables(Implementation(case_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(case_i))==(?);
  Abstract_List_VisibleVariables(Implementation(case_i))==(?);
  External_List_VisibleVariables(Implementation(case_i))==(?);
  Expanded_List_VisibleVariables(Implementation(case_i))==(?);
  List_VisibleVariables(Implementation(case_i))==(?);
  Internal_List_VisibleVariables(Implementation(case_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(case_i))==(btrue);
  Expanded_List_Invariant(Implementation(case_i))==(btrue);
  Abstract_List_Invariant(Implementation(case_i))==(btrue);
  Context_List_Invariant(Implementation(case_i))==(btrue);
  List_Invariant(Implementation(case_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(case_i))==(btrue);
  Abstract_List_Assertions(Implementation(case_i))==(btrue);
  Context_List_Assertions(Implementation(case_i))==(btrue);
  List_Assertions(Implementation(case_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(case_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(case_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(case_i))==(skip);
  Context_List_Initialisation(Implementation(case_i))==(skip);
  List_Initialisation(Implementation(case_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(case_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(case_i))==(btrue);
  List_Context_Constraints(Implementation(case_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(case_i))==(opcase);
  List_Operations(Implementation(case_i))==(opcase)
END
&
THEORY ListInputX IS
  List_Input(Implementation(case_i),opcase)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(case_i),opcase)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(case_i),opcase)==(res <-- opcase(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(case_i),opcase)==(btrue);
  List_Precondition(Implementation(case_i),opcase)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(case_i),opcase)==(xx: NAT | not(xx = 1) & xx = 0 ==> (xx: INT | res:=xx) [] not(xx = 0) & xx = 1 ==> (xx: INT | res:=xx) [] not(xx = 0) & not(xx = 1) ==> (xx: INT | res:=xx));
  List_Substitution(Implementation(case_i),opcase)==(CASE xx OF EITHER 0 THEN res:=xx OR 1 THEN res:=xx ELSE res:=xx END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(case_i))==(?);
  Inherited_List_Constants(Implementation(case_i))==(?);
  List_Constants(Implementation(case_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(case_i))==(?);
  Context_List_Defered(Implementation(case_i))==(?);
  Context_List_Sets(Implementation(case_i))==(?);
  List_Own_Enumerated(Implementation(case_i))==(?);
  List_Valuable_Sets(Implementation(case_i))==(?);
  Inherited_List_Enumerated(Implementation(case_i))==(?);
  Inherited_List_Defered(Implementation(case_i))==(?);
  Inherited_List_Sets(Implementation(case_i))==(?);
  List_Enumerated(Implementation(case_i))==(?);
  List_Defered(Implementation(case_i))==(?);
  List_Sets(Implementation(case_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(case_i))==(?);
  Expanded_List_HiddenConstants(Implementation(case_i))==(?);
  List_HiddenConstants(Implementation(case_i))==(?);
  External_List_HiddenConstants(Implementation(case_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(case_i))==(btrue);
  Context_List_Properties(Implementation(case_i))==(btrue);
  Inherited_List_Properties(Implementation(case_i))==(btrue);
  List_Properties(Implementation(case_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(case_i))==(aa: aa);
  List_Values(Implementation(case_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(case_i))==(Type(opcase) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(case_i)) == (? | ? | ? | ? | opcase | ? | ? | ? | case_i);
  List_Of_HiddenCst_Ids(Implementation(case_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(case_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(case_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(case_i)) == (?: ?)
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
  List_Local_Operations(Implementation(case_i))==(?)
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
  TypingPredicate(Implementation(case_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
