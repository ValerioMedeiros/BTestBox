Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(OC_IFELSE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(OC_IFELSE))==(Machine(OC_IFELSE));
  Level(Machine(OC_IFELSE))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(OC_IFELSE)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(OC_IFELSE))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(OC_IFELSE))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(OC_IFELSE))==(?);
  List_Includes(Machine(OC_IFELSE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(OC_IFELSE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(OC_IFELSE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(OC_IFELSE))==(?);
  Context_List_Variables(Machine(OC_IFELSE))==(?);
  Abstract_List_Variables(Machine(OC_IFELSE))==(?);
  Local_List_Variables(Machine(OC_IFELSE))==(?);
  List_Variables(Machine(OC_IFELSE))==(?);
  External_List_Variables(Machine(OC_IFELSE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(OC_IFELSE))==(?);
  Abstract_List_VisibleVariables(Machine(OC_IFELSE))==(?);
  External_List_VisibleVariables(Machine(OC_IFELSE))==(?);
  Expanded_List_VisibleVariables(Machine(OC_IFELSE))==(?);
  List_VisibleVariables(Machine(OC_IFELSE))==(?);
  Internal_List_VisibleVariables(Machine(OC_IFELSE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(OC_IFELSE))==(btrue);
  Gluing_List_Invariant(Machine(OC_IFELSE))==(btrue);
  Expanded_List_Invariant(Machine(OC_IFELSE))==(btrue);
  Abstract_List_Invariant(Machine(OC_IFELSE))==(btrue);
  Context_List_Invariant(Machine(OC_IFELSE))==(btrue);
  List_Invariant(Machine(OC_IFELSE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(OC_IFELSE))==(btrue);
  Abstract_List_Assertions(Machine(OC_IFELSE))==(btrue);
  Context_List_Assertions(Machine(OC_IFELSE))==(btrue);
  List_Assertions(Machine(OC_IFELSE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(OC_IFELSE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(OC_IFELSE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(OC_IFELSE))==(skip);
  Context_List_Initialisation(Machine(OC_IFELSE))==(skip);
  List_Initialisation(Machine(OC_IFELSE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(OC_IFELSE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(OC_IFELSE))==(btrue);
  List_Constraints(Machine(OC_IFELSE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(OC_IFELSE))==(opOC_IFELSE);
  List_Operations(Machine(OC_IFELSE))==(opOC_IFELSE)
END
&
THEORY ListInputX IS
  List_Input(Machine(OC_IFELSE),opOC_IFELSE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(OC_IFELSE),opOC_IFELSE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(OC_IFELSE),opOC_IFELSE)==(res <-- opOC_IFELSE(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(OC_IFELSE),opOC_IFELSE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(OC_IFELSE),opOC_IFELSE)==(xx: NAT & yy: NAT | xx>yy ==> res:=xx [] not(xx>yy) ==> res:=yy);
  List_Substitution(Machine(OC_IFELSE),opOC_IFELSE)==(IF xx>yy THEN res:=xx ELSE res:=yy END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(OC_IFELSE))==(?);
  Inherited_List_Constants(Machine(OC_IFELSE))==(?);
  List_Constants(Machine(OC_IFELSE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(OC_IFELSE))==(?);
  Context_List_Defered(Machine(OC_IFELSE))==(?);
  Context_List_Sets(Machine(OC_IFELSE))==(?);
  List_Valuable_Sets(Machine(OC_IFELSE))==(?);
  Inherited_List_Enumerated(Machine(OC_IFELSE))==(?);
  Inherited_List_Defered(Machine(OC_IFELSE))==(?);
  Inherited_List_Sets(Machine(OC_IFELSE))==(?);
  List_Enumerated(Machine(OC_IFELSE))==(?);
  List_Defered(Machine(OC_IFELSE))==(?);
  List_Sets(Machine(OC_IFELSE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(OC_IFELSE))==(?);
  Expanded_List_HiddenConstants(Machine(OC_IFELSE))==(?);
  List_HiddenConstants(Machine(OC_IFELSE))==(?);
  External_List_HiddenConstants(Machine(OC_IFELSE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(OC_IFELSE))==(btrue);
  Context_List_Properties(Machine(OC_IFELSE))==(btrue);
  Inherited_List_Properties(Machine(OC_IFELSE))==(btrue);
  List_Properties(Machine(OC_IFELSE))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(OC_IFELSE),opOC_IFELSE)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(OC_IFELSE)) == (? | ? | ? | ? | opOC_IFELSE | ? | ? | ? | OC_IFELSE);
  List_Of_HiddenCst_Ids(Machine(OC_IFELSE)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(OC_IFELSE)) == (?);
  List_Of_VisibleVar_Ids(Machine(OC_IFELSE)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(OC_IFELSE)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(OC_IFELSE)) == (Type(opOC_IFELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(OC_IFELSE)) == (Type(opOC_IFELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
