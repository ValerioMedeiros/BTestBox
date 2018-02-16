Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithLocalOperations))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithLocalOperations))==(Machine(MchWithLocalOperations));
  Level(Machine(MchWithLocalOperations))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithLocalOperations)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithLocalOperations))==(?);
  List_Includes(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithLocalOperations))==(?);
  Context_List_Variables(Machine(MchWithLocalOperations))==(?);
  Abstract_List_Variables(Machine(MchWithLocalOperations))==(?);
  Local_List_Variables(Machine(MchWithLocalOperations))==(?);
  List_Variables(Machine(MchWithLocalOperations))==(?);
  External_List_Variables(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithLocalOperations))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithLocalOperations))==(?);
  External_List_VisibleVariables(Machine(MchWithLocalOperations))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithLocalOperations))==(?);
  List_VisibleVariables(Machine(MchWithLocalOperations))==(?);
  Internal_List_VisibleVariables(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithLocalOperations))==(btrue);
  Gluing_List_Invariant(Machine(MchWithLocalOperations))==(btrue);
  Expanded_List_Invariant(Machine(MchWithLocalOperations))==(btrue);
  Abstract_List_Invariant(Machine(MchWithLocalOperations))==(btrue);
  Context_List_Invariant(Machine(MchWithLocalOperations))==(btrue);
  List_Invariant(Machine(MchWithLocalOperations))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithLocalOperations))==(btrue);
  Abstract_List_Assertions(Machine(MchWithLocalOperations))==(btrue);
  Context_List_Assertions(Machine(MchWithLocalOperations))==(btrue);
  List_Assertions(Machine(MchWithLocalOperations))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithLocalOperations))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithLocalOperations))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithLocalOperations))==(skip);
  Context_List_Initialisation(Machine(MchWithLocalOperations))==(skip);
  List_Initialisation(Machine(MchWithLocalOperations))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithLocalOperations))==(btrue);
  List_Constraints(Machine(MchWithLocalOperations))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithLocalOperations))==(opMchWithLocalOperations);
  List_Operations(Machine(MchWithLocalOperations))==(opMchWithLocalOperations)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(nn1,nn2)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(res <-- opMchWithLocalOperations(nn1,nn2))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(nn1: NAT & nn2: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(nn1: NAT & nn2: NAT | nn1>nn2 ==> res:=nn1 [] not(nn1>nn2) ==> res:=nn2);
  List_Substitution(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(IF nn1>nn2 THEN res:=nn1 ELSE res:=nn2 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithLocalOperations))==(?);
  Inherited_List_Constants(Machine(MchWithLocalOperations))==(?);
  List_Constants(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithLocalOperations))==(?);
  Context_List_Defered(Machine(MchWithLocalOperations))==(?);
  Context_List_Sets(Machine(MchWithLocalOperations))==(?);
  List_Valuable_Sets(Machine(MchWithLocalOperations))==(?);
  Inherited_List_Enumerated(Machine(MchWithLocalOperations))==(?);
  Inherited_List_Defered(Machine(MchWithLocalOperations))==(?);
  Inherited_List_Sets(Machine(MchWithLocalOperations))==(?);
  List_Enumerated(Machine(MchWithLocalOperations))==(?);
  List_Defered(Machine(MchWithLocalOperations))==(?);
  List_Sets(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithLocalOperations))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithLocalOperations))==(?);
  List_HiddenConstants(Machine(MchWithLocalOperations))==(?);
  External_List_HiddenConstants(Machine(MchWithLocalOperations))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithLocalOperations))==(btrue);
  Context_List_Properties(Machine(MchWithLocalOperations))==(btrue);
  Inherited_List_Properties(Machine(MchWithLocalOperations))==(btrue);
  List_Properties(Machine(MchWithLocalOperations))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithLocalOperations),opMchWithLocalOperations)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithLocalOperations)) == (? | ? | ? | ? | opMchWithLocalOperations | ? | ? | ? | MchWithLocalOperations);
  List_Of_HiddenCst_Ids(Machine(MchWithLocalOperations)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithLocalOperations)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchWithLocalOperations)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithLocalOperations)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithLocalOperations)) == (Type(opMchWithLocalOperations) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(MchWithLocalOperations)) == (Type(opMchWithLocalOperations) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
