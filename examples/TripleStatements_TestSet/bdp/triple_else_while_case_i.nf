Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(triple_else_while_case_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(triple_else_while_case_i))==(Machine(triple_else_while_case));
  Level(Implementation(triple_else_while_case_i))==(1);
  Upper_Level(Implementation(triple_else_while_case_i))==(Machine(triple_else_while_case))
END
&
THEORY LoadedStructureX IS
  Implementation(triple_else_while_case_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(triple_else_while_case_i))==(?);
  Inherited_List_Includes(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(triple_else_while_case_i))==(?);
  Context_List_Variables(Implementation(triple_else_while_case_i))==(?);
  Abstract_List_Variables(Implementation(triple_else_while_case_i))==(?);
  Local_List_Variables(Implementation(triple_else_while_case_i))==(?);
  List_Variables(Implementation(triple_else_while_case_i))==(?);
  External_List_Variables(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(triple_else_while_case_i))==(?);
  Abstract_List_VisibleVariables(Implementation(triple_else_while_case_i))==(?);
  External_List_VisibleVariables(Implementation(triple_else_while_case_i))==(?);
  Expanded_List_VisibleVariables(Implementation(triple_else_while_case_i))==(?);
  List_VisibleVariables(Implementation(triple_else_while_case_i))==(?);
  Internal_List_VisibleVariables(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(triple_else_while_case_i))==(btrue);
  Expanded_List_Invariant(Implementation(triple_else_while_case_i))==(btrue);
  Abstract_List_Invariant(Implementation(triple_else_while_case_i))==(btrue);
  Context_List_Invariant(Implementation(triple_else_while_case_i))==(btrue);
  List_Invariant(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(triple_else_while_case_i))==(btrue);
  Abstract_List_Assertions(Implementation(triple_else_while_case_i))==(btrue);
  Context_List_Assertions(Implementation(triple_else_while_case_i))==(btrue);
  List_Assertions(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(triple_else_while_case_i))==(skip);
  Context_List_Initialisation(Implementation(triple_else_while_case_i))==(skip);
  List_Initialisation(Implementation(triple_else_while_case_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(triple_else_while_case_i))==(btrue);
  List_Context_Constraints(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(triple_else_while_case_i))==(optriple_else_while_case);
  List_Operations(Implementation(triple_else_while_case_i))==(optriple_else_while_case)
END
&
THEORY ListInputX IS
  List_Input(Implementation(triple_else_while_case_i),optriple_else_while_case)==(xx,yy,zz)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(triple_else_while_case_i),optriple_else_while_case)==(res1,res2,res3)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(triple_else_while_case_i),optriple_else_while_case)==(res1,res2,res3 <-- optriple_else_while_case(xx,yy,zz))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(triple_else_while_case_i),optriple_else_while_case)==(btrue);
  List_Precondition(Implementation(triple_else_while_case_i),optriple_else_while_case)==(xx: NAT & yy: NAT & zz: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(triple_else_while_case_i),optriple_else_while_case)==(xx: NAT & yy: NAT & zz: NAT | @ii.(ii:=0;(ii: INT | res2:=ii);(zz: INT | res3:=zz);(xx<5 ==> ((0: INT | res1:=0);WHILE ii<yy DO not(zz = 1) & zz = 0 ==> ((ii+1: INT & ii: INT & 1: INT | res2:=ii+1);(zz: INT | res3:=zz)) [] not(zz = 0) & zz = 1 ==> ((ii+1: INT & ii: INT & 1: INT | res2:=ii+1);(zz: INT | res3:=zz)) [] not(zz = 0) & not(zz = 1) ==> ((ii+1: INT & ii: INT & 1: INT | res2:=ii+1);(zz: INT | res3:=zz));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=yy & res2 = ii & res3 = zz VARIANT yy-ii END) [] not(xx<5) ==> ((xx: INT | res1:=xx);WHILE ii<yy DO not(zz = 1) & zz = 0 ==> ((ii+1: INT & ii: INT & 1: INT | res2:=ii+1);(zz: INT | res3:=zz)) [] not(zz = 0) & zz = 1 ==> ((ii+1: INT & ii: INT & 1: INT | res2:=ii+1);(zz: INT | res3:=zz)) [] not(zz = 0) & not(zz = 1) ==> ((ii+1: INT & ii: INT & 1: INT | res2:=ii+1);(zz: INT | res3:=zz));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT 0<=ii & ii<=yy & res2 = ii & res3 = zz VARIANT yy-ii END))));
  List_Substitution(Implementation(triple_else_while_case_i),optriple_else_while_case)==(VAR ii IN ii:=0;res2:=ii;res3:=zz;IF xx<5 THEN res1:=0;WHILE ii<yy DO CASE zz OF EITHER 0 THEN res2:=ii+1;res3:=zz OR 1 THEN res2:=ii+1;res3:=zz ELSE res2:=ii+1;res3:=zz END END;ii:=ii+1 INVARIANT 0<=ii & ii<=yy & res2 = ii & res3 = zz VARIANT yy-ii END ELSE res1:=xx;WHILE ii<yy DO CASE zz OF EITHER 0 THEN res2:=ii+1;res3:=zz OR 1 THEN res2:=ii+1;res3:=zz ELSE res2:=ii+1;res3:=zz END END;ii:=ii+1 INVARIANT 0<=ii & ii<=yy & res2 = ii & res3 = zz VARIANT yy-ii END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(triple_else_while_case_i))==(?);
  Inherited_List_Constants(Implementation(triple_else_while_case_i))==(?);
  List_Constants(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(triple_else_while_case_i))==(?);
  Context_List_Defered(Implementation(triple_else_while_case_i))==(?);
  Context_List_Sets(Implementation(triple_else_while_case_i))==(?);
  List_Own_Enumerated(Implementation(triple_else_while_case_i))==(?);
  List_Valuable_Sets(Implementation(triple_else_while_case_i))==(?);
  Inherited_List_Enumerated(Implementation(triple_else_while_case_i))==(?);
  Inherited_List_Defered(Implementation(triple_else_while_case_i))==(?);
  Inherited_List_Sets(Implementation(triple_else_while_case_i))==(?);
  List_Enumerated(Implementation(triple_else_while_case_i))==(?);
  List_Defered(Implementation(triple_else_while_case_i))==(?);
  List_Sets(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(triple_else_while_case_i))==(?);
  Expanded_List_HiddenConstants(Implementation(triple_else_while_case_i))==(?);
  List_HiddenConstants(Implementation(triple_else_while_case_i))==(?);
  External_List_HiddenConstants(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(triple_else_while_case_i))==(btrue);
  Context_List_Properties(Implementation(triple_else_while_case_i))==(btrue);
  Inherited_List_Properties(Implementation(triple_else_while_case_i))==(btrue);
  List_Properties(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(triple_else_while_case_i))==(aa: aa);
  List_Values(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(triple_else_while_case_i))==(Type(optriple_else_while_case) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(triple_else_while_case_i)) == (? | ? | ? | ? | optriple_else_while_case | ? | ? | ? | triple_else_while_case_i);
  List_Of_HiddenCst_Ids(Implementation(triple_else_while_case_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(triple_else_while_case_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(triple_else_while_case_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(triple_else_while_case_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(triple_else_while_case_i),optriple_else_while_case, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(triple_else_while_case_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(triple_else_while_case_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
