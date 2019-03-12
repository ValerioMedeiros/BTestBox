Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(whileSimples))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(whileSimples))==(Machine(whileSimples));
  Level(Machine(whileSimples))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(whileSimples)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(whileSimples))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(whileSimples))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(whileSimples))==(?);
  List_Includes(Machine(whileSimples))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(whileSimples))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(whileSimples))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(whileSimples))==(?);
  Context_List_Variables(Machine(whileSimples))==(?);
  Abstract_List_Variables(Machine(whileSimples))==(?);
  Local_List_Variables(Machine(whileSimples))==(?);
  List_Variables(Machine(whileSimples))==(?);
  External_List_Variables(Machine(whileSimples))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(whileSimples))==(?);
  Abstract_List_VisibleVariables(Machine(whileSimples))==(?);
  External_List_VisibleVariables(Machine(whileSimples))==(?);
  Expanded_List_VisibleVariables(Machine(whileSimples))==(?);
  List_VisibleVariables(Machine(whileSimples))==(?);
  Internal_List_VisibleVariables(Machine(whileSimples))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(whileSimples))==(btrue);
  Gluing_List_Invariant(Machine(whileSimples))==(btrue);
  Expanded_List_Invariant(Machine(whileSimples))==(btrue);
  Abstract_List_Invariant(Machine(whileSimples))==(btrue);
  Context_List_Invariant(Machine(whileSimples))==(btrue);
  List_Invariant(Machine(whileSimples))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(whileSimples))==(btrue);
  Abstract_List_Assertions(Machine(whileSimples))==(btrue);
  Context_List_Assertions(Machine(whileSimples))==(btrue);
  List_Assertions(Machine(whileSimples))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(whileSimples))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(whileSimples))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(whileSimples))==(skip);
  Context_List_Initialisation(Machine(whileSimples))==(skip);
  List_Initialisation(Machine(whileSimples))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(whileSimples))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(whileSimples))==(btrue);
  List_Constraints(Machine(whileSimples))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(whileSimples))==(testSimples,testSimples1);
  List_Operations(Machine(whileSimples))==(testSimples,testSimples1)
END
&
THEORY ListInputX IS
  List_Input(Machine(whileSimples),testSimples)==(xx,yy);
  List_Input(Machine(whileSimples),testSimples1)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(whileSimples),testSimples)==(total);
  List_Output(Machine(whileSimples),testSimples1)==(totales)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(whileSimples),testSimples)==(total <-- testSimples(xx,yy));
  List_Header(Machine(whileSimples),testSimples1)==(totales <-- testSimples1(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(whileSimples),testSimples)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & total: NAT);
  List_Precondition(Machine(whileSimples),testSimples1)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & totales: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(whileSimples),testSimples1)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & totales: NAT | totales:=xx+yy);
  Expanded_List_Substitution(Machine(whileSimples),testSimples)==(xx: NAT & xx>0 & xx<5 & yy: NAT & yy>0 & yy<5 & total: NAT | total:=xx+yy);
  List_Substitution(Machine(whileSimples),testSimples)==(total:=xx+yy);
  List_Substitution(Machine(whileSimples),testSimples1)==(totales:=xx+yy)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(whileSimples))==(?);
  Inherited_List_Constants(Machine(whileSimples))==(?);
  List_Constants(Machine(whileSimples))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(whileSimples))==(?);
  Context_List_Defered(Machine(whileSimples))==(?);
  Context_List_Sets(Machine(whileSimples))==(?);
  List_Valuable_Sets(Machine(whileSimples))==(?);
  Inherited_List_Enumerated(Machine(whileSimples))==(?);
  Inherited_List_Defered(Machine(whileSimples))==(?);
  Inherited_List_Sets(Machine(whileSimples))==(?);
  List_Enumerated(Machine(whileSimples))==(?);
  List_Defered(Machine(whileSimples))==(?);
  List_Sets(Machine(whileSimples))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(whileSimples))==(?);
  Expanded_List_HiddenConstants(Machine(whileSimples))==(?);
  List_HiddenConstants(Machine(whileSimples))==(?);
  External_List_HiddenConstants(Machine(whileSimples))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(whileSimples))==(btrue);
  Context_List_Properties(Machine(whileSimples))==(btrue);
  Inherited_List_Properties(Machine(whileSimples))==(btrue);
  List_Properties(Machine(whileSimples))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(whileSimples),testSimples)==(?);
  List_ANY_Var(Machine(whileSimples),testSimples1)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(whileSimples)) == (? | ? | ? | ? | testSimples,testSimples1 | ? | ? | ? | whileSimples);
  List_Of_HiddenCst_Ids(Machine(whileSimples)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(whileSimples)) == (?);
  List_Of_VisibleVar_Ids(Machine(whileSimples)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(whileSimples)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(whileSimples)) == (Type(testSimples1) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(testSimples) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(whileSimples)) == (Type(testSimples1) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(testSimples) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
