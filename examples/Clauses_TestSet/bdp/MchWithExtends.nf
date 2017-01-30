Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithExtends))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithExtends))==(Machine(MchWithExtends));
  Level(Machine(MchWithExtends))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithExtends)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithExtends))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithExtends))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithExtends))==(MchToExtend);
  List_Includes(Machine(MchWithExtends))==(MchToExtend)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithExtends))==(Inc,Dec)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithExtends))==(MchToExtend)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithExtends))==(?);
  Context_List_Variables(Machine(MchWithExtends))==(?);
  Abstract_List_Variables(Machine(MchWithExtends))==(?);
  Local_List_Variables(Machine(MchWithExtends))==(?);
  List_Variables(Machine(MchWithExtends))==(?);
  External_List_Variables(Machine(MchWithExtends))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithExtends))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithExtends))==(?);
  External_List_VisibleVariables(Machine(MchWithExtends))==(count);
  Expanded_List_VisibleVariables(Machine(MchWithExtends))==(count);
  List_VisibleVariables(Machine(MchWithExtends))==(?);
  Internal_List_VisibleVariables(Machine(MchWithExtends))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithExtends))==(btrue);
  Gluing_List_Invariant(Machine(MchWithExtends))==(btrue);
  Abstract_List_Invariant(Machine(MchWithExtends))==(btrue);
  Expanded_List_Invariant(Machine(MchWithExtends))==(count: NAT);
  Context_List_Invariant(Machine(MchWithExtends))==(btrue);
  List_Invariant(Machine(MchWithExtends))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(MchWithExtends))==(btrue);
  Expanded_List_Assertions(Machine(MchWithExtends))==(btrue);
  Context_List_Assertions(Machine(MchWithExtends))==(btrue);
  List_Assertions(Machine(MchWithExtends))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithExtends))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithExtends))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithExtends))==(count:=0);
  Context_List_Initialisation(Machine(MchWithExtends))==(skip);
  List_Initialisation(Machine(MchWithExtends))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithExtends))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(MchWithExtends),Machine(MchToExtend))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(MchWithExtends),Machine(MchToExtend))==(btrue);
  List_Context_Constraints(Machine(MchWithExtends))==(btrue);
  List_Constraints(Machine(MchWithExtends))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithExtends))==(Inc,Dec);
  List_Operations(Machine(MchWithExtends))==(Inc,Dec)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithExtends),Dec)==(nn);
  List_Input(Machine(MchWithExtends),Inc)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithExtends),Dec)==(?);
  List_Output(Machine(MchWithExtends),Inc)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithExtends),Dec)==(Dec(nn));
  List_Header(Machine(MchWithExtends),Inc)==(Inc(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(MchWithExtends),Dec)==(nn: NAT & count-nn>=0);
  List_Precondition(Machine(MchWithExtends),Dec)==(nn: NAT & count-nn>=0);
  Own_Precondition(Machine(MchWithExtends),Inc)==(nn: NAT & count+nn<50);
  List_Precondition(Machine(MchWithExtends),Inc)==(nn: NAT & count+nn<50)
END
&
THEORY ListSubstitutionX IS
  List_Substitution(Machine(MchWithExtends),Dec)==(count:=count-nn);
  Expanded_List_Substitution(Machine(MchWithExtends),Dec)==(nn: NAT & count-nn>=0 | count:=count-nn);
  List_Substitution(Machine(MchWithExtends),Inc)==(count:=count+nn);
  Expanded_List_Substitution(Machine(MchWithExtends),Inc)==(nn: NAT & count+nn<50 | count:=count+nn)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithExtends))==(?);
  Inherited_List_Constants(Machine(MchWithExtends))==(?);
  List_Constants(Machine(MchWithExtends))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithExtends))==(?);
  Context_List_Defered(Machine(MchWithExtends))==(?);
  Context_List_Sets(Machine(MchWithExtends))==(?);
  List_Valuable_Sets(Machine(MchWithExtends))==(?);
  Inherited_List_Enumerated(Machine(MchWithExtends))==(?);
  Inherited_List_Defered(Machine(MchWithExtends))==(?);
  Inherited_List_Sets(Machine(MchWithExtends))==(?);
  List_Enumerated(Machine(MchWithExtends))==(?);
  List_Defered(Machine(MchWithExtends))==(?);
  List_Sets(Machine(MchWithExtends))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithExtends))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithExtends))==(?);
  List_HiddenConstants(Machine(MchWithExtends))==(?);
  External_List_HiddenConstants(Machine(MchWithExtends))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithExtends))==(btrue);
  Context_List_Properties(Machine(MchWithExtends))==(btrue);
  Inherited_List_Properties(Machine(MchWithExtends))==(btrue);
  List_Properties(Machine(MchWithExtends))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithExtends),Dec)==(?);
  List_ANY_Var(Machine(MchWithExtends),Inc)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithExtends)) == (? | ? | ? | V | ? | Inc,Dec | included(Machine(MchToExtend)) | ? | MchWithExtends);
  List_Of_HiddenCst_Ids(Machine(MchWithExtends)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithExtends)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchWithExtends)) == (? | count);
  List_Of_Ids_SeenBNU(Machine(MchWithExtends)) == (?: ?);
  List_Of_Ids(Machine(MchToExtend)) == (? | ? | ? | ? | Inc,Dec | ? | ? | ? | MchToExtend);
  List_Of_HiddenCst_Ids(Machine(MchToExtend)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchToExtend)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchToExtend)) == (count | ?);
  List_Of_Ids_SeenBNU(Machine(MchToExtend)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(MchWithExtends)) == (Type(count) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithExtends)) == (Type(Inc) == Cst(No_type,btype(INTEGER,?,?));Type(Dec) == Cst(No_type,btype(INTEGER,?,?)))
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
)
