Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithLocalOperations_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithLocalOperations_i))==(Machine(MchWithLocalOperations));
  Level(Implementation(MchWithLocalOperations_i))==(1);
  Upper_Level(Implementation(MchWithLocalOperations_i))==(Machine(MchWithLocalOperations))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithLocalOperations_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithLocalOperations_i))==(?);
  Inherited_List_Includes(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithLocalOperations_i))==(?);
  Context_List_Variables(Implementation(MchWithLocalOperations_i))==(?);
  Abstract_List_Variables(Implementation(MchWithLocalOperations_i))==(?);
  Local_List_Variables(Implementation(MchWithLocalOperations_i))==(?);
  List_Variables(Implementation(MchWithLocalOperations_i))==(?);
  External_List_Variables(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithLocalOperations_i))==(?);
  Abstract_List_VisibleVariables(Implementation(MchWithLocalOperations_i))==(?);
  External_List_VisibleVariables(Implementation(MchWithLocalOperations_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchWithLocalOperations_i))==(?);
  List_VisibleVariables(Implementation(MchWithLocalOperations_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithLocalOperations_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchWithLocalOperations_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithLocalOperations_i))==(btrue);
  Context_List_Invariant(Implementation(MchWithLocalOperations_i))==(btrue);
  List_Invariant(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchWithLocalOperations_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchWithLocalOperations_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithLocalOperations_i))==(btrue);
  List_Assertions(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithLocalOperations_i))==(skip);
  Context_List_Initialisation(Implementation(MchWithLocalOperations_i))==(skip);
  List_Initialisation(Implementation(MchWithLocalOperations_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithLocalOperations_i))==(btrue);
  List_Context_Constraints(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithLocalOperations_i))==(max_y,opMchWithLocalOperations);
  List_Operations(Implementation(MchWithLocalOperations_i))==(max_y,opMchWithLocalOperations)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithLocalOperations_i),max_y)==(nn1,nn2);
  List_Input(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(nn1,nn2)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithLocalOperations_i),max_y)==(res);
  List_Output(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithLocalOperations_i),max_y)==(res <-- max_y(nn1,nn2));
  List_Header(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(res <-- opMchWithLocalOperations(nn1,nn2))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithLocalOperations_i),max_y)==(btrue);
  List_Precondition(Implementation(MchWithLocalOperations_i),max_y)==(nn1: NAT & nn2: NAT);
  Own_Precondition(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(btrue);
  List_Precondition(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(nn1: NAT & nn2: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(nn1: NAT & nn2: NAT | nn1>nn2 ==> res:=nn1 [] not(nn1>nn2) ==> res:=nn2);
  Expanded_List_Substitution(Implementation(MchWithLocalOperations_i),max_y)==(nn1: NAT & nn2: NAT | nn1>nn2 ==> (nn1: INT | res:=nn1) [] not(nn1>nn2) ==> (nn2: INT | res:=nn2));
  List_Substitution(Implementation(MchWithLocalOperations_i),max_y)==(IF nn1>nn2 THEN res:=nn1 ELSE res:=nn2 END);
  List_Substitution(Implementation(MchWithLocalOperations_i),opMchWithLocalOperations)==(res <-- max_y(nn1,nn2))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithLocalOperations_i))==(?);
  Inherited_List_Constants(Implementation(MchWithLocalOperations_i))==(?);
  List_Constants(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchWithLocalOperations_i))==(?);
  Context_List_Defered(Implementation(MchWithLocalOperations_i))==(?);
  Context_List_Sets(Implementation(MchWithLocalOperations_i))==(?);
  List_Own_Enumerated(Implementation(MchWithLocalOperations_i))==(?);
  List_Valuable_Sets(Implementation(MchWithLocalOperations_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithLocalOperations_i))==(?);
  Inherited_List_Defered(Implementation(MchWithLocalOperations_i))==(?);
  Inherited_List_Sets(Implementation(MchWithLocalOperations_i))==(?);
  List_Enumerated(Implementation(MchWithLocalOperations_i))==(?);
  List_Defered(Implementation(MchWithLocalOperations_i))==(?);
  List_Sets(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithLocalOperations_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchWithLocalOperations_i))==(?);
  List_HiddenConstants(Implementation(MchWithLocalOperations_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithLocalOperations_i))==(btrue);
  Context_List_Properties(Implementation(MchWithLocalOperations_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithLocalOperations_i))==(btrue);
  List_Properties(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(MchWithLocalOperations_i))==(aa: aa);
  List_Values(Implementation(MchWithLocalOperations_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(MchWithLocalOperations_i))==(Type(opMchWithLocalOperations) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithLocalOperations_i)) == (? | ? | ? | ? | max_y,opMchWithLocalOperations,refinement_of_max_y | ? | ? | ? | MchWithLocalOperations_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithLocalOperations_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithLocalOperations_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchWithLocalOperations_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(MchWithLocalOperations_i)) == (?: ?)
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
  List_Local_Operations(Implementation(MchWithLocalOperations_i))==(max_y)
END
&
THEORY ListLocalInputX IS
  List_Local_Input(Implementation(MchWithLocalOperations_i),max_y)==(nn1,nn2)
END
&
THEORY ListLocalOutputX IS
  List_Local_Output(Implementation(MchWithLocalOperations_i),max_y)==(res)
END
&
THEORY ListLocalHeaderX IS
  List_Local_Header(Implementation(MchWithLocalOperations_i),max_y)==(res <-- max_y(nn1,nn2))
END
&
THEORY ListLocalPreconditionX IS
  List_Local_Precondition(Implementation(MchWithLocalOperations_i),max_y)==(nn1: NAT & nn2: NAT)
END
&
THEORY ListLocalSubstitutionX IS
  Expanded_List_Local_Substitution(Implementation(MchWithLocalOperations_i),max_y)==(nn1: NAT & nn2: NAT | nn1>nn2 ==> res:=nn1 [] not(nn1>nn2) ==> res:=nn2);
  List_Local_Substitution(Implementation(MchWithLocalOperations_i),max_y)==(IF nn1>nn2 THEN res:=nn1 ELSE res:=nn2 END)
END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(MchWithLocalOperations_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX IS
  LocalOp_Expanded_Invariant(Implementation(MchWithLocalOperations_i),max_y)==(btrue)
END
)
