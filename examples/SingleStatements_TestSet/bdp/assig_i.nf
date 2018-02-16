﻿Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(assig_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(assig_i))==(Machine(assig));
  Level(Implementation(assig_i))==(1);
  Upper_Level(Implementation(assig_i))==(Machine(assig))
END
&
THEORY LoadedStructureX IS
  Implementation(assig_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(assig_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(assig_i))==(?);
  Inherited_List_Includes(Implementation(assig_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(assig_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(assig_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(assig_i))==(?);
  Context_List_Variables(Implementation(assig_i))==(?);
  Abstract_List_Variables(Implementation(assig_i))==(?);
  Local_List_Variables(Implementation(assig_i))==(?);
  List_Variables(Implementation(assig_i))==(?);
  External_List_Variables(Implementation(assig_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(assig_i))==(?);
  Abstract_List_VisibleVariables(Implementation(assig_i))==(?);
  External_List_VisibleVariables(Implementation(assig_i))==(?);
  Expanded_List_VisibleVariables(Implementation(assig_i))==(?);
  List_VisibleVariables(Implementation(assig_i))==(?);
  Internal_List_VisibleVariables(Implementation(assig_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(assig_i))==(btrue);
  Expanded_List_Invariant(Implementation(assig_i))==(btrue);
  Abstract_List_Invariant(Implementation(assig_i))==(btrue);
  Context_List_Invariant(Implementation(assig_i))==(btrue);
  List_Invariant(Implementation(assig_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(assig_i))==(btrue);
  Abstract_List_Assertions(Implementation(assig_i))==(btrue);
  Context_List_Assertions(Implementation(assig_i))==(btrue);
  List_Assertions(Implementation(assig_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(assig_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(assig_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(assig_i))==(skip);
  Context_List_Initialisation(Implementation(assig_i))==(skip);
  List_Initialisation(Implementation(assig_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(assig_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(assig_i))==(btrue);
  List_Context_Constraints(Implementation(assig_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(assig_i))==(opassig);
  List_Operations(Implementation(assig_i))==(opassig)
END
&
THEORY ListInputX IS
  List_Input(Implementation(assig_i),opassig)==(xx)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(assig_i),opassig)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(assig_i),opassig)==(res <-- opassig(xx))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(assig_i),opassig)==(btrue);
  List_Precondition(Implementation(assig_i),opassig)==(xx: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(assig_i),opassig)==(xx: NAT & xx: INT | res:=xx);
  List_Substitution(Implementation(assig_i),opassig)==(res:=xx)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(assig_i))==(?);
  Inherited_List_Constants(Implementation(assig_i))==(?);
  List_Constants(Implementation(assig_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(assig_i))==(?);
  Context_List_Defered(Implementation(assig_i))==(?);
  Context_List_Sets(Implementation(assig_i))==(?);
  List_Own_Enumerated(Implementation(assig_i))==(?);
  List_Valuable_Sets(Implementation(assig_i))==(?);
  Inherited_List_Enumerated(Implementation(assig_i))==(?);
  Inherited_List_Defered(Implementation(assig_i))==(?);
  Inherited_List_Sets(Implementation(assig_i))==(?);
  List_Enumerated(Implementation(assig_i))==(?);
  List_Defered(Implementation(assig_i))==(?);
  List_Sets(Implementation(assig_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(assig_i))==(?);
  Expanded_List_HiddenConstants(Implementation(assig_i))==(?);
  List_HiddenConstants(Implementation(assig_i))==(?);
  External_List_HiddenConstants(Implementation(assig_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(assig_i))==(btrue);
  Context_List_Properties(Implementation(assig_i))==(btrue);
  Inherited_List_Properties(Implementation(assig_i))==(btrue);
  List_Properties(Implementation(assig_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(assig_i))==(aa: aa);
  List_Values(Implementation(assig_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(assig_i))==(Type(opassig) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(assig_i)) == (? | ? | ? | ? | opassig | ? | ? | ? | assig_i);
  List_Of_HiddenCst_Ids(Implementation(assig_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(assig_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(assig_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(assig_i)) == (?: ?)
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
  List_Local_Operations(Implementation(assig_i))==(?)
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
  TypingPredicate(Implementation(assig_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
