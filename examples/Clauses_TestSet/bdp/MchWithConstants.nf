Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithConstants))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithConstants))==(Machine(MchWithConstants));
  Level(Machine(MchWithConstants))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithConstants)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithConstants))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithConstants))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithConstants))==(?);
  List_Includes(Machine(MchWithConstants))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithConstants))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithConstants))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithConstants))==(?);
  Context_List_Variables(Machine(MchWithConstants))==(?);
  Abstract_List_Variables(Machine(MchWithConstants))==(?);
  Local_List_Variables(Machine(MchWithConstants))==(?);
  List_Variables(Machine(MchWithConstants))==(?);
  External_List_Variables(Machine(MchWithConstants))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithConstants))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithConstants))==(?);
  External_List_VisibleVariables(Machine(MchWithConstants))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithConstants))==(?);
  List_VisibleVariables(Machine(MchWithConstants))==(?);
  Internal_List_VisibleVariables(Machine(MchWithConstants))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithConstants))==(btrue);
  Gluing_List_Invariant(Machine(MchWithConstants))==(btrue);
  Expanded_List_Invariant(Machine(MchWithConstants))==(btrue);
  Abstract_List_Invariant(Machine(MchWithConstants))==(btrue);
  Context_List_Invariant(Machine(MchWithConstants))==(btrue);
  List_Invariant(Machine(MchWithConstants))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithConstants))==(btrue);
  Abstract_List_Assertions(Machine(MchWithConstants))==(btrue);
  Context_List_Assertions(Machine(MchWithConstants))==(btrue);
  List_Assertions(Machine(MchWithConstants))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithConstants))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithConstants))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithConstants))==(skip);
  Context_List_Initialisation(Machine(MchWithConstants))==(skip);
  List_Initialisation(Machine(MchWithConstants))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithConstants))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithConstants))==(btrue);
  List_Constraints(Machine(MchWithConstants))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithConstants))==(opMchWithCConstants);
  List_Operations(Machine(MchWithConstants))==(opMchWithCConstants)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithConstants),opMchWithCConstants)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithConstants),opMchWithCConstants)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithConstants),opMchWithCConstants)==(res <-- opMchWithCConstants(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithConstants),opMchWithCConstants)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithConstants),opMchWithCConstants)==(nn: NAT | nn<max_count ==> res:=TRUE [] not(nn<max_count) ==> res:=FALSE);
  List_Substitution(Machine(MchWithConstants),opMchWithCConstants)==(IF nn<max_count THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithConstants))==(max_count);
  Inherited_List_Constants(Machine(MchWithConstants))==(?);
  List_Constants(Machine(MchWithConstants))==(max_count)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithConstants))==(?);
  Context_List_Defered(Machine(MchWithConstants))==(?);
  Context_List_Sets(Machine(MchWithConstants))==(?);
  List_Valuable_Sets(Machine(MchWithConstants))==(?);
  Inherited_List_Enumerated(Machine(MchWithConstants))==(?);
  Inherited_List_Defered(Machine(MchWithConstants))==(?);
  Inherited_List_Sets(Machine(MchWithConstants))==(?);
  List_Enumerated(Machine(MchWithConstants))==(?);
  List_Defered(Machine(MchWithConstants))==(?);
  List_Sets(Machine(MchWithConstants))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithConstants))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithConstants))==(?);
  List_HiddenConstants(Machine(MchWithConstants))==(?);
  External_List_HiddenConstants(Machine(MchWithConstants))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithConstants))==(btrue);
  Context_List_Properties(Machine(MchWithConstants))==(btrue);
  Inherited_List_Properties(Machine(MchWithConstants))==(btrue);
  List_Properties(Machine(MchWithConstants))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithConstants),opMchWithCConstants)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithConstants)) == (max_count | ? | ? | ? | opMchWithCConstants | ? | ? | ? | MchWithConstants);
  List_Of_HiddenCst_Ids(Machine(MchWithConstants)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithConstants)) == (max_count);
  List_Of_VisibleVar_Ids(Machine(MchWithConstants)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithConstants)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(MchWithConstants)) == (Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithConstants)) == (Type(opMchWithCConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)));
  Observers(Machine(MchWithConstants)) == (Type(opMchWithCConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
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
