Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MchWithVariables))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MchWithVariables))==(Machine(MchWithVariables));
  Level(Machine(MchWithVariables))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MchWithVariables)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MchWithVariables))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MchWithVariables))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MchWithVariables))==(?);
  List_Includes(Machine(MchWithVariables))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MchWithVariables))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MchWithVariables))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MchWithVariables))==(?);
  Context_List_Variables(Machine(MchWithVariables))==(?);
  Abstract_List_Variables(Machine(MchWithVariables))==(?);
  Local_List_Variables(Machine(MchWithVariables))==(count);
  List_Variables(Machine(MchWithVariables))==(count);
  External_List_Variables(Machine(MchWithVariables))==(count)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MchWithVariables))==(?);
  Abstract_List_VisibleVariables(Machine(MchWithVariables))==(?);
  External_List_VisibleVariables(Machine(MchWithVariables))==(?);
  Expanded_List_VisibleVariables(Machine(MchWithVariables))==(?);
  List_VisibleVariables(Machine(MchWithVariables))==(?);
  Internal_List_VisibleVariables(Machine(MchWithVariables))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MchWithVariables))==(btrue);
  Gluing_List_Invariant(Machine(MchWithVariables))==(btrue);
  Expanded_List_Invariant(Machine(MchWithVariables))==(btrue);
  Abstract_List_Invariant(Machine(MchWithVariables))==(btrue);
  Context_List_Invariant(Machine(MchWithVariables))==(btrue);
  List_Invariant(Machine(MchWithVariables))==(count: NAT & count<=max_count)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MchWithVariables))==(btrue);
  Abstract_List_Assertions(Machine(MchWithVariables))==(btrue);
  Context_List_Assertions(Machine(MchWithVariables))==(btrue);
  List_Assertions(Machine(MchWithVariables))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MchWithVariables))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MchWithVariables))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MchWithVariables))==(count:=0);
  Context_List_Initialisation(Machine(MchWithVariables))==(skip);
  List_Initialisation(Machine(MchWithVariables))==(count:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MchWithVariables))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MchWithVariables))==(btrue);
  List_Constraints(Machine(MchWithVariables))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MchWithVariables))==(opIncCount,opRelease,resetCount,getCount);
  List_Operations(Machine(MchWithVariables))==(opIncCount,opRelease,resetCount,getCount)
END
&
THEORY ListInputX IS
  List_Input(Machine(MchWithVariables),opIncCount)==(nn);
  List_Input(Machine(MchWithVariables),opRelease)==(nn);
  List_Input(Machine(MchWithVariables),resetCount)==(?);
  List_Input(Machine(MchWithVariables),getCount)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MchWithVariables),opIncCount)==(res);
  List_Output(Machine(MchWithVariables),opRelease)==(res);
  List_Output(Machine(MchWithVariables),resetCount)==(?);
  List_Output(Machine(MchWithVariables),getCount)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MchWithVariables),opIncCount)==(res <-- opIncCount(nn));
  List_Header(Machine(MchWithVariables),opRelease)==(res <-- opRelease(nn));
  List_Header(Machine(MchWithVariables),resetCount)==(resetCount);
  List_Header(Machine(MchWithVariables),getCount)==(res <-- getCount)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MchWithVariables),opIncCount)==(nn: NAT & nn>0);
  List_Precondition(Machine(MchWithVariables),opRelease)==(nn: NAT);
  List_Precondition(Machine(MchWithVariables),resetCount)==(btrue);
  List_Precondition(Machine(MchWithVariables),getCount)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MchWithVariables),getCount)==(btrue | res:=count);
  Expanded_List_Substitution(Machine(MchWithVariables),resetCount)==(btrue | count:=0);
  Expanded_List_Substitution(Machine(MchWithVariables),opRelease)==(nn: NAT | count-nn<0 ==> res:=0 [] not(count-nn<0) ==> res,count:=1,count-nn);
  Expanded_List_Substitution(Machine(MchWithVariables),opIncCount)==(nn: NAT & nn>0 | count+nn<max_count ==> res,count:=1,count+nn [] not(count+nn<max_count) ==> res:=0);
  List_Substitution(Machine(MchWithVariables),opIncCount)==(IF count+nn<max_count THEN res:=1 || count:=count+nn ELSE res:=0 END);
  List_Substitution(Machine(MchWithVariables),opRelease)==(IF count-nn<0 THEN res:=0 ELSE res:=1 || count:=count-nn END);
  List_Substitution(Machine(MchWithVariables),resetCount)==(count:=0);
  List_Substitution(Machine(MchWithVariables),getCount)==(res:=count)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MchWithVariables))==(max_count);
  Inherited_List_Constants(Machine(MchWithVariables))==(?);
  List_Constants(Machine(MchWithVariables))==(max_count)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MchWithVariables))==(?);
  Context_List_Defered(Machine(MchWithVariables))==(?);
  Context_List_Sets(Machine(MchWithVariables))==(?);
  List_Valuable_Sets(Machine(MchWithVariables))==(?);
  Inherited_List_Enumerated(Machine(MchWithVariables))==(?);
  Inherited_List_Defered(Machine(MchWithVariables))==(?);
  Inherited_List_Sets(Machine(MchWithVariables))==(?);
  List_Enumerated(Machine(MchWithVariables))==(?);
  List_Defered(Machine(MchWithVariables))==(?);
  List_Sets(Machine(MchWithVariables))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MchWithVariables))==(?);
  Expanded_List_HiddenConstants(Machine(MchWithVariables))==(?);
  List_HiddenConstants(Machine(MchWithVariables))==(?);
  External_List_HiddenConstants(Machine(MchWithVariables))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MchWithVariables))==(btrue);
  Context_List_Properties(Machine(MchWithVariables))==(btrue);
  Inherited_List_Properties(Machine(MchWithVariables))==(btrue);
  List_Properties(Machine(MchWithVariables))==(max_count = 10)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MchWithVariables),opIncCount)==(?);
  List_ANY_Var(Machine(MchWithVariables),opRelease)==(?);
  List_ANY_Var(Machine(MchWithVariables),resetCount)==(?);
  List_ANY_Var(Machine(MchWithVariables),getCount)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MchWithVariables)) == (max_count | ? | count | ? | opIncCount,opRelease,resetCount,getCount | ? | ? | ? | MchWithVariables);
  List_Of_HiddenCst_Ids(Machine(MchWithVariables)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MchWithVariables)) == (max_count);
  List_Of_VisibleVar_Ids(Machine(MchWithVariables)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MchWithVariables)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(MchWithVariables)) == (Type(max_count) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(MchWithVariables)) == (Type(count) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MchWithVariables)) == (Type(getCount) == Cst(btype(INTEGER,?,?),No_type);Type(resetCount) == Cst(No_type,No_type);Type(opRelease) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(opIncCount) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(MchWithVariables)) == (Type(getCount) == Cst(btype(INTEGER,?,?),No_type))
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
