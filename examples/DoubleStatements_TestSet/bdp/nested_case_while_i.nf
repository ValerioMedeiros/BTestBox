﻿Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(nested_case_while_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(nested_case_while_i))==(Machine(nested_case_while));
  Level(Implementation(nested_case_while_i))==(1);
  Upper_Level(Implementation(nested_case_while_i))==(Machine(nested_case_while))
END
&
THEORY LoadedStructureX IS
  Implementation(nested_case_while_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(nested_case_while_i))==(?);
  Inherited_List_Includes(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(nested_case_while_i))==(?);
  Context_List_Variables(Implementation(nested_case_while_i))==(?);
  Abstract_List_Variables(Implementation(nested_case_while_i))==(?);
  Local_List_Variables(Implementation(nested_case_while_i))==(?);
  List_Variables(Implementation(nested_case_while_i))==(?);
  External_List_Variables(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(nested_case_while_i))==(?);
  Abstract_List_VisibleVariables(Implementation(nested_case_while_i))==(?);
  External_List_VisibleVariables(Implementation(nested_case_while_i))==(?);
  Expanded_List_VisibleVariables(Implementation(nested_case_while_i))==(?);
  List_VisibleVariables(Implementation(nested_case_while_i))==(?);
  Internal_List_VisibleVariables(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(nested_case_while_i))==(btrue);
  Expanded_List_Invariant(Implementation(nested_case_while_i))==(btrue);
  Abstract_List_Invariant(Implementation(nested_case_while_i))==(btrue);
  Context_List_Invariant(Implementation(nested_case_while_i))==(btrue);
  List_Invariant(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(nested_case_while_i))==(btrue);
  Abstract_List_Assertions(Implementation(nested_case_while_i))==(btrue);
  Context_List_Assertions(Implementation(nested_case_while_i))==(btrue);
  List_Assertions(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(nested_case_while_i))==(skip);
  Context_List_Initialisation(Implementation(nested_case_while_i))==(skip);
  List_Initialisation(Implementation(nested_case_while_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(nested_case_while_i))==(btrue);
  List_Context_Constraints(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(nested_case_while_i))==(opnested_case_while);
  List_Operations(Implementation(nested_case_while_i))==(opnested_case_while)
END
&
THEORY ListInputX IS
  List_Input(Implementation(nested_case_while_i),opnested_case_while)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(nested_case_while_i),opnested_case_while)==(res1,res2)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(nested_case_while_i),opnested_case_while)==(res1,res2 <-- opnested_case_while(xx,yy))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(nested_case_while_i),opnested_case_while)==(btrue);
  List_Precondition(Implementation(nested_case_while_i),opnested_case_while)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(nested_case_while_i),opnested_case_while)==(xx: NAT & yy: NAT | not(xx = 1) & xx = 0 ==> ((xx: INT | res1:=xx);@ii.(ii:=0;WHILE ii<yy DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=yy VARIANT yy-ii END;(ii: INT | res2:=ii))) [] not(xx = 0) & xx = 1 ==> ((xx: INT | res1:=xx);@ii.(ii:=0;WHILE ii<yy DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=yy VARIANT yy-ii END;(ii: INT | res2:=ii))) [] not(xx = 0) & not(xx = 1) ==> ((xx: INT | res1:=xx);@ii.(ii:=0;WHILE ii<yy DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT 0<=ii & ii<=yy VARIANT yy-ii END;(ii: INT | res2:=ii))));
  List_Substitution(Implementation(nested_case_while_i),opnested_case_while)==(CASE xx OF EITHER 0 THEN res1:=xx;VAR ii IN ii:=0;WHILE ii<yy DO ii:=ii+1 INVARIANT 0<=ii & ii<=yy VARIANT yy-ii END;res2:=ii END OR 1 THEN res1:=xx;VAR ii IN ii:=0;WHILE ii<yy DO ii:=ii+1 INVARIANT 0<=ii & ii<=yy VARIANT yy-ii END;res2:=ii END ELSE res1:=xx;VAR ii IN ii:=0;WHILE ii<yy DO ii:=ii+1 INVARIANT 0<=ii & ii<=yy VARIANT yy-ii END;res2:=ii END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(nested_case_while_i))==(?);
  Inherited_List_Constants(Implementation(nested_case_while_i))==(?);
  List_Constants(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(nested_case_while_i))==(?);
  Context_List_Defered(Implementation(nested_case_while_i))==(?);
  Context_List_Sets(Implementation(nested_case_while_i))==(?);
  List_Own_Enumerated(Implementation(nested_case_while_i))==(?);
  List_Valuable_Sets(Implementation(nested_case_while_i))==(?);
  Inherited_List_Enumerated(Implementation(nested_case_while_i))==(?);
  Inherited_List_Defered(Implementation(nested_case_while_i))==(?);
  Inherited_List_Sets(Implementation(nested_case_while_i))==(?);
  List_Enumerated(Implementation(nested_case_while_i))==(?);
  List_Defered(Implementation(nested_case_while_i))==(?);
  List_Sets(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(nested_case_while_i))==(?);
  Expanded_List_HiddenConstants(Implementation(nested_case_while_i))==(?);
  List_HiddenConstants(Implementation(nested_case_while_i))==(?);
  External_List_HiddenConstants(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(nested_case_while_i))==(btrue);
  Context_List_Properties(Implementation(nested_case_while_i))==(btrue);
  Inherited_List_Properties(Implementation(nested_case_while_i))==(btrue);
  List_Properties(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(nested_case_while_i))==(aa: aa);
  List_Values(Implementation(nested_case_while_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(nested_case_while_i))==(Type(opnested_case_while) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(nested_case_while_i)) == (? | ? | ? | ? | opnested_case_while | ? | ? | ? | nested_case_while_i);
  List_Of_HiddenCst_Ids(Implementation(nested_case_while_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(nested_case_while_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(nested_case_while_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(nested_case_while_i)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(nested_case_while_i),opnested_case_while, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(nested_case_while_i),opnested_case_while, 2) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(nested_case_while_i),opnested_case_while, 3) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(nested_case_while_i))==(?)
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
  TypingPredicate(Implementation(nested_case_while_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
