Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(duoseq_while_else))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(duoseq_while_else))==(Machine(duoseq_while_else));
  Level(Machine(duoseq_while_else))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(duoseq_while_else)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(duoseq_while_else))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(duoseq_while_else))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(duoseq_while_else))==(?);
  List_Includes(Machine(duoseq_while_else))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(duoseq_while_else))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(duoseq_while_else))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(duoseq_while_else))==(?);
  Context_List_Variables(Machine(duoseq_while_else))==(?);
  Abstract_List_Variables(Machine(duoseq_while_else))==(?);
  Local_List_Variables(Machine(duoseq_while_else))==(?);
  List_Variables(Machine(duoseq_while_else))==(?);
  External_List_Variables(Machine(duoseq_while_else))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(duoseq_while_else))==(?);
  Abstract_List_VisibleVariables(Machine(duoseq_while_else))==(?);
  External_List_VisibleVariables(Machine(duoseq_while_else))==(?);
  Expanded_List_VisibleVariables(Machine(duoseq_while_else))==(?);
  List_VisibleVariables(Machine(duoseq_while_else))==(?);
  Internal_List_VisibleVariables(Machine(duoseq_while_else))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(duoseq_while_else))==(btrue);
  Gluing_List_Invariant(Machine(duoseq_while_else))==(btrue);
  Expanded_List_Invariant(Machine(duoseq_while_else))==(btrue);
  Abstract_List_Invariant(Machine(duoseq_while_else))==(btrue);
  Context_List_Invariant(Machine(duoseq_while_else))==(btrue);
  List_Invariant(Machine(duoseq_while_else))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(duoseq_while_else))==(btrue);
  Abstract_List_Assertions(Machine(duoseq_while_else))==(btrue);
  Context_List_Assertions(Machine(duoseq_while_else))==(btrue);
  List_Assertions(Machine(duoseq_while_else))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(duoseq_while_else))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(duoseq_while_else))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(duoseq_while_else))==(skip);
  Context_List_Initialisation(Machine(duoseq_while_else))==(skip);
  List_Initialisation(Machine(duoseq_while_else))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(duoseq_while_else))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(duoseq_while_else))==(btrue);
  List_Constraints(Machine(duoseq_while_else))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(duoseq_while_else))==(opduoseq_while_else);
  List_Operations(Machine(duoseq_while_else))==(opduoseq_while_else)
END
&
THEORY ListInputX IS
  List_Input(Machine(duoseq_while_else),opduoseq_while_else)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(duoseq_while_else),opduoseq_while_else)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(duoseq_while_else),opduoseq_while_else)==(res1,res2 <-- opduoseq_while_else(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(duoseq_while_else),opduoseq_while_else)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(duoseq_while_else),opduoseq_while_else)==(xx: NAT | res1:=xx || (xx<5 ==> res2:=0 [] not(xx<5) ==> res2:=xx));
  List_Substitution(Machine(duoseq_while_else),opduoseq_while_else)==(res1:=xx || IF xx<5 THEN res2:=0 ELSE res2:=xx END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(duoseq_while_else))==(?);
  Inherited_List_Constants(Machine(duoseq_while_else))==(?);
  List_Constants(Machine(duoseq_while_else))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(duoseq_while_else))==(?);
  Context_List_Defered(Machine(duoseq_while_else))==(?);
  Context_List_Sets(Machine(duoseq_while_else))==(?);
  List_Valuable_Sets(Machine(duoseq_while_else))==(?);
  Inherited_List_Enumerated(Machine(duoseq_while_else))==(?);
  Inherited_List_Defered(Machine(duoseq_while_else))==(?);
  Inherited_List_Sets(Machine(duoseq_while_else))==(?);
  List_Enumerated(Machine(duoseq_while_else))==(?);
  List_Defered(Machine(duoseq_while_else))==(?);
  List_Sets(Machine(duoseq_while_else))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(duoseq_while_else))==(?);
  Expanded_List_HiddenConstants(Machine(duoseq_while_else))==(?);
  List_HiddenConstants(Machine(duoseq_while_else))==(?);
  External_List_HiddenConstants(Machine(duoseq_while_else))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(duoseq_while_else))==(btrue);
  Context_List_Properties(Machine(duoseq_while_else))==(btrue);
  Inherited_List_Properties(Machine(duoseq_while_else))==(btrue);
  List_Properties(Machine(duoseq_while_else))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(duoseq_while_else),opduoseq_while_else)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(duoseq_while_else)) == (? | ? | ? | ? | opduoseq_while_else | ? | ? | ? | duoseq_while_else);
  List_Of_HiddenCst_Ids(Machine(duoseq_while_else)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(duoseq_while_else)) == (?);
  List_Of_VisibleVar_Ids(Machine(duoseq_while_else)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(duoseq_while_else)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(duoseq_while_else)) == (Type(opduoseq_while_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(duoseq_while_else)) == (Type(opduoseq_while_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
