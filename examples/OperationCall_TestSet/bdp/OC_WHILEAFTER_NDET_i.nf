Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(OC_WHILEAFTER_NDET_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(OC_WHILEAFTER_NDET_i))==(Machine(OC_WHILEAFTER));
  Level(Implementation(OC_WHILEAFTER_NDET_i))==(1);
  Upper_Level(Implementation(OC_WHILEAFTER_NDET_i))==(Machine(OC_WHILEAFTER))
END
&
THEORY LoadedStructureX IS
  Implementation(OC_WHILEAFTER_NDET_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(OC_WHILEAFTER_NDET_i))==(NONDET_MCH_WHILE);
  Inherited_List_Includes(Implementation(OC_WHILEAFTER_NDET_i))==(NONDET_MCH_WHILE)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Context_List_Variables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Abstract_List_Variables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Local_List_Variables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Variables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  External_List_Variables(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Abstract_List_VisibleVariables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  External_List_VisibleVariables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Expanded_List_VisibleVariables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_VisibleVariables(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Internal_List_VisibleVariables(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Abstract_List_Invariant(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Expanded_List_Invariant(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Context_List_Invariant(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  List_Invariant(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Expanded_List_Assertions(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Context_List_Assertions(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  List_Assertions(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(OC_WHILEAFTER_NDET_i))==(skip);
  Context_List_Initialisation(Implementation(OC_WHILEAFTER_NDET_i))==(skip);
  List_Initialisation(Implementation(OC_WHILEAFTER_NDET_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(OC_WHILEAFTER_NDET_i),Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(OC_WHILEAFTER_NDET_i),Machine(NONDET_MCH_WHILE))==(btrue);
  List_Constraints(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  List_Context_Constraints(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(OC_WHILEAFTER_NDET_i))==(opOC_WHILEAFTER);
  List_Operations(Implementation(OC_WHILEAFTER_NDET_i))==(opOC_WHILEAFTER)
END
&
THEORY ListInputX IS
  List_Input(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(res1,res2 <-- opOC_WHILEAFTER(xx,yy))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(btrue);
  List_Precondition(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(xx: NAT & yy: NAT | @ii.(ii:=0;(ii: INT | res1:=ii);WHILE ii<xx DO (ii+1: INT & ii: INT & 1: INT | res1:=ii+1);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=xx & res1 = ii VARIANT xx-ii END;(xx: NAT | res1:=xx [] res1:=xx);(yy: NAT | res2:=yy [] res2:=yy)));
  List_Substitution(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER)==(VAR ii IN ii:=0;res1:=ii;WHILE ii<xx DO res1:=ii+1;ii:=ii+1 INVARIANT 0<=ii & ii<=xx & res1 = ii VARIANT xx-ii END;res1 <-- opNONDET_MCH_WHILE(xx);res2 <-- opNONDET_MCH_WHILE(yy) END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Inherited_List_Constants(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Constants(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Context_List_Defered(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Context_List_Sets(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Own_Enumerated(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Valuable_Sets(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Inherited_List_Enumerated(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Inherited_List_Defered(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Inherited_List_Sets(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Enumerated(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Defered(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_Sets(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  Expanded_List_HiddenConstants(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  List_HiddenConstants(Implementation(OC_WHILEAFTER_NDET_i))==(?);
  External_List_HiddenConstants(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Context_List_Properties(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  Inherited_List_Properties(Implementation(OC_WHILEAFTER_NDET_i))==(btrue);
  List_Properties(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(OC_WHILEAFTER_NDET_i))==(aa: aa);
  List_Values(Implementation(OC_WHILEAFTER_NDET_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(OC_WHILEAFTER_NDET_i),Machine(NONDET_MCH_WHILE))==(opNONDET_MCH_WHILE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(OC_WHILEAFTER_NDET_i))==(Type(opOC_WHILEAFTER) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(OC_WHILEAFTER_NDET_i)) == (? | ? | ? | ? | opOC_WHILEAFTER | ? | imported(Machine(NONDET_MCH_WHILE)) | ? | OC_WHILEAFTER_NDET_i);
  List_Of_HiddenCst_Ids(Implementation(OC_WHILEAFTER_NDET_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(OC_WHILEAFTER_NDET_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(OC_WHILEAFTER_NDET_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(OC_WHILEAFTER_NDET_i)) == (?: ?);
  List_Of_Ids(Machine(NONDET_MCH_WHILE)) == (? | ? | ? | ? | opNONDET_MCH_WHILE | ? | ? | ? | NONDET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Machine(NONDET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(NONDET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Machine(NONDET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(NONDET_MCH_WHILE)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(OC_WHILEAFTER_NDET_i),opOC_WHILEAFTER, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(OC_WHILEAFTER_NDET_i))==(?)
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
  TypingPredicate(Implementation(OC_WHILEAFTER_NDET_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(OC_WHILEAFTER_NDET_i),Machine(NONDET_MCH_WHILE))==(?);
  ImportedVisVariablesList(Implementation(OC_WHILEAFTER_NDET_i),Machine(NONDET_MCH_WHILE))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
