Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithConstraints_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithConstraints_i))==(Machine(MchWithConstraints));
  Level(Implementation(MchWithConstraints_i))==(1);
  Upper_Level(Implementation(MchWithConstraints_i))==(Machine(MchWithConstraints))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithConstraints_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithConstraints_i))==(?);
  Inherited_List_Includes(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithConstraints_i))==(?);
  Context_List_Variables(Implementation(MchWithConstraints_i))==(?);
  Abstract_List_Variables(Implementation(MchWithConstraints_i))==(?);
  Local_List_Variables(Implementation(MchWithConstraints_i))==(?);
  List_Variables(Implementation(MchWithConstraints_i))==(?);
  External_List_Variables(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithConstraints_i))==(?);
  Abstract_List_VisibleVariables(Implementation(MchWithConstraints_i))==(?);
  External_List_VisibleVariables(Implementation(MchWithConstraints_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchWithConstraints_i))==(?);
  List_VisibleVariables(Implementation(MchWithConstraints_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithConstraints_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchWithConstraints_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithConstraints_i))==(btrue);
  Context_List_Invariant(Implementation(MchWithConstraints_i))==(btrue);
  List_Invariant(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchWithConstraints_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchWithConstraints_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithConstraints_i))==(btrue);
  List_Assertions(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithConstraints_i))==(skip);
  Context_List_Initialisation(Implementation(MchWithConstraints_i))==(skip);
  List_Initialisation(Implementation(MchWithConstraints_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithConstraints_i))==(max_count)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithConstraints_i))==(max_count: NAT);
  List_Context_Constraints(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithConstraints_i))==(opMchWithConstraints);
  List_Operations(Implementation(MchWithConstraints_i))==(opMchWithConstraints)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithConstraints_i),opMchWithConstraints)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithConstraints_i),opMchWithConstraints)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithConstraints_i),opMchWithConstraints)==(res <-- opMchWithConstraints(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithConstraints_i),opMchWithConstraints)==(btrue);
  List_Precondition(Implementation(MchWithConstraints_i),opMchWithConstraints)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchWithConstraints_i),opMchWithConstraints)==(nn: NAT | nn<max_count ==> res:=TRUE [] not(nn<max_count) ==> res:=FALSE);
  List_Substitution(Implementation(MchWithConstraints_i),opMchWithConstraints)==(IF nn<max_count THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithConstraints_i))==(?);
  Inherited_List_Constants(Implementation(MchWithConstraints_i))==(?);
  List_Constants(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchWithConstraints_i))==(?);
  Context_List_Defered(Implementation(MchWithConstraints_i))==(?);
  Context_List_Sets(Implementation(MchWithConstraints_i))==(?);
  List_Own_Enumerated(Implementation(MchWithConstraints_i))==(?);
  List_Valuable_Sets(Implementation(MchWithConstraints_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithConstraints_i))==(?);
  Inherited_List_Defered(Implementation(MchWithConstraints_i))==(?);
  Inherited_List_Sets(Implementation(MchWithConstraints_i))==(?);
  List_Enumerated(Implementation(MchWithConstraints_i))==(?);
  List_Defered(Implementation(MchWithConstraints_i))==(?);
  List_Sets(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithConstraints_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchWithConstraints_i))==(?);
  List_HiddenConstants(Implementation(MchWithConstraints_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithConstraints_i))==(btrue);
  Context_List_Properties(Implementation(MchWithConstraints_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithConstraints_i))==(btrue);
  List_Properties(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(MchWithConstraints_i))==(aa: aa);
  List_Values(Implementation(MchWithConstraints_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(MchWithConstraints_i))==(Type(opMchWithConstraints) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithConstraints_i)) == (? | ? | ? | ? | opMchWithConstraints | ? | ? | max_count | MchWithConstraints_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithConstraints_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithConstraints_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchWithConstraints_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(MchWithConstraints_i)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Implementation(MchWithConstraints_i)) == (Type(max_count) == Prm(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(MchWithConstraints_i))==(?)
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
  TypingPredicate(Implementation(MchWithConstraints_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
