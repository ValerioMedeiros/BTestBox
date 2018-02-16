Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithAConstants))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithAConstants))==(Machine(MchWithAConstants));
  Level(Machine(MchWithAConstants))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithAConstants)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithAConstants))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithAConstants))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithAConstants))==(?);
  List_Includes(Machine(MchWithAConstants))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithAConstants))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithAConstants))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithAConstants))==(?);
  Context_List_Variables(Machine(MchWithAConstants))==(?);
  Abstract_List_Variables(Machine(MchWithAConstants))==(?);
  Local_List_Variables(Machine(MchWithAConstants))==(?);
  List_Variables(Machine(MchWithAConstants))==(?);
  External_List_Variables(Machine(MchWithAConstants))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithAConstants))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithAConstants))==(?);
  External_List_VisibleVariables(Machine(MchWithAConstants))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithAConstants))==(?);
  List_VisibleVariables(Machine(MchWithAConstants))==(?);
  Internal_List_VisibleVariables(Machine(MchWithAConstants))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithAConstants))==(btrue);
  Gluing_List_Invariant(Machine(MchWithAConstants))==(btrue);
  Expanded_List_Invariant(Machine(MchWithAConstants))==(btrue);
  Abstract_List_Invariant(Machine(MchWithAConstants))==(btrue);
  Context_List_Invariant(Machine(MchWithAConstants))==(btrue);
  List_Invariant(Machine(MchWithAConstants))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithAConstants))==(btrue);
  Abstract_List_Assertions(Machine(MchWithAConstants))==(btrue);
  Context_List_Assertions(Machine(MchWithAConstants))==(btrue);
  List_Assertions(Machine(MchWithAConstants))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithAConstants))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithAConstants))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithAConstants))==(skip);
  Context_List_Initialisation(Machine(MchWithAConstants))==(skip);
  List_Initialisation(Machine(MchWithAConstants))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithAConstants))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithAConstants))==(btrue);
  List_Constraints(Machine(MchWithAConstants))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithAConstants))==(opMchWithAConstants);
  List_Operations(Machine(MchWithAConstants))==(opMchWithAConstants)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithAConstants),opMchWithAConstants)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithAConstants),opMchWithAConstants)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithAConstants),opMchWithAConstants)==(res <-- opMchWithAConstants(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithAConstants),opMchWithAConstants)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithAConstants),opMchWithAConstants)==(nn: NAT | nn<max_count ==> res:=TRUE [] not(nn<max_count) ==> res:=FALSE);
  List_Substitution(Machine(MchWithAConstants),opMchWithAConstants)==(IF nn<max_count THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithAConstants))==(?);
  Inherited_List_Constants(Machine(MchWithAConstants))==(?);
  List_Constants(Machine(MchWithAConstants))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithAConstants))==(?);
  Context_List_Defered(Machine(MchWithAConstants))==(?);
  Context_List_Sets(Machine(MchWithAConstants))==(?);
  List_Valuable_Sets(Machine(MchWithAConstants))==(?);
  Inherited_List_Enumerated(Machine(MchWithAConstants))==(?);
  Inherited_List_Defered(Machine(MchWithAConstants))==(?);
  Inherited_List_Sets(Machine(MchWithAConstants))==(?);
  List_Enumerated(Machine(MchWithAConstants))==(?);
  List_Defered(Machine(MchWithAConstants))==(?);
  List_Sets(Machine(MchWithAConstants))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithAConstants))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithAConstants))==(?);
  List_HiddenConstants(Machine(MchWithAConstants))==(max_count);
  External_List_HiddenConstants(Machine(MchWithAConstants))==(max_count)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithAConstants))==(btrue);
  Context_List_Properties(Machine(MchWithAConstants))==(btrue);
  Inherited_List_Properties(Machine(MchWithAConstants))==(btrue);
  List_Properties(Machine(MchWithAConstants))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithAConstants),opMchWithAConstants)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithAConstants)) == (? | ? | ? | ? | opMchWithAConstants | ? | ? | ? | MchWithAConstants);
  List_Of_HiddenCst_Ids(Machine(MchWithAConstants)) == (max_count | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithAConstants)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchWithAConstants)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithAConstants)) == (?: ?)
END
&
THEORY HiddenConstantsEnvX IS
  HiddenConstants(Machine(MchWithAConstants)) == (Type(max_count) == HCst(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithAConstants)) == (Type(opMchWithAConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)));
  Observers(Machine(MchWithAConstants)) == (Type(opMchWithAConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
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
