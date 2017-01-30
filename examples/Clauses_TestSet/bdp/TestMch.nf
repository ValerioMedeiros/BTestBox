Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(TestMch))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(TestMch))==(Machine(TestMch));
  Level(Machine(TestMch))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(TestMch)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(TestMch))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(TestMch))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(TestMch))==(?);
  List_Includes(Machine(TestMch))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(TestMch))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(TestMch))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(TestMch))==(?);
  Context_List_Variables(Machine(TestMch))==(?);
  Abstract_List_Variables(Machine(TestMch))==(?);
  Local_List_Variables(Machine(TestMch))==(?);
  List_Variables(Machine(TestMch))==(?);
  External_List_Variables(Machine(TestMch))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(TestMch))==(?);
  Abstract_List_VisibleVariables(Machine(TestMch))==(?);
  External_List_VisibleVariables(Machine(TestMch))==(?);
  Expanded_List_VisibleVariables(Machine(TestMch))==(?);
  List_VisibleVariables(Machine(TestMch))==(?);
  Internal_List_VisibleVariables(Machine(TestMch))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(TestMch))==(btrue);
  Gluing_List_Invariant(Machine(TestMch))==(btrue);
  Expanded_List_Invariant(Machine(TestMch))==(btrue);
  Abstract_List_Invariant(Machine(TestMch))==(btrue);
  Context_List_Invariant(Machine(TestMch))==(btrue);
  List_Invariant(Machine(TestMch))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(TestMch))==(btrue);
  Abstract_List_Assertions(Machine(TestMch))==(btrue);
  Context_List_Assertions(Machine(TestMch))==(btrue);
  List_Assertions(Machine(TestMch))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(TestMch))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(TestMch))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(TestMch))==(skip);
  Context_List_Initialisation(Machine(TestMch))==(skip);
  List_Initialisation(Machine(TestMch))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(TestMch))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(TestMch))==(btrue);
  List_Constraints(Machine(TestMch))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(TestMch))==(test_op_1);
  List_Operations(Machine(TestMch))==(test_op_1)
END
&
THEORY ListInputX IS
  List_Input(Machine(TestMch),test_op_1)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(TestMch),test_op_1)==(verdict)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(TestMch),test_op_1)==(verdict <-- test_op_1)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(TestMch),test_op_1)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(TestMch),test_op_1)==(btrue | @ans.(ans: BOOL ==> verdict:=ans));
  List_Substitution(Machine(TestMch),test_op_1)==(ANY ans WHERE ans: BOOL THEN verdict:=ans END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(TestMch))==(?);
  Inherited_List_Constants(Machine(TestMch))==(?);
  List_Constants(Machine(TestMch))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(TestMch))==(?);
  Context_List_Defered(Machine(TestMch))==(?);
  Context_List_Sets(Machine(TestMch))==(?);
  List_Valuable_Sets(Machine(TestMch))==(?);
  Inherited_List_Enumerated(Machine(TestMch))==(?);
  Inherited_List_Defered(Machine(TestMch))==(?);
  Inherited_List_Sets(Machine(TestMch))==(?);
  List_Enumerated(Machine(TestMch))==(?);
  List_Defered(Machine(TestMch))==(?);
  List_Sets(Machine(TestMch))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(TestMch))==(?);
  Expanded_List_HiddenConstants(Machine(TestMch))==(?);
  List_HiddenConstants(Machine(TestMch))==(?);
  External_List_HiddenConstants(Machine(TestMch))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(TestMch))==(btrue);
  Context_List_Properties(Machine(TestMch))==(btrue);
  Inherited_List_Properties(Machine(TestMch))==(btrue);
  List_Properties(Machine(TestMch))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(TestMch),test_op_1)==(Var(ans) == btype(BOOL,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(TestMch)) == (? | ? | ? | ? | test_op_1 | ? | ? | ? | TestMch);
  List_Of_HiddenCst_Ids(Machine(TestMch)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(TestMch)) == (?);
  List_Of_VisibleVar_Ids(Machine(TestMch)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(TestMch)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(TestMch)) == (Type(test_op_1) == Cst(btype(BOOL,?,?),No_type));
  Observers(Machine(TestMch)) == (Type(test_op_1) == Cst(btype(BOOL,?,?),No_type))
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
