Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(OC_WHILE_CHOICE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(OC_WHILE_CHOICE))==(Machine(OC_WHILE_CHOICE));
  Level(Machine(OC_WHILE_CHOICE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(OC_WHILE_CHOICE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(OC_WHILE_CHOICE))==(?);
  List_Includes(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(OC_WHILE_CHOICE))==(?);
  Context_List_Variables(Machine(OC_WHILE_CHOICE))==(?);
  Abstract_List_Variables(Machine(OC_WHILE_CHOICE))==(?);
  Local_List_Variables(Machine(OC_WHILE_CHOICE))==(?);
  List_Variables(Machine(OC_WHILE_CHOICE))==(?);
  External_List_Variables(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(OC_WHILE_CHOICE))==(?);
  Abstract_List_VisibleVariables(Machine(OC_WHILE_CHOICE))==(?);
  External_List_VisibleVariables(Machine(OC_WHILE_CHOICE))==(?);
  Expanded_List_VisibleVariables(Machine(OC_WHILE_CHOICE))==(?);
  List_VisibleVariables(Machine(OC_WHILE_CHOICE))==(?);
  Internal_List_VisibleVariables(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(OC_WHILE_CHOICE))==(btrue);
  Gluing_List_Invariant(Machine(OC_WHILE_CHOICE))==(btrue);
  Expanded_List_Invariant(Machine(OC_WHILE_CHOICE))==(btrue);
  Abstract_List_Invariant(Machine(OC_WHILE_CHOICE))==(btrue);
  Context_List_Invariant(Machine(OC_WHILE_CHOICE))==(btrue);
  List_Invariant(Machine(OC_WHILE_CHOICE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(OC_WHILE_CHOICE))==(btrue);
  Abstract_List_Assertions(Machine(OC_WHILE_CHOICE))==(btrue);
  Context_List_Assertions(Machine(OC_WHILE_CHOICE))==(btrue);
  List_Assertions(Machine(OC_WHILE_CHOICE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(OC_WHILE_CHOICE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(OC_WHILE_CHOICE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(OC_WHILE_CHOICE))==(skip);
  Context_List_Initialisation(Machine(OC_WHILE_CHOICE))==(skip);
  List_Initialisation(Machine(OC_WHILE_CHOICE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(OC_WHILE_CHOICE))==(btrue);
  List_Constraints(Machine(OC_WHILE_CHOICE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(OC_WHILE_CHOICE))==(opOC_WHILE_CHOICE);
  List_Operations(Machine(OC_WHILE_CHOICE))==(opOC_WHILE_CHOICE)
END
&
THEORY ListInputX IS
  List_Input(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(res <-- opOC_WHILE_CHOICE(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(nn: NAT | res:=nn [] res:=0);
  List_Substitution(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(CHOICE res:=nn OR res:=0 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(OC_WHILE_CHOICE))==(?);
  Inherited_List_Constants(Machine(OC_WHILE_CHOICE))==(?);
  List_Constants(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(OC_WHILE_CHOICE))==(?);
  Context_List_Defered(Machine(OC_WHILE_CHOICE))==(?);
  Context_List_Sets(Machine(OC_WHILE_CHOICE))==(?);
  List_Valuable_Sets(Machine(OC_WHILE_CHOICE))==(?);
  Inherited_List_Enumerated(Machine(OC_WHILE_CHOICE))==(?);
  Inherited_List_Defered(Machine(OC_WHILE_CHOICE))==(?);
  Inherited_List_Sets(Machine(OC_WHILE_CHOICE))==(?);
  List_Enumerated(Machine(OC_WHILE_CHOICE))==(?);
  List_Defered(Machine(OC_WHILE_CHOICE))==(?);
  List_Sets(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(OC_WHILE_CHOICE))==(?);
  Expanded_List_HiddenConstants(Machine(OC_WHILE_CHOICE))==(?);
  List_HiddenConstants(Machine(OC_WHILE_CHOICE))==(?);
  External_List_HiddenConstants(Machine(OC_WHILE_CHOICE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(OC_WHILE_CHOICE))==(btrue);
  Context_List_Properties(Machine(OC_WHILE_CHOICE))==(btrue);
  Inherited_List_Properties(Machine(OC_WHILE_CHOICE))==(btrue);
  List_Properties(Machine(OC_WHILE_CHOICE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(OC_WHILE_CHOICE),opOC_WHILE_CHOICE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(OC_WHILE_CHOICE)) == (? | ? | ? | ? | opOC_WHILE_CHOICE | ? | ? | ? | OC_WHILE_CHOICE);
  List_Of_HiddenCst_Ids(Machine(OC_WHILE_CHOICE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(OC_WHILE_CHOICE)) == (?);
  List_Of_VisibleVar_Ids(Machine(OC_WHILE_CHOICE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(OC_WHILE_CHOICE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(OC_WHILE_CHOICE)) == (Type(opOC_WHILE_CHOICE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(OC_WHILE_CHOICE)) == (Type(opOC_WHILE_CHOICE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
