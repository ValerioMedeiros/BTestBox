Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(Machine(NONDET_MCH_WHILE));
  Level(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(1);
  Upper_Level(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(Machine(NONDET_MCH_WHILE))
END
&
THEORY LoadedStructureX IS
  Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(DET_MCH_WHILE);
  Inherited_List_Includes(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(DET_MCH_WHILE)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Context_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Abstract_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Local_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  External_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Abstract_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  External_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Expanded_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Internal_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Abstract_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Expanded_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Context_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Expanded_List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Context_List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(skip);
  Context_List_Initialisation(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(skip);
  List_Initialisation(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),Machine(DET_MCH_WHILE))==(btrue);
  List_Constraints(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  List_Context_Constraints(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(opNONDET_MCH_WHILE);
  List_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(opNONDET_MCH_WHILE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(res <-- opNONDET_MCH_WHILE(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(btrue);
  List_Precondition(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(xx: NAT | @ii.(ii:=0;(ii: INT | res:=ii);WHILE ii<xx DO (xx: NAT | res:=xx);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=xx & (ii = 0 => res = 0) & (not(ii = 0) => res = xx) VARIANT xx-ii END));
  List_Substitution(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE)==(VAR ii IN ii:=0;res:=ii;WHILE ii<xx DO res <-- opDET_MCH_WHILE(xx);ii:=ii+1 INVARIANT 0<=ii & ii<=xx & (ii = 0 => res = 0) & (not(ii = 0) => res = xx) VARIANT xx-ii END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Inherited_List_Constants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Constants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Context_List_Defered(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Context_List_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Own_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Valuable_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Inherited_List_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Inherited_List_Defered(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Inherited_List_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Defered(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  Expanded_List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?);
  External_List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Context_List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  Inherited_List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue);
  List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(aa: aa);
  List_Values(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),Machine(DET_MCH_WHILE))==(opDET_MCH_WHILE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(Type(opNONDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE)) == (? | ? | ? | ? | opNONDET_MCH_WHILE | ? | imported(Machine(DET_MCH_WHILE)) | ? | IMP_OC_NONDET_MCH_WHILEINSIDE);
  List_Of_HiddenCst_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE)) == (?);
  List_Of_VisibleVar_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE)) == (?: ?);
  List_Of_Ids(Machine(DET_MCH_WHILE)) == (? | ? | ? | ? | opDET_MCH_WHILE | ? | ? | ? | DET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(DET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(DET_MCH_WHILE)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),opNONDET_MCH_WHILE, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(?)
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
  TypingPredicate(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),Machine(DET_MCH_WHILE))==(?);
  ImportedVisVariablesList(Implementation(IMP_OC_NONDET_MCH_WHILEINSIDE),Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
