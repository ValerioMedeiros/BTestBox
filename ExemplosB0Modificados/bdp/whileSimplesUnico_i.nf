Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(whileSimplesUnico_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(whileSimplesUnico_i))==(Machine(whileSimplesUnico));
  Level(Implementation(whileSimplesUnico_i))==(1);
  Upper_Level(Implementation(whileSimplesUnico_i))==(Machine(whileSimplesUnico))
END
&
THEORY LoadedStructureX IS
  Implementation(whileSimplesUnico_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(whileSimplesUnico_i))==(?);
  Inherited_List_Includes(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(whileSimplesUnico_i))==(?);
  Context_List_Variables(Implementation(whileSimplesUnico_i))==(?);
  Abstract_List_Variables(Implementation(whileSimplesUnico_i))==(?);
  Local_List_Variables(Implementation(whileSimplesUnico_i))==(?);
  List_Variables(Implementation(whileSimplesUnico_i))==(?);
  External_List_Variables(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(whileSimplesUnico_i))==(?);
  Abstract_List_VisibleVariables(Implementation(whileSimplesUnico_i))==(?);
  External_List_VisibleVariables(Implementation(whileSimplesUnico_i))==(?);
  Expanded_List_VisibleVariables(Implementation(whileSimplesUnico_i))==(?);
  List_VisibleVariables(Implementation(whileSimplesUnico_i))==(?);
  Internal_List_VisibleVariables(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(whileSimplesUnico_i))==(btrue);
  Expanded_List_Invariant(Implementation(whileSimplesUnico_i))==(btrue);
  Abstract_List_Invariant(Implementation(whileSimplesUnico_i))==(btrue);
  Context_List_Invariant(Implementation(whileSimplesUnico_i))==(btrue);
  List_Invariant(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(whileSimplesUnico_i))==(btrue);
  Abstract_List_Assertions(Implementation(whileSimplesUnico_i))==(btrue);
  Context_List_Assertions(Implementation(whileSimplesUnico_i))==(btrue);
  List_Assertions(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(whileSimplesUnico_i))==(skip);
  Context_List_Initialisation(Implementation(whileSimplesUnico_i))==(skip);
  List_Initialisation(Implementation(whileSimplesUnico_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(whileSimplesUnico_i))==(btrue);
  List_Context_Constraints(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(whileSimplesUnico_i))==(testSimples);
  List_Operations(Implementation(whileSimplesUnico_i))==(testSimples)
END
&
THEORY ListInputX IS
  List_Input(Implementation(whileSimplesUnico_i),testSimples)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(whileSimplesUnico_i),testSimples)==(total)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(whileSimplesUnico_i),testSimples)==(total <-- testSimples(xx,yy))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(whileSimplesUnico_i),testSimples)==(btrue);
  List_Precondition(Implementation(whileSimplesUnico_i),testSimples)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & total: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(whileSimplesUnico_i),testSimples)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & total: NAT | @(aux1,aux2).(aux1:=xx;aux2:=yy;WHILE aux1>0 DO (aux1-1: INT & aux1: INT & 1: INT | aux1:=aux1-1);(aux2+1: INT & aux2: INT & 1: INT | aux2:=aux2+1) INVARIANT xx+yy = aux1+aux2 & aux1>=0 & aux2>=0 VARIANT aux1 END;(aux2: INT | total:=aux2)));
  List_Substitution(Implementation(whileSimplesUnico_i),testSimples)==(VAR aux1,aux2 IN aux1:=xx;aux2:=yy;WHILE aux1>0 DO aux1:=aux1-1;aux2:=aux2+1 INVARIANT xx+yy = aux1+aux2 & aux1>=0 & aux2>=0 VARIANT aux1 END;total:=aux2 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(whileSimplesUnico_i))==(?);
  Inherited_List_Constants(Implementation(whileSimplesUnico_i))==(?);
  List_Constants(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(whileSimplesUnico_i))==(?);
  Context_List_Defered(Implementation(whileSimplesUnico_i))==(?);
  Context_List_Sets(Implementation(whileSimplesUnico_i))==(?);
  List_Own_Enumerated(Implementation(whileSimplesUnico_i))==(?);
  List_Valuable_Sets(Implementation(whileSimplesUnico_i))==(?);
  Inherited_List_Enumerated(Implementation(whileSimplesUnico_i))==(?);
  Inherited_List_Defered(Implementation(whileSimplesUnico_i))==(?);
  Inherited_List_Sets(Implementation(whileSimplesUnico_i))==(?);
  List_Enumerated(Implementation(whileSimplesUnico_i))==(?);
  List_Defered(Implementation(whileSimplesUnico_i))==(?);
  List_Sets(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(whileSimplesUnico_i))==(?);
  Expanded_List_HiddenConstants(Implementation(whileSimplesUnico_i))==(?);
  List_HiddenConstants(Implementation(whileSimplesUnico_i))==(?);
  External_List_HiddenConstants(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(whileSimplesUnico_i))==(btrue);
  Context_List_Properties(Implementation(whileSimplesUnico_i))==(btrue);
  Inherited_List_Properties(Implementation(whileSimplesUnico_i))==(btrue);
  List_Properties(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(whileSimplesUnico_i))==(aa: aa);
  List_Values(Implementation(whileSimplesUnico_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(whileSimplesUnico_i))==(Type(testSimples) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(whileSimplesUnico_i)) == (? | ? | ? | ? | testSimples | ? | ? | ? | whileSimplesUnico_i);
  List_Of_HiddenCst_Ids(Implementation(whileSimplesUnico_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(whileSimplesUnico_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(whileSimplesUnico_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(whileSimplesUnico_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(whileSimplesUnico_i),testSimples, 1) == (Type(aux1) == Lvl(btype(INTEGER,?,?));Type(aux2) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(whileSimplesUnico_i))==(?)
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
  TypingPredicate(Implementation(whileSimplesUnico_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
