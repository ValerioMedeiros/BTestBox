Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(if_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(if_i))==(Machine(if));
  Level(Implementation(if_i))==(1);
  Upper_Level(Implementation(if_i))==(Machine(if))
END
&
THEORY LoadedStructureX IS
  Implementation(if_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(if_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(if_i))==(?);
  Inherited_List_Includes(Implementation(if_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(if_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(if_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(if_i))==(?);
  Context_List_Variables(Implementation(if_i))==(?);
  Abstract_List_Variables(Implementation(if_i))==(?);
  Local_List_Variables(Implementation(if_i))==(?);
  List_Variables(Implementation(if_i))==(?);
  External_List_Variables(Implementation(if_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(if_i))==(?);
  Abstract_List_VisibleVariables(Implementation(if_i))==(?);
  External_List_VisibleVariables(Implementation(if_i))==(?);
  Expanded_List_VisibleVariables(Implementation(if_i))==(?);
  List_VisibleVariables(Implementation(if_i))==(?);
  Internal_List_VisibleVariables(Implementation(if_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(if_i))==(btrue);
  Expanded_List_Invariant(Implementation(if_i))==(btrue);
  Abstract_List_Invariant(Implementation(if_i))==(btrue);
  Context_List_Invariant(Implementation(if_i))==(btrue);
  List_Invariant(Implementation(if_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(if_i))==(btrue);
  Abstract_List_Assertions(Implementation(if_i))==(btrue);
  Context_List_Assertions(Implementation(if_i))==(btrue);
  List_Assertions(Implementation(if_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(if_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(if_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(if_i))==(skip);
  Context_List_Initialisation(Implementation(if_i))==(skip);
  List_Initialisation(Implementation(if_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(if_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(if_i))==(btrue);
  List_Context_Constraints(Implementation(if_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(if_i))==(opif);
  List_Operations(Implementation(if_i))==(opif)
END
&
THEORY ListInputX IS
  List_Input(Implementation(if_i),opif)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(if_i),opif)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(if_i),opif)==(res <-- opif(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(if_i),opif)==(btrue);
  List_Precondition(Implementation(if_i),opif)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(if_i),opif)==(xx: NAT | xx<5 ==> (0: INT | res:=0) [] not(xx<5) ==> skip);
  List_Substitution(Implementation(if_i),opif)==(IF xx<5 THEN res:=0 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(if_i))==(?);
  Inherited_List_Constants(Implementation(if_i))==(?);
  List_Constants(Implementation(if_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(if_i))==(?);
  Context_List_Defered(Implementation(if_i))==(?);
  Context_List_Sets(Implementation(if_i))==(?);
  List_Own_Enumerated(Implementation(if_i))==(?);
  List_Valuable_Sets(Implementation(if_i))==(?);
  Inherited_List_Enumerated(Implementation(if_i))==(?);
  Inherited_List_Defered(Implementation(if_i))==(?);
  Inherited_List_Sets(Implementation(if_i))==(?);
  List_Enumerated(Implementation(if_i))==(?);
  List_Defered(Implementation(if_i))==(?);
  List_Sets(Implementation(if_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(if_i))==(?);
  Expanded_List_HiddenConstants(Implementation(if_i))==(?);
  List_HiddenConstants(Implementation(if_i))==(?);
  External_List_HiddenConstants(Implementation(if_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(if_i))==(btrue);
  Context_List_Properties(Implementation(if_i))==(btrue);
  Inherited_List_Properties(Implementation(if_i))==(btrue);
  List_Properties(Implementation(if_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(if_i))==(aa: aa);
  List_Values(Implementation(if_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(if_i))==(Type(opif) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(if_i)) == (? | ? | ? | ? | opif | ? | ? | ? | if_i);
  List_Of_HiddenCst_Ids(Implementation(if_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(if_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(if_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(if_i)) == (?: ?)
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
  List_Local_Operations(Implementation(if_i))==(?)
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
  TypingPredicate(Implementation(if_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
