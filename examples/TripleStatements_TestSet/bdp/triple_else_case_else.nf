Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(triple_else_case_else))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(triple_else_case_else))==(Machine(triple_else_case_else));
  Level(Machine(triple_else_case_else))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(triple_else_case_else)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(triple_else_case_else))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(triple_else_case_else))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(triple_else_case_else))==(?);
  List_Includes(Machine(triple_else_case_else))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(triple_else_case_else))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(triple_else_case_else))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(triple_else_case_else))==(?);
  Context_List_Variables(Machine(triple_else_case_else))==(?);
  Abstract_List_Variables(Machine(triple_else_case_else))==(?);
  Local_List_Variables(Machine(triple_else_case_else))==(?);
  List_Variables(Machine(triple_else_case_else))==(?);
  External_List_Variables(Machine(triple_else_case_else))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(triple_else_case_else))==(?);
  Abstract_List_VisibleVariables(Machine(triple_else_case_else))==(?);
  External_List_VisibleVariables(Machine(triple_else_case_else))==(?);
  Expanded_List_VisibleVariables(Machine(triple_else_case_else))==(?);
  List_VisibleVariables(Machine(triple_else_case_else))==(?);
  Internal_List_VisibleVariables(Machine(triple_else_case_else))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(triple_else_case_else))==(btrue);
  Gluing_List_Invariant(Machine(triple_else_case_else))==(btrue);
  Expanded_List_Invariant(Machine(triple_else_case_else))==(btrue);
  Abstract_List_Invariant(Machine(triple_else_case_else))==(btrue);
  Context_List_Invariant(Machine(triple_else_case_else))==(btrue);
  List_Invariant(Machine(triple_else_case_else))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(triple_else_case_else))==(btrue);
  Abstract_List_Assertions(Machine(triple_else_case_else))==(btrue);
  Context_List_Assertions(Machine(triple_else_case_else))==(btrue);
  List_Assertions(Machine(triple_else_case_else))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(triple_else_case_else))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(triple_else_case_else))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(triple_else_case_else))==(skip);
  Context_List_Initialisation(Machine(triple_else_case_else))==(skip);
  List_Initialisation(Machine(triple_else_case_else))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(triple_else_case_else))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(triple_else_case_else))==(btrue);
  List_Constraints(Machine(triple_else_case_else))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(triple_else_case_else))==(optriple_else_case_else);
  List_Operations(Machine(triple_else_case_else))==(optriple_else_case_else)
END
&
THEORY ListInputX IS
  List_Input(Machine(triple_else_case_else),optriple_else_case_else)==(xx,yy,zz)
END
&
THEORY ListOutputX IS
  List_Output(Machine(triple_else_case_else),optriple_else_case_else)==(res1,res2,res3)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(triple_else_case_else),optriple_else_case_else)==(res1,res2,res3 <-- optriple_else_case_else(xx,yy,zz))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(triple_else_case_else),optriple_else_case_else)==(xx: NAT & yy: NAT & zz: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(triple_else_case_else),optriple_else_case_else)==(xx: NAT & yy: NAT & zz: NAT | xx<5 ==> (not(yy = 1) & yy = 0 ==> (zz<5 ==> res1,res2,res3:=0,yy,0 [] not(zz<5) ==> res1,res2,res3:=0,yy,zz) [] not(yy = 0) & yy = 1 ==> (zz<5 ==> res1,res2,res3:=0,yy,0 [] not(zz<5) ==> res1,res2,res3:=0,yy,zz) [] not(yy = 0) & not(yy = 1) ==> (zz<5 ==> res1,res2,res3:=0,yy,0 [] not(zz<5) ==> res1,res2,res3:=0,yy,zz)) [] not(xx<5) ==> (not(yy = 1) & yy = 0 ==> (zz<5 ==> res1,res2,res3:=xx,yy,0 [] not(zz<5) ==> res1,res2,res3:=xx,yy,zz) [] not(yy = 0) & yy = 1 ==> (zz<5 ==> res1,res2,res3:=xx,yy,0 [] not(zz<5) ==> res1,res2,res3:=xx,yy,zz) [] not(yy = 0) & not(yy = 1) ==> (zz<5 ==> res1,res2,res3:=xx,yy,0 [] not(zz<5) ==> res1,res2,res3:=xx,yy,zz)));
  List_Substitution(Machine(triple_else_case_else),optriple_else_case_else)==(IF xx<5 THEN CASE yy OF EITHER 0 THEN IF zz<5 THEN res1:=0 || res2:=yy || res3:=0 ELSE res1:=0 || res2:=yy || res3:=zz END OR 1 THEN IF zz<5 THEN res1:=0 || res2:=yy || res3:=0 ELSE res1:=0 || res2:=yy || res3:=zz END ELSE IF zz<5 THEN res1:=0 || res2:=yy || res3:=0 ELSE res1:=0 || res2:=yy || res3:=zz END END END ELSE CASE yy OF EITHER 0 THEN IF zz<5 THEN res1:=xx || res2:=yy || res3:=0 ELSE res1:=xx || res2:=yy || res3:=zz END OR 1 THEN IF zz<5 THEN res1:=xx || res2:=yy || res3:=0 ELSE res1:=xx || res2:=yy || res3:=zz END ELSE IF zz<5 THEN res1:=xx || res2:=yy || res3:=0 ELSE res1:=xx || res2:=yy || res3:=zz END END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(triple_else_case_else))==(?);
  Inherited_List_Constants(Machine(triple_else_case_else))==(?);
  List_Constants(Machine(triple_else_case_else))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(triple_else_case_else))==(?);
  Context_List_Defered(Machine(triple_else_case_else))==(?);
  Context_List_Sets(Machine(triple_else_case_else))==(?);
  List_Valuable_Sets(Machine(triple_else_case_else))==(?);
  Inherited_List_Enumerated(Machine(triple_else_case_else))==(?);
  Inherited_List_Defered(Machine(triple_else_case_else))==(?);
  Inherited_List_Sets(Machine(triple_else_case_else))==(?);
  List_Enumerated(Machine(triple_else_case_else))==(?);
  List_Defered(Machine(triple_else_case_else))==(?);
  List_Sets(Machine(triple_else_case_else))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(triple_else_case_else))==(?);
  Expanded_List_HiddenConstants(Machine(triple_else_case_else))==(?);
  List_HiddenConstants(Machine(triple_else_case_else))==(?);
  External_List_HiddenConstants(Machine(triple_else_case_else))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(triple_else_case_else))==(btrue);
  Context_List_Properties(Machine(triple_else_case_else))==(btrue);
  Inherited_List_Properties(Machine(triple_else_case_else))==(btrue);
  List_Properties(Machine(triple_else_case_else))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(triple_else_case_else),optriple_else_case_else)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(triple_else_case_else)) == (? | ? | ? | ? | optriple_else_case_else | ? | ? | ? | triple_else_case_else);
  List_Of_HiddenCst_Ids(Machine(triple_else_case_else)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(triple_else_case_else)) == (?);
  List_Of_VisibleVar_Ids(Machine(triple_else_case_else)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(triple_else_case_else)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(triple_else_case_else)) == (Type(optriple_else_case_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(triple_else_case_else)) == (Type(optriple_else_case_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
