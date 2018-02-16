Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(OC_WHILE_CHOICE_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(OC_WHILE_CHOICE_i))==(Machine(OC_WHILE_CHOICE));
  Level(Implementation(OC_WHILE_CHOICE_i))==(1);
  Upper_Level(Implementation(OC_WHILE_CHOICE_i))==(Machine(OC_WHILE_CHOICE))
END
&
THEORY LoadedStructureX IS
  Implementation(OC_WHILE_CHOICE_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(OC_WHILE_CHOICE_i))==(NDET_WHILE_CHOICE);
  Inherited_List_Includes(Implementation(OC_WHILE_CHOICE_i))==(NDET_WHILE_CHOICE)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(OC_WHILE_CHOICE_i))==(?);
  Context_List_Variables(Implementation(OC_WHILE_CHOICE_i))==(?);
  Abstract_List_Variables(Implementation(OC_WHILE_CHOICE_i))==(?);
  Local_List_Variables(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Variables(Implementation(OC_WHILE_CHOICE_i))==(?);
  External_List_Variables(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(OC_WHILE_CHOICE_i))==(?);
  Abstract_List_VisibleVariables(Implementation(OC_WHILE_CHOICE_i))==(?);
  External_List_VisibleVariables(Implementation(OC_WHILE_CHOICE_i))==(?);
  Expanded_List_VisibleVariables(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_VisibleVariables(Implementation(OC_WHILE_CHOICE_i))==(?);
  Internal_List_VisibleVariables(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Abstract_List_Invariant(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Expanded_List_Invariant(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Context_List_Invariant(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  List_Invariant(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Expanded_List_Assertions(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Context_List_Assertions(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  List_Assertions(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(OC_WHILE_CHOICE_i))==(skip);
  Context_List_Initialisation(Implementation(OC_WHILE_CHOICE_i))==(skip);
  List_Initialisation(Implementation(OC_WHILE_CHOICE_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(OC_WHILE_CHOICE_i),Machine(NDET_WHILE_CHOICE))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(OC_WHILE_CHOICE_i),Machine(NDET_WHILE_CHOICE))==(btrue);
  List_Constraints(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  List_Context_Constraints(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(OC_WHILE_CHOICE_i))==(opOC_WHILE_CHOICE);
  List_Operations(Implementation(OC_WHILE_CHOICE_i))==(opOC_WHILE_CHOICE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(res <-- opOC_WHILE_CHOICE(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(btrue);
  List_Precondition(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(nn: NAT | @ii.(ii:=0;(0: INT | res:=0);WHILE ii<nn DO (ii+1: INT & ii: INT & 1: INT | ii:=ii+1);(btrue | res:=5 [] res:=10) INVARIANT res: {0,5,10} & 0<=ii & ii<=nn VARIANT nn-ii END;(res = 5 ==> (nn: INT | res:=nn) [] not(res = 5) ==> (0: INT | res:=0))));
  List_Substitution(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE)==(VAR ii IN ii:=0;res:=0;WHILE ii<nn DO ii:=ii+1;res <-- opNDET_WHILE_CHOICE INVARIANT res: {0,5,10} & 0<=ii & ii<=nn VARIANT nn-ii END;IF res = 5 THEN res:=nn ELSE res:=0 END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(OC_WHILE_CHOICE_i))==(?);
  Inherited_List_Constants(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Constants(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(OC_WHILE_CHOICE_i))==(?);
  Context_List_Defered(Implementation(OC_WHILE_CHOICE_i))==(?);
  Context_List_Sets(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Own_Enumerated(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Valuable_Sets(Implementation(OC_WHILE_CHOICE_i))==(?);
  Inherited_List_Enumerated(Implementation(OC_WHILE_CHOICE_i))==(?);
  Inherited_List_Defered(Implementation(OC_WHILE_CHOICE_i))==(?);
  Inherited_List_Sets(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Enumerated(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Defered(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_Sets(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(OC_WHILE_CHOICE_i))==(?);
  Expanded_List_HiddenConstants(Implementation(OC_WHILE_CHOICE_i))==(?);
  List_HiddenConstants(Implementation(OC_WHILE_CHOICE_i))==(?);
  External_List_HiddenConstants(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Context_List_Properties(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  Inherited_List_Properties(Implementation(OC_WHILE_CHOICE_i))==(btrue);
  List_Properties(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(OC_WHILE_CHOICE_i))==(aa: aa);
  List_Values(Implementation(OC_WHILE_CHOICE_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(OC_WHILE_CHOICE_i),Machine(NDET_WHILE_CHOICE))==(opNDET_WHILE_CHOICE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(OC_WHILE_CHOICE_i))==(Type(opOC_WHILE_CHOICE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(OC_WHILE_CHOICE_i)) == (? | ? | ? | ? | opOC_WHILE_CHOICE | ? | imported(Machine(NDET_WHILE_CHOICE)) | ? | OC_WHILE_CHOICE_i);
  List_Of_HiddenCst_Ids(Implementation(OC_WHILE_CHOICE_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(OC_WHILE_CHOICE_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(OC_WHILE_CHOICE_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(OC_WHILE_CHOICE_i)) == (?: ?);
  List_Of_Ids(Machine(NDET_WHILE_CHOICE)) == (? | ? | ? | ? | opNDET_WHILE_CHOICE | ? | ? | ? | NDET_WHILE_CHOICE);
  List_Of_HiddenCst_Ids(Machine(NDET_WHILE_CHOICE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(NDET_WHILE_CHOICE)) == (?);
  List_Of_VisibleVar_Ids(Machine(NDET_WHILE_CHOICE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(NDET_WHILE_CHOICE)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(OC_WHILE_CHOICE_i),opOC_WHILE_CHOICE, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(OC_WHILE_CHOICE_i))==(?)
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
  TypingPredicate(Implementation(OC_WHILE_CHOICE_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(OC_WHILE_CHOICE_i),Machine(NDET_WHILE_CHOICE))==(?);
  ImportedVisVariablesList(Implementation(OC_WHILE_CHOICE_i),Machine(NDET_WHILE_CHOICE))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
