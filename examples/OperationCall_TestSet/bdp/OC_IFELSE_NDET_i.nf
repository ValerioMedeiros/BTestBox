Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(OC_IFELSE_NDET_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(OC_IFELSE_NDET_i))==(Machine(OC_IFELSE));
  Level(Implementation(OC_IFELSE_NDET_i))==(1);
  Upper_Level(Implementation(OC_IFELSE_NDET_i))==(Machine(OC_IFELSE))
END
&
THEORY LoadedStructureX IS
  Implementation(OC_IFELSE_NDET_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(OC_IFELSE_NDET_i))==(NONDET_MCH_ELSE);
  Inherited_List_Includes(Implementation(OC_IFELSE_NDET_i))==(NONDET_MCH_ELSE)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(OC_IFELSE_NDET_i))==(?);
  Context_List_Variables(Implementation(OC_IFELSE_NDET_i))==(?);
  Abstract_List_Variables(Implementation(OC_IFELSE_NDET_i))==(?);
  Local_List_Variables(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Variables(Implementation(OC_IFELSE_NDET_i))==(?);
  External_List_Variables(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(OC_IFELSE_NDET_i))==(?);
  Abstract_List_VisibleVariables(Implementation(OC_IFELSE_NDET_i))==(?);
  External_List_VisibleVariables(Implementation(OC_IFELSE_NDET_i))==(?);
  Expanded_List_VisibleVariables(Implementation(OC_IFELSE_NDET_i))==(?);
  List_VisibleVariables(Implementation(OC_IFELSE_NDET_i))==(?);
  Internal_List_VisibleVariables(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Abstract_List_Invariant(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Expanded_List_Invariant(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Context_List_Invariant(Implementation(OC_IFELSE_NDET_i))==(btrue);
  List_Invariant(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Expanded_List_Assertions(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Context_List_Assertions(Implementation(OC_IFELSE_NDET_i))==(btrue);
  List_Assertions(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(OC_IFELSE_NDET_i))==(skip);
  Context_List_Initialisation(Implementation(OC_IFELSE_NDET_i))==(skip);
  List_Initialisation(Implementation(OC_IFELSE_NDET_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(OC_IFELSE_NDET_i),Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(OC_IFELSE_NDET_i),Machine(NONDET_MCH_ELSE))==(btrue);
  List_Constraints(Implementation(OC_IFELSE_NDET_i))==(btrue);
  List_Context_Constraints(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(OC_IFELSE_NDET_i))==(opOC_IFELSE);
  List_Operations(Implementation(OC_IFELSE_NDET_i))==(opOC_IFELSE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(res <-- opOC_IFELSE(xx,yy))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(btrue);
  List_Precondition(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(xx: NAT & yy: NAT | (xx: NAT & yy: NAT | xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy [] (xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy));(xx>yy ==> (xx: NAT & yy: NAT | xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy [] (xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy)) [] not(xx>yy) ==> (xx: NAT & yy: NAT | xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy [] (xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy))));
  List_Substitution(Implementation(OC_IFELSE_NDET_i),opOC_IFELSE)==(res <-- opNONDET_MCH_ELSE(xx,yy);IF xx>yy THEN res <-- opNONDET_MCH_ELSE(xx,yy) ELSE res <-- opNONDET_MCH_ELSE(xx,yy) END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(OC_IFELSE_NDET_i))==(?);
  Inherited_List_Constants(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Constants(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(OC_IFELSE_NDET_i))==(?);
  Context_List_Defered(Implementation(OC_IFELSE_NDET_i))==(?);
  Context_List_Sets(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Own_Enumerated(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Valuable_Sets(Implementation(OC_IFELSE_NDET_i))==(?);
  Inherited_List_Enumerated(Implementation(OC_IFELSE_NDET_i))==(?);
  Inherited_List_Defered(Implementation(OC_IFELSE_NDET_i))==(?);
  Inherited_List_Sets(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Enumerated(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Defered(Implementation(OC_IFELSE_NDET_i))==(?);
  List_Sets(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(OC_IFELSE_NDET_i))==(?);
  Expanded_List_HiddenConstants(Implementation(OC_IFELSE_NDET_i))==(?);
  List_HiddenConstants(Implementation(OC_IFELSE_NDET_i))==(?);
  External_List_HiddenConstants(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Context_List_Properties(Implementation(OC_IFELSE_NDET_i))==(btrue);
  Inherited_List_Properties(Implementation(OC_IFELSE_NDET_i))==(btrue);
  List_Properties(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(OC_IFELSE_NDET_i))==(aa: aa);
  List_Values(Implementation(OC_IFELSE_NDET_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(OC_IFELSE_NDET_i),Machine(NONDET_MCH_ELSE))==(opNONDET_MCH_ELSE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(OC_IFELSE_NDET_i))==(Type(opOC_IFELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(OC_IFELSE_NDET_i)) == (? | ? | ? | ? | opOC_IFELSE | ? | imported(Machine(NONDET_MCH_ELSE)) | ? | OC_IFELSE_NDET_i);
  List_Of_HiddenCst_Ids(Implementation(OC_IFELSE_NDET_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(OC_IFELSE_NDET_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(OC_IFELSE_NDET_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(OC_IFELSE_NDET_i)) == (?: ?);
  List_Of_Ids(Machine(NONDET_MCH_ELSE)) == (? | ? | ? | ? | opNONDET_MCH_ELSE | ? | ? | ? | NONDET_MCH_ELSE);
  List_Of_HiddenCst_Ids(Machine(NONDET_MCH_ELSE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(NONDET_MCH_ELSE)) == (?);
  List_Of_VisibleVar_Ids(Machine(NONDET_MCH_ELSE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(NONDET_MCH_ELSE)) == (?: ?)
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
  List_Local_Operations(Implementation(OC_IFELSE_NDET_i))==(?)
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
  TypingPredicate(Implementation(OC_IFELSE_NDET_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(OC_IFELSE_NDET_i),Machine(NONDET_MCH_ELSE))==(?);
  ImportedVisVariablesList(Implementation(OC_IFELSE_NDET_i),Machine(NONDET_MCH_ELSE))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
