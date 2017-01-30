Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(DET_MCH_WHILE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(DET_MCH_WHILE))==(Machine(DET_MCH_WHILE));
  Level(Machine(DET_MCH_WHILE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(DET_MCH_WHILE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(DET_MCH_WHILE))==(?);
  List_Includes(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(DET_MCH_WHILE))==(?);
  Context_List_Variables(Machine(DET_MCH_WHILE))==(?);
  Abstract_List_Variables(Machine(DET_MCH_WHILE))==(?);
  Local_List_Variables(Machine(DET_MCH_WHILE))==(?);
  List_Variables(Machine(DET_MCH_WHILE))==(?);
  External_List_Variables(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(DET_MCH_WHILE))==(?);
  Abstract_List_VisibleVariables(Machine(DET_MCH_WHILE))==(?);
  External_List_VisibleVariables(Machine(DET_MCH_WHILE))==(?);
  Expanded_List_VisibleVariables(Machine(DET_MCH_WHILE))==(?);
  List_VisibleVariables(Machine(DET_MCH_WHILE))==(?);
  Internal_List_VisibleVariables(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(DET_MCH_WHILE))==(btrue);
  Gluing_List_Invariant(Machine(DET_MCH_WHILE))==(btrue);
  Expanded_List_Invariant(Machine(DET_MCH_WHILE))==(btrue);
  Abstract_List_Invariant(Machine(DET_MCH_WHILE))==(btrue);
  Context_List_Invariant(Machine(DET_MCH_WHILE))==(btrue);
  List_Invariant(Machine(DET_MCH_WHILE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(DET_MCH_WHILE))==(btrue);
  Abstract_List_Assertions(Machine(DET_MCH_WHILE))==(btrue);
  Context_List_Assertions(Machine(DET_MCH_WHILE))==(btrue);
  List_Assertions(Machine(DET_MCH_WHILE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(DET_MCH_WHILE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(DET_MCH_WHILE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(DET_MCH_WHILE))==(skip);
  Context_List_Initialisation(Machine(DET_MCH_WHILE))==(skip);
  List_Initialisation(Machine(DET_MCH_WHILE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(DET_MCH_WHILE))==(btrue);
  List_Constraints(Machine(DET_MCH_WHILE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(DET_MCH_WHILE))==(opDET_MCH_WHILE);
  List_Operations(Machine(DET_MCH_WHILE))==(opDET_MCH_WHILE)
END
&
THEORY ListInputX IS
  List_Input(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(res <-- opDET_MCH_WHILE(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(nn: NAT | res:=nn);
  List_Substitution(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(res:=nn)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(DET_MCH_WHILE))==(?);
  Inherited_List_Constants(Machine(DET_MCH_WHILE))==(?);
  List_Constants(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(DET_MCH_WHILE))==(?);
  Context_List_Defered(Machine(DET_MCH_WHILE))==(?);
  Context_List_Sets(Machine(DET_MCH_WHILE))==(?);
  List_Valuable_Sets(Machine(DET_MCH_WHILE))==(?);
  Inherited_List_Enumerated(Machine(DET_MCH_WHILE))==(?);
  Inherited_List_Defered(Machine(DET_MCH_WHILE))==(?);
  Inherited_List_Sets(Machine(DET_MCH_WHILE))==(?);
  List_Enumerated(Machine(DET_MCH_WHILE))==(?);
  List_Defered(Machine(DET_MCH_WHILE))==(?);
  List_Sets(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(DET_MCH_WHILE))==(?);
  Expanded_List_HiddenConstants(Machine(DET_MCH_WHILE))==(?);
  List_HiddenConstants(Machine(DET_MCH_WHILE))==(?);
  External_List_HiddenConstants(Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(DET_MCH_WHILE))==(btrue);
  Context_List_Properties(Machine(DET_MCH_WHILE))==(btrue);
  Inherited_List_Properties(Machine(DET_MCH_WHILE))==(btrue);
  List_Properties(Machine(DET_MCH_WHILE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(DET_MCH_WHILE),opDET_MCH_WHILE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(DET_MCH_WHILE)) == (? | ? | ? | ? | opDET_MCH_WHILE | ? | ? | ? | DET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(DET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(DET_MCH_WHILE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(DET_MCH_WHILE)) == (Type(opDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(DET_MCH_WHILE)) == (Type(opDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
