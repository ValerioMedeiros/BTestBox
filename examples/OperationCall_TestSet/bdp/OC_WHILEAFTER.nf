Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(OC_WHILEAFTER))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(OC_WHILEAFTER))==(Machine(OC_WHILEAFTER));
  Level(Machine(OC_WHILEAFTER))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(OC_WHILEAFTER)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(OC_WHILEAFTER))==(?);
  List_Includes(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(OC_WHILEAFTER))==(?);
  Context_List_Variables(Machine(OC_WHILEAFTER))==(?);
  Abstract_List_Variables(Machine(OC_WHILEAFTER))==(?);
  Local_List_Variables(Machine(OC_WHILEAFTER))==(?);
  List_Variables(Machine(OC_WHILEAFTER))==(?);
  External_List_Variables(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(OC_WHILEAFTER))==(?);
  Abstract_List_VisibleVariables(Machine(OC_WHILEAFTER))==(?);
  External_List_VisibleVariables(Machine(OC_WHILEAFTER))==(?);
  Expanded_List_VisibleVariables(Machine(OC_WHILEAFTER))==(?);
  List_VisibleVariables(Machine(OC_WHILEAFTER))==(?);
  Internal_List_VisibleVariables(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(OC_WHILEAFTER))==(btrue);
  Gluing_List_Invariant(Machine(OC_WHILEAFTER))==(btrue);
  Expanded_List_Invariant(Machine(OC_WHILEAFTER))==(btrue);
  Abstract_List_Invariant(Machine(OC_WHILEAFTER))==(btrue);
  Context_List_Invariant(Machine(OC_WHILEAFTER))==(btrue);
  List_Invariant(Machine(OC_WHILEAFTER))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(OC_WHILEAFTER))==(btrue);
  Abstract_List_Assertions(Machine(OC_WHILEAFTER))==(btrue);
  Context_List_Assertions(Machine(OC_WHILEAFTER))==(btrue);
  List_Assertions(Machine(OC_WHILEAFTER))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(OC_WHILEAFTER))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(OC_WHILEAFTER))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(OC_WHILEAFTER))==(skip);
  Context_List_Initialisation(Machine(OC_WHILEAFTER))==(skip);
  List_Initialisation(Machine(OC_WHILEAFTER))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(OC_WHILEAFTER))==(btrue);
  List_Constraints(Machine(OC_WHILEAFTER))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(OC_WHILEAFTER))==(opOC_WHILEAFTER);
  List_Operations(Machine(OC_WHILEAFTER))==(opOC_WHILEAFTER)
END
&
THEORY ListInputX IS
  List_Input(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(res1,res2 <-- opOC_WHILEAFTER(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(xx: NAT & yy: NAT | res1,res2:=xx,yy);
  List_Substitution(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(res1:=xx || res2:=yy)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(OC_WHILEAFTER))==(?);
  Inherited_List_Constants(Machine(OC_WHILEAFTER))==(?);
  List_Constants(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(OC_WHILEAFTER))==(?);
  Context_List_Defered(Machine(OC_WHILEAFTER))==(?);
  Context_List_Sets(Machine(OC_WHILEAFTER))==(?);
  List_Valuable_Sets(Machine(OC_WHILEAFTER))==(?);
  Inherited_List_Enumerated(Machine(OC_WHILEAFTER))==(?);
  Inherited_List_Defered(Machine(OC_WHILEAFTER))==(?);
  Inherited_List_Sets(Machine(OC_WHILEAFTER))==(?);
  List_Enumerated(Machine(OC_WHILEAFTER))==(?);
  List_Defered(Machine(OC_WHILEAFTER))==(?);
  List_Sets(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(OC_WHILEAFTER))==(?);
  Expanded_List_HiddenConstants(Machine(OC_WHILEAFTER))==(?);
  List_HiddenConstants(Machine(OC_WHILEAFTER))==(?);
  External_List_HiddenConstants(Machine(OC_WHILEAFTER))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(OC_WHILEAFTER))==(btrue);
  Context_List_Properties(Machine(OC_WHILEAFTER))==(btrue);
  Inherited_List_Properties(Machine(OC_WHILEAFTER))==(btrue);
  List_Properties(Machine(OC_WHILEAFTER))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(OC_WHILEAFTER),opOC_WHILEAFTER)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(OC_WHILEAFTER)) == (? | ? | ? | ? | opOC_WHILEAFTER | ? | ? | ? | OC_WHILEAFTER);
  List_Of_HiddenCst_Ids(Machine(OC_WHILEAFTER)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(OC_WHILEAFTER)) == (?);
  List_Of_VisibleVar_Ids(Machine(OC_WHILEAFTER)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(OC_WHILEAFTER)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(OC_WHILEAFTER)) == (Type(opOC_WHILEAFTER) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(OC_WHILEAFTER)) == (Type(opOC_WHILEAFTER) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
