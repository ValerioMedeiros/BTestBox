Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(OC_WHILEBEFORE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(OC_WHILEBEFORE))==(Machine(OC_WHILEBEFORE));
  Level(Machine(OC_WHILEBEFORE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(OC_WHILEBEFORE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(OC_WHILEBEFORE))==(?);
  List_Includes(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(OC_WHILEBEFORE))==(?);
  Context_List_Variables(Machine(OC_WHILEBEFORE))==(?);
  Abstract_List_Variables(Machine(OC_WHILEBEFORE))==(?);
  Local_List_Variables(Machine(OC_WHILEBEFORE))==(?);
  List_Variables(Machine(OC_WHILEBEFORE))==(?);
  External_List_Variables(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(OC_WHILEBEFORE))==(?);
  Abstract_List_VisibleVariables(Machine(OC_WHILEBEFORE))==(?);
  External_List_VisibleVariables(Machine(OC_WHILEBEFORE))==(?);
  Expanded_List_VisibleVariables(Machine(OC_WHILEBEFORE))==(?);
  List_VisibleVariables(Machine(OC_WHILEBEFORE))==(?);
  Internal_List_VisibleVariables(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(OC_WHILEBEFORE))==(btrue);
  Gluing_List_Invariant(Machine(OC_WHILEBEFORE))==(btrue);
  Expanded_List_Invariant(Machine(OC_WHILEBEFORE))==(btrue);
  Abstract_List_Invariant(Machine(OC_WHILEBEFORE))==(btrue);
  Context_List_Invariant(Machine(OC_WHILEBEFORE))==(btrue);
  List_Invariant(Machine(OC_WHILEBEFORE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(OC_WHILEBEFORE))==(btrue);
  Abstract_List_Assertions(Machine(OC_WHILEBEFORE))==(btrue);
  Context_List_Assertions(Machine(OC_WHILEBEFORE))==(btrue);
  List_Assertions(Machine(OC_WHILEBEFORE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(OC_WHILEBEFORE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(OC_WHILEBEFORE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(OC_WHILEBEFORE))==(skip);
  Context_List_Initialisation(Machine(OC_WHILEBEFORE))==(skip);
  List_Initialisation(Machine(OC_WHILEBEFORE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(OC_WHILEBEFORE))==(btrue);
  List_Constraints(Machine(OC_WHILEBEFORE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(OC_WHILEBEFORE))==(opOC_WHILEBEFORE);
  List_Operations(Machine(OC_WHILEBEFORE))==(opOC_WHILEBEFORE)
END
&
THEORY ListInputX IS
  List_Input(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(res1,res2 <-- opOC_WHILEBEFORE(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(xx: NAT & yy: NAT | res1,res2:=xx,yy);
  List_Substitution(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(res1:=xx || res2:=yy)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(OC_WHILEBEFORE))==(?);
  Inherited_List_Constants(Machine(OC_WHILEBEFORE))==(?);
  List_Constants(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(OC_WHILEBEFORE))==(?);
  Context_List_Defered(Machine(OC_WHILEBEFORE))==(?);
  Context_List_Sets(Machine(OC_WHILEBEFORE))==(?);
  List_Valuable_Sets(Machine(OC_WHILEBEFORE))==(?);
  Inherited_List_Enumerated(Machine(OC_WHILEBEFORE))==(?);
  Inherited_List_Defered(Machine(OC_WHILEBEFORE))==(?);
  Inherited_List_Sets(Machine(OC_WHILEBEFORE))==(?);
  List_Enumerated(Machine(OC_WHILEBEFORE))==(?);
  List_Defered(Machine(OC_WHILEBEFORE))==(?);
  List_Sets(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(OC_WHILEBEFORE))==(?);
  Expanded_List_HiddenConstants(Machine(OC_WHILEBEFORE))==(?);
  List_HiddenConstants(Machine(OC_WHILEBEFORE))==(?);
  External_List_HiddenConstants(Machine(OC_WHILEBEFORE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(OC_WHILEBEFORE))==(btrue);
  Context_List_Properties(Machine(OC_WHILEBEFORE))==(btrue);
  Inherited_List_Properties(Machine(OC_WHILEBEFORE))==(btrue);
  List_Properties(Machine(OC_WHILEBEFORE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(OC_WHILEBEFORE),opOC_WHILEBEFORE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(OC_WHILEBEFORE)) == (? | ? | ? | ? | opOC_WHILEBEFORE | ? | ? | ? | OC_WHILEBEFORE);
  List_Of_HiddenCst_Ids(Machine(OC_WHILEBEFORE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(OC_WHILEBEFORE)) == (?);
  List_Of_VisibleVar_Ids(Machine(OC_WHILEBEFORE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(OC_WHILEBEFORE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(OC_WHILEBEFORE)) == (Type(opOC_WHILEBEFORE) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(OC_WHILEBEFORE)) == (Type(opOC_WHILEBEFORE) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
