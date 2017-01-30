Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(else))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(else))==(Machine(else));
  Level(Machine(else))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(else)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(else))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(else))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(else))==(?);
  List_Includes(Machine(else))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(else))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(else))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(else))==(?);
  Context_List_Variables(Machine(else))==(?);
  Abstract_List_Variables(Machine(else))==(?);
  Local_List_Variables(Machine(else))==(?);
  List_Variables(Machine(else))==(?);
  External_List_Variables(Machine(else))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(else))==(?);
  Abstract_List_VisibleVariables(Machine(else))==(?);
  External_List_VisibleVariables(Machine(else))==(?);
  Expanded_List_VisibleVariables(Machine(else))==(?);
  List_VisibleVariables(Machine(else))==(?);
  Internal_List_VisibleVariables(Machine(else))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(else))==(btrue);
  Gluing_List_Invariant(Machine(else))==(btrue);
  Expanded_List_Invariant(Machine(else))==(btrue);
  Abstract_List_Invariant(Machine(else))==(btrue);
  Context_List_Invariant(Machine(else))==(btrue);
  List_Invariant(Machine(else))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(else))==(btrue);
  Abstract_List_Assertions(Machine(else))==(btrue);
  Context_List_Assertions(Machine(else))==(btrue);
  List_Assertions(Machine(else))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(else))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(else))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(else))==(skip);
  Context_List_Initialisation(Machine(else))==(skip);
  List_Initialisation(Machine(else))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(else))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(else))==(btrue);
  List_Constraints(Machine(else))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(else))==(opelse);
  List_Operations(Machine(else))==(opelse)
END
&
THEORY ListInputX IS
  List_Input(Machine(else),opelse)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(else),opelse)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(else),opelse)==(res <-- opelse(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(else),opelse)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(else),opelse)==(xx: NAT | xx<5 ==> res:=0 [] not(xx<5) ==> res:=xx);
  List_Substitution(Machine(else),opelse)==(IF xx<5 THEN res:=0 ELSE res:=xx END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(else))==(?);
  Inherited_List_Constants(Machine(else))==(?);
  List_Constants(Machine(else))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(else))==(?);
  Context_List_Defered(Machine(else))==(?);
  Context_List_Sets(Machine(else))==(?);
  List_Valuable_Sets(Machine(else))==(?);
  Inherited_List_Enumerated(Machine(else))==(?);
  Inherited_List_Defered(Machine(else))==(?);
  Inherited_List_Sets(Machine(else))==(?);
  List_Enumerated(Machine(else))==(?);
  List_Defered(Machine(else))==(?);
  List_Sets(Machine(else))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(else))==(?);
  Expanded_List_HiddenConstants(Machine(else))==(?);
  List_HiddenConstants(Machine(else))==(?);
  External_List_HiddenConstants(Machine(else))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(else))==(btrue);
  Context_List_Properties(Machine(else))==(btrue);
  Inherited_List_Properties(Machine(else))==(btrue);
  List_Properties(Machine(else))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(else),opelse)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(else)) == (? | ? | ? | ? | opelse | ? | ? | ? | else);
  List_Of_HiddenCst_Ids(Machine(else)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(else)) == (?);
  List_Of_VisibleVar_Ids(Machine(else)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(else)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(else)) == (Type(opelse) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(else)) == (Type(opelse) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
