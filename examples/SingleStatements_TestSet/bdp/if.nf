Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(if))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(if))==(Machine(if));
  Level(Machine(if))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(if)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(if))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(if))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(if))==(?);
  List_Includes(Machine(if))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(if))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(if))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(if))==(?);
  Context_List_Variables(Machine(if))==(?);
  Abstract_List_Variables(Machine(if))==(?);
  Local_List_Variables(Machine(if))==(?);
  List_Variables(Machine(if))==(?);
  External_List_Variables(Machine(if))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(if))==(?);
  Abstract_List_VisibleVariables(Machine(if))==(?);
  External_List_VisibleVariables(Machine(if))==(?);
  Expanded_List_VisibleVariables(Machine(if))==(?);
  List_VisibleVariables(Machine(if))==(?);
  Internal_List_VisibleVariables(Machine(if))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(if))==(btrue);
  Gluing_List_Invariant(Machine(if))==(btrue);
  Expanded_List_Invariant(Machine(if))==(btrue);
  Abstract_List_Invariant(Machine(if))==(btrue);
  Context_List_Invariant(Machine(if))==(btrue);
  List_Invariant(Machine(if))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(if))==(btrue);
  Abstract_List_Assertions(Machine(if))==(btrue);
  Context_List_Assertions(Machine(if))==(btrue);
  List_Assertions(Machine(if))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(if))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(if))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(if))==(skip);
  Context_List_Initialisation(Machine(if))==(skip);
  List_Initialisation(Machine(if))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(if))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(if))==(btrue);
  List_Constraints(Machine(if))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(if))==(opif);
  List_Operations(Machine(if))==(opif)
END
&
THEORY ListInputX IS
  List_Input(Machine(if),opif)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(if),opif)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(if),opif)==(res <-- opif(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(if),opif)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(if),opif)==(xx: NAT | xx<5 ==> res:=0 [] not(xx<5) ==> skip);
  List_Substitution(Machine(if),opif)==(IF xx<5 THEN res:=0 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(if))==(?);
  Inherited_List_Constants(Machine(if))==(?);
  List_Constants(Machine(if))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(if))==(?);
  Context_List_Defered(Machine(if))==(?);
  Context_List_Sets(Machine(if))==(?);
  List_Valuable_Sets(Machine(if))==(?);
  Inherited_List_Enumerated(Machine(if))==(?);
  Inherited_List_Defered(Machine(if))==(?);
  Inherited_List_Sets(Machine(if))==(?);
  List_Enumerated(Machine(if))==(?);
  List_Defered(Machine(if))==(?);
  List_Sets(Machine(if))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(if))==(?);
  Expanded_List_HiddenConstants(Machine(if))==(?);
  List_HiddenConstants(Machine(if))==(?);
  External_List_HiddenConstants(Machine(if))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(if))==(btrue);
  Context_List_Properties(Machine(if))==(btrue);
  Inherited_List_Properties(Machine(if))==(btrue);
  List_Properties(Machine(if))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(if),opif)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(if)) == (? | ? | ? | ? | opif | ? | ? | ? | if);
  List_Of_HiddenCst_Ids(Machine(if)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(if)) == (?);
  List_Of_VisibleVar_Ids(Machine(if)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(if)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(if)) == (Type(opif) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(if)) == (Type(opif) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
