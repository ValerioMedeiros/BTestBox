Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(nested_while_while))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(nested_while_while))==(Machine(nested_while_while));
  Level(Machine(nested_while_while))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(nested_while_while)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(nested_while_while))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(nested_while_while))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(nested_while_while))==(?);
  List_Includes(Machine(nested_while_while))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(nested_while_while))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(nested_while_while))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(nested_while_while))==(?);
  Context_List_Variables(Machine(nested_while_while))==(?);
  Abstract_List_Variables(Machine(nested_while_while))==(?);
  Local_List_Variables(Machine(nested_while_while))==(?);
  List_Variables(Machine(nested_while_while))==(?);
  External_List_Variables(Machine(nested_while_while))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(nested_while_while))==(?);
  Abstract_List_VisibleVariables(Machine(nested_while_while))==(?);
  External_List_VisibleVariables(Machine(nested_while_while))==(?);
  Expanded_List_VisibleVariables(Machine(nested_while_while))==(?);
  List_VisibleVariables(Machine(nested_while_while))==(?);
  Internal_List_VisibleVariables(Machine(nested_while_while))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(nested_while_while))==(btrue);
  Gluing_List_Invariant(Machine(nested_while_while))==(btrue);
  Expanded_List_Invariant(Machine(nested_while_while))==(btrue);
  Abstract_List_Invariant(Machine(nested_while_while))==(btrue);
  Context_List_Invariant(Machine(nested_while_while))==(btrue);
  List_Invariant(Machine(nested_while_while))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(nested_while_while))==(btrue);
  Abstract_List_Assertions(Machine(nested_while_while))==(btrue);
  Context_List_Assertions(Machine(nested_while_while))==(btrue);
  List_Assertions(Machine(nested_while_while))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(nested_while_while))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(nested_while_while))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(nested_while_while))==(skip);
  Context_List_Initialisation(Machine(nested_while_while))==(skip);
  List_Initialisation(Machine(nested_while_while))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(nested_while_while))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(nested_while_while))==(btrue);
  List_Constraints(Machine(nested_while_while))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(nested_while_while))==(opnested_while_while);
  List_Operations(Machine(nested_while_while))==(opnested_while_while)
END
&
THEORY ListInputX IS
  List_Input(Machine(nested_while_while),opnested_while_while)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(nested_while_while),opnested_while_while)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(nested_while_while),opnested_while_while)==(res1,res2 <-- opnested_while_while(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(nested_while_while),opnested_while_while)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(nested_while_while),opnested_while_while)==(xx: NAT & yy: NAT | res1:=xx || (xx>0 ==> res2:=yy [] not(xx>0) ==> res2:=0));
  List_Substitution(Machine(nested_while_while),opnested_while_while)==(res1:=xx || IF xx>0 THEN res2:=yy ELSE res2:=0 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(nested_while_while))==(?);
  Inherited_List_Constants(Machine(nested_while_while))==(?);
  List_Constants(Machine(nested_while_while))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(nested_while_while))==(?);
  Context_List_Defered(Machine(nested_while_while))==(?);
  Context_List_Sets(Machine(nested_while_while))==(?);
  List_Valuable_Sets(Machine(nested_while_while))==(?);
  Inherited_List_Enumerated(Machine(nested_while_while))==(?);
  Inherited_List_Defered(Machine(nested_while_while))==(?);
  Inherited_List_Sets(Machine(nested_while_while))==(?);
  List_Enumerated(Machine(nested_while_while))==(?);
  List_Defered(Machine(nested_while_while))==(?);
  List_Sets(Machine(nested_while_while))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(nested_while_while))==(?);
  Expanded_List_HiddenConstants(Machine(nested_while_while))==(?);
  List_HiddenConstants(Machine(nested_while_while))==(?);
  External_List_HiddenConstants(Machine(nested_while_while))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(nested_while_while))==(btrue);
  Context_List_Properties(Machine(nested_while_while))==(btrue);
  Inherited_List_Properties(Machine(nested_while_while))==(btrue);
  List_Properties(Machine(nested_while_while))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(nested_while_while),opnested_while_while)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(nested_while_while)) == (? | ? | ? | ? | opnested_while_while | ? | ? | ? | nested_while_while);
  List_Of_HiddenCst_Ids(Machine(nested_while_while)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(nested_while_while)) == (?);
  List_Of_VisibleVar_Ids(Machine(nested_while_while)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(nested_while_while)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(nested_while_while)) == (Type(opnested_while_while) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(nested_while_while)) == (Type(opnested_while_while) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
