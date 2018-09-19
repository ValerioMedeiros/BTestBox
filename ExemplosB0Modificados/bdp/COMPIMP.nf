Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(COMPIMP))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(COMPIMP))==(Machine(COMPIMP));
  Level(Machine(COMPIMP))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(COMPIMP)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(COMPIMP))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(COMPIMP))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(COMPIMP))==(?);
  List_Includes(Machine(COMPIMP))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(COMPIMP))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(COMPIMP))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(COMPIMP))==(?);
  Context_List_Variables(Machine(COMPIMP))==(?);
  Abstract_List_Variables(Machine(COMPIMP))==(?);
  Local_List_Variables(Machine(COMPIMP))==(?);
  List_Variables(Machine(COMPIMP))==(?);
  External_List_Variables(Machine(COMPIMP))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(COMPIMP))==(?);
  Abstract_List_VisibleVariables(Machine(COMPIMP))==(?);
  External_List_VisibleVariables(Machine(COMPIMP))==(?);
  Expanded_List_VisibleVariables(Machine(COMPIMP))==(?);
  List_VisibleVariables(Machine(COMPIMP))==(?);
  Internal_List_VisibleVariables(Machine(COMPIMP))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(COMPIMP))==(btrue);
  Gluing_List_Invariant(Machine(COMPIMP))==(btrue);
  Expanded_List_Invariant(Machine(COMPIMP))==(btrue);
  Abstract_List_Invariant(Machine(COMPIMP))==(btrue);
  Context_List_Invariant(Machine(COMPIMP))==(btrue);
  List_Invariant(Machine(COMPIMP))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(COMPIMP))==(btrue);
  Abstract_List_Assertions(Machine(COMPIMP))==(btrue);
  Context_List_Assertions(Machine(COMPIMP))==(btrue);
  List_Assertions(Machine(COMPIMP))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(COMPIMP))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(COMPIMP))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(COMPIMP))==(skip);
  Context_List_Initialisation(Machine(COMPIMP))==(skip);
  List_Initialisation(Machine(COMPIMP))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(COMPIMP))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(COMPIMP))==(btrue);
  List_Constraints(Machine(COMPIMP))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(COMPIMP))==(do_int);
  List_Operations(Machine(COMPIMP))==(do_int)
END
&
THEORY ListInputX IS
  List_Input(Machine(COMPIMP),do_int)==(value)
END
&
THEORY ListOutputX IS
  List_Output(Machine(COMPIMP),do_int)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(COMPIMP),do_int)==(res <-- do_int(value))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(COMPIMP),do_int)==(value: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(COMPIMP),do_int)==(value: NAT | res:=(value+1) mod 1024);
  List_Substitution(Machine(COMPIMP),do_int)==(res:=(value+1) mod 1024)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(COMPIMP))==(?);
  Inherited_List_Constants(Machine(COMPIMP))==(?);
  List_Constants(Machine(COMPIMP))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(COMPIMP))==(?);
  Context_List_Defered(Machine(COMPIMP))==(?);
  Context_List_Sets(Machine(COMPIMP))==(?);
  List_Valuable_Sets(Machine(COMPIMP))==(?);
  Inherited_List_Enumerated(Machine(COMPIMP))==(?);
  Inherited_List_Defered(Machine(COMPIMP))==(?);
  Inherited_List_Sets(Machine(COMPIMP))==(?);
  List_Enumerated(Machine(COMPIMP))==(?);
  List_Defered(Machine(COMPIMP))==(?);
  List_Sets(Machine(COMPIMP))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(COMPIMP))==(?);
  Expanded_List_HiddenConstants(Machine(COMPIMP))==(?);
  List_HiddenConstants(Machine(COMPIMP))==(?);
  External_List_HiddenConstants(Machine(COMPIMP))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(COMPIMP))==(btrue);
  Context_List_Properties(Machine(COMPIMP))==(btrue);
  Inherited_List_Properties(Machine(COMPIMP))==(btrue);
  List_Properties(Machine(COMPIMP))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(COMPIMP),do_int)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(COMPIMP)) == (? | ? | ? | ? | do_int | ? | ? | ? | COMPIMP);
  List_Of_HiddenCst_Ids(Machine(COMPIMP)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(COMPIMP)) == (?);
  List_Of_VisibleVar_Ids(Machine(COMPIMP)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(COMPIMP)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(COMPIMP)) == (Type(do_int) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(COMPIMP)) == (Type(do_int) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
