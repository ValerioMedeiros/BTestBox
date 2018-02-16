Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithPromotes))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithPromotes))==(Machine(MchWithPromotes));
  Level(Machine(MchWithPromotes))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithPromotes)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithPromotes))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithPromotes))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithPromotes))==(MchToExtend);
  List_Includes(Machine(MchWithPromotes))==(MchToExtend)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithPromotes))==(Inc,Dec)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithPromotes))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithPromotes))==(?);
  Context_List_Variables(Machine(MchWithPromotes))==(?);
  Abstract_List_Variables(Machine(MchWithPromotes))==(?);
  Local_List_Variables(Machine(MchWithPromotes))==(?);
  List_Variables(Machine(MchWithPromotes))==(?);
  External_List_Variables(Machine(MchWithPromotes))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithPromotes))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithPromotes))==(?);
  External_List_VisibleVariables(Machine(MchWithPromotes))==(count);
  Expanded_List_VisibleVariables(Machine(MchWithPromotes))==(count);
  List_VisibleVariables(Machine(MchWithPromotes))==(?);
  Internal_List_VisibleVariables(Machine(MchWithPromotes))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithPromotes))==(btrue);
  Gluing_List_Invariant(Machine(MchWithPromotes))==(btrue);
  Abstract_List_Invariant(Machine(MchWithPromotes))==(btrue);
  Expanded_List_Invariant(Machine(MchWithPromotes))==(count: NAT);
  Context_List_Invariant(Machine(MchWithPromotes))==(btrue);
  List_Invariant(Machine(MchWithPromotes))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(MchWithPromotes))==(btrue);
  Expanded_List_Assertions(Machine(MchWithPromotes))==(btrue);
  Context_List_Assertions(Machine(MchWithPromotes))==(btrue);
  List_Assertions(Machine(MchWithPromotes))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithPromotes))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithPromotes))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithPromotes))==(count:=0);
  Context_List_Initialisation(Machine(MchWithPromotes))==(skip);
  List_Initialisation(Machine(MchWithPromotes))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithPromotes))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(MchWithPromotes),Machine(MchToExtend))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(MchWithPromotes),Machine(MchToExtend))==(btrue);
  List_Context_Constraints(Machine(MchWithPromotes))==(btrue);
  List_Constraints(Machine(MchWithPromotes))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithPromotes))==(Inc,Dec);
  List_Operations(Machine(MchWithPromotes))==(Inc,Dec)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithPromotes),Dec)==(nn);
  List_Input(Machine(MchWithPromotes),Inc)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithPromotes),Dec)==(?);
  List_Output(Machine(MchWithPromotes),Inc)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithPromotes),Dec)==(Dec(nn));
  List_Header(Machine(MchWithPromotes),Inc)==(Inc(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(MchWithPromotes),Dec)==(nn: NAT & count-nn>=0);
  List_Precondition(Machine(MchWithPromotes),Dec)==(nn: NAT & count-nn>=0);
  Own_Precondition(Machine(MchWithPromotes),Inc)==(nn: NAT & count+nn<50);
  List_Precondition(Machine(MchWithPromotes),Inc)==(nn: NAT & count+nn<50)
END
&
THEORY ListSubstitutionX IS
  List_Substitution(Machine(MchWithPromotes),Dec)==(count:=count-nn);
  Expanded_List_Substitution(Machine(MchWithPromotes),Dec)==(nn: NAT & count-nn>=0 | count:=count-nn);
  List_Substitution(Machine(MchWithPromotes),Inc)==(count:=count+nn);
  Expanded_List_Substitution(Machine(MchWithPromotes),Inc)==(nn: NAT & count+nn<50 | count:=count+nn)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithPromotes))==(?);
  Inherited_List_Constants(Machine(MchWithPromotes))==(?);
  List_Constants(Machine(MchWithPromotes))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithPromotes))==(?);
  Context_List_Defered(Machine(MchWithPromotes))==(?);
  Context_List_Sets(Machine(MchWithPromotes))==(?);
  List_Valuable_Sets(Machine(MchWithPromotes))==(?);
  Inherited_List_Enumerated(Machine(MchWithPromotes))==(?);
  Inherited_List_Defered(Machine(MchWithPromotes))==(?);
  Inherited_List_Sets(Machine(MchWithPromotes))==(?);
  List_Enumerated(Machine(MchWithPromotes))==(?);
  List_Defered(Machine(MchWithPromotes))==(?);
  List_Sets(Machine(MchWithPromotes))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithPromotes))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithPromotes))==(?);
  List_HiddenConstants(Machine(MchWithPromotes))==(?);
  External_List_HiddenConstants(Machine(MchWithPromotes))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithPromotes))==(btrue);
  Context_List_Properties(Machine(MchWithPromotes))==(btrue);
  Inherited_List_Properties(Machine(MchWithPromotes))==(btrue);
  List_Properties(Machine(MchWithPromotes))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithPromotes),Dec)==(?);
  List_ANY_Var(Machine(MchWithPromotes),Inc)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithPromotes)) == (? | ? | ? | V | ? | Inc,Dec | included(Machine(MchToExtend)) | ? | MchWithPromotes);
  List_Of_HiddenCst_Ids(Machine(MchWithPromotes)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithPromotes)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchWithPromotes)) == (? | count);
  List_Of_Ids_SeenBNU(Machine(MchWithPromotes)) == (?: ?);
  List_Of_Ids(Machine(MchToExtend)) == (? | ? | ? | ? | Inc,Dec,RandomInc | ? | ? | ? | MchToExtend);
  List_Of_HiddenCst_Ids(Machine(MchToExtend)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchToExtend)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchToExtend)) == (count | ?);
  List_Of_Ids_SeenBNU(Machine(MchToExtend)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(MchWithPromotes)) == (Type(count) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithPromotes)) == (Type(Inc) == Cst(No_type,btype(INTEGER,?,?));Type(Dec) == Cst(No_type,btype(INTEGER,?,?)))
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
