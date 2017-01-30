Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithSets))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithSets))==(Machine(MchWithSets));
  Level(Machine(MchWithSets))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithSets)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithSets))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithSets))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithSets))==(?);
  List_Includes(Machine(MchWithSets))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithSets))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithSets))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithSets))==(?);
  Context_List_Variables(Machine(MchWithSets))==(?);
  Abstract_List_Variables(Machine(MchWithSets))==(?);
  Local_List_Variables(Machine(MchWithSets))==(?);
  List_Variables(Machine(MchWithSets))==(?);
  External_List_Variables(Machine(MchWithSets))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithSets))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithSets))==(?);
  External_List_VisibleVariables(Machine(MchWithSets))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithSets))==(?);
  List_VisibleVariables(Machine(MchWithSets))==(?);
  Internal_List_VisibleVariables(Machine(MchWithSets))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithSets))==(btrue);
  Gluing_List_Invariant(Machine(MchWithSets))==(btrue);
  Expanded_List_Invariant(Machine(MchWithSets))==(btrue);
  Abstract_List_Invariant(Machine(MchWithSets))==(btrue);
  Context_List_Invariant(Machine(MchWithSets))==(btrue);
  List_Invariant(Machine(MchWithSets))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithSets))==(btrue);
  Abstract_List_Assertions(Machine(MchWithSets))==(btrue);
  Context_List_Assertions(Machine(MchWithSets))==(btrue);
  List_Assertions(Machine(MchWithSets))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithSets))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithSets))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithSets))==(skip);
  Context_List_Initialisation(Machine(MchWithSets))==(skip);
  List_Initialisation(Machine(MchWithSets))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithSets))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithSets))==(btrue);
  List_Constraints(Machine(MchWithSets))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithSets))==(opMchWithSets);
  List_Operations(Machine(MchWithSets))==(opMchWithSets)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithSets),opMchWithSets)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithSets),opMchWithSets)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithSets),opMchWithSets)==(res <-- opMchWithSets(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithSets),opMchWithSets)==(nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithSets),opMchWithSets)==(nn: NAT | nn<max_count ==> res:=Okay [] not(nn<max_count) ==> res:=Out_of_Range);
  List_Substitution(Machine(MchWithSets),opMchWithSets)==(IF nn<max_count THEN res:=Okay ELSE res:=Out_of_Range END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithSets))==(max_count);
  Inherited_List_Constants(Machine(MchWithSets))==(?);
  List_Constants(Machine(MchWithSets))==(max_count)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(MchWithSets),answer)==({Okay,Out_of_Range});
  Context_List_Enumerated(Machine(MchWithSets))==(?);
  Context_List_Defered(Machine(MchWithSets))==(?);
  Context_List_Sets(Machine(MchWithSets))==(?);
  List_Valuable_Sets(Machine(MchWithSets))==(?);
  Inherited_List_Enumerated(Machine(MchWithSets))==(?);
  Inherited_List_Defered(Machine(MchWithSets))==(?);
  Inherited_List_Sets(Machine(MchWithSets))==(?);
  List_Enumerated(Machine(MchWithSets))==(answer);
  List_Defered(Machine(MchWithSets))==(?);
  List_Sets(Machine(MchWithSets))==(answer)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithSets))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithSets))==(?);
  List_HiddenConstants(Machine(MchWithSets))==(?);
  External_List_HiddenConstants(Machine(MchWithSets))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithSets))==(btrue);
  Context_List_Properties(Machine(MchWithSets))==(btrue);
  Inherited_List_Properties(Machine(MchWithSets))==(btrue);
  List_Properties(Machine(MchWithSets))==(max_count = 10 & answer: FIN(INTEGER) & not(answer = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithSets),opMchWithSets)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithSets)) == (max_count,answer,Okay,Out_of_Range | ? | ? | ? | opMchWithSets | ? | ? | ? | MchWithSets);
  List_Of_HiddenCst_Ids(Machine(MchWithSets)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithSets)) == (max_count);
  List_Of_VisibleVar_Ids(Machine(MchWithSets)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithSets)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(MchWithSets)) == (Type(answer) == Cst(SetOf(etype(answer,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(MchWithSets)) == (Type(Okay) == Cst(etype(answer,0,1));Type(Out_of_Range) == Cst(etype(answer,0,1));Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithSets)) == (Type(opMchWithSets) == Cst(etype(answer,?,?),btype(INTEGER,?,?)));
  Observers(Machine(MchWithSets)) == (Type(opMchWithSets) == Cst(etype(answer,?,?),btype(INTEGER,?,?)))
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
