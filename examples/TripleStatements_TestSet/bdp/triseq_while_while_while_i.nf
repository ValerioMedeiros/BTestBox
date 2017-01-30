Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(triseq_while_while_while_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(triseq_while_while_while_i))==(Machine(triseq_while_while_while));
  Level(Implementation(triseq_while_while_while_i))==(1);
  Upper_Level(Implementation(triseq_while_while_while_i))==(Machine(triseq_while_while_while))
END
&
THEORY LoadedStructureX IS
  Implementation(triseq_while_while_while_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(triseq_while_while_while_i))==(?);
  Inherited_List_Includes(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(triseq_while_while_while_i))==(?);
  Context_List_Variables(Implementation(triseq_while_while_while_i))==(?);
  Abstract_List_Variables(Implementation(triseq_while_while_while_i))==(?);
  Local_List_Variables(Implementation(triseq_while_while_while_i))==(?);
  List_Variables(Implementation(triseq_while_while_while_i))==(?);
  External_List_Variables(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(triseq_while_while_while_i))==(?);
  Abstract_List_VisibleVariables(Implementation(triseq_while_while_while_i))==(?);
  External_List_VisibleVariables(Implementation(triseq_while_while_while_i))==(?);
  Expanded_List_VisibleVariables(Implementation(triseq_while_while_while_i))==(?);
  List_VisibleVariables(Implementation(triseq_while_while_while_i))==(?);
  Internal_List_VisibleVariables(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(triseq_while_while_while_i))==(btrue);
  Expanded_List_Invariant(Implementation(triseq_while_while_while_i))==(btrue);
  Abstract_List_Invariant(Implementation(triseq_while_while_while_i))==(btrue);
  Context_List_Invariant(Implementation(triseq_while_while_while_i))==(btrue);
  List_Invariant(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(triseq_while_while_while_i))==(btrue);
  Abstract_List_Assertions(Implementation(triseq_while_while_while_i))==(btrue);
  Context_List_Assertions(Implementation(triseq_while_while_while_i))==(btrue);
  List_Assertions(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(triseq_while_while_while_i))==(skip);
  Context_List_Initialisation(Implementation(triseq_while_while_while_i))==(skip);
  List_Initialisation(Implementation(triseq_while_while_while_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(triseq_while_while_while_i))==(btrue);
  List_Context_Constraints(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(triseq_while_while_while_i))==(optriseq_while_while_while);
  List_Operations(Implementation(triseq_while_while_while_i))==(optriseq_while_while_while)
END
&
THEORY ListInputX IS
  List_Input(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(res1,res2,res3)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(res1,res2,res3 <-- optriseq_while_while_while(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(btrue);
  List_Precondition(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(xx: NAT | @ii.(ii:=0;WHILE ii<xx DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;(ii: INT | res1:=ii);(0: INT | ii:=0);WHILE ii<xx DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;(ii: INT | res2:=ii);(0: INT | ii:=0);WHILE ii<xx DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;(ii: INT | res3:=ii)));
  List_Substitution(Implementation(triseq_while_while_while_i),optriseq_while_while_while)==(VAR ii IN ii:=0;WHILE ii<xx DO ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;res1:=ii;ii:=0;WHILE ii<xx DO ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;res2:=ii;ii:=0;WHILE ii<xx DO ii:=ii+1 INVARIANT 0<=ii & ii<=xx VARIANT xx-ii END;res3:=ii END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(triseq_while_while_while_i))==(?);
  Inherited_List_Constants(Implementation(triseq_while_while_while_i))==(?);
  List_Constants(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(triseq_while_while_while_i))==(?);
  Context_List_Defered(Implementation(triseq_while_while_while_i))==(?);
  Context_List_Sets(Implementation(triseq_while_while_while_i))==(?);
  List_Own_Enumerated(Implementation(triseq_while_while_while_i))==(?);
  List_Valuable_Sets(Implementation(triseq_while_while_while_i))==(?);
  Inherited_List_Enumerated(Implementation(triseq_while_while_while_i))==(?);
  Inherited_List_Defered(Implementation(triseq_while_while_while_i))==(?);
  Inherited_List_Sets(Implementation(triseq_while_while_while_i))==(?);
  List_Enumerated(Implementation(triseq_while_while_while_i))==(?);
  List_Defered(Implementation(triseq_while_while_while_i))==(?);
  List_Sets(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(triseq_while_while_while_i))==(?);
  Expanded_List_HiddenConstants(Implementation(triseq_while_while_while_i))==(?);
  List_HiddenConstants(Implementation(triseq_while_while_while_i))==(?);
  External_List_HiddenConstants(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(triseq_while_while_while_i))==(btrue);
  Context_List_Properties(Implementation(triseq_while_while_while_i))==(btrue);
  Inherited_List_Properties(Implementation(triseq_while_while_while_i))==(btrue);
  List_Properties(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(triseq_while_while_while_i))==(aa: aa);
  List_Values(Implementation(triseq_while_while_while_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(triseq_while_while_while_i))==(Type(optriseq_while_while_while) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(triseq_while_while_while_i)) == (? | ? | ? | ? | optriseq_while_while_while | ? | ? | ? | triseq_while_while_while_i);
  List_Of_HiddenCst_Ids(Implementation(triseq_while_while_while_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(triseq_while_while_while_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(triseq_while_while_while_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(triseq_while_while_while_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(triseq_while_while_while_i),optriseq_while_while_while, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(triseq_while_while_while_i))==(?)
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
  TypingPredicate(Implementation(triseq_while_while_while_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
