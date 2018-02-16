Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(while_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(while_i))==(Machine(while));
  Level(Implementation(while_i))==(1);
  Upper_Level(Implementation(while_i))==(Machine(while))
END
&
THEORY LoadedStructureX IS
  Implementation(while_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(while_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(while_i))==(?);
  Inherited_List_Includes(Implementation(while_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(while_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(while_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(while_i))==(?);
  Context_List_Variables(Implementation(while_i))==(?);
  Abstract_List_Variables(Implementation(while_i))==(?);
  Local_List_Variables(Implementation(while_i))==(?);
  List_Variables(Implementation(while_i))==(?);
  External_List_Variables(Implementation(while_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(while_i))==(?);
  Abstract_List_VisibleVariables(Implementation(while_i))==(?);
  External_List_VisibleVariables(Implementation(while_i))==(?);
  Expanded_List_VisibleVariables(Implementation(while_i))==(?);
  List_VisibleVariables(Implementation(while_i))==(?);
  Internal_List_VisibleVariables(Implementation(while_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(while_i))==(btrue);
  Expanded_List_Invariant(Implementation(while_i))==(btrue);
  Abstract_List_Invariant(Implementation(while_i))==(btrue);
  Context_List_Invariant(Implementation(while_i))==(btrue);
  List_Invariant(Implementation(while_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(while_i))==(btrue);
  Abstract_List_Assertions(Implementation(while_i))==(btrue);
  Context_List_Assertions(Implementation(while_i))==(btrue);
  List_Assertions(Implementation(while_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(while_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(while_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(while_i))==(skip);
  Context_List_Initialisation(Implementation(while_i))==(skip);
  List_Initialisation(Implementation(while_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(while_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(while_i))==(btrue);
  List_Context_Constraints(Implementation(while_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(while_i))==(opwhile);
  List_Operations(Implementation(while_i))==(opwhile)
END
&
THEORY ListInputX IS
  List_Input(Implementation(while_i),opwhile)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(while_i),opwhile)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(while_i),opwhile)==(res <-- opwhile(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(while_i),opwhile)==(btrue);
  List_Precondition(Implementation(while_i),opwhile)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(while_i),opwhile)==(xx: NAT | @ii.(ii:=0;WHILE ii<xx DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT ii>=0 & ii<=xx VARIANT xx-ii END;(ii: INT | res:=ii)));
  List_Substitution(Implementation(while_i),opwhile)==(VAR ii IN ii:=0;WHILE ii<xx DO ii:=ii+1 INVARIANT ii>=0 & ii<=xx VARIANT xx-ii END;res:=ii END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(while_i))==(?);
  Inherited_List_Constants(Implementation(while_i))==(?);
  List_Constants(Implementation(while_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(while_i))==(?);
  Context_List_Defered(Implementation(while_i))==(?);
  Context_List_Sets(Implementation(while_i))==(?);
  List_Own_Enumerated(Implementation(while_i))==(?);
  List_Valuable_Sets(Implementation(while_i))==(?);
  Inherited_List_Enumerated(Implementation(while_i))==(?);
  Inherited_List_Defered(Implementation(while_i))==(?);
  Inherited_List_Sets(Implementation(while_i))==(?);
  List_Enumerated(Implementation(while_i))==(?);
  List_Defered(Implementation(while_i))==(?);
  List_Sets(Implementation(while_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(while_i))==(?);
  Expanded_List_HiddenConstants(Implementation(while_i))==(?);
  List_HiddenConstants(Implementation(while_i))==(?);
  External_List_HiddenConstants(Implementation(while_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(while_i))==(btrue);
  Context_List_Properties(Implementation(while_i))==(btrue);
  Inherited_List_Properties(Implementation(while_i))==(btrue);
  List_Properties(Implementation(while_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(while_i))==(aa: aa);
  List_Values(Implementation(while_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(while_i))==(Type(opwhile) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(while_i)) == (? | ? | ? | ? | opwhile | ? | ? | ? | while_i);
  List_Of_HiddenCst_Ids(Implementation(while_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(while_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(while_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(while_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(while_i),opwhile, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(while_i))==(?)
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
  TypingPredicate(Implementation(while_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
