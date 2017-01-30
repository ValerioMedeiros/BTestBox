Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(Machine(NONDET_MCH_WHILE));
  Level(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(1);
  Upper_Level(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(Machine(NONDET_MCH_WHILE))
END
&
THEORY LoadedStructureX IS
  Implementation(IMP_OC_NONDET_MCH_WHILEAFTER)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(DET_MCH_WHILE);
  Inherited_List_Includes(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(DET_MCH_WHILE)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Context_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Abstract_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Local_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  External_List_Variables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Abstract_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  External_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Expanded_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Internal_List_VisibleVariables(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Abstract_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Expanded_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Context_List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  List_Invariant(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Expanded_List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Context_List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  List_Assertions(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(skip);
  Context_List_Initialisation(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(skip);
  List_Initialisation(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),Machine(DET_MCH_WHILE))==(btrue);
  List_Constraints(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  List_Context_Constraints(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(opNONDET_MCH_WHILE);
  List_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(opNONDET_MCH_WHILE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(res <-- opNONDET_MCH_WHILE(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(btrue);
  List_Precondition(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(xx: NAT | @ii.(ii:=0;(ii: INT | res:=ii);WHILE ii<xx DO (ii+1: INT & ii: INT & 1: INT | res:=ii+1);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=xx & res = ii VARIANT xx-ii END;(xx: NAT | res:=xx)));
  List_Substitution(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE)==(VAR ii IN ii:=0;res:=ii;WHILE ii<xx DO res:=ii+1;ii:=ii+1 INVARIANT 0<=ii & ii<=xx & res = ii VARIANT xx-ii END;res <-- opDET_MCH_WHILE(xx) END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Inherited_List_Constants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Constants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Context_List_Defered(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Context_List_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Own_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Valuable_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Inherited_List_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Inherited_List_Defered(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Inherited_List_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Enumerated(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Defered(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_Sets(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  Expanded_List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?);
  External_List_HiddenConstants(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Context_List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  Inherited_List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue);
  List_Properties(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(aa: aa);
  List_Values(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),Machine(DET_MCH_WHILE))==(opDET_MCH_WHILE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(Type(opNONDET_MCH_WHILE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER)) == (? | ? | ? | ? | opNONDET_MCH_WHILE | ? | imported(Machine(DET_MCH_WHILE)) | ? | IMP_OC_NONDET_MCH_WHILEAFTER);
  List_Of_HiddenCst_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER)) == (?);
  List_Of_VisibleVar_Ids(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER)) == (?: ?);
  List_Of_Ids(Machine(DET_MCH_WHILE)) == (? | ? | ? | ? | opDET_MCH_WHILE | ? | ? | ? | DET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(DET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(DET_MCH_WHILE)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),opNONDET_MCH_WHILE, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(?)
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
  TypingPredicate(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),Machine(DET_MCH_WHILE))==(?);
  ImportedVisVariablesList(Implementation(IMP_OC_NONDET_MCH_WHILEAFTER),Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
