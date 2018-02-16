Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(else_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(else_i))==(Machine(else));
  Level(Implementation(else_i))==(1);
  Upper_Level(Implementation(else_i))==(Machine(else))
END
&
THEORY LoadedStructureX IS
  Implementation(else_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(else_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(else_i))==(?);
  Inherited_List_Includes(Implementation(else_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(else_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(else_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(else_i))==(?);
  Context_List_Variables(Implementation(else_i))==(?);
  Abstract_List_Variables(Implementation(else_i))==(?);
  Local_List_Variables(Implementation(else_i))==(?);
  List_Variables(Implementation(else_i))==(?);
  External_List_Variables(Implementation(else_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(else_i))==(?);
  Abstract_List_VisibleVariables(Implementation(else_i))==(?);
  External_List_VisibleVariables(Implementation(else_i))==(?);
  Expanded_List_VisibleVariables(Implementation(else_i))==(?);
  List_VisibleVariables(Implementation(else_i))==(?);
  Internal_List_VisibleVariables(Implementation(else_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(else_i))==(btrue);
  Expanded_List_Invariant(Implementation(else_i))==(btrue);
  Abstract_List_Invariant(Implementation(else_i))==(btrue);
  Context_List_Invariant(Implementation(else_i))==(btrue);
  List_Invariant(Implementation(else_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(else_i))==(btrue);
  Abstract_List_Assertions(Implementation(else_i))==(btrue);
  Context_List_Assertions(Implementation(else_i))==(btrue);
  List_Assertions(Implementation(else_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(else_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(else_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(else_i))==(skip);
  Context_List_Initialisation(Implementation(else_i))==(skip);
  List_Initialisation(Implementation(else_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(else_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(else_i))==(btrue);
  List_Context_Constraints(Implementation(else_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(else_i))==(opelse);
  List_Operations(Implementation(else_i))==(opelse)
END
&
THEORY ListInputX IS
  List_Input(Implementation(else_i),opelse)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(else_i),opelse)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(else_i),opelse)==(res <-- opelse(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(else_i),opelse)==(btrue);
  List_Precondition(Implementation(else_i),opelse)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(else_i),opelse)==(xx: NAT | xx<5 ==> (0: INT | res:=0) [] not(xx<5) ==> (xx: INT | res:=xx));
  List_Substitution(Implementation(else_i),opelse)==(IF xx<5 THEN res:=0 ELSE res:=xx END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(else_i))==(?);
  Inherited_List_Constants(Implementation(else_i))==(?);
  List_Constants(Implementation(else_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(else_i))==(?);
  Context_List_Defered(Implementation(else_i))==(?);
  Context_List_Sets(Implementation(else_i))==(?);
  List_Own_Enumerated(Implementation(else_i))==(?);
  List_Valuable_Sets(Implementation(else_i))==(?);
  Inherited_List_Enumerated(Implementation(else_i))==(?);
  Inherited_List_Defered(Implementation(else_i))==(?);
  Inherited_List_Sets(Implementation(else_i))==(?);
  List_Enumerated(Implementation(else_i))==(?);
  List_Defered(Implementation(else_i))==(?);
  List_Sets(Implementation(else_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(else_i))==(?);
  Expanded_List_HiddenConstants(Implementation(else_i))==(?);
  List_HiddenConstants(Implementation(else_i))==(?);
  External_List_HiddenConstants(Implementation(else_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(else_i))==(btrue);
  Context_List_Properties(Implementation(else_i))==(btrue);
  Inherited_List_Properties(Implementation(else_i))==(btrue);
  List_Properties(Implementation(else_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(else_i))==(aa: aa);
  List_Values(Implementation(else_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(else_i))==(Type(opelse) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(else_i)) == (? | ? | ? | ? | opelse | ? | ? | ? | else_i);
  List_Of_HiddenCst_Ids(Implementation(else_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(else_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(else_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(else_i)) == (?: ?)
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
  List_Local_Operations(Implementation(else_i))==(?)
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
  TypingPredicate(Implementation(else_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
