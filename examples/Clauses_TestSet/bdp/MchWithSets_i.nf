Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithSets_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithSets_i))==(Machine(MchWithSets));
  Level(Implementation(MchWithSets_i))==(1);
  Upper_Level(Implementation(MchWithSets_i))==(Machine(MchWithSets))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithSets_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithSets_i))==(?);
  Inherited_List_Includes(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithSets_i))==(?);
  Context_List_Variables(Implementation(MchWithSets_i))==(?);
  Abstract_List_Variables(Implementation(MchWithSets_i))==(?);
  Local_List_Variables(Implementation(MchWithSets_i))==(?);
  List_Variables(Implementation(MchWithSets_i))==(?);
  External_List_Variables(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithSets_i))==(?);
  Abstract_List_VisibleVariables(Implementation(MchWithSets_i))==(?);
  External_List_VisibleVariables(Implementation(MchWithSets_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchWithSets_i))==(?);
  List_VisibleVariables(Implementation(MchWithSets_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithSets_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchWithSets_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithSets_i))==(btrue);
  Context_List_Invariant(Implementation(MchWithSets_i))==(btrue);
  List_Invariant(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchWithSets_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchWithSets_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithSets_i))==(btrue);
  List_Assertions(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithSets_i))==(skip);
  Context_List_Initialisation(Implementation(MchWithSets_i))==(skip);
  List_Initialisation(Implementation(MchWithSets_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithSets_i))==(btrue);
  List_Context_Constraints(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithSets_i))==(opMchWithSets);
  List_Operations(Implementation(MchWithSets_i))==(opMchWithSets)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithSets_i),opMchWithSets)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithSets_i),opMchWithSets)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithSets_i),opMchWithSets)==(res <-- opMchWithSets(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithSets_i),opMchWithSets)==(btrue);
  List_Precondition(Implementation(MchWithSets_i),opMchWithSets)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchWithSets_i),opMchWithSets)==(nn: NAT | nn<max_count ==> res:=Okay [] not(nn<max_count) ==> res:=Out_of_Range);
  List_Substitution(Implementation(MchWithSets_i),opMchWithSets)==(IF nn<max_count THEN res:=Okay ELSE res:=Out_of_Range END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithSets_i))==(max_count);
  Inherited_List_Constants(Implementation(MchWithSets_i))==(max_count);
  List_Constants(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(MchWithSets_i),answer)==({Okay,Out_of_Range});
  Context_List_Enumerated(Implementation(MchWithSets_i))==(?);
  Context_List_Defered(Implementation(MchWithSets_i))==(?);
  Context_List_Sets(Implementation(MchWithSets_i))==(?);
  List_Own_Enumerated(Implementation(MchWithSets_i))==(answer);
  List_Valuable_Sets(Implementation(MchWithSets_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithSets_i))==(answer);
  Inherited_List_Defered(Implementation(MchWithSets_i))==(?);
  Inherited_List_Sets(Implementation(MchWithSets_i))==(answer);
  List_Enumerated(Implementation(MchWithSets_i))==(?);
  List_Defered(Implementation(MchWithSets_i))==(?);
  List_Sets(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithSets_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchWithSets_i))==(?);
  List_HiddenConstants(Implementation(MchWithSets_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithSets_i))==(max_count = 10 & answer: FIN(INTEGER) & not(answer = {}));
  Context_List_Properties(Implementation(MchWithSets_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithSets_i))==(btrue);
  List_Properties(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(MchWithSets_i))==(btrue);
  Values_Subs(Implementation(MchWithSets_i))==(max_count: 10);
  List_Values(Implementation(MchWithSets_i))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(MchWithSets_i))==(Type(opMchWithSets) == Cst(etype(answer,?,?),btype(INTEGER,?,?)));
  Constants(Implementation(MchWithSets_i))==(Type(Okay) == Cst(etype(answer,0,1));Type(Out_of_Range) == Cst(etype(answer,0,1));Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithSets_i)) == (? | ? | ? | ? | opMchWithSets | ? | ? | ? | MchWithSets_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithSets_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithSets_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchWithSets_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(MchWithSets_i)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Implementation(MchWithSets_i)) == (Type(answer) == Cst(SetOf(etype(answer,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(MchWithSets_i)) == (Type(max_count) == Cst(btype(INTEGER,?,?));Type(Out_of_Range) == Cst(etype(answer,0,1));Type(Okay) == Cst(etype(answer,0,1)))
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
  List_Local_Operations(Implementation(MchWithSets_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(MchWithSets_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
