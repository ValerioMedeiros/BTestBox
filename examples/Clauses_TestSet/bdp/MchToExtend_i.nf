Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(MchToExtend_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(MchToExtend_i))==(Machine(MchToExtend));
  Level(Implementation(MchToExtend_i))==(1);
  Upper_Level(Implementation(MchToExtend_i))==(Machine(MchToExtend))
END
&
THEORY LoadedStructureX IS
  Implementation(MchToExtend_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(MchToExtend_i))==(?);
  Inherited_List_Includes(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(MchToExtend_i))==(?);
  Context_List_Variables(Implementation(MchToExtend_i))==(?);
  Abstract_List_Variables(Implementation(MchToExtend_i))==(?);
  Local_List_Variables(Implementation(MchToExtend_i))==(?);
  List_Variables(Implementation(MchToExtend_i))==(?);
  External_List_Variables(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(MchToExtend_i))==(count);
  Abstract_List_VisibleVariables(Implementation(MchToExtend_i))==(count);
  External_List_VisibleVariables(Implementation(MchToExtend_i))==(?);
  Expanded_List_VisibleVariables(Implementation(MchToExtend_i))==(?);
  List_VisibleVariables(Implementation(MchToExtend_i))==(?);
  Internal_List_VisibleVariables(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(MchToExtend_i))==(btrue);
  Expanded_List_Invariant(Implementation(MchToExtend_i))==(btrue);
  Abstract_List_Invariant(Implementation(MchToExtend_i))==(count: NAT);
  Context_List_Invariant(Implementation(MchToExtend_i))==(btrue);
  List_Invariant(Implementation(MchToExtend_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(MchToExtend_i))==(btrue);
  Abstract_List_Assertions(Implementation(MchToExtend_i))==(btrue);
  Context_List_Assertions(Implementation(MchToExtend_i))==(btrue);
  List_Assertions(Implementation(MchToExtend_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(MchToExtend_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(MchToExtend_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(MchToExtend_i))==(0: INT | count:=0);
  Context_List_Initialisation(Implementation(MchToExtend_i))==(skip);
  List_Initialisation(Implementation(MchToExtend_i))==(count:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(MchToExtend_i))==(btrue);
  List_Context_Constraints(Implementation(MchToExtend_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(MchToExtend_i))==(Inc,Dec,RandomInc);
  List_Operations(Implementation(MchToExtend_i))==(Inc,Dec,RandomInc)
END
&
THEORY ListInputX IS
  List_Input(Implementation(MchToExtend_i),Inc)==(nn);
  List_Input(Implementation(MchToExtend_i),Dec)==(nn);
  List_Input(Implementation(MchToExtend_i),RandomInc)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(MchToExtend_i),Inc)==(?);
  List_Output(Implementation(MchToExtend_i),Dec)==(?);
  List_Output(Implementation(MchToExtend_i),RandomInc)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(MchToExtend_i),Inc)==(Inc(nn));
  List_Header(Implementation(MchToExtend_i),Dec)==(Dec(nn));
  List_Header(Implementation(MchToExtend_i),RandomInc)==(RandomInc)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(MchToExtend_i),Inc)==(btrue);
  List_Precondition(Implementation(MchToExtend_i),Inc)==(nn: NAT & count+nn<50);
  Own_Precondition(Implementation(MchToExtend_i),Dec)==(btrue);
  List_Precondition(Implementation(MchToExtend_i),Dec)==(nn: NAT & count-nn>=0);
  Own_Precondition(Implementation(MchToExtend_i),RandomInc)==(btrue);
  List_Precondition(Implementation(MchToExtend_i),RandomInc)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(MchToExtend_i),RandomInc)==(btrue & count: INT | count:=count);
  Expanded_List_Substitution(Implementation(MchToExtend_i),Dec)==(nn: NAT & count-nn>=0 | @sub.((count-nn: INT & count: INT & nn: INT | sub:=count-nn);(sub>=0 ==> (sub: INT | count:=sub) [] not(sub>=0) ==> skip)));
  Expanded_List_Substitution(Implementation(MchToExtend_i),Inc)==(nn: NAT & count+nn<50 | @sum.((count+nn: INT & count: INT & nn: INT | sum:=count+nn);(sum<=50 ==> (sum: INT | count:=sum) [] not(sum<=50) ==> skip)));
  List_Substitution(Implementation(MchToExtend_i),Inc)==(VAR sum IN sum:=count+nn;IF sum<=50 THEN count:=sum END END);
  List_Substitution(Implementation(MchToExtend_i),Dec)==(VAR sub IN sub:=count-nn;IF sub>=0 THEN count:=sub END END);
  List_Substitution(Implementation(MchToExtend_i),RandomInc)==(count:=count)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(MchToExtend_i))==(?);
  Inherited_List_Constants(Implementation(MchToExtend_i))==(?);
  List_Constants(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(MchToExtend_i))==(?);
  Context_List_Defered(Implementation(MchToExtend_i))==(?);
  Context_List_Sets(Implementation(MchToExtend_i))==(?);
  List_Own_Enumerated(Implementation(MchToExtend_i))==(?);
  List_Valuable_Sets(Implementation(MchToExtend_i))==(?);
  Inherited_List_Enumerated(Implementation(MchToExtend_i))==(?);
  Inherited_List_Defered(Implementation(MchToExtend_i))==(?);
  Inherited_List_Sets(Implementation(MchToExtend_i))==(?);
  List_Enumerated(Implementation(MchToExtend_i))==(?);
  List_Defered(Implementation(MchToExtend_i))==(?);
  List_Sets(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(MchToExtend_i))==(?);
  Expanded_List_HiddenConstants(Implementation(MchToExtend_i))==(?);
  List_HiddenConstants(Implementation(MchToExtend_i))==(?);
  External_List_HiddenConstants(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(MchToExtend_i))==(btrue);
  Context_List_Properties(Implementation(MchToExtend_i))==(btrue);
  Inherited_List_Properties(Implementation(MchToExtend_i))==(btrue);
  List_Properties(Implementation(MchToExtend_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(MchToExtend_i))==(aa: aa);
  List_Values(Implementation(MchToExtend_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(MchToExtend_i))==(Type(RandomInc) == Cst(No_type,No_type);Type(Dec) == Cst(No_type,btype(INTEGER,?,?));Type(Inc) == Cst(No_type,btype(INTEGER,?,?)));
  VisibleVariables(Implementation(MchToExtend_i))==(Type(count) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(MchToExtend_i)) == (? | ? | ? | ? | Inc,Dec,RandomInc | ? | ? | ? | MchToExtend_i);
  List_Of_HiddenCst_Ids(Implementation(MchToExtend_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(MchToExtend_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(MchToExtend_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(MchToExtend_i)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(MchToExtend_i)) == (Type(count) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(MchToExtend_i),Inc, 1) == (Type(sum) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(MchToExtend_i),Dec, 1) == (Type(sub) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(MchToExtend_i))==(?)
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
  TypingPredicate(Implementation(MchToExtend_i))==(count: INTEGER)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
