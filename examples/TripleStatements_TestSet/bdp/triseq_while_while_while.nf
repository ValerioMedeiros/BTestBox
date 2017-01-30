Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(triseq_while_while_while))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(triseq_while_while_while))==(Machine(triseq_while_while_while));
  Level(Machine(triseq_while_while_while))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(triseq_while_while_while)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(triseq_while_while_while))==(?);
  List_Includes(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(triseq_while_while_while))==(?);
  Context_List_Variables(Machine(triseq_while_while_while))==(?);
  Abstract_List_Variables(Machine(triseq_while_while_while))==(?);
  Local_List_Variables(Machine(triseq_while_while_while))==(?);
  List_Variables(Machine(triseq_while_while_while))==(?);
  External_List_Variables(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(triseq_while_while_while))==(?);
  Abstract_List_VisibleVariables(Machine(triseq_while_while_while))==(?);
  External_List_VisibleVariables(Machine(triseq_while_while_while))==(?);
  Expanded_List_VisibleVariables(Machine(triseq_while_while_while))==(?);
  List_VisibleVariables(Machine(triseq_while_while_while))==(?);
  Internal_List_VisibleVariables(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(triseq_while_while_while))==(btrue);
  Gluing_List_Invariant(Machine(triseq_while_while_while))==(btrue);
  Expanded_List_Invariant(Machine(triseq_while_while_while))==(btrue);
  Abstract_List_Invariant(Machine(triseq_while_while_while))==(btrue);
  Context_List_Invariant(Machine(triseq_while_while_while))==(btrue);
  List_Invariant(Machine(triseq_while_while_while))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(triseq_while_while_while))==(btrue);
  Abstract_List_Assertions(Machine(triseq_while_while_while))==(btrue);
  Context_List_Assertions(Machine(triseq_while_while_while))==(btrue);
  List_Assertions(Machine(triseq_while_while_while))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(triseq_while_while_while))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(triseq_while_while_while))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(triseq_while_while_while))==(skip);
  Context_List_Initialisation(Machine(triseq_while_while_while))==(skip);
  List_Initialisation(Machine(triseq_while_while_while))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(triseq_while_while_while))==(btrue);
  List_Constraints(Machine(triseq_while_while_while))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(triseq_while_while_while))==(optriseq_while_while_while);
  List_Operations(Machine(triseq_while_while_while))==(optriseq_while_while_while)
END
&
THEORY ListInputX IS
  List_Input(Machine(triseq_while_while_while),optriseq_while_while_while)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(triseq_while_while_while),optriseq_while_while_while)==(res1,res2,res3)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(triseq_while_while_while),optriseq_while_while_while)==(res1,res2,res3 <-- optriseq_while_while_while(xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(triseq_while_while_while),optriseq_while_while_while)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(triseq_while_while_while),optriseq_while_while_while)==(xx: NAT | res1,res2,res3:=xx,xx,xx);
  List_Substitution(Machine(triseq_while_while_while),optriseq_while_while_while)==(res1:=xx || res2:=xx || res3:=xx)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(triseq_while_while_while))==(?);
  Inherited_List_Constants(Machine(triseq_while_while_while))==(?);
  List_Constants(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(triseq_while_while_while))==(?);
  Context_List_Defered(Machine(triseq_while_while_while))==(?);
  Context_List_Sets(Machine(triseq_while_while_while))==(?);
  List_Valuable_Sets(Machine(triseq_while_while_while))==(?);
  Inherited_List_Enumerated(Machine(triseq_while_while_while))==(?);
  Inherited_List_Defered(Machine(triseq_while_while_while))==(?);
  Inherited_List_Sets(Machine(triseq_while_while_while))==(?);
  List_Enumerated(Machine(triseq_while_while_while))==(?);
  List_Defered(Machine(triseq_while_while_while))==(?);
  List_Sets(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(triseq_while_while_while))==(?);
  Expanded_List_HiddenConstants(Machine(triseq_while_while_while))==(?);
  List_HiddenConstants(Machine(triseq_while_while_while))==(?);
  External_List_HiddenConstants(Machine(triseq_while_while_while))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(triseq_while_while_while))==(btrue);
  Context_List_Properties(Machine(triseq_while_while_while))==(btrue);
  Inherited_List_Properties(Machine(triseq_while_while_while))==(btrue);
  List_Properties(Machine(triseq_while_while_while))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(triseq_while_while_while),optriseq_while_while_while)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(triseq_while_while_while)) == (? | ? | ? | ? | optriseq_while_while_while | ? | ? | ? | triseq_while_while_while);
  List_Of_HiddenCst_Ids(Machine(triseq_while_while_while)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(triseq_while_while_while)) == (?);
  List_Of_VisibleVar_Ids(Machine(triseq_while_while_while)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(triseq_while_while_while)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(triseq_while_while_while)) == (Type(optriseq_while_while_while) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(triseq_while_while_while)) == (Type(optriseq_while_while_while) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
