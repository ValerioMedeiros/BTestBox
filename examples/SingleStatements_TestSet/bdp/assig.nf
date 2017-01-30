Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(assig))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(assig))==(Machine(assig));
  Level(Machine(assig))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(assig)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(assig))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(assig))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(assig))==(?);
  List_Includes(Machine(assig))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(assig))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(assig))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(assig))==(?);
  Context_List_Variables(Machine(assig))==(?);
  Abstract_List_Variables(Machine(assig))==(?);
  Local_List_Variables(Machine(assig))==(?);
  List_Variables(Machine(assig))==(?);
  External_List_Variables(Machine(assig))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(assig))==(?);
  Abstract_List_VisibleVariables(Machine(assig))==(?);
  External_List_VisibleVariables(Machine(assig))==(?);
  Expanded_List_VisibleVariables(Machine(assig))==(?);
  List_VisibleVariables(Machine(assig))==(?);
  Internal_List_VisibleVariables(Machine(assig))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(assig))==(btrue);
  Gluing_List_Invariant(Machine(assig))==(btrue);
  Expanded_List_Invariant(Machine(assig))==(btrue);
  Abstract_List_Invariant(Machine(assig))==(btrue);
  Context_List_Invariant(Machine(assig))==(btrue);
  List_Invariant(Machine(assig))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(assig))==(btrue);
  Abstract_List_Assertions(Machine(assig))==(btrue);
  Context_List_Assertions(Machine(assig))==(btrue);
  List_Assertions(Machine(assig))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(assig))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(assig))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(assig))==(skip);
  Context_List_Initialisation(Machine(assig))==(skip);
  List_Initialisation(Machine(assig))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(assig))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(assig))==(btrue);
  List_Constraints(Machine(assig))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(assig))==(opassig);
  List_Operations(Machine(assig))==(opassig)
END
&
THEORY ListInputX IS
  List_Input(Machine(assig),opassig)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(assig),opassig)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(assig),opassig)==(res <-- opassig(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(assig),opassig)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(assig),opassig)==(xx: NAT | res:=xx);
  List_Substitution(Machine(assig),opassig)==(res:=xx)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(assig))==(?);
  Inherited_List_Constants(Machine(assig))==(?);
  List_Constants(Machine(assig))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(assig))==(?);
  Context_List_Defered(Machine(assig))==(?);
  Context_List_Sets(Machine(assig))==(?);
  List_Valuable_Sets(Machine(assig))==(?);
  Inherited_List_Enumerated(Machine(assig))==(?);
  Inherited_List_Defered(Machine(assig))==(?);
  Inherited_List_Sets(Machine(assig))==(?);
  List_Enumerated(Machine(assig))==(?);
  List_Defered(Machine(assig))==(?);
  List_Sets(Machine(assig))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(assig))==(?);
  Expanded_List_HiddenConstants(Machine(assig))==(?);
  List_HiddenConstants(Machine(assig))==(?);
  External_List_HiddenConstants(Machine(assig))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(assig))==(btrue);
  Context_List_Properties(Machine(assig))==(btrue);
  Inherited_List_Properties(Machine(assig))==(btrue);
  List_Properties(Machine(assig))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(assig),opassig)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(assig)) == (? | ? | ? | ? | opassig | ? | ? | ? | assig);
  List_Of_HiddenCst_Ids(Machine(assig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(assig)) == (?);
  List_Of_VisibleVar_Ids(Machine(assig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(assig)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(assig)) == (Type(opassig) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(assig)) == (Type(opassig) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
