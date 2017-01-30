Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(NONDET_MCH_WHILE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(NONDET_MCH_WHILE))==(Machine(NONDET_MCH_WHILE));
  Level(Machine(NONDET_MCH_WHILE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(NONDET_MCH_WHILE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(NONDET_MCH_WHILE))==(?);
  List_Includes(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(NONDET_MCH_WHILE))==(?);
  Context_List_Variables(Machine(NONDET_MCH_WHILE))==(?);
  Abstract_List_Variables(Machine(NONDET_MCH_WHILE))==(?);
  Local_List_Variables(Machine(NONDET_MCH_WHILE))==(?);
  List_Variables(Machine(NONDET_MCH_WHILE))==(?);
  External_List_Variables(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(NONDET_MCH_WHILE))==(?);
  Abstract_List_VisibleVariables(Machine(NONDET_MCH_WHILE))==(?);
  External_List_VisibleVariables(Machine(NONDET_MCH_WHILE))==(?);
  Expanded_List_VisibleVariables(Machine(NONDET_MCH_WHILE))==(?);
  List_VisibleVariables(Machine(NONDET_MCH_WHILE))==(?);
  Internal_List_VisibleVariables(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(NONDET_MCH_WHILE))==(btrue);
  Gluing_List_Invariant(Machine(NONDET_MCH_WHILE))==(btrue);
  Expanded_List_Invariant(Machine(NONDET_MCH_WHILE))==(btrue);
  Abstract_List_Invariant(Machine(NONDET_MCH_WHILE))==(btrue);
  Context_List_Invariant(Machine(NONDET_MCH_WHILE))==(btrue);
  List_Invariant(Machine(NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(NONDET_MCH_WHILE))==(btrue);
  Abstract_List_Assertions(Machine(NONDET_MCH_WHILE))==(btrue);
  Context_List_Assertions(Machine(NONDET_MCH_WHILE))==(btrue);
  List_Assertions(Machine(NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(NONDET_MCH_WHILE))==(skip);
  Context_List_Initialisation(Machine(NONDET_MCH_WHILE))==(skip);
  List_Initialisation(Machine(NONDET_MCH_WHILE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(NONDET_MCH_WHILE))==(btrue);
  List_Constraints(Machine(NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(NONDET_MCH_WHILE))==(opNONDET_MCH_WHILE);
  List_Operations(Machine(NONDET_MCH_WHILE))==(opNONDET_MCH_WHILE)
END
&
THEORY ListInputX IS
  List_Input(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(res <-- opNONDET_MCH_WHILE(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(xx: NAT | res:=xx [] res:=xx);
  List_Substitution(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(CHOICE res:=xx OR res:=xx END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(NONDET_MCH_WHILE))==(?);
  Inherited_List_Constants(Machine(NONDET_MCH_WHILE))==(?);
  List_Constants(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(NONDET_MCH_WHILE))==(?);
  Context_List_Defered(Machine(NONDET_MCH_WHILE))==(?);
  Context_List_Sets(Machine(NONDET_MCH_WHILE))==(?);
  List_Valuable_Sets(Machine(NONDET_MCH_WHILE))==(?);
  Inherited_List_Enumerated(Machine(NONDET_MCH_WHILE))==(?);
  Inherited_List_Defered(Machine(NONDET_MCH_WHILE))==(?);
  Inherited_List_Sets(Machine(NONDET_MCH_WHILE))==(?);
  List_Enumerated(Machine(NONDET_MCH_WHILE))==(?);
  List_Defered(Machine(NONDET_MCH_WHILE))==(?);
  List_Sets(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(NONDET_MCH_WHILE))==(?);
  Expanded_List_HiddenConstants(Machine(NONDET_MCH_WHILE))==(?);
  List_HiddenConstants(Machine(NONDET_MCH_WHILE))==(?);
  External_List_HiddenConstants(Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(NONDET_MCH_WHILE))==(btrue);
  Context_List_Properties(Machine(NONDET_MCH_WHILE))==(btrue);
  Inherited_List_Properties(Machine(NONDET_MCH_WHILE))==(btrue);
  List_Properties(Machine(NONDET_MCH_WHILE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(NONDET_MCH_WHILE),opNONDET_MCH_WHILE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(NONDET_MCH_WHILE)) == (? | ? | ? | ? | opNONDET_MCH_WHILE | ? | ? | ? | NONDET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Machine(NONDET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(NONDET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Machine(NONDET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(NONDET_MCH_WHILE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(NONDET_MCH_WHILE)) == (Type(opNONDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(NONDET_MCH_WHILE)) == (Type(opNONDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
