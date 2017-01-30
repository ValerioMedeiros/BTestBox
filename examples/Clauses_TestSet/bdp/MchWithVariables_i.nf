Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchWithVariables_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchWithVariables_i))==(Machine(MchWithVariables));
  Level(Implementation(MchWithVariables_i))==(1);
  Upper_Level(Implementation(MchWithVariables_i))==(Machine(MchWithVariables))
END
&
THEORY LoadedStructureX IS
  Implementation(MchWithVariables_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchWithVariables_i))==(?);
  Inherited_List_Includes(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchWithVariables_i))==(?);
  Context_List_Variables(Implementation(MchWithVariables_i))==(?);
  Abstract_List_Variables(Implementation(MchWithVariables_i))==(count);
  Local_List_Variables(Implementation(MchWithVariables_i))==(?);
  List_Variables(Implementation(MchWithVariables_i))==(?);
  External_List_Variables(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchWithVariables_i))==(?);
  Abstract_List_VisibleVariables(Implementation(MchWithVariables_i))==(?);
  External_List_VisibleVariables(Implementation(MchWithVariables_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchWithVariables_i))==(?);
  List_VisibleVariables(Implementation(MchWithVariables_i))==(countImp);
  Internal_List_VisibleVariables(Implementation(MchWithVariables_i))==(countImp)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchWithVariables_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchWithVariables_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchWithVariables_i))==(count: NAT & count<=max_count);
  Context_List_Invariant(Implementation(MchWithVariables_i))==(btrue);
  List_Invariant(Implementation(MchWithVariables_i))==(countImp: NAT & countImp<=max_count & countImp = count)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchWithVariables_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchWithVariables_i))==(btrue);
  Context_List_Assertions(Implementation(MchWithVariables_i))==(btrue);
  List_Assertions(Implementation(MchWithVariables_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchWithVariables_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchWithVariables_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchWithVariables_i))==(0: INT | countImp:=0);
  Context_List_Initialisation(Implementation(MchWithVariables_i))==(skip);
  List_Initialisation(Implementation(MchWithVariables_i))==(countImp:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchWithVariables_i))==(btrue);
  List_Context_Constraints(Implementation(MchWithVariables_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchWithVariables_i))==(opIncCount,opRelease,resetCount,getCount);
  List_Operations(Implementation(MchWithVariables_i))==(opIncCount,opRelease,resetCount,getCount)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchWithVariables_i),opIncCount)==(nn);
  List_Input(Implementation(MchWithVariables_i),opRelease)==(nn);
  List_Input(Implementation(MchWithVariables_i),resetCount)==(?);
  List_Input(Implementation(MchWithVariables_i),getCount)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchWithVariables_i),opIncCount)==(res);
  List_Output(Implementation(MchWithVariables_i),opRelease)==(res);
  List_Output(Implementation(MchWithVariables_i),resetCount)==(?);
  List_Output(Implementation(MchWithVariables_i),getCount)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchWithVariables_i),opIncCount)==(res <-- opIncCount(nn));
  List_Header(Implementation(MchWithVariables_i),opRelease)==(res <-- opRelease(nn));
  List_Header(Implementation(MchWithVariables_i),resetCount)==(resetCount);
  List_Header(Implementation(MchWithVariables_i),getCount)==(res <-- getCount)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchWithVariables_i),opIncCount)==(btrue);
  List_Precondition(Implementation(MchWithVariables_i),opIncCount)==(nn: NAT & nn>0);
  Own_Precondition(Implementation(MchWithVariables_i),opRelease)==(btrue);
  List_Precondition(Implementation(MchWithVariables_i),opRelease)==(nn: NAT);
  Own_Precondition(Implementation(MchWithVariables_i),resetCount)==(btrue);
  List_Precondition(Implementation(MchWithVariables_i),resetCount)==(btrue);
  Own_Precondition(Implementation(MchWithVariables_i),getCount)==(btrue);
  List_Precondition(Implementation(MchWithVariables_i),getCount)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchWithVariables_i),getCount)==(btrue & countImp: INT | res:=countImp);
  Expanded_List_Substitution(Implementation(MchWithVariables_i),resetCount)==(btrue & 0: INT | countImp:=0);
  Expanded_List_Substitution(Implementation(MchWithVariables_i),opRelease)==(nn: NAT | @aux.((countImp-nn: INT & countImp: INT & nn: INT | aux:=countImp-nn);(aux<0 ==> (0: INT | res:=0) [] not(aux<0) ==> ((1: INT | res:=1);(countImp-nn: INT & countImp: INT & nn: INT | countImp:=countImp-nn)))));
  Expanded_List_Substitution(Implementation(MchWithVariables_i),opIncCount)==(nn: NAT & nn>0 | @aux.((countImp+nn: INT & countImp: INT & nn: INT | aux:=countImp+nn);(aux<max_count ==> ((1: INT | res:=1);(countImp+nn: INT & countImp: INT & nn: INT | countImp:=countImp+nn)) [] not(aux<max_count) ==> (0: INT | res:=0))));
  List_Substitution(Implementation(MchWithVariables_i),opIncCount)==(VAR aux IN aux:=countImp+nn;IF aux<max_count THEN res:=1;countImp:=countImp+nn ELSE res:=0 END END);
  List_Substitution(Implementation(MchWithVariables_i),opRelease)==(VAR aux IN aux:=countImp-nn;IF aux<0 THEN res:=0 ELSE res:=1;countImp:=countImp-nn END END);
  List_Substitution(Implementation(MchWithVariables_i),resetCount)==(countImp:=0);
  List_Substitution(Implementation(MchWithVariables_i),getCount)==(res:=countImp)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchWithVariables_i))==(max_count);
  Inherited_List_Constants(Implementation(MchWithVariables_i))==(max_count);
  List_Constants(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchWithVariables_i))==(?);
  Context_List_Defered(Implementation(MchWithVariables_i))==(?);
  Context_List_Sets(Implementation(MchWithVariables_i))==(?);
  List_Own_Enumerated(Implementation(MchWithVariables_i))==(?);
  List_Valuable_Sets(Implementation(MchWithVariables_i))==(?);
  Inherited_List_Enumerated(Implementation(MchWithVariables_i))==(?);
  Inherited_List_Defered(Implementation(MchWithVariables_i))==(?);
  Inherited_List_Sets(Implementation(MchWithVariables_i))==(?);
  List_Enumerated(Implementation(MchWithVariables_i))==(?);
  List_Defered(Implementation(MchWithVariables_i))==(?);
  List_Sets(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchWithVariables_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchWithVariables_i))==(?);
  List_HiddenConstants(Implementation(MchWithVariables_i))==(?);
  External_List_HiddenConstants(Implementation(MchWithVariables_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchWithVariables_i))==(max_count = 10);
  Context_List_Properties(Implementation(MchWithVariables_i))==(btrue);
  Inherited_List_Properties(Implementation(MchWithVariables_i))==(btrue);
  List_Properties(Implementation(MchWithVariables_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(MchWithVariables_i))==(btrue);
  Values_Subs(Implementation(MchWithVariables_i))==(max_count: 10);
  List_Values(Implementation(MchWithVariables_i))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(MchWithVariables_i))==(Type(countImp) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(MchWithVariables_i))==(Type(getCount) == Cst(btype(INTEGER,?,?),No_type);Type(resetCount) == Cst(No_type,No_type);Type(opRelease) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(opIncCount) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Constants(Implementation(MchWithVariables_i))==(Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchWithVariables_i)) == (? | ? | ? | ? | opIncCount,opRelease,resetCount,getCount | ? | ? | ? | MchWithVariables_i);
  List_Of_HiddenCst_Ids(Implementation(MchWithVariables_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchWithVariables_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchWithVariables_i)) == (countImp | ?);
  List_Of_Ids_SeenBNU(Implementation(MchWithVariables_i)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(MchWithVariables_i)) == (Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(MchWithVariables_i)) == (Type(countImp) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(MchWithVariables_i),opIncCount, 1) == (Type(aux) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(MchWithVariables_i),opRelease, 1) == (Type(aux) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(MchWithVariables_i))==(?)
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
  TypingPredicate(Implementation(MchWithVariables_i))==(countImp: INTEGER)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
