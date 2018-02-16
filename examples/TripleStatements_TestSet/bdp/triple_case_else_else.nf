﻿Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(triple_case_else_else))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(triple_case_else_else))==(Machine(triple_case_else_else));
  Level(Machine(triple_case_else_else))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(triple_case_else_else)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(triple_case_else_else))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(triple_case_else_else))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(triple_case_else_else))==(?);
  List_Includes(Machine(triple_case_else_else))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(triple_case_else_else))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(triple_case_else_else))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(triple_case_else_else))==(?);
  Context_List_Variables(Machine(triple_case_else_else))==(?);
  Abstract_List_Variables(Machine(triple_case_else_else))==(?);
  Local_List_Variables(Machine(triple_case_else_else))==(?);
  List_Variables(Machine(triple_case_else_else))==(?);
  External_List_Variables(Machine(triple_case_else_else))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(triple_case_else_else))==(?);
  Abstract_List_VisibleVariables(Machine(triple_case_else_else))==(?);
  External_List_VisibleVariables(Machine(triple_case_else_else))==(?);
  Expanded_List_VisibleVariables(Machine(triple_case_else_else))==(?);
  List_VisibleVariables(Machine(triple_case_else_else))==(?);
  Internal_List_VisibleVariables(Machine(triple_case_else_else))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(triple_case_else_else))==(btrue);
  Gluing_List_Invariant(Machine(triple_case_else_else))==(btrue);
  Expanded_List_Invariant(Machine(triple_case_else_else))==(btrue);
  Abstract_List_Invariant(Machine(triple_case_else_else))==(btrue);
  Context_List_Invariant(Machine(triple_case_else_else))==(btrue);
  List_Invariant(Machine(triple_case_else_else))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(triple_case_else_else))==(btrue);
  Abstract_List_Assertions(Machine(triple_case_else_else))==(btrue);
  Context_List_Assertions(Machine(triple_case_else_else))==(btrue);
  List_Assertions(Machine(triple_case_else_else))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(triple_case_else_else))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(triple_case_else_else))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(triple_case_else_else))==(skip);
  Context_List_Initialisation(Machine(triple_case_else_else))==(skip);
  List_Initialisation(Machine(triple_case_else_else))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(triple_case_else_else))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(triple_case_else_else))==(btrue);
  List_Constraints(Machine(triple_case_else_else))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(triple_case_else_else))==(optriple_case_else_else);
  List_Operations(Machine(triple_case_else_else))==(optriple_case_else_else)
END
&
THEORY ListInputX IS
  List_Input(Machine(triple_case_else_else),optriple_case_else_else)==(xx,yy,zz)
END
&
THEORY ListOutputX IS
  List_Output(Machine(triple_case_else_else),optriple_case_else_else)==(res1,res2,res3)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(triple_case_else_else),optriple_case_else_else)==(res1,res2,res3 <-- optriple_case_else_else(xx,yy,zz))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(triple_case_else_else),optriple_case_else_else)==(xx: NAT & yy: NAT & zz: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(triple_case_else_else),optriple_case_else_else)==(xx: NAT & yy: NAT & zz: NAT | not(xx = 1) & xx = 0 ==> (yy<5 ==> (zz<5 ==> res1,res2,res3:=xx,0,0 [] not(zz<5) ==> res1,res2,res3:=xx,0,zz) [] not(yy<5) ==> (zz<5 ==> res1,res2,res3:=xx,yy,0 [] not(zz<5) ==> res1,res2,res3:=xx,yy,zz)) [] not(xx = 0) & xx = 1 ==> (yy<5 ==> (zz<5 ==> res1,res2,res3:=xx,0,0 [] not(zz<5) ==> res1,res2,res3:=xx,0,zz) [] not(yy<5) ==> (zz<5 ==> res1,res2,res3:=xx,yy,0 [] not(zz<5) ==> res1,res2,res3:=xx,yy,zz)) [] not(xx = 0) & not(xx = 1) ==> (yy<5 ==> (zz<5 ==> res1,res2,res3:=xx,0,0 [] not(zz<5) ==> res1,res2,res3:=xx,0,zz) [] not(yy<5) ==> (zz<5 ==> res1,res2,res3:=xx,yy,0 [] not(zz<5) ==> res1,res2,res3:=xx,yy,zz)));
  List_Substitution(Machine(triple_case_else_else),optriple_case_else_else)==(CASE xx OF EITHER 0 THEN IF yy<5 THEN IF zz<5 THEN res1:=xx || res2:=0 || res3:=0 ELSE res1:=xx || res2:=0 || res3:=zz END ELSE IF zz<5 THEN res1:=xx || res2:=yy || res3:=0 ELSE res1:=xx || res2:=yy || res3:=zz END END OR 1 THEN IF yy<5 THEN IF zz<5 THEN res1:=xx || res2:=0 || res3:=0 ELSE res1:=xx || res2:=0 || res3:=zz END ELSE IF zz<5 THEN res1:=xx || res2:=yy || res3:=0 ELSE res1:=xx || res2:=yy || res3:=zz END END ELSE IF yy<5 THEN IF zz<5 THEN res1:=xx || res2:=0 || res3:=0 ELSE res1:=xx || res2:=0 || res3:=zz END ELSE IF zz<5 THEN res1:=xx || res2:=yy || res3:=0 ELSE res1:=xx || res2:=yy || res3:=zz END END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(triple_case_else_else))==(?);
  Inherited_List_Constants(Machine(triple_case_else_else))==(?);
  List_Constants(Machine(triple_case_else_else))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(triple_case_else_else))==(?);
  Context_List_Defered(Machine(triple_case_else_else))==(?);
  Context_List_Sets(Machine(triple_case_else_else))==(?);
  List_Valuable_Sets(Machine(triple_case_else_else))==(?);
  Inherited_List_Enumerated(Machine(triple_case_else_else))==(?);
  Inherited_List_Defered(Machine(triple_case_else_else))==(?);
  Inherited_List_Sets(Machine(triple_case_else_else))==(?);
  List_Enumerated(Machine(triple_case_else_else))==(?);
  List_Defered(Machine(triple_case_else_else))==(?);
  List_Sets(Machine(triple_case_else_else))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(triple_case_else_else))==(?);
  Expanded_List_HiddenConstants(Machine(triple_case_else_else))==(?);
  List_HiddenConstants(Machine(triple_case_else_else))==(?);
  External_List_HiddenConstants(Machine(triple_case_else_else))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(triple_case_else_else))==(btrue);
  Context_List_Properties(Machine(triple_case_else_else))==(btrue);
  Inherited_List_Properties(Machine(triple_case_else_else))==(btrue);
  List_Properties(Machine(triple_case_else_else))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(triple_case_else_else),optriple_case_else_else)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(triple_case_else_else)) == (? | ? | ? | ? | optriple_case_else_else | ? | ? | ? | triple_case_else_else);
  List_Of_HiddenCst_Ids(Machine(triple_case_else_else)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(triple_case_else_else)) == (?);
  List_Of_VisibleVar_Ids(Machine(triple_case_else_else)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(triple_case_else_else)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(triple_case_else_else)) == (Type(optriple_case_else_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(triple_case_else_else)) == (Type(optriple_case_else_else) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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