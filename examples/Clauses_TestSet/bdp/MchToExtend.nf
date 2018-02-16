Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchToExtend))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchToExtend))==(Machine(MchToExtend));
  Level(Machine(MchToExtend))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchToExtend)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchToExtend))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchToExtend))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchToExtend))==(?);
  List_Includes(Machine(MchToExtend))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchToExtend))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchToExtend))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchToExtend))==(?);
  Context_List_Variables(Machine(MchToExtend))==(?);
  Abstract_List_Variables(Machine(MchToExtend))==(?);
  Local_List_Variables(Machine(MchToExtend))==(?);
  List_Variables(Machine(MchToExtend))==(?);
  External_List_Variables(Machine(MchToExtend))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchToExtend))==(?);
  Abstract_List_VisibleVariables(Machine(MchToExtend))==(?);
  External_List_VisibleVariables(Machine(MchToExtend))==(?);
  Expanded_List_VisibleVariables(Machine(MchToExtend))==(?);
  List_VisibleVariables(Machine(MchToExtend))==(count);
  Internal_List_VisibleVariables(Machine(MchToExtend))==(count)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchToExtend))==(btrue);
  Gluing_List_Invariant(Machine(MchToExtend))==(btrue);
  Expanded_List_Invariant(Machine(MchToExtend))==(btrue);
  Abstract_List_Invariant(Machine(MchToExtend))==(btrue);
  Context_List_Invariant(Machine(MchToExtend))==(btrue);
  List_Invariant(Machine(MchToExtend))==(count: NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchToExtend))==(btrue);
  Abstract_List_Assertions(Machine(MchToExtend))==(btrue);
  Context_List_Assertions(Machine(MchToExtend))==(btrue);
  List_Assertions(Machine(MchToExtend))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchToExtend))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchToExtend))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchToExtend))==(count:=0);
  Context_List_Initialisation(Machine(MchToExtend))==(skip);
  List_Initialisation(Machine(MchToExtend))==(count:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchToExtend))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchToExtend))==(btrue);
  List_Constraints(Machine(MchToExtend))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchToExtend))==(Inc,Dec,RandomInc);
  List_Operations(Machine(MchToExtend))==(Inc,Dec,RandomInc)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchToExtend),Inc)==(nn);
  List_Input(Machine(MchToExtend),Dec)==(nn);
  List_Input(Machine(MchToExtend),RandomInc)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchToExtend),Inc)==(?);
  List_Output(Machine(MchToExtend),Dec)==(?);
  List_Output(Machine(MchToExtend),RandomInc)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchToExtend),Inc)==(Inc(nn));
  List_Header(Machine(MchToExtend),Dec)==(Dec(nn));
  List_Header(Machine(MchToExtend),RandomInc)==(RandomInc)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchToExtend),Inc)==(nn: NAT & count+nn<50);
  List_Precondition(Machine(MchToExtend),Dec)==(nn: NAT & count-nn>=0);
  List_Precondition(Machine(MchToExtend),RandomInc)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchToExtend),RandomInc)==(btrue | @nn.(nn: 0..50-count ==> count:=count+nn));
  Expanded_List_Substitution(Machine(MchToExtend),Dec)==(nn: NAT & count-nn>=0 | count:=count-nn);
  Expanded_List_Substitution(Machine(MchToExtend),Inc)==(nn: NAT & count+nn<50 | count:=count+nn);
  List_Substitution(Machine(MchToExtend),Inc)==(count:=count+nn);
  List_Substitution(Machine(MchToExtend),Dec)==(count:=count-nn);
  List_Substitution(Machine(MchToExtend),RandomInc)==(ANY nn WHERE nn: 0..50-count THEN count:=count+nn END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchToExtend))==(?);
  Inherited_List_Constants(Machine(MchToExtend))==(?);
  List_Constants(Machine(MchToExtend))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchToExtend))==(?);
  Context_List_Defered(Machine(MchToExtend))==(?);
  Context_List_Sets(Machine(MchToExtend))==(?);
  List_Valuable_Sets(Machine(MchToExtend))==(?);
  Inherited_List_Enumerated(Machine(MchToExtend))==(?);
  Inherited_List_Defered(Machine(MchToExtend))==(?);
  Inherited_List_Sets(Machine(MchToExtend))==(?);
  List_Enumerated(Machine(MchToExtend))==(?);
  List_Defered(Machine(MchToExtend))==(?);
  List_Sets(Machine(MchToExtend))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchToExtend))==(?);
  Expanded_List_HiddenConstants(Machine(MchToExtend))==(?);
  List_HiddenConstants(Machine(MchToExtend))==(?);
  External_List_HiddenConstants(Machine(MchToExtend))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchToExtend))==(btrue);
  Context_List_Properties(Machine(MchToExtend))==(btrue);
  Inherited_List_Properties(Machine(MchToExtend))==(btrue);
  List_Properties(Machine(MchToExtend))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchToExtend),Inc)==(?);
  List_ANY_Var(Machine(MchToExtend),Dec)==(?);
  List_ANY_Var(Machine(MchToExtend),RandomInc)==(Var(nn) == btype(INTEGER,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchToExtend)) == (? | ? | ? | ? | Inc,Dec,RandomInc | ? | ? | ? | MchToExtend);
  List_Of_HiddenCst_Ids(Machine(MchToExtend)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchToExtend)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchToExtend)) == (count | ?);
  List_Of_Ids_SeenBNU(Machine(MchToExtend)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(MchToExtend)) == (Type(count) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchToExtend)) == (Type(RandomInc) == Cst(No_type,No_type);Type(Dec) == Cst(No_type,btype(INTEGER,?,?));Type(Inc) == Cst(No_type,btype(INTEGER,?,?)))
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
