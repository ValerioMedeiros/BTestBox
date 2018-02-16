Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(duoseq_while_else_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(duoseq_while_else_i))==(Machine(duoseq_while_else));
  Level(Implementation(duoseq_while_else_i))==(1);
  Upper_Level(Implementation(duoseq_while_else_i))==(Machine(duoseq_while_else))
END
&
THEORY LoadedStructureX IS
  Implementation(duoseq_while_else_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(duoseq_while_else_i))==(?);
  Inherited_List_Includes(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(duoseq_while_else_i))==(?);
  Context_List_Variables(Implementation(duoseq_while_else_i))==(?);
  Abstract_List_Variables(Implementation(duoseq_while_else_i))==(?);
  Local_List_Variables(Implementation(duoseq_while_else_i))==(?);
  List_Variables(Implementation(duoseq_while_else_i))==(?);
  External_List_Variables(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(duoseq_while_else_i))==(?);
  Abstract_List_VisibleVariables(Implementation(duoseq_while_else_i))==(?);
  External_List_VisibleVariables(Implementation(duoseq_while_else_i))==(?);
  Expanded_List_VisibleVariables(Implementation(duoseq_while_else_i))==(?);
  List_VisibleVariables(Implementation(duoseq_while_else_i))==(?);
  Internal_List_VisibleVariables(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(duoseq_while_else_i))==(btrue);
  Expanded_List_Invariant(Implementation(duoseq_while_else_i))==(btrue);
  Abstract_List_Invariant(Implementation(duoseq_while_else_i))==(btrue);
  Context_List_Invariant(Implementation(duoseq_while_else_i))==(btrue);
  List_Invariant(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(duoseq_while_else_i))==(btrue);
  Abstract_List_Assertions(Implementation(duoseq_while_else_i))==(btrue);
  Context_List_Assertions(Implementation(duoseq_while_else_i))==(btrue);
  List_Assertions(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(duoseq_while_else_i))==(skip);
  Context_List_Initialisation(Implementation(duoseq_while_else_i))==(skip);
  List_Initialisation(Implementation(duoseq_while_else_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(duoseq_while_else_i))==(btrue);
  List_Context_Constraints(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(duoseq_while_else_i))==(opduoseq_while_else);
  List_Operations(Implementation(duoseq_while_else_i))==(opduoseq_while_else)
END
&
THEORY ListInputX IS
  List_Input(Implementation(duoseq_while_else_i),opduoseq_while_else)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(duoseq_while_else_i),opduoseq_while_else)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(duoseq_while_else_i),opduoseq_while_else)==(res1,res2 <-- opduoseq_while_else(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(duoseq_while_else_i),opduoseq_while_else)==(btrue);
  List_Precondition(Implementation(duoseq_while_else_i),opduoseq_while_else)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(duoseq_while_else_i),opduoseq_while_else)==(xx: NAT | @ii.(ii:=0;(ii: INT | res1:=ii);WHILE ii<xx DO (ii+1: INT & ii: INT & 1: INT | res1:=ii+1);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=xx & res1 = ii VARIANT xx-ii END;(xx<5 ==> (0: INT | res2:=0) [] not(xx<5) ==> (xx: INT | res2:=xx))));
  List_Substitution(Implementation(duoseq_while_else_i),opduoseq_while_else)==(VAR ii IN ii:=0;res1:=ii;WHILE ii<xx DO res1:=ii+1;ii:=ii+1 INVARIANT 0<=ii & ii<=xx & res1 = ii VARIANT xx-ii END;IF xx<5 THEN res2:=0 ELSE res2:=xx END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(duoseq_while_else_i))==(?);
  Inherited_List_Constants(Implementation(duoseq_while_else_i))==(?);
  List_Constants(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(duoseq_while_else_i))==(?);
  Context_List_Defered(Implementation(duoseq_while_else_i))==(?);
  Context_List_Sets(Implementation(duoseq_while_else_i))==(?);
  List_Own_Enumerated(Implementation(duoseq_while_else_i))==(?);
  List_Valuable_Sets(Implementation(duoseq_while_else_i))==(?);
  Inherited_List_Enumerated(Implementation(duoseq_while_else_i))==(?);
  Inherited_List_Defered(Implementation(duoseq_while_else_i))==(?);
  Inherited_List_Sets(Implementation(duoseq_while_else_i))==(?);
  List_Enumerated(Implementation(duoseq_while_else_i))==(?);
  List_Defered(Implementation(duoseq_while_else_i))==(?);
  List_Sets(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(duoseq_while_else_i))==(?);
  Expanded_List_HiddenConstants(Implementation(duoseq_while_else_i))==(?);
  List_HiddenConstants(Implementation(duoseq_while_else_i))==(?);
  External_List_HiddenConstants(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(duoseq_while_else_i))==(btrue);
  Context_List_Properties(Implementation(duoseq_while_else_i))==(btrue);
  Inherited_List_Properties(Implementation(duoseq_while_else_i))==(btrue);
  List_Properties(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(duoseq_while_else_i))==(aa: aa);
  List_Values(Implementation(duoseq_while_else_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(duoseq_while_else_i))==(Type(opduoseq_while_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(duoseq_while_else_i)) == (? | ? | ? | ? | opduoseq_while_else | ? | ? | ? | duoseq_while_else_i);
  List_Of_HiddenCst_Ids(Implementation(duoseq_while_else_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(duoseq_while_else_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(duoseq_while_else_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(duoseq_while_else_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(duoseq_while_else_i),opduoseq_while_else, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(duoseq_while_else_i))==(?)
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
  TypingPredicate(Implementation(duoseq_while_else_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
