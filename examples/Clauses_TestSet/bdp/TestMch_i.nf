Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(TestMch_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(TestMch_i))==(Machine(TestMch));
  Level(Implementation(TestMch_i))==(1);
  Upper_Level(Implementation(TestMch_i))==(Machine(TestMch))
END
&
THEORY LoadedStructureX IS
  Implementation(TestMch_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(TestMch_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(TestMch_i))==(MchToBeImported);
  Inherited_List_Includes(Implementation(TestMch_i))==(MchToBeImported)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(TestMch_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(TestMch_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(TestMch_i))==(?);
  Context_List_Variables(Implementation(TestMch_i))==(?);
  Abstract_List_Variables(Implementation(TestMch_i))==(?);
  Local_List_Variables(Implementation(TestMch_i))==(?);
  List_Variables(Implementation(TestMch_i))==(count);
  External_List_Variables(Implementation(TestMch_i))==(count)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(TestMch_i))==(?);
  Abstract_List_VisibleVariables(Implementation(TestMch_i))==(?);
  External_List_VisibleVariables(Implementation(TestMch_i))==(?);
  Expanded_List_VisibleVariables(Implementation(TestMch_i))==(?);
  List_VisibleVariables(Implementation(TestMch_i))==(countI);
  Internal_List_VisibleVariables(Implementation(TestMch_i))==(countI)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(TestMch_i))==(btrue);
  Abstract_List_Invariant(Implementation(TestMch_i))==(btrue);
  Expanded_List_Invariant(Implementation(TestMch_i))==(count: NAT & count<=10);
  Context_List_Invariant(Implementation(TestMch_i))==(btrue);
  List_Invariant(Implementation(TestMch_i))==(countI = count)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(TestMch_i))==(btrue);
  Expanded_List_Assertions(Implementation(TestMch_i))==(btrue);
  Context_List_Assertions(Implementation(TestMch_i))==(btrue);
  List_Assertions(Implementation(TestMch_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(TestMch_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(TestMch_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(TestMch_i))==(count:=0;(0: INT | countI:=0));
  Context_List_Initialisation(Implementation(TestMch_i))==(skip);
  List_Initialisation(Implementation(TestMch_i))==(countI:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(TestMch_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(TestMch_i),Machine(MchToBeImported))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(TestMch_i),Machine(MchToBeImported))==(btrue);
  List_Constraints(Implementation(TestMch_i))==(btrue);
  List_Context_Constraints(Implementation(TestMch_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(TestMch_i))==(set_variables_test_op_1,test_op_1);
  List_Operations(Implementation(TestMch_i))==(set_variables_test_op_1,test_op_1)
END
&
THEORY ListInputX IS
  List_Input(Implementation(TestMch_i),set_variables_test_op_1)==(?);
  List_Input(Implementation(TestMch_i),test_op_1)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(TestMch_i),set_variables_test_op_1)==(?);
  List_Output(Implementation(TestMch_i),test_op_1)==(verdict)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(TestMch_i),set_variables_test_op_1)==(set_variables_test_op_1);
  List_Header(Implementation(TestMch_i),test_op_1)==(verdict <-- test_op_1)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(TestMch_i),set_variables_test_op_1)==(btrue);
  List_Precondition(Implementation(TestMch_i),set_variables_test_op_1)==(btrue);
  Own_Precondition(Implementation(TestMch_i),test_op_1)==(btrue);
  List_Precondition(Implementation(TestMch_i),test_op_1)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(TestMch_i),test_op_1)==(btrue | (btrue | count:=6);(1: NAT & count+1<=10 | count:=count+1);(countI = 7 ==> verdict:=TRUE [] not(countI = 7) ==> verdict:=FALSE));
  Expanded_List_Substitution(Implementation(TestMch_i),set_variables_test_op_1)==(btrue & 6: INT | countI:=6);
  List_Substitution(Implementation(TestMch_i),set_variables_test_op_1)==(countI:=6);
  List_Substitution(Implementation(TestMch_i),test_op_1)==(set_variables_test_op_1;Inc(1);IF countI = 7 THEN verdict:=TRUE ELSE verdict:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(TestMch_i))==(?);
  Inherited_List_Constants(Implementation(TestMch_i))==(?);
  List_Constants(Implementation(TestMch_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(TestMch_i))==(?);
  Context_List_Defered(Implementation(TestMch_i))==(?);
  Context_List_Sets(Implementation(TestMch_i))==(?);
  List_Own_Enumerated(Implementation(TestMch_i))==(?);
  List_Valuable_Sets(Implementation(TestMch_i))==(?);
  Inherited_List_Enumerated(Implementation(TestMch_i))==(?);
  Inherited_List_Defered(Implementation(TestMch_i))==(?);
  Inherited_List_Sets(Implementation(TestMch_i))==(?);
  List_Enumerated(Implementation(TestMch_i))==(?);
  List_Defered(Implementation(TestMch_i))==(?);
  List_Sets(Implementation(TestMch_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(TestMch_i))==(?);
  Expanded_List_HiddenConstants(Implementation(TestMch_i))==(?);
  List_HiddenConstants(Implementation(TestMch_i))==(?);
  External_List_HiddenConstants(Implementation(TestMch_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(TestMch_i))==(btrue);
  Context_List_Properties(Implementation(TestMch_i))==(btrue);
  Inherited_List_Properties(Implementation(TestMch_i))==(btrue);
  List_Properties(Implementation(TestMch_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(TestMch_i))==(aa: aa);
  List_Values(Implementation(TestMch_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(TestMch_i),Machine(MchToBeImported))==(Inc,Dec)
END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(TestMch_i))==(Type(countI) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(TestMch_i))==(Type(test_op_1) == Cst(btype(BOOL,?,?),No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(TestMch_i)) == (? | ? | ? | count | set_variables_test_op_1,test_op_1,refinement_of_set_variables_test_op_1 | ? | imported(Machine(MchToBeImported)) | ? | TestMch_i);
  List_Of_HiddenCst_Ids(Implementation(TestMch_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(TestMch_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(TestMch_i)) == (countI | ?);
  List_Of_Ids_SeenBNU(Implementation(TestMch_i)) == (?: ?);
  List_Of_Ids(Machine(MchToBeImported)) == (? | ? | count | ? | Inc,Dec | ? | ? | ? | MchToBeImported);
  List_Of_HiddenCst_Ids(Machine(MchToBeImported)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchToBeImported)) == (?);
  List_Of_VisibleVar_Ids(Machine(MchToBeImported)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchToBeImported)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(TestMch_i)) == (Type(countI) == Mvv(btype(INTEGER,?,?)))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(TestMch_i))==(set_variables_test_op_1)
END
&
THEORY ListLocalInputX IS
  List_Local_Input(Implementation(TestMch_i),set_variables_test_op_1)==(?)
END
&
THEORY ListLocalOutputX IS
  List_Local_Output(Implementation(TestMch_i),set_variables_test_op_1)==(?)
END
&
THEORY ListLocalHeaderX IS
  List_Local_Header(Implementation(TestMch_i),set_variables_test_op_1)==(set_variables_test_op_1)
END
&
THEORY ListLocalPreconditionX IS
  List_Local_Precondition(Implementation(TestMch_i),set_variables_test_op_1)==(btrue)
END
&
THEORY ListLocalSubstitutionX IS
  Expanded_List_Local_Substitution(Implementation(TestMch_i),set_variables_test_op_1)==(btrue | count:=6);
  List_Local_Substitution(Implementation(TestMch_i),set_variables_test_op_1)==(count:=6)
END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(TestMch_i))==(countI: INTEGER)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(TestMch_i),Machine(MchToBeImported))==(count);
  ImportedVisVariablesList(Implementation(TestMch_i),Machine(MchToBeImported))==(?)
END
&
THEORY ListLocalOpInvariantX IS
  LocalOp_Expanded_Invariant(Implementation(TestMch_i),set_variables_test_op_1)==(count: NAT & count<=10)
END
)
