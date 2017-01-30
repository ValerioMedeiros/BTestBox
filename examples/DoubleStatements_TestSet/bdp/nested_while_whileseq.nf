Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(nested_while_whileseq))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(nested_while_whileseq))==(Machine(nested_while_whileseq));
  Level(Machine(nested_while_whileseq))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(nested_while_whileseq)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(nested_while_whileseq))==(?);
  List_Includes(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(nested_while_whileseq))==(?);
  Context_List_Variables(Machine(nested_while_whileseq))==(?);
  Abstract_List_Variables(Machine(nested_while_whileseq))==(?);
  Local_List_Variables(Machine(nested_while_whileseq))==(?);
  List_Variables(Machine(nested_while_whileseq))==(?);
  External_List_Variables(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(nested_while_whileseq))==(?);
  Abstract_List_VisibleVariables(Machine(nested_while_whileseq))==(?);
  External_List_VisibleVariables(Machine(nested_while_whileseq))==(?);
  Expanded_List_VisibleVariables(Machine(nested_while_whileseq))==(?);
  List_VisibleVariables(Machine(nested_while_whileseq))==(?);
  Internal_List_VisibleVariables(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(nested_while_whileseq))==(btrue);
  Gluing_List_Invariant(Machine(nested_while_whileseq))==(btrue);
  Expanded_List_Invariant(Machine(nested_while_whileseq))==(btrue);
  Abstract_List_Invariant(Machine(nested_while_whileseq))==(btrue);
  Context_List_Invariant(Machine(nested_while_whileseq))==(btrue);
  List_Invariant(Machine(nested_while_whileseq))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(nested_while_whileseq))==(btrue);
  Abstract_List_Assertions(Machine(nested_while_whileseq))==(btrue);
  Context_List_Assertions(Machine(nested_while_whileseq))==(btrue);
  List_Assertions(Machine(nested_while_whileseq))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(nested_while_whileseq))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(nested_while_whileseq))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(nested_while_whileseq))==(skip);
  Context_List_Initialisation(Machine(nested_while_whileseq))==(skip);
  List_Initialisation(Machine(nested_while_whileseq))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(nested_while_whileseq))==(btrue);
  List_Constraints(Machine(nested_while_whileseq))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(nested_while_whileseq))==(opnested_while_whileseq);
  List_Operations(Machine(nested_while_whileseq))==(opnested_while_whileseq)
END
&
THEORY ListInputX IS
  List_Input(Machine(nested_while_whileseq),opnested_while_whileseq)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Machine(nested_while_whileseq),opnested_while_whileseq)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(nested_while_whileseq),opnested_while_whileseq)==(res1,res2 <-- opnested_while_whileseq(xx,yy))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(nested_while_whileseq),opnested_while_whileseq)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(nested_while_whileseq),opnested_while_whileseq)==(xx: NAT & yy: NAT | res1:=xx || (xx<1 ==> res2:=0 [] not(xx<1) ==> res2:=yy));
  List_Substitution(Machine(nested_while_whileseq),opnested_while_whileseq)==(res1:=xx || IF xx<1 THEN res2:=0 ELSE res2:=yy END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(nested_while_whileseq))==(?);
  Inherited_List_Constants(Machine(nested_while_whileseq))==(?);
  List_Constants(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(nested_while_whileseq))==(?);
  Context_List_Defered(Machine(nested_while_whileseq))==(?);
  Context_List_Sets(Machine(nested_while_whileseq))==(?);
  List_Valuable_Sets(Machine(nested_while_whileseq))==(?);
  Inherited_List_Enumerated(Machine(nested_while_whileseq))==(?);
  Inherited_List_Defered(Machine(nested_while_whileseq))==(?);
  Inherited_List_Sets(Machine(nested_while_whileseq))==(?);
  List_Enumerated(Machine(nested_while_whileseq))==(?);
  List_Defered(Machine(nested_while_whileseq))==(?);
  List_Sets(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(nested_while_whileseq))==(?);
  Expanded_List_HiddenConstants(Machine(nested_while_whileseq))==(?);
  List_HiddenConstants(Machine(nested_while_whileseq))==(?);
  External_List_HiddenConstants(Machine(nested_while_whileseq))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(nested_while_whileseq))==(btrue);
  Context_List_Properties(Machine(nested_while_whileseq))==(btrue);
  Inherited_List_Properties(Machine(nested_while_whileseq))==(btrue);
  List_Properties(Machine(nested_while_whileseq))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(nested_while_whileseq),opnested_while_whileseq)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(nested_while_whileseq)) == (? | ? | ? | ? | opnested_while_whileseq | ? | ? | ? | nested_while_whileseq);
  List_Of_HiddenCst_Ids(Machine(nested_while_whileseq)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(nested_while_whileseq)) == (?);
  List_Of_VisibleVar_Ids(Machine(nested_while_whileseq)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(nested_while_whileseq)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(nested_while_whileseq)) == (Type(opnested_while_whileseq) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(nested_while_whileseq)) == (Type(opnested_while_whileseq) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
