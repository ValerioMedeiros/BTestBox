Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithExtends_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithExtends_i))==(Machine(MchWithExtends));
  Level(Implementation(MchWithExtends_i))==(1);
  Upper_Level(Implementation(MchWithExtends_i))==(Machine(MchWithExtends))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithExtends_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithExtends_i))==(MchToExtend);
  Inherited_List_Includes(Implementation(MchWithExtends_i))==(MchToExtend)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithExtends_i))==(Inc,Dec)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithExtends_i))==(MchToExtend)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithExtends_i))==(?);
  Context_List_Variables(Implementation(MchWithExtends_i))==(?);
  Abstract_List_Variables(Implementation(MchWithExtends_i))==(?);
  Local_List_Variables(Implementation(MchWithExtends_i))==(?);
  List_Variables(Implementation(MchWithExtends_i))==(?);
  External_List_Variables(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithExtends_i))==(count);
  Abstract_List_VisibleVariables(Implementation(MchWithExtends_i))==(count);
  External_List_VisibleVariables(Implementation(MchWithExtends_i))==(count);
  Expanded_List_VisibleVariables(Implementation(MchWithExtends_i))==(count);
  List_VisibleVariables(Implementation(MchWithExtends_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithExtends_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithExtends_i))==(count: NAT);
  Expanded_List_Invariant(Implementation(MchWithExtends_i))==(count: NAT);
  Context_List_Invariant(Implementation(MchWithExtends_i))==(btrue);
  List_Invariant(Implementation(MchWithExtends_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(MchWithExtends_i))==(btrue);
  Expanded_List_Assertions(Implementation(MchWithExtends_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithExtends_i))==(btrue);
  List_Assertions(Implementation(MchWithExtends_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithExtends_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithExtends_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithExtends_i))==(count:=0);
  Context_List_Initialisation(Implementation(MchWithExtends_i))==(skip);
  List_Initialisation(Implementation(MchWithExtends_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(MchWithExtends_i),Machine(MchToExtend))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithExtends_i),Machine(MchToExtend))==(btrue);
  List_Constraints(Implementation(MchWithExtends_i))==(btrue);
  List_Context_Constraints(Implementation(MchWithExtends_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithExtends_i))==(Inc,Dec);
  List_Operations(Implementation(MchWithExtends_i))==(Inc,Dec)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithExtends_i),Dec)==(nn);
  List_Input(Implementation(MchWithExtends_i),Inc)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithExtends_i),Dec)==(?);
  List_Output(Implementation(MchWithExtends_i),Inc)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithExtends_i),Dec)==(Dec(nn));
  List_Header(Implementation(MchWithExtends_i),Inc)==(Inc(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithExtends_i),Dec)==(nn: NAT & count-nn>=0);
  List_Precondition(Implementation(MchWithExtends_i),Dec)==(nn: NAT & count-nn>=0);
  Own_Precondition(Implementation(MchWithExtends_i),Inc)==(nn: NAT & count+nn<50);
  List_Precondition(Implementation(MchWithExtends_i),Inc)==(nn: NAT & count+nn<50)
END
&
THEORY ListSubstitutionX IS
  List_Substitution(Implementation(MchWithExtends_i),Dec)==(count:=count-nn);
  Expanded_List_Substitution(Implementation(MchWithExtends_i),Dec)==(nn: NAT & count-nn>=0 | count:=count-nn);
  List_Substitution(Implementation(MchWithExtends_i),Inc)==(count:=count+nn);
  Expanded_List_Substitution(Implementation(MchWithExtends_i),Inc)==(nn: NAT & count+nn<50 | count:=count+nn)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithExtends_i))==(?);
  Inherited_List_Constants(Implementation(MchWithExtends_i))==(?);
  List_Constants(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchWithExtends_i))==(?);
  Context_List_Defered(Implementation(MchWithExtends_i))==(?);
  Context_List_Sets(Implementation(MchWithExtends_i))==(?);
  List_Own_Enumerated(Implementation(MchWithExtends_i))==(?);
  List_Valuable_Sets(Implementation(MchWithExtends_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithExtends_i))==(?);
  Inherited_List_Defered(Implementation(MchWithExtends_i))==(?);
  Inherited_List_Sets(Implementation(MchWithExtends_i))==(?);
  List_Enumerated(Implementation(MchWithExtends_i))==(?);
  List_Defered(Implementation(MchWithExtends_i))==(?);
  List_Sets(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithExtends_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchWithExtends_i))==(?);
  List_HiddenConstants(Implementation(MchWithExtends_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithExtends_i))==(btrue);
  Context_List_Properties(Implementation(MchWithExtends_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithExtends_i))==(btrue);
  List_Properties(Implementation(MchWithExtends_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(MchWithExtends_i))==(aa: aa);
  List_Values(Implementation(MchWithExtends_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(MchWithExtends_i),Machine(MchToExtend))==(Inc,Dec)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(MchWithExtends_i))==(Type(Inc) == Cst(No_type,btype(INTEGER,?,?));Type(Dec) == Cst(No_type,btype(INTEGER,?,?)));
  VisibleVariables(Implementation(MchWithExtends_i))==(Type(count) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithExtends_i)) == (? | ? | ? | ? | ? | ? | imported(Machine(MchToExtend)) | ? | MchWithExtends_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithExtends_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithExtends_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchWithExtends_i)) == (? | count);
  List_Of_Ids_SeenBNU(Implementation(MchWithExtends_i)) == (?: ?);
  List_Of_Ids(Machine(MchToExtend)) == (? | ? | ? | ? | Inc,Dec | ? | ? | ? | MchToExtend);
  List_Of_HiddenCst_Ids(Machine(MchToExtend)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchToExtend)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchToExtend)) == (count | ?);
  List_Of_Ids_SeenBNU(Machine(MchToExtend)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(MchWithExtends_i)) == (Type(count) == Mvv(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(MchWithExtends_i))==(?)
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
  TypingPredicate(Implementation(MchWithExtends_i))==(count: INTEGER)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(MchWithExtends_i),Machine(MchToExtend))==(?);
  ImportedVisVariablesList(Implementation(MchWithExtends_i),Machine(MchToExtend))==(count)
END
&
THEORY ListLocalOpInvariantX END
)
