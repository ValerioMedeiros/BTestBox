Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(duoseq_while_nestedwhile_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(duoseq_while_nestedwhile_i))==(Machine(duoseq_while_nestedwhile));
  Level(Implementation(duoseq_while_nestedwhile_i))==(1);
  Upper_Level(Implementation(duoseq_while_nestedwhile_i))==(Machine(duoseq_while_nestedwhile))
END
&
THEORY LoadedStructureX IS
  Implementation(duoseq_while_nestedwhile_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(duoseq_while_nestedwhile_i))==(?);
  Inherited_List_Includes(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(duoseq_while_nestedwhile_i))==(?);
  Context_List_Variables(Implementation(duoseq_while_nestedwhile_i))==(?);
  Abstract_List_Variables(Implementation(duoseq_while_nestedwhile_i))==(?);
  Local_List_Variables(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Variables(Implementation(duoseq_while_nestedwhile_i))==(?);
  External_List_Variables(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(duoseq_while_nestedwhile_i))==(?);
  Abstract_List_VisibleVariables(Implementation(duoseq_while_nestedwhile_i))==(?);
  External_List_VisibleVariables(Implementation(duoseq_while_nestedwhile_i))==(?);
  Expanded_List_VisibleVariables(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_VisibleVariables(Implementation(duoseq_while_nestedwhile_i))==(?);
  Internal_List_VisibleVariables(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Expanded_List_Invariant(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Abstract_List_Invariant(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Context_List_Invariant(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  List_Invariant(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Abstract_List_Assertions(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Context_List_Assertions(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  List_Assertions(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(duoseq_while_nestedwhile_i))==(skip);
  Context_List_Initialisation(Implementation(duoseq_while_nestedwhile_i))==(skip);
  List_Initialisation(Implementation(duoseq_while_nestedwhile_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  List_Context_Constraints(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(duoseq_while_nestedwhile_i))==(opduoseq_while_nestedwhile);
  List_Operations(Implementation(duoseq_while_nestedwhile_i))==(opduoseq_while_nestedwhile)
END
&
THEORY ListInputX IS
  List_Input(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(nn1,nn2)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(res1,res2 <-- opduoseq_while_nestedwhile(nn1,nn2))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(btrue);
  List_Precondition(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(nn1: NAT & nn2: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(nn1: NAT & nn2: NAT | @(ii,jj).(ii:=0;jj:=0;(0: INT | res1:=0);(0: INT | res2:=0);WHILE ii<nn1 DO (ii+1: INT & ii: INT & 1: INT | res1:=ii+1);(0: INT | jj:=0);(0: INT | res2:=0);WHILE jj<nn2 DO (jj+1: INT & jj: INT & 1: INT | res2:=jj+1);(jj+1: INT & jj: INT & 1: INT | jj:=jj+1) INVARIANT 0<=jj & jj<=nn2 & res2 = jj VARIANT nn2-jj END;(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=nn1 & res1 = ii & (ii = 0 => res2 = 0) & (not(ii = 0) => res2 = nn2) VARIANT nn1-ii END;(0: INT | ii:=0);(0: INT | jj:=0);(0: INT | res1:=0);(0: INT | res2:=0);WHILE ii<nn1 DO (ii+1: INT & ii: INT & 1: INT | res1:=ii+1);(0: INT | jj:=0);(0: INT | res2:=0);WHILE jj<nn2 DO (jj+1: INT & jj: INT & 1: INT | res2:=jj+1);(jj+1: INT & jj: INT & 1: INT | jj:=jj+1) INVARIANT 0<=jj & jj<=nn2 & res2 = jj VARIANT nn2-jj END;(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=nn1 & res1 = ii & (ii = 0 => res2 = 0) & (not(ii = 0) => res2 = nn2) VARIANT nn1-ii END));
  List_Substitution(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile)==(VAR ii,jj IN ii:=0;jj:=0;res1:=0;res2:=0;WHILE ii<nn1 DO res1:=ii+1;jj:=0;res2:=0;WHILE jj<nn2 DO res2:=jj+1;jj:=jj+1 INVARIANT 0<=jj & jj<=nn2 & res2 = jj VARIANT nn2-jj END;ii:=ii+1 INVARIANT 0<=ii & ii<=nn1 & res1 = ii & (ii = 0 => res2 = 0) & (not(ii = 0) => res2 = nn2) VARIANT nn1-ii END;ii:=0;jj:=0;res1:=0;res2:=0;WHILE ii<nn1 DO res1:=ii+1;jj:=0;res2:=0;WHILE jj<nn2 DO res2:=jj+1;jj:=jj+1 INVARIANT 0<=jj & jj<=nn2 & res2 = jj VARIANT nn2-jj END;ii:=ii+1 INVARIANT 0<=ii & ii<=nn1 & res1 = ii & (ii = 0 => res2 = 0) & (not(ii = 0) => res2 = nn2) VARIANT nn1-ii END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(duoseq_while_nestedwhile_i))==(?);
  Inherited_List_Constants(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Constants(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(duoseq_while_nestedwhile_i))==(?);
  Context_List_Defered(Implementation(duoseq_while_nestedwhile_i))==(?);
  Context_List_Sets(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Own_Enumerated(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Valuable_Sets(Implementation(duoseq_while_nestedwhile_i))==(?);
  Inherited_List_Enumerated(Implementation(duoseq_while_nestedwhile_i))==(?);
  Inherited_List_Defered(Implementation(duoseq_while_nestedwhile_i))==(?);
  Inherited_List_Sets(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Enumerated(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Defered(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_Sets(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(duoseq_while_nestedwhile_i))==(?);
  Expanded_List_HiddenConstants(Implementation(duoseq_while_nestedwhile_i))==(?);
  List_HiddenConstants(Implementation(duoseq_while_nestedwhile_i))==(?);
  External_List_HiddenConstants(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Context_List_Properties(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  Inherited_List_Properties(Implementation(duoseq_while_nestedwhile_i))==(btrue);
  List_Properties(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(duoseq_while_nestedwhile_i))==(aa: aa);
  List_Values(Implementation(duoseq_while_nestedwhile_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(duoseq_while_nestedwhile_i))==(Type(opduoseq_while_nestedwhile) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(duoseq_while_nestedwhile_i)) == (? | ? | ? | ? | opduoseq_while_nestedwhile | ? | ? | ? | duoseq_while_nestedwhile_i);
  List_Of_HiddenCst_Ids(Implementation(duoseq_while_nestedwhile_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(duoseq_while_nestedwhile_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(duoseq_while_nestedwhile_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(duoseq_while_nestedwhile_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(duoseq_while_nestedwhile_i),opduoseq_while_nestedwhile, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(jj) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(duoseq_while_nestedwhile_i))==(?)
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
  TypingPredicate(Implementation(duoseq_while_nestedwhile_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
