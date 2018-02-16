Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithConstraints))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithConstraints))==(Machine(MchWithConstraints));
  Level(Machine(MchWithConstraints))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithConstraints)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithConstraints))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithConstraints))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithConstraints))==(?);
  List_Includes(Machine(MchWithConstraints))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithConstraints))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithConstraints))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithConstraints))==(?);
  Context_List_Variables(Machine(MchWithConstraints))==(?);
  Abstract_List_Variables(Machine(MchWithConstraints))==(?);
  Local_List_Variables(Machine(MchWithConstraints))==(?);
  List_Variables(Machine(MchWithConstraints))==(?);
  External_List_Variables(Machine(MchWithConstraints))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithConstraints))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithConstraints))==(?);
  External_List_VisibleVariables(Machine(MchWithConstraints))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithConstraints))==(?);
  List_VisibleVariables(Machine(MchWithConstraints))==(?);
  Internal_List_VisibleVariables(Machine(MchWithConstraints))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithConstraints))==(btrue);
  Gluing_List_Invariant(Machine(MchWithConstraints))==(btrue);
  Expanded_List_Invariant(Machine(MchWithConstraints))==(btrue);
  Abstract_List_Invariant(Machine(MchWithConstraints))==(btrue);
  Context_List_Invariant(Machine(MchWithConstraints))==(btrue);
  List_Invariant(Machine(MchWithConstraints))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithConstraints))==(btrue);
  Abstract_List_Assertions(Machine(MchWithConstraints))==(btrue);
  Context_List_Assertions(Machine(MchWithConstraints))==(btrue);
  List_Assertions(Machine(MchWithConstraints))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithConstraints))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithConstraints))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithConstraints))==(skip);
  Context_List_Initialisation(Machine(MchWithConstraints))==(skip);
  List_Initialisation(Machine(MchWithConstraints))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithConstraints))==(max_count)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithConstraints))==(btrue);
  List_Constraints(Machine(MchWithConstraints))==(max_count: NAT)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithConstraints))==(opMchWithConstraints);
  List_Operations(Machine(MchWithConstraints))==(opMchWithConstraints)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithConstraints),opMchWithConstraints)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithConstraints),opMchWithConstraints)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithConstraints),opMchWithConstraints)==(res <-- opMchWithConstraints(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithConstraints),opMchWithConstraints)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithConstraints),opMchWithConstraints)==(nn: NAT | nn<max_count ==> res:=TRUE [] not(nn<max_count) ==> res:=FALSE);
  List_Substitution(Machine(MchWithConstraints),opMchWithConstraints)==(IF nn<max_count THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithConstraints))==(?);
  Inherited_List_Constants(Machine(MchWithConstraints))==(?);
  List_Constants(Machine(MchWithConstraints))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithConstraints))==(?);
  Context_List_Defered(Machine(MchWithConstraints))==(?);
  Context_List_Sets(Machine(MchWithConstraints))==(?);
  List_Valuable_Sets(Machine(MchWithConstraints))==(?);
  Inherited_List_Enumerated(Machine(MchWithConstraints))==(?);
  Inherited_List_Defered(Machine(MchWithConstraints))==(?);
  Inherited_List_Sets(Machine(MchWithConstraints))==(?);
  List_Enumerated(Machine(MchWithConstraints))==(?);
  List_Defered(Machine(MchWithConstraints))==(?);
  List_Sets(Machine(MchWithConstraints))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithConstraints))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithConstraints))==(?);
  List_HiddenConstants(Machine(MchWithConstraints))==(?);
  External_List_HiddenConstants(Machine(MchWithConstraints))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithConstraints))==(btrue);
  Context_List_Properties(Machine(MchWithConstraints))==(btrue);
  Inherited_List_Properties(Machine(MchWithConstraints))==(btrue);
  List_Properties(Machine(MchWithConstraints))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithConstraints),opMchWithConstraints)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithConstraints)) == (? | ? | ? | ? | opMchWithConstraints | ? | ? | max_count | MchWithConstraints);
  List_Of_HiddenCst_Ids(Machine(MchWithConstraints)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithConstraints)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchWithConstraints)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithConstraints)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Machine(MchWithConstraints)) == (Type(max_count) == Prm(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithConstraints)) == (Type(opMchWithConstraints) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)));
  Observers(Machine(MchWithConstraints)) == (Type(opMchWithConstraints) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
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
