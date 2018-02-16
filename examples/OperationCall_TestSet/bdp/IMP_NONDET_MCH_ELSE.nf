﻿Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(IMP_NONDET_MCH_ELSE))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(IMP_NONDET_MCH_ELSE))==(Machine(NONDET_MCH_ELSE));
  Level(Implementation(IMP_NONDET_MCH_ELSE))==(1);
  Upper_Level(Implementation(IMP_NONDET_MCH_ELSE))==(Machine(NONDET_MCH_ELSE))
END
&
THEORY LoadedStructureX IS
  Implementation(IMP_NONDET_MCH_ELSE)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Inherited_List_Includes(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Context_List_Variables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Abstract_List_Variables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Local_List_Variables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Variables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  External_List_Variables(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Abstract_List_VisibleVariables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  External_List_VisibleVariables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Expanded_List_VisibleVariables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_VisibleVariables(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Internal_List_VisibleVariables(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Expanded_List_Invariant(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Abstract_List_Invariant(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Context_List_Invariant(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  List_Invariant(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Abstract_List_Assertions(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Context_List_Assertions(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  List_Assertions(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(IMP_NONDET_MCH_ELSE))==(skip);
  Context_List_Initialisation(Implementation(IMP_NONDET_MCH_ELSE))==(skip);
  List_Initialisation(Implementation(IMP_NONDET_MCH_ELSE))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  List_Context_Constraints(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(IMP_NONDET_MCH_ELSE))==(opNONDET_MCH_ELSE);
  List_Operations(Implementation(IMP_NONDET_MCH_ELSE))==(opNONDET_MCH_ELSE)
END
&
THEORY ListInputX IS
  List_Input(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(xx,yy)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(res <-- opNONDET_MCH_ELSE(xx,yy))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(btrue);
  List_Precondition(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(xx: NAT & yy: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(xx: NAT & yy: NAT | xx>yy ==> (xx: INT | res:=xx) [] not(xx>yy) ==> (yy: INT | res:=yy));
  List_Substitution(Implementation(IMP_NONDET_MCH_ELSE),opNONDET_MCH_ELSE)==(IF xx>yy THEN res:=xx ELSE res:=yy END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Inherited_List_Constants(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Constants(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Context_List_Defered(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Context_List_Sets(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Own_Enumerated(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Valuable_Sets(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Inherited_List_Enumerated(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Inherited_List_Defered(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Inherited_List_Sets(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Enumerated(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Defered(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_Sets(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  Expanded_List_HiddenConstants(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  List_HiddenConstants(Implementation(IMP_NONDET_MCH_ELSE))==(?);
  External_List_HiddenConstants(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Context_List_Properties(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  Inherited_List_Properties(Implementation(IMP_NONDET_MCH_ELSE))==(btrue);
  List_Properties(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(IMP_NONDET_MCH_ELSE))==(aa: aa);
  List_Values(Implementation(IMP_NONDET_MCH_ELSE))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(IMP_NONDET_MCH_ELSE))==(Type(opNONDET_MCH_ELSE) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(IMP_NONDET_MCH_ELSE)) == (? | ? | ? | ? | opNONDET_MCH_ELSE | ? | ? | ? | IMP_NONDET_MCH_ELSE);
  List_Of_HiddenCst_Ids(Implementation(IMP_NONDET_MCH_ELSE)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(IMP_NONDET_MCH_ELSE)) == (?);
  List_Of_VisibleVar_Ids(Implementation(IMP_NONDET_MCH_ELSE)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(IMP_NONDET_MCH_ELSE)) == (?: ?)
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
  List_Local_Operations(Implementation(IMP_NONDET_MCH_ELSE))==(?)
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
  TypingPredicate(Implementation(IMP_NONDET_MCH_ELSE))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
