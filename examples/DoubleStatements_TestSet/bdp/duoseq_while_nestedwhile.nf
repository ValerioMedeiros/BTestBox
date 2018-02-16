Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(duoseq_while_nestedwhile))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(duoseq_while_nestedwhile))==(Machine(duoseq_while_nestedwhile));
  Level(Machine(duoseq_while_nestedwhile))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(duoseq_while_nestedwhile)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(duoseq_while_nestedwhile))==(?);
  List_Includes(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(duoseq_while_nestedwhile))==(?);
  Context_List_Variables(Machine(duoseq_while_nestedwhile))==(?);
  Abstract_List_Variables(Machine(duoseq_while_nestedwhile))==(?);
  Local_List_Variables(Machine(duoseq_while_nestedwhile))==(?);
  List_Variables(Machine(duoseq_while_nestedwhile))==(?);
  External_List_Variables(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(duoseq_while_nestedwhile))==(?);
  Abstract_List_VisibleVariables(Machine(duoseq_while_nestedwhile))==(?);
  External_List_VisibleVariables(Machine(duoseq_while_nestedwhile))==(?);
  Expanded_List_VisibleVariables(Machine(duoseq_while_nestedwhile))==(?);
  List_VisibleVariables(Machine(duoseq_while_nestedwhile))==(?);
  Internal_List_VisibleVariables(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(duoseq_while_nestedwhile))==(btrue);
  Gluing_List_Invariant(Machine(duoseq_while_nestedwhile))==(btrue);
  Expanded_List_Invariant(Machine(duoseq_while_nestedwhile))==(btrue);
  Abstract_List_Invariant(Machine(duoseq_while_nestedwhile))==(btrue);
  Context_List_Invariant(Machine(duoseq_while_nestedwhile))==(btrue);
  List_Invariant(Machine(duoseq_while_nestedwhile))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(duoseq_while_nestedwhile))==(btrue);
  Abstract_List_Assertions(Machine(duoseq_while_nestedwhile))==(btrue);
  Context_List_Assertions(Machine(duoseq_while_nestedwhile))==(btrue);
  List_Assertions(Machine(duoseq_while_nestedwhile))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(duoseq_while_nestedwhile))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(duoseq_while_nestedwhile))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(duoseq_while_nestedwhile))==(skip);
  Context_List_Initialisation(Machine(duoseq_while_nestedwhile))==(skip);
  List_Initialisation(Machine(duoseq_while_nestedwhile))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(duoseq_while_nestedwhile))==(btrue);
  List_Constraints(Machine(duoseq_while_nestedwhile))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(duoseq_while_nestedwhile))==(opduoseq_while_nestedwhile);
  List_Operations(Machine(duoseq_while_nestedwhile))==(opduoseq_while_nestedwhile)
END
&
THEORY ListInputX IS
  List_Input(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(nn1,nn2)
END
&
THEORY ListOutputX IS
  List_Output(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(res1,res2 <-- opduoseq_while_nestedwhile(nn1,nn2))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(nn1: NAT & nn2: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(nn1: NAT & nn2: NAT | res1:=nn1 || (nn1>0 ==> res2:=nn2 [] not(nn1>0) ==> res2:=0));
  List_Substitution(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(res1:=nn1 || IF nn1>0 THEN res2:=nn2 ELSE res2:=0 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(duoseq_while_nestedwhile))==(?);
  Inherited_List_Constants(Machine(duoseq_while_nestedwhile))==(?);
  List_Constants(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(duoseq_while_nestedwhile))==(?);
  Context_List_Defered(Machine(duoseq_while_nestedwhile))==(?);
  Context_List_Sets(Machine(duoseq_while_nestedwhile))==(?);
  List_Valuable_Sets(Machine(duoseq_while_nestedwhile))==(?);
  Inherited_List_Enumerated(Machine(duoseq_while_nestedwhile))==(?);
  Inherited_List_Defered(Machine(duoseq_while_nestedwhile))==(?);
  Inherited_List_Sets(Machine(duoseq_while_nestedwhile))==(?);
  List_Enumerated(Machine(duoseq_while_nestedwhile))==(?);
  List_Defered(Machine(duoseq_while_nestedwhile))==(?);
  List_Sets(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(duoseq_while_nestedwhile))==(?);
  Expanded_List_HiddenConstants(Machine(duoseq_while_nestedwhile))==(?);
  List_HiddenConstants(Machine(duoseq_while_nestedwhile))==(?);
  External_List_HiddenConstants(Machine(duoseq_while_nestedwhile))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(duoseq_while_nestedwhile))==(btrue);
  Context_List_Properties(Machine(duoseq_while_nestedwhile))==(btrue);
  Inherited_List_Properties(Machine(duoseq_while_nestedwhile))==(btrue);
  List_Properties(Machine(duoseq_while_nestedwhile))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(duoseq_while_nestedwhile),opduoseq_while_nestedwhile)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(duoseq_while_nestedwhile)) == (? | ? | ? | ? | opduoseq_while_nestedwhile | ? | ? | ? | duoseq_while_nestedwhile);
  List_Of_HiddenCst_Ids(Machine(duoseq_while_nestedwhile)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(duoseq_while_nestedwhile)) == (?);
  List_Of_VisibleVar_Ids(Machine(duoseq_while_nestedwhile)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(duoseq_while_nestedwhile)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(duoseq_while_nestedwhile)) == (Type(opduoseq_while_nestedwhile) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(duoseq_while_nestedwhile)) == (Type(opduoseq_while_nestedwhile) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
