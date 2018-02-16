Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(OC_WHILEINSIDE_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(OC_WHILEINSIDE_i))==(Machine(OC_WHILEINSIDE));
  Level(Implementation(OC_WHILEINSIDE_i))==(1);
  Upper_Level(Implementation(OC_WHILEINSIDE_i))==(Machine(OC_WHILEINSIDE))
END
&
THEORY LoadedStructureX IS
  Implementation(OC_WHILEINSIDE_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(OC_WHILEINSIDE_i))==(DET_MCH_WHILE);
  Inherited_List_Includes(Implementation(OC_WHILEINSIDE_i))==(DET_MCH_WHILE)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(OC_WHILEINSIDE_i))==(?);
  Context_List_Variables(Implementation(OC_WHILEINSIDE_i))==(?);
  Abstract_List_Variables(Implementation(OC_WHILEINSIDE_i))==(?);
  Local_List_Variables(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Variables(Implementation(OC_WHILEINSIDE_i))==(?);
  External_List_Variables(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(OC_WHILEINSIDE_i))==(?);
  Abstract_List_VisibleVariables(Implementation(OC_WHILEINSIDE_i))==(?);
  External_List_VisibleVariables(Implementation(OC_WHILEINSIDE_i))==(?);
  Expanded_List_VisibleVariables(Implementation(OC_WHILEINSIDE_i))==(?);
  List_VisibleVariables(Implementation(OC_WHILEINSIDE_i))==(?);
  Internal_List_VisibleVariables(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Abstract_List_Invariant(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Expanded_List_Invariant(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Context_List_Invariant(Implementation(OC_WHILEINSIDE_i))==(btrue);
  List_Invariant(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Expanded_List_Assertions(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Context_List_Assertions(Implementation(OC_WHILEINSIDE_i))==(btrue);
  List_Assertions(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(OC_WHILEINSIDE_i))==(skip);
  Context_List_Initialisation(Implementation(OC_WHILEINSIDE_i))==(skip);
  List_Initialisation(Implementation(OC_WHILEINSIDE_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(OC_WHILEINSIDE_i),Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(OC_WHILEINSIDE_i),Machine(DET_MCH_WHILE))==(btrue);
  List_Constraints(Implementation(OC_WHILEINSIDE_i))==(btrue);
  List_Context_Constraints(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(OC_WHILEINSIDE_i))==(opOC_WHILEINSIDE);
  List_Operations(Implementation(OC_WHILEINSIDE_i))==(opOC_WHILEINSIDE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(res1,res2 <-- opOC_WHILEINSIDE(xx,yy))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(btrue);
  List_Precondition(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(xx: NAT & yy: NAT | @ii.(ii:=0;(ii: INT | res1:=ii);WHILE ii<xx DO (xx: NAT | res1:=xx);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=xx & (ii = 0 => res1 = 0) & (not(ii = 0) => res1 = xx) VARIANT xx-ii END;(0: INT | ii:=0);(ii: INT | res2:=ii);WHILE ii<yy DO (yy: NAT | res2:=yy);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=yy & (ii = 0 => res2 = 0) & (not(ii = 0) => res2 = yy) VARIANT yy-ii END));
  List_Substitution(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE)==(VAR ii IN ii:=0;res1:=ii;WHILE ii<xx DO res1 <-- opDET_MCH_WHILE(xx);ii:=ii+1 INVARIANT 0<=ii & ii<=xx & (ii = 0 => res1 = 0) & (not(ii = 0) => res1 = xx) VARIANT xx-ii END;ii:=0;res2:=ii;WHILE ii<yy DO res2 <-- opDET_MCH_WHILE(yy);ii:=ii+1 INVARIANT 0<=ii & ii<=yy & (ii = 0 => res2 = 0) & (not(ii = 0) => res2 = yy) VARIANT yy-ii END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(OC_WHILEINSIDE_i))==(?);
  Inherited_List_Constants(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Constants(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(OC_WHILEINSIDE_i))==(?);
  Context_List_Defered(Implementation(OC_WHILEINSIDE_i))==(?);
  Context_List_Sets(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Own_Enumerated(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Valuable_Sets(Implementation(OC_WHILEINSIDE_i))==(?);
  Inherited_List_Enumerated(Implementation(OC_WHILEINSIDE_i))==(?);
  Inherited_List_Defered(Implementation(OC_WHILEINSIDE_i))==(?);
  Inherited_List_Sets(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Enumerated(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Defered(Implementation(OC_WHILEINSIDE_i))==(?);
  List_Sets(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(OC_WHILEINSIDE_i))==(?);
  Expanded_List_HiddenConstants(Implementation(OC_WHILEINSIDE_i))==(?);
  List_HiddenConstants(Implementation(OC_WHILEINSIDE_i))==(?);
  External_List_HiddenConstants(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Context_List_Properties(Implementation(OC_WHILEINSIDE_i))==(btrue);
  Inherited_List_Properties(Implementation(OC_WHILEINSIDE_i))==(btrue);
  List_Properties(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(OC_WHILEINSIDE_i))==(aa: aa);
  List_Values(Implementation(OC_WHILEINSIDE_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(OC_WHILEINSIDE_i),Machine(DET_MCH_WHILE))==(opDET_MCH_WHILE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(OC_WHILEINSIDE_i))==(Type(opOC_WHILEINSIDE) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(OC_WHILEINSIDE_i)) == (? | ? | ? | ? | opOC_WHILEINSIDE | ? | imported(Machine(DET_MCH_WHILE)) | ? | OC_WHILEINSIDE_i);
  List_Of_HiddenCst_Ids(Implementation(OC_WHILEINSIDE_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(OC_WHILEINSIDE_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(OC_WHILEINSIDE_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(OC_WHILEINSIDE_i)) == (?: ?);
  List_Of_Ids(Machine(DET_MCH_WHILE)) == (? | ? | ? | ? | opDET_MCH_WHILE | ? | ? | ? | DET_MCH_WHILE);
  List_Of_HiddenCst_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(DET_MCH_WHILE)) == (?);
  List_Of_VisibleVar_Ids(Machine(DET_MCH_WHILE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(DET_MCH_WHILE)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(OC_WHILEINSIDE_i),opOC_WHILEINSIDE, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(OC_WHILEINSIDE_i))==(?)
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
  TypingPredicate(Implementation(OC_WHILEINSIDE_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(OC_WHILEINSIDE_i),Machine(DET_MCH_WHILE))==(?);
  ImportedVisVariablesList(Implementation(OC_WHILEINSIDE_i),Machine(DET_MCH_WHILE))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
