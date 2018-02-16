Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(triple_case_else_case))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(triple_case_else_case))==(Machine(triple_case_else_case));
  Level(Machine(triple_case_else_case))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(triple_case_else_case)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(triple_case_else_case))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(triple_case_else_case))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(triple_case_else_case))==(?);
  List_Includes(Machine(triple_case_else_case))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(triple_case_else_case))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(triple_case_else_case))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(triple_case_else_case))==(?);
  Context_List_Variables(Machine(triple_case_else_case))==(?);
  Abstract_List_Variables(Machine(triple_case_else_case))==(?);
  Local_List_Variables(Machine(triple_case_else_case))==(?);
  List_Variables(Machine(triple_case_else_case))==(?);
  External_List_Variables(Machine(triple_case_else_case))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(triple_case_else_case))==(?);
  Abstract_List_VisibleVariables(Machine(triple_case_else_case))==(?);
  External_List_VisibleVariables(Machine(triple_case_else_case))==(?);
  Expanded_List_VisibleVariables(Machine(triple_case_else_case))==(?);
  List_VisibleVariables(Machine(triple_case_else_case))==(?);
  Internal_List_VisibleVariables(Machine(triple_case_else_case))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(triple_case_else_case))==(btrue);
  Gluing_List_Invariant(Machine(triple_case_else_case))==(btrue);
  Expanded_List_Invariant(Machine(triple_case_else_case))==(btrue);
  Abstract_List_Invariant(Machine(triple_case_else_case))==(btrue);
  Context_List_Invariant(Machine(triple_case_else_case))==(btrue);
  List_Invariant(Machine(triple_case_else_case))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(triple_case_else_case))==(btrue);
  Abstract_List_Assertions(Machine(triple_case_else_case))==(btrue);
  Context_List_Assertions(Machine(triple_case_else_case))==(btrue);
  List_Assertions(Machine(triple_case_else_case))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(triple_case_else_case))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(triple_case_else_case))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(triple_case_else_case))==(skip);
  Context_List_Initialisation(Machine(triple_case_else_case))==(skip);
  List_Initialisation(Machine(triple_case_else_case))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(triple_case_else_case))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(triple_case_else_case))==(btrue);
  List_Constraints(Machine(triple_case_else_case))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(triple_case_else_case))==(optriple_case_else_case);
  List_Operations(Machine(triple_case_else_case))==(optriple_case_else_case)
END
&
THEORY ListInputX IS
  List_Input(Machine(triple_case_else_case),optriple_case_else_case)==(xx,yy,zz)
END
&
THEORY ListOutputX IS
  List_Output(Machine(triple_case_else_case),optriple_case_else_case)==(res1,res2,res3)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(triple_case_else_case),optriple_case_else_case)==(res1,res2,res3 <-- optriple_case_else_case(xx,yy,zz))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(triple_case_else_case),optriple_case_else_case)==(xx: NAT & yy: NAT & zz: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(triple_case_else_case),optriple_case_else_case)==(xx: NAT & yy: NAT & zz: NAT | not(xx = 1) & xx = 0 ==> (yy<5 ==> (not(zz = 1) & zz = 0 ==> res1,res2,res3:=xx,0,zz [] not(zz = 0) & zz = 1 ==> res1,res2,res3:=xx,0,zz [] not(zz = 0) & not(zz = 1) ==> res1,res2,res3:=xx,0,zz) [] not(yy<5) ==> (not(zz = 1) & zz = 0 ==> res1,res2,res3:=xx,yy,zz [] not(zz = 0) & zz = 1 ==> res1,res2,res3:=xx,yy,zz [] not(zz = 0) & not(zz = 1) ==> res1,res2,res3:=xx,yy,zz)) [] not(xx = 0) & xx = 1 ==> (yy<5 ==> (not(zz = 1) & zz = 0 ==> res1,res2,res3:=xx,0,zz [] not(zz = 0) & zz = 1 ==> res1,res2,res3:=xx,0,zz [] not(zz = 0) & not(zz = 1) ==> res1,res2,res3:=xx,0,zz) [] not(yy<5) ==> (not(zz = 1) & zz = 0 ==> res1,res2,res3:=xx,yy,zz [] not(zz = 0) & zz = 1 ==> res1,res2,res3:=xx,yy,zz [] not(zz = 0) & not(zz = 1) ==> res1,res2,res3:=xx,yy,zz)) [] not(xx = 0) & not(xx = 1) ==> (yy<5 ==> (not(zz = 1) & zz = 0 ==> res1,res2,res3:=xx,0,zz [] not(zz = 0) & zz = 1 ==> res1,res2,res3:=xx,0,zz [] not(zz = 0) & not(zz = 1) ==> res1,res2,res3:=xx,0,zz) [] not(yy<5) ==> (not(zz = 1) & zz = 0 ==> res1,res2,res3:=xx,yy,zz [] not(zz = 0) & zz = 1 ==> res1,res2,res3:=xx,yy,zz [] not(zz = 0) & not(zz = 1) ==> res1,res2,res3:=xx,yy,zz)));
  List_Substitution(Machine(triple_case_else_case),optriple_case_else_case)==(CASE xx OF EITHER 0 THEN IF yy<5 THEN CASE zz OF EITHER 0 THEN res1:=xx || res2:=0 || res3:=zz OR 1 THEN res1:=xx || res2:=0 || res3:=zz ELSE res1:=xx || res2:=0 || res3:=zz END END ELSE CASE zz OF EITHER 0 THEN res1:=xx || res2:=yy || res3:=zz OR 1 THEN res1:=xx || res2:=yy || res3:=zz ELSE res1:=xx || res2:=yy || res3:=zz END END END OR 1 THEN IF yy<5 THEN CASE zz OF EITHER 0 THEN res1:=xx || res2:=0 || res3:=zz OR 1 THEN res1:=xx || res2:=0 || res3:=zz ELSE res1:=xx || res2:=0 || res3:=zz END END ELSE CASE zz OF EITHER 0 THEN res1:=xx || res2:=yy || res3:=zz OR 1 THEN res1:=xx || res2:=yy || res3:=zz ELSE res1:=xx || res2:=yy || res3:=zz END END END ELSE IF yy<5 THEN CASE zz OF EITHER 0 THEN res1:=xx || res2:=0 || res3:=zz OR 1 THEN res1:=xx || res2:=0 || res3:=zz ELSE res1:=xx || res2:=0 || res3:=zz END END ELSE CASE zz OF EITHER 0 THEN res1:=xx || res2:=yy || res3:=zz OR 1 THEN res1:=xx || res2:=yy || res3:=zz ELSE res1:=xx || res2:=yy || res3:=zz END END END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(triple_case_else_case))==(?);
  Inherited_List_Constants(Machine(triple_case_else_case))==(?);
  List_Constants(Machine(triple_case_else_case))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(triple_case_else_case))==(?);
  Context_List_Defered(Machine(triple_case_else_case))==(?);
  Context_List_Sets(Machine(triple_case_else_case))==(?);
  List_Valuable_Sets(Machine(triple_case_else_case))==(?);
  Inherited_List_Enumerated(Machine(triple_case_else_case))==(?);
  Inherited_List_Defered(Machine(triple_case_else_case))==(?);
  Inherited_List_Sets(Machine(triple_case_else_case))==(?);
  List_Enumerated(Machine(triple_case_else_case))==(?);
  List_Defered(Machine(triple_case_else_case))==(?);
  List_Sets(Machine(triple_case_else_case))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(triple_case_else_case))==(?);
  Expanded_List_HiddenConstants(Machine(triple_case_else_case))==(?);
  List_HiddenConstants(Machine(triple_case_else_case))==(?);
  External_List_HiddenConstants(Machine(triple_case_else_case))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(triple_case_else_case))==(btrue);
  Context_List_Properties(Machine(triple_case_else_case))==(btrue);
  Inherited_List_Properties(Machine(triple_case_else_case))==(btrue);
  List_Properties(Machine(triple_case_else_case))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(triple_case_else_case),optriple_case_else_case)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(triple_case_else_case)) == (? | ? | ? | ? | optriple_case_else_case | ? | ? | ? | triple_case_else_case);
  List_Of_HiddenCst_Ids(Machine(triple_case_else_case)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(triple_case_else_case)) == (?);
  List_Of_VisibleVar_Ids(Machine(triple_case_else_case)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(triple_case_else_case)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(triple_case_else_case)) == (Type(optriple_case_else_case) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(triple_case_else_case)) == (Type(optriple_case_else_case) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
