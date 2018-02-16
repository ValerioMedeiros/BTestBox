Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithConstants_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithConstants_i))==(Machine(MchWithConstants));
  Level(Implementation(MchWithConstants_i))==(1);
  Upper_Level(Implementation(MchWithConstants_i))==(Machine(MchWithConstants))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithConstants_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithConstants_i))==(?);
  Inherited_List_Includes(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithConstants_i))==(?);
  Context_List_Variables(Implementation(MchWithConstants_i))==(?);
  Abstract_List_Variables(Implementation(MchWithConstants_i))==(?);
  Local_List_Variables(Implementation(MchWithConstants_i))==(?);
  List_Variables(Implementation(MchWithConstants_i))==(?);
  External_List_Variables(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithConstants_i))==(?);
  Abstract_List_VisibleVariables(Implementation(MchWithConstants_i))==(?);
  External_List_VisibleVariables(Implementation(MchWithConstants_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchWithConstants_i))==(?);
  List_VisibleVariables(Implementation(MchWithConstants_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithConstants_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchWithConstants_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithConstants_i))==(btrue);
  Context_List_Invariant(Implementation(MchWithConstants_i))==(btrue);
  List_Invariant(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchWithConstants_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchWithConstants_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithConstants_i))==(btrue);
  List_Assertions(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithConstants_i))==(skip);
  Context_List_Initialisation(Implementation(MchWithConstants_i))==(skip);
  List_Initialisation(Implementation(MchWithConstants_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithConstants_i))==(btrue);
  List_Context_Constraints(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithConstants_i))==(opMchWithCConstants);
  List_Operations(Implementation(MchWithConstants_i))==(opMchWithCConstants)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithConstants_i),opMchWithCConstants)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithConstants_i),opMchWithCConstants)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithConstants_i),opMchWithCConstants)==(res <-- opMchWithCConstants(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithConstants_i),opMchWithCConstants)==(btrue);
  List_Precondition(Implementation(MchWithConstants_i),opMchWithCConstants)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchWithConstants_i),opMchWithCConstants)==(nn: NAT | nn<max_count ==> res:=TRUE [] not(nn<max_count) ==> res:=FALSE);
  List_Substitution(Implementation(MchWithConstants_i),opMchWithCConstants)==(IF nn<max_count THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithConstants_i))==(max_count);
  Inherited_List_Constants(Implementation(MchWithConstants_i))==(max_count);
  List_Constants(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchWithConstants_i))==(?);
  Context_List_Defered(Implementation(MchWithConstants_i))==(?);
  Context_List_Sets(Implementation(MchWithConstants_i))==(?);
  List_Own_Enumerated(Implementation(MchWithConstants_i))==(?);
  List_Valuable_Sets(Implementation(MchWithConstants_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithConstants_i))==(?);
  Inherited_List_Defered(Implementation(MchWithConstants_i))==(?);
  Inherited_List_Sets(Implementation(MchWithConstants_i))==(?);
  List_Enumerated(Implementation(MchWithConstants_i))==(?);
  List_Defered(Implementation(MchWithConstants_i))==(?);
  List_Sets(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithConstants_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchWithConstants_i))==(?);
  List_HiddenConstants(Implementation(MchWithConstants_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithConstants_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithConstants_i))==(max_count = 10);
  Context_List_Properties(Implementation(MchWithConstants_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithConstants_i))==(btrue);
  List_Properties(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(MchWithConstants_i))==(btrue);
  Values_Subs(Implementation(MchWithConstants_i))==(max_count: 10);
  List_Values(Implementation(MchWithConstants_i))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(MchWithConstants_i))==(Type(opMchWithCConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)));
  Constants(Implementation(MchWithConstants_i))==(Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithConstants_i)) == (? | ? | ? | ? | opMchWithCConstants | ? | ? | ? | MchWithConstants_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithConstants_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithConstants_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchWithConstants_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(MchWithConstants_i)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(MchWithConstants_i)) == (Type(max_count) == Cst(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(MchWithConstants_i))==(?)
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
  TypingPredicate(Implementation(MchWithConstants_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
