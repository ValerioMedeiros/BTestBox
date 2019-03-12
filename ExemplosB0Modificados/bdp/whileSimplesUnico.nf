Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(whileSimplesUnico))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(whileSimplesUnico))==(Machine(whileSimplesUnico));
  Level(Machine(whileSimplesUnico))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(whileSimplesUnico)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(whileSimplesUnico))==(?);
  List_Includes(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(whileSimplesUnico))==(?);
  Context_List_Variables(Machine(whileSimplesUnico))==(?);
  Abstract_List_Variables(Machine(whileSimplesUnico))==(?);
  Local_List_Variables(Machine(whileSimplesUnico))==(?);
  List_Variables(Machine(whileSimplesUnico))==(?);
  External_List_Variables(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(whileSimplesUnico))==(?);
  Abstract_List_VisibleVariables(Machine(whileSimplesUnico))==(?);
  External_List_VisibleVariables(Machine(whileSimplesUnico))==(?);
  Expanded_List_VisibleVariables(Machine(whileSimplesUnico))==(?);
  List_VisibleVariables(Machine(whileSimplesUnico))==(?);
  Internal_List_VisibleVariables(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(whileSimplesUnico))==(btrue);
  Gluing_List_Invariant(Machine(whileSimplesUnico))==(btrue);
  Expanded_List_Invariant(Machine(whileSimplesUnico))==(btrue);
  Abstract_List_Invariant(Machine(whileSimplesUnico))==(btrue);
  Context_List_Invariant(Machine(whileSimplesUnico))==(btrue);
  List_Invariant(Machine(whileSimplesUnico))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(whileSimplesUnico))==(btrue);
  Abstract_List_Assertions(Machine(whileSimplesUnico))==(btrue);
  Context_List_Assertions(Machine(whileSimplesUnico))==(btrue);
  List_Assertions(Machine(whileSimplesUnico))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(whileSimplesUnico))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(whileSimplesUnico))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(whileSimplesUnico))==(skip);
  Context_List_Initialisation(Machine(whileSimplesUnico))==(skip);
  List_Initialisation(Machine(whileSimplesUnico))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(whileSimplesUnico))==(btrue);
  List_Constraints(Machine(whileSimplesUnico))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(whileSimplesUnico))==(testSimples);
  List_Operations(Machine(whileSimplesUnico))==(testSimples)
END
&
THEORY ListInputX IS
  List_Input(Machine(whileSimplesUnico),testSimples)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(whileSimplesUnico),testSimples)==(total)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(whileSimplesUnico),testSimples)==(total <-- testSimples(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(whileSimplesUnico),testSimples)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & total: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(whileSimplesUnico),testSimples)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & total: NAT | total:=xx+yy);
  List_Substitution(Machine(whileSimplesUnico),testSimples)==(total:=xx+yy)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(whileSimplesUnico))==(?);
  Inherited_List_Constants(Machine(whileSimplesUnico))==(?);
  List_Constants(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(whileSimplesUnico))==(?);
  Context_List_Defered(Machine(whileSimplesUnico))==(?);
  Context_List_Sets(Machine(whileSimplesUnico))==(?);
  List_Valuable_Sets(Machine(whileSimplesUnico))==(?);
  Inherited_List_Enumerated(Machine(whileSimplesUnico))==(?);
  Inherited_List_Defered(Machine(whileSimplesUnico))==(?);
  Inherited_List_Sets(Machine(whileSimplesUnico))==(?);
  List_Enumerated(Machine(whileSimplesUnico))==(?);
  List_Defered(Machine(whileSimplesUnico))==(?);
  List_Sets(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(whileSimplesUnico))==(?);
  Expanded_List_HiddenConstants(Machine(whileSimplesUnico))==(?);
  List_HiddenConstants(Machine(whileSimplesUnico))==(?);
  External_List_HiddenConstants(Machine(whileSimplesUnico))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(whileSimplesUnico))==(btrue);
  Context_List_Properties(Machine(whileSimplesUnico))==(btrue);
  Inherited_List_Properties(Machine(whileSimplesUnico))==(btrue);
  List_Properties(Machine(whileSimplesUnico))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(whileSimplesUnico),testSimples)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(whileSimplesUnico)) == (? | ? | ? | ? | testSimples | ? | ? | ? | whileSimplesUnico);
  List_Of_HiddenCst_Ids(Machine(whileSimplesUnico)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(whileSimplesUnico)) == (?);
  List_Of_VisibleVar_Ids(Machine(whileSimplesUnico)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(whileSimplesUnico)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(whileSimplesUnico)) == (Type(testSimples) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(whileSimplesUnico)) == (Type(testSimples) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
)
