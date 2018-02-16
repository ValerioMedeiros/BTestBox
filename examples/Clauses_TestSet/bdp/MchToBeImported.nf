Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchToBeImported))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchToBeImported))==(Machine(MchToBeImported));
  Level(Machine(MchToBeImported))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchToBeImported)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchToBeImported))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchToBeImported))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchToBeImported))==(?);
  List_Includes(Machine(MchToBeImported))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchToBeImported))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchToBeImported))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchToBeImported))==(?);
  Context_List_Variables(Machine(MchToBeImported))==(?);
  Abstract_List_Variables(Machine(MchToBeImported))==(?);
  Local_List_Variables(Machine(MchToBeImported))==(count);
  List_Variables(Machine(MchToBeImported))==(count);
  External_List_Variables(Machine(MchToBeImported))==(count)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchToBeImported))==(?);
  Abstract_List_VisibleVariables(Machine(MchToBeImported))==(?);
  External_List_VisibleVariables(Machine(MchToBeImported))==(?);
  Expanded_List_VisibleVariables(Machine(MchToBeImported))==(?);
  List_VisibleVariables(Machine(MchToBeImported))==(?);
  Internal_List_VisibleVariables(Machine(MchToBeImported))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchToBeImported))==(btrue);
  Gluing_List_Invariant(Machine(MchToBeImported))==(btrue);
  Expanded_List_Invariant(Machine(MchToBeImported))==(btrue);
  Abstract_List_Invariant(Machine(MchToBeImported))==(btrue);
  Context_List_Invariant(Machine(MchToBeImported))==(btrue);
  List_Invariant(Machine(MchToBeImported))==(count: NAT & count<=10)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchToBeImported))==(btrue);
  Abstract_List_Assertions(Machine(MchToBeImported))==(btrue);
  Context_List_Assertions(Machine(MchToBeImported))==(btrue);
  List_Assertions(Machine(MchToBeImported))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchToBeImported))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchToBeImported))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchToBeImported))==(count:=0);
  Context_List_Initialisation(Machine(MchToBeImported))==(skip);
  List_Initialisation(Machine(MchToBeImported))==(count:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchToBeImported))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchToBeImported))==(btrue);
  List_Constraints(Machine(MchToBeImported))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchToBeImported))==(Inc,Dec);
  List_Operations(Machine(MchToBeImported))==(Inc,Dec)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchToBeImported),Inc)==(nn);
  List_Input(Machine(MchToBeImported),Dec)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchToBeImported),Inc)==(?);
  List_Output(Machine(MchToBeImported),Dec)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchToBeImported),Inc)==(Inc(nn));
  List_Header(Machine(MchToBeImported),Dec)==(Dec(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchToBeImported),Inc)==(nn: NAT & count+nn<=10);
  List_Precondition(Machine(MchToBeImported),Dec)==(nn: NAT & count-nn>=0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchToBeImported),Dec)==(nn: NAT & count-nn>=0 | count:=count-nn);
  Expanded_List_Substitution(Machine(MchToBeImported),Inc)==(nn: NAT & count+nn<=10 | count:=count+nn);
  List_Substitution(Machine(MchToBeImported),Inc)==(count:=count+nn);
  List_Substitution(Machine(MchToBeImported),Dec)==(count:=count-nn)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchToBeImported))==(?);
  Inherited_List_Constants(Machine(MchToBeImported))==(?);
  List_Constants(Machine(MchToBeImported))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchToBeImported))==(?);
  Context_List_Defered(Machine(MchToBeImported))==(?);
  Context_List_Sets(Machine(MchToBeImported))==(?);
  List_Valuable_Sets(Machine(MchToBeImported))==(?);
  Inherited_List_Enumerated(Machine(MchToBeImported))==(?);
  Inherited_List_Defered(Machine(MchToBeImported))==(?);
  Inherited_List_Sets(Machine(MchToBeImported))==(?);
  List_Enumerated(Machine(MchToBeImported))==(?);
  List_Defered(Machine(MchToBeImported))==(?);
  List_Sets(Machine(MchToBeImported))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchToBeImported))==(?);
  Expanded_List_HiddenConstants(Machine(MchToBeImported))==(?);
  List_HiddenConstants(Machine(MchToBeImported))==(?);
  External_List_HiddenConstants(Machine(MchToBeImported))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchToBeImported))==(btrue);
  Context_List_Properties(Machine(MchToBeImported))==(btrue);
  Inherited_List_Properties(Machine(MchToBeImported))==(btrue);
  List_Properties(Machine(MchToBeImported))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchToBeImported),Inc)==(?);
  List_ANY_Var(Machine(MchToBeImported),Dec)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchToBeImported)) == (? | ? | count | ? | Inc,Dec | ? | ? | ? | MchToBeImported);
  List_Of_HiddenCst_Ids(Machine(MchToBeImported)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchToBeImported)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchToBeImported)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchToBeImported)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(MchToBeImported)) == (Type(count) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchToBeImported)) == (Type(Dec) == Cst(No_type,btype(INTEGER,?,?));Type(Inc) == Cst(No_type,btype(INTEGER,?,?)))
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
