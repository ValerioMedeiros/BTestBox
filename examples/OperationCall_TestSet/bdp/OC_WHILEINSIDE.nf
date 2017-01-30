Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(OC_WHILEINSIDE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(OC_WHILEINSIDE))==(Machine(OC_WHILEINSIDE));
  Level(Machine(OC_WHILEINSIDE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(OC_WHILEINSIDE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(OC_WHILEINSIDE))==(?);
  List_Includes(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(OC_WHILEINSIDE))==(?);
  Context_List_Variables(Machine(OC_WHILEINSIDE))==(?);
  Abstract_List_Variables(Machine(OC_WHILEINSIDE))==(?);
  Local_List_Variables(Machine(OC_WHILEINSIDE))==(?);
  List_Variables(Machine(OC_WHILEINSIDE))==(?);
  External_List_Variables(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(OC_WHILEINSIDE))==(?);
  Abstract_List_VisibleVariables(Machine(OC_WHILEINSIDE))==(?);
  External_List_VisibleVariables(Machine(OC_WHILEINSIDE))==(?);
  Expanded_List_VisibleVariables(Machine(OC_WHILEINSIDE))==(?);
  List_VisibleVariables(Machine(OC_WHILEINSIDE))==(?);
  Internal_List_VisibleVariables(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(OC_WHILEINSIDE))==(btrue);
  Gluing_List_Invariant(Machine(OC_WHILEINSIDE))==(btrue);
  Expanded_List_Invariant(Machine(OC_WHILEINSIDE))==(btrue);
  Abstract_List_Invariant(Machine(OC_WHILEINSIDE))==(btrue);
  Context_List_Invariant(Machine(OC_WHILEINSIDE))==(btrue);
  List_Invariant(Machine(OC_WHILEINSIDE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(OC_WHILEINSIDE))==(btrue);
  Abstract_List_Assertions(Machine(OC_WHILEINSIDE))==(btrue);
  Context_List_Assertions(Machine(OC_WHILEINSIDE))==(btrue);
  List_Assertions(Machine(OC_WHILEINSIDE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(OC_WHILEINSIDE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(OC_WHILEINSIDE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(OC_WHILEINSIDE))==(skip);
  Context_List_Initialisation(Machine(OC_WHILEINSIDE))==(skip);
  List_Initialisation(Machine(OC_WHILEINSIDE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(OC_WHILEINSIDE))==(btrue);
  List_Constraints(Machine(OC_WHILEINSIDE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(OC_WHILEINSIDE))==(opOC_WHILEINSIDE);
  List_Operations(Machine(OC_WHILEINSIDE))==(opOC_WHILEINSIDE)
END
&
THEORY ListInputX IS
  List_Input(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(res1,res2 <-- opOC_WHILEINSIDE(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(xx: NAT & yy: NAT | res1,res2:=xx,yy);
  List_Substitution(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(res1:=xx || res2:=yy)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(OC_WHILEINSIDE))==(?);
  Inherited_List_Constants(Machine(OC_WHILEINSIDE))==(?);
  List_Constants(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(OC_WHILEINSIDE))==(?);
  Context_List_Defered(Machine(OC_WHILEINSIDE))==(?);
  Context_List_Sets(Machine(OC_WHILEINSIDE))==(?);
  List_Valuable_Sets(Machine(OC_WHILEINSIDE))==(?);
  Inherited_List_Enumerated(Machine(OC_WHILEINSIDE))==(?);
  Inherited_List_Defered(Machine(OC_WHILEINSIDE))==(?);
  Inherited_List_Sets(Machine(OC_WHILEINSIDE))==(?);
  List_Enumerated(Machine(OC_WHILEINSIDE))==(?);
  List_Defered(Machine(OC_WHILEINSIDE))==(?);
  List_Sets(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(OC_WHILEINSIDE))==(?);
  Expanded_List_HiddenConstants(Machine(OC_WHILEINSIDE))==(?);
  List_HiddenConstants(Machine(OC_WHILEINSIDE))==(?);
  External_List_HiddenConstants(Machine(OC_WHILEINSIDE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(OC_WHILEINSIDE))==(btrue);
  Context_List_Properties(Machine(OC_WHILEINSIDE))==(btrue);
  Inherited_List_Properties(Machine(OC_WHILEINSIDE))==(btrue);
  List_Properties(Machine(OC_WHILEINSIDE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(OC_WHILEINSIDE),opOC_WHILEINSIDE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(OC_WHILEINSIDE)) == (? | ? | ? | ? | opOC_WHILEINSIDE | ? | ? | ? | OC_WHILEINSIDE);
  List_Of_HiddenCst_Ids(Machine(OC_WHILEINSIDE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(OC_WHILEINSIDE)) == (?);
  List_Of_VisibleVar_Ids(Machine(OC_WHILEINSIDE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(OC_WHILEINSIDE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(OC_WHILEINSIDE)) == (Type(opOC_WHILEINSIDE) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(OC_WHILEINSIDE)) == (Type(opOC_WHILEINSIDE) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
