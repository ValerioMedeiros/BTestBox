Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(while))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(while))==(Machine(while));
  Level(Machine(while))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(while)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(while))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(while))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(while))==(?);
  List_Includes(Machine(while))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(while))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(while))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(while))==(?);
  Context_List_Variables(Machine(while))==(?);
  Abstract_List_Variables(Machine(while))==(?);
  Local_List_Variables(Machine(while))==(?);
  List_Variables(Machine(while))==(?);
  External_List_Variables(Machine(while))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(while))==(?);
  Abstract_List_VisibleVariables(Machine(while))==(?);
  External_List_VisibleVariables(Machine(while))==(?);
  Expanded_List_VisibleVariables(Machine(while))==(?);
  List_VisibleVariables(Machine(while))==(?);
  Internal_List_VisibleVariables(Machine(while))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(while))==(btrue);
  Gluing_List_Invariant(Machine(while))==(btrue);
  Expanded_List_Invariant(Machine(while))==(btrue);
  Abstract_List_Invariant(Machine(while))==(btrue);
  Context_List_Invariant(Machine(while))==(btrue);
  List_Invariant(Machine(while))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(while))==(btrue);
  Abstract_List_Assertions(Machine(while))==(btrue);
  Context_List_Assertions(Machine(while))==(btrue);
  List_Assertions(Machine(while))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(while))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(while))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(while))==(skip);
  Context_List_Initialisation(Machine(while))==(skip);
  List_Initialisation(Machine(while))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(while))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(while))==(btrue);
  List_Constraints(Machine(while))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(while))==(opwhile);
  List_Operations(Machine(while))==(opwhile)
END
&
THEORY ListInputX IS
  List_Input(Machine(while),opwhile)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(while),opwhile)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(while),opwhile)==(res <-- opwhile(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(while),opwhile)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(while),opwhile)==(xx: NAT | res:=xx);
  List_Substitution(Machine(while),opwhile)==(res:=xx)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(while))==(?);
  Inherited_List_Constants(Machine(while))==(?);
  List_Constants(Machine(while))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(while))==(?);
  Context_List_Defered(Machine(while))==(?);
  Context_List_Sets(Machine(while))==(?);
  List_Valuable_Sets(Machine(while))==(?);
  Inherited_List_Enumerated(Machine(while))==(?);
  Inherited_List_Defered(Machine(while))==(?);
  Inherited_List_Sets(Machine(while))==(?);
  List_Enumerated(Machine(while))==(?);
  List_Defered(Machine(while))==(?);
  List_Sets(Machine(while))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(while))==(?);
  Expanded_List_HiddenConstants(Machine(while))==(?);
  List_HiddenConstants(Machine(while))==(?);
  External_List_HiddenConstants(Machine(while))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(while))==(btrue);
  Context_List_Properties(Machine(while))==(btrue);
  Inherited_List_Properties(Machine(while))==(btrue);
  List_Properties(Machine(while))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(while),opwhile)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(while)) == (? | ? | ? | ? | opwhile | ? | ? | ? | while);
  List_Of_HiddenCst_Ids(Machine(while)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(while)) == (?);
  List_Of_VisibleVar_Ids(Machine(while)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(while)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(while)) == (Type(opwhile) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(while)) == (Type(opwhile) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
