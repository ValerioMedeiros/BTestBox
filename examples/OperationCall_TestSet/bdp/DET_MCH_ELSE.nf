Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(DET_MCH_ELSE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(DET_MCH_ELSE))==(Machine(DET_MCH_ELSE));
  Level(Machine(DET_MCH_ELSE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(DET_MCH_ELSE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(DET_MCH_ELSE))==(?);
  List_Includes(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(DET_MCH_ELSE))==(?);
  Context_List_Variables(Machine(DET_MCH_ELSE))==(?);
  Abstract_List_Variables(Machine(DET_MCH_ELSE))==(?);
  Local_List_Variables(Machine(DET_MCH_ELSE))==(?);
  List_Variables(Machine(DET_MCH_ELSE))==(?);
  External_List_Variables(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(DET_MCH_ELSE))==(?);
  Abstract_List_VisibleVariables(Machine(DET_MCH_ELSE))==(?);
  External_List_VisibleVariables(Machine(DET_MCH_ELSE))==(?);
  Expanded_List_VisibleVariables(Machine(DET_MCH_ELSE))==(?);
  List_VisibleVariables(Machine(DET_MCH_ELSE))==(?);
  Internal_List_VisibleVariables(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(DET_MCH_ELSE))==(btrue);
  Gluing_List_Invariant(Machine(DET_MCH_ELSE))==(btrue);
  Expanded_List_Invariant(Machine(DET_MCH_ELSE))==(btrue);
  Abstract_List_Invariant(Machine(DET_MCH_ELSE))==(btrue);
  Context_List_Invariant(Machine(DET_MCH_ELSE))==(btrue);
  List_Invariant(Machine(DET_MCH_ELSE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(DET_MCH_ELSE))==(btrue);
  Abstract_List_Assertions(Machine(DET_MCH_ELSE))==(btrue);
  Context_List_Assertions(Machine(DET_MCH_ELSE))==(btrue);
  List_Assertions(Machine(DET_MCH_ELSE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(DET_MCH_ELSE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(DET_MCH_ELSE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(DET_MCH_ELSE))==(skip);
  Context_List_Initialisation(Machine(DET_MCH_ELSE))==(skip);
  List_Initialisation(Machine(DET_MCH_ELSE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(DET_MCH_ELSE))==(btrue);
  List_Constraints(Machine(DET_MCH_ELSE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(DET_MCH_ELSE))==(opDET_MCH_ELSE);
  List_Operations(Machine(DET_MCH_ELSE))==(opDET_MCH_ELSE)
END
&
THEORY ListInputX IS
  List_Input(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(res <-- opDET_MCH_ELSE(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(xx: NAT & yy: NAT | xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy);
  List_Substitution(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(IF xx>yy THEN res:=xx ELSE res:=yy END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(DET_MCH_ELSE))==(?);
  Inherited_List_Constants(Machine(DET_MCH_ELSE))==(?);
  List_Constants(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(DET_MCH_ELSE))==(?);
  Context_List_Defered(Machine(DET_MCH_ELSE))==(?);
  Context_List_Sets(Machine(DET_MCH_ELSE))==(?);
  List_Valuable_Sets(Machine(DET_MCH_ELSE))==(?);
  Inherited_List_Enumerated(Machine(DET_MCH_ELSE))==(?);
  Inherited_List_Defered(Machine(DET_MCH_ELSE))==(?);
  Inherited_List_Sets(Machine(DET_MCH_ELSE))==(?);
  List_Enumerated(Machine(DET_MCH_ELSE))==(?);
  List_Defered(Machine(DET_MCH_ELSE))==(?);
  List_Sets(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(DET_MCH_ELSE))==(?);
  Expanded_List_HiddenConstants(Machine(DET_MCH_ELSE))==(?);
  List_HiddenConstants(Machine(DET_MCH_ELSE))==(?);
  External_List_HiddenConstants(Machine(DET_MCH_ELSE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(DET_MCH_ELSE))==(btrue);
  Context_List_Properties(Machine(DET_MCH_ELSE))==(btrue);
  Inherited_List_Properties(Machine(DET_MCH_ELSE))==(btrue);
  List_Properties(Machine(DET_MCH_ELSE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(DET_MCH_ELSE),opDET_MCH_ELSE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(DET_MCH_ELSE)) == (? | ? | ? | ? | opDET_MCH_ELSE | ? | ? | ? | DET_MCH_ELSE);
  List_Of_HiddenCst_Ids(Machine(DET_MCH_ELSE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(DET_MCH_ELSE)) == (?);
  List_Of_VisibleVar_Ids(Machine(DET_MCH_ELSE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(DET_MCH_ELSE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(DET_MCH_ELSE)) == (Type(opDET_MCH_ELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(DET_MCH_ELSE)) == (Type(opDET_MCH_ELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
