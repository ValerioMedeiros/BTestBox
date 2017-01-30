Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithAConstants_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithAConstants_i))==(Machine(MchWithAConstants));
  Level(Implementation(MchWithAConstants_i))==(1);
  Upper_Level(Implementation(MchWithAConstants_i))==(Machine(MchWithAConstants))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithAConstants_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithAConstants_i))==(?);
  Inherited_List_Includes(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithAConstants_i))==(?);
  Context_List_Variables(Implementation(MchWithAConstants_i))==(?);
  Abstract_List_Variables(Implementation(MchWithAConstants_i))==(?);
  Local_List_Variables(Implementation(MchWithAConstants_i))==(?);
  List_Variables(Implementation(MchWithAConstants_i))==(?);
  External_List_Variables(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithAConstants_i))==(?);
  Abstract_List_VisibleVariables(Implementation(MchWithAConstants_i))==(?);
  External_List_VisibleVariables(Implementation(MchWithAConstants_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchWithAConstants_i))==(?);
  List_VisibleVariables(Implementation(MchWithAConstants_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithAConstants_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchWithAConstants_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithAConstants_i))==(btrue);
  Context_List_Invariant(Implementation(MchWithAConstants_i))==(btrue);
  List_Invariant(Implementation(MchWithAConstants_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchWithAConstants_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchWithAConstants_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithAConstants_i))==(btrue);
  List_Assertions(Implementation(MchWithAConstants_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithAConstants_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithAConstants_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithAConstants_i))==(skip);
  Context_List_Initialisation(Implementation(MchWithAConstants_i))==(skip);
  List_Initialisation(Implementation(MchWithAConstants_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithAConstants_i))==(btrue);
  List_Context_Constraints(Implementation(MchWithAConstants_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithAConstants_i))==(opMchWithAConstants);
  List_Operations(Implementation(MchWithAConstants_i))==(opMchWithAConstants)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithAConstants_i),opMchWithAConstants)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithAConstants_i),opMchWithAConstants)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithAConstants_i),opMchWithAConstants)==(res <-- opMchWithAConstants(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithAConstants_i),opMchWithAConstants)==(btrue);
  List_Precondition(Implementation(MchWithAConstants_i),opMchWithAConstants)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchWithAConstants_i),opMchWithAConstants)==(nn: NAT | nn<max_countConcrete ==> res:=TRUE [] not(nn<max_countConcrete) ==> res:=FALSE);
  List_Substitution(Implementation(MchWithAConstants_i),opMchWithAConstants)==(IF nn<max_countConcrete THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithAConstants_i))==(max_countConcrete);
  Inherited_List_Constants(Implementation(MchWithAConstants_i))==(?);
  List_Constants(Implementation(MchWithAConstants_i))==(max_countConcrete)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchWithAConstants_i))==(?);
  Context_List_Defered(Implementation(MchWithAConstants_i))==(?);
  Context_List_Sets(Implementation(MchWithAConstants_i))==(?);
  List_Own_Enumerated(Implementation(MchWithAConstants_i))==(?);
  List_Valuable_Sets(Implementation(MchWithAConstants_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithAConstants_i))==(?);
  Inherited_List_Defered(Implementation(MchWithAConstants_i))==(?);
  Inherited_List_Sets(Implementation(MchWithAConstants_i))==(?);
  List_Enumerated(Implementation(MchWithAConstants_i))==(?);
  List_Defered(Implementation(MchWithAConstants_i))==(?);
  List_Sets(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithAConstants_i))==(max_count);
  Expanded_List_HiddenConstants(Implementation(MchWithAConstants_i))==(?);
  List_HiddenConstants(Implementation(MchWithAConstants_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithAConstants_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithAConstants_i))==(max_count = 10);
  Context_List_Properties(Implementation(MchWithAConstants_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithAConstants_i))==(btrue);
  List_Properties(Implementation(MchWithAConstants_i))==(max_countConcrete = max_count)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(MchWithAConstants_i))==(btrue);
  Values_Subs(Implementation(MchWithAConstants_i))==(max_countConcrete: 10);
  List_Values(Implementation(MchWithAConstants_i))==(max_countConcrete = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Constants(Implementation(MchWithAConstants_i))==(Type(max_countConcrete) == Cst(btype(INTEGER,?,?)));
  Operations(Implementation(MchWithAConstants_i))==(Type(opMchWithAConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithAConstants_i)) == (max_countConcrete | ? | ? | ? | opMchWithAConstants | ? | ? | ? | MchWithAConstants_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithAConstants_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithAConstants_i)) == (max_countConcrete);
  List_Of_VisibleVar_Ids(Implementation(MchWithAConstants_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(MchWithAConstants_i)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(MchWithAConstants_i)) == (Type(max_countConcrete) == Cst(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(MchWithAConstants_i))==(?)
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
  TypingPredicate(Implementation(MchWithAConstants_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
