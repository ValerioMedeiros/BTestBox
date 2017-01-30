Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(NONDET_MCH_ELSE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(NONDET_MCH_ELSE))==(Machine(NONDET_MCH_ELSE));
  Level(Machine(NONDET_MCH_ELSE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(NONDET_MCH_ELSE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(NONDET_MCH_ELSE))==(?);
  List_Includes(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(NONDET_MCH_ELSE))==(?);
  Context_List_Variables(Machine(NONDET_MCH_ELSE))==(?);
  Abstract_List_Variables(Machine(NONDET_MCH_ELSE))==(?);
  Local_List_Variables(Machine(NONDET_MCH_ELSE))==(?);
  List_Variables(Machine(NONDET_MCH_ELSE))==(?);
  External_List_Variables(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(NONDET_MCH_ELSE))==(?);
  Abstract_List_VisibleVariables(Machine(NONDET_MCH_ELSE))==(?);
  External_List_VisibleVariables(Machine(NONDET_MCH_ELSE))==(?);
  Expanded_List_VisibleVariables(Machine(NONDET_MCH_ELSE))==(?);
  List_VisibleVariables(Machine(NONDET_MCH_ELSE))==(?);
  Internal_List_VisibleVariables(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(NONDET_MCH_ELSE))==(btrue);
  Gluing_List_Invariant(Machine(NONDET_MCH_ELSE))==(btrue);
  Expanded_List_Invariant(Machine(NONDET_MCH_ELSE))==(btrue);
  Abstract_List_Invariant(Machine(NONDET_MCH_ELSE))==(btrue);
  Context_List_Invariant(Machine(NONDET_MCH_ELSE))==(btrue);
  List_Invariant(Machine(NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(NONDET_MCH_ELSE))==(btrue);
  Abstract_List_Assertions(Machine(NONDET_MCH_ELSE))==(btrue);
  Context_List_Assertions(Machine(NONDET_MCH_ELSE))==(btrue);
  List_Assertions(Machine(NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(NONDET_MCH_ELSE))==(skip);
  Context_List_Initialisation(Machine(NONDET_MCH_ELSE))==(skip);
  List_Initialisation(Machine(NONDET_MCH_ELSE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(NONDET_MCH_ELSE))==(btrue);
  List_Constraints(Machine(NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(NONDET_MCH_ELSE))==(opNONDET_MCH_ELSE);
  List_Operations(Machine(NONDET_MCH_ELSE))==(opNONDET_MCH_ELSE)
END
&
THEORY ListInputX IS
  List_Input(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(res <-- opNONDET_MCH_ELSE(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(xx: NAT & yy: NAT | xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy [] (xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy));
  List_Substitution(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(CHOICE IF xx>yy THEN res:=xx ELSE res:=yy END OR IF xx>yy THEN res:=xx ELSE res:=yy END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(NONDET_MCH_ELSE))==(?);
  Inherited_List_Constants(Machine(NONDET_MCH_ELSE))==(?);
  List_Constants(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(NONDET_MCH_ELSE))==(?);
  Context_List_Defered(Machine(NONDET_MCH_ELSE))==(?);
  Context_List_Sets(Machine(NONDET_MCH_ELSE))==(?);
  List_Valuable_Sets(Machine(NONDET_MCH_ELSE))==(?);
  Inherited_List_Enumerated(Machine(NONDET_MCH_ELSE))==(?);
  Inherited_List_Defered(Machine(NONDET_MCH_ELSE))==(?);
  Inherited_List_Sets(Machine(NONDET_MCH_ELSE))==(?);
  List_Enumerated(Machine(NONDET_MCH_ELSE))==(?);
  List_Defered(Machine(NONDET_MCH_ELSE))==(?);
  List_Sets(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(NONDET_MCH_ELSE))==(?);
  Expanded_List_HiddenConstants(Machine(NONDET_MCH_ELSE))==(?);
  List_HiddenConstants(Machine(NONDET_MCH_ELSE))==(?);
  External_List_HiddenConstants(Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(NONDET_MCH_ELSE))==(btrue);
  Context_List_Properties(Machine(NONDET_MCH_ELSE))==(btrue);
  Inherited_List_Properties(Machine(NONDET_MCH_ELSE))==(btrue);
  List_Properties(Machine(NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(NONDET_MCH_ELSE)) == (? | ? | ? | ? | opNONDET_MCH_ELSE | ? | ? | ? | NONDET_MCH_ELSE);
  List_Of_HiddenCst_Ids(Machine(NONDET_MCH_ELSE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(NONDET_MCH_ELSE)) == (?);
  List_Of_VisibleVar_Ids(Machine(NONDET_MCH_ELSE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(NONDET_MCH_ELSE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(NONDET_MCH_ELSE)) == (Type(opNONDET_MCH_ELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(NONDET_MCH_ELSE)) == (Type(opNONDET_MCH_ELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
