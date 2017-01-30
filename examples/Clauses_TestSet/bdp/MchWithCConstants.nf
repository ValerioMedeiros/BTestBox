Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithCConstants))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithCConstants))==(Machine(MchWithCConstants));
  Level(Machine(MchWithCConstants))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithCConstants)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithCConstants))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithCConstants))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithCConstants))==(?);
  List_Includes(Machine(MchWithCConstants))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithCConstants))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithCConstants))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithCConstants))==(?);
  Context_List_Variables(Machine(MchWithCConstants))==(?);
  Abstract_List_Variables(Machine(MchWithCConstants))==(?);
  Local_List_Variables(Machine(MchWithCConstants))==(?);
  List_Variables(Machine(MchWithCConstants))==(?);
  External_List_Variables(Machine(MchWithCConstants))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithCConstants))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithCConstants))==(?);
  External_List_VisibleVariables(Machine(MchWithCConstants))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithCConstants))==(?);
  List_VisibleVariables(Machine(MchWithCConstants))==(?);
  Internal_List_VisibleVariables(Machine(MchWithCConstants))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithCConstants))==(btrue);
  Gluing_List_Invariant(Machine(MchWithCConstants))==(btrue);
  Expanded_List_Invariant(Machine(MchWithCConstants))==(btrue);
  Abstract_List_Invariant(Machine(MchWithCConstants))==(btrue);
  Context_List_Invariant(Machine(MchWithCConstants))==(btrue);
  List_Invariant(Machine(MchWithCConstants))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithCConstants))==(btrue);
  Abstract_List_Assertions(Machine(MchWithCConstants))==(btrue);
  Context_List_Assertions(Machine(MchWithCConstants))==(btrue);
  List_Assertions(Machine(MchWithCConstants))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithCConstants))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithCConstants))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithCConstants))==(skip);
  Context_List_Initialisation(Machine(MchWithCConstants))==(skip);
  List_Initialisation(Machine(MchWithCConstants))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithCConstants))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithCConstants))==(btrue);
  List_Constraints(Machine(MchWithCConstants))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithCConstants))==(opMchWithCConstants);
  List_Operations(Machine(MchWithCConstants))==(opMchWithCConstants)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithCConstants),opMchWithCConstants)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithCConstants),opMchWithCConstants)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithCConstants),opMchWithCConstants)==(res <-- opMchWithCConstants(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithCConstants),opMchWithCConstants)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithCConstants),opMchWithCConstants)==(nn: NAT | nn<max_count ==> res:=TRUE [] not(nn<max_count) ==> res:=FALSE);
  List_Substitution(Machine(MchWithCConstants),opMchWithCConstants)==(IF nn<max_count THEN res:=TRUE ELSE res:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithCConstants))==(max_count);
  Inherited_List_Constants(Machine(MchWithCConstants))==(?);
  List_Constants(Machine(MchWithCConstants))==(max_count)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithCConstants))==(?);
  Context_List_Defered(Machine(MchWithCConstants))==(?);
  Context_List_Sets(Machine(MchWithCConstants))==(?);
  List_Valuable_Sets(Machine(MchWithCConstants))==(?);
  Inherited_List_Enumerated(Machine(MchWithCConstants))==(?);
  Inherited_List_Defered(Machine(MchWithCConstants))==(?);
  Inherited_List_Sets(Machine(MchWithCConstants))==(?);
  List_Enumerated(Machine(MchWithCConstants))==(?);
  List_Defered(Machine(MchWithCConstants))==(?);
  List_Sets(Machine(MchWithCConstants))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithCConstants))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithCConstants))==(?);
  List_HiddenConstants(Machine(MchWithCConstants))==(?);
  External_List_HiddenConstants(Machine(MchWithCConstants))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithCConstants))==(btrue);
  Context_List_Properties(Machine(MchWithCConstants))==(btrue);
  Inherited_List_Properties(Machine(MchWithCConstants))==(btrue);
  List_Properties(Machine(MchWithCConstants))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithCConstants),opMchWithCConstants)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithCConstants)) == (max_count | ? | ? | ? | opMchWithCConstants | ? | ? | ? | MchWithCConstants);
  List_Of_HiddenCst_Ids(Machine(MchWithCConstants)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithCConstants)) == (max_count);
  List_Of_VisibleVar_Ids(Machine(MchWithCConstants)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithCConstants)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(MchWithCConstants)) == (Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithCConstants)) == (Type(opMchWithCConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)));
  Observers(Machine(MchWithCConstants)) == (Type(opMchWithCConstants) == Cst(btype(BOOL,?,?),btype(INTEGER,?,?)))
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
