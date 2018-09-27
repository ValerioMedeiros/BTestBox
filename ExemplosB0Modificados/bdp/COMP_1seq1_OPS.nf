Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(COMP_1seq1_OPS))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(COMP_1seq1_OPS))==(Machine(COMP_1seq1_OPS));
  Level(Machine(COMP_1seq1_OPS))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(COMP_1seq1_OPS)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(COMP_1seq1_OPS))==(?);
  List_Includes(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(COMP_1seq1_OPS))==(?);
  Context_List_Variables(Machine(COMP_1seq1_OPS))==(?);
  Abstract_List_Variables(Machine(COMP_1seq1_OPS))==(?);
  Local_List_Variables(Machine(COMP_1seq1_OPS))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  List_Variables(Machine(COMP_1seq1_OPS))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  External_List_Variables(Machine(COMP_1seq1_OPS))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(COMP_1seq1_OPS))==(?);
  Abstract_List_VisibleVariables(Machine(COMP_1seq1_OPS))==(?);
  External_List_VisibleVariables(Machine(COMP_1seq1_OPS))==(?);
  Expanded_List_VisibleVariables(Machine(COMP_1seq1_OPS))==(?);
  List_VisibleVariables(Machine(COMP_1seq1_OPS))==(?);
  Internal_List_VisibleVariables(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(COMP_1seq1_OPS))==(btrue);
  Gluing_List_Invariant(Machine(COMP_1seq1_OPS))==(btrue);
  Expanded_List_Invariant(Machine(COMP_1seq1_OPS))==(btrue);
  Abstract_List_Invariant(Machine(COMP_1seq1_OPS))==(btrue);
  Context_List_Invariant(Machine(COMP_1seq1_OPS))==(btrue);
  List_Invariant(Machine(COMP_1seq1_OPS))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(COMP_1seq1_OPS))==(btrue);
  Abstract_List_Assertions(Machine(COMP_1seq1_OPS))==(btrue);
  Context_List_Assertions(Machine(COMP_1seq1_OPS))==(btrue);
  List_Assertions(Machine(COMP_1seq1_OPS))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(COMP_1seq1_OPS))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(COMP_1seq1_OPS))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(COMP_1seq1_OPS))==(counter,max_counter,cond1,check_boolexp,check_BLOCK,check_BECOME,check_IF,check_CASE,check_SEQUENCE,check_WHILE,check_OPER_CALL:=1,1024,TRUE,TRUE,0,0,0,0,0,0,0);
  Context_List_Initialisation(Machine(COMP_1seq1_OPS))==(skip);
  List_Initialisation(Machine(COMP_1seq1_OPS))==(counter:=1 || max_counter:=1024 || cond1:=TRUE || check_boolexp:=TRUE || check_BLOCK:=0 || check_BECOME:=0 || check_IF:=0 || check_CASE:=0 || check_SEQUENCE:=0 || check_WHILE:=0 || check_OPER_CALL:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(COMP_1seq1_OPS))==(btrue);
  List_Constraints(Machine(COMP_1seq1_OPS))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(COMP_1seq1_OPS))==(ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039);
  List_Operations(Machine(COMP_1seq1_OPS))==(ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039)
END
&
THEORY ListInputX IS
  List_Input(Machine(COMP_1seq1_OPS),ID00000)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00001)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00002)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00003)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00004)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00005)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00006)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00007)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00008)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00009)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00010)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00011)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00012)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00013)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00014)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00015)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00016)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00017)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00018)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00019)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00020)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00021)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00022)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00023)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00024)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00025)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00026)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00027)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00028)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00029)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00030)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00031)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00032)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00033)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00034)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00035)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00036)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00037)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00038)==(?);
  List_Input(Machine(COMP_1seq1_OPS),ID00039)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(COMP_1seq1_OPS),ID00000)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00001)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00002)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00003)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00004)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00005)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00006)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00007)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00008)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00009)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00010)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00011)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00012)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00013)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00014)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00015)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00016)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00017)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00018)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00019)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00020)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00021)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00022)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00023)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00024)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00025)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00026)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00027)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00028)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00029)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00030)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00031)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00032)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00033)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00034)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00035)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00036)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00037)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00038)==(?);
  List_Output(Machine(COMP_1seq1_OPS),ID00039)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(COMP_1seq1_OPS),ID00000)==(ID00000);
  List_Header(Machine(COMP_1seq1_OPS),ID00001)==(ID00001);
  List_Header(Machine(COMP_1seq1_OPS),ID00002)==(ID00002);
  List_Header(Machine(COMP_1seq1_OPS),ID00003)==(ID00003);
  List_Header(Machine(COMP_1seq1_OPS),ID00004)==(ID00004);
  List_Header(Machine(COMP_1seq1_OPS),ID00005)==(ID00005);
  List_Header(Machine(COMP_1seq1_OPS),ID00006)==(ID00006);
  List_Header(Machine(COMP_1seq1_OPS),ID00007)==(ID00007);
  List_Header(Machine(COMP_1seq1_OPS),ID00008)==(ID00008);
  List_Header(Machine(COMP_1seq1_OPS),ID00009)==(ID00009);
  List_Header(Machine(COMP_1seq1_OPS),ID00010)==(ID00010);
  List_Header(Machine(COMP_1seq1_OPS),ID00011)==(ID00011);
  List_Header(Machine(COMP_1seq1_OPS),ID00012)==(ID00012);
  List_Header(Machine(COMP_1seq1_OPS),ID00013)==(ID00013);
  List_Header(Machine(COMP_1seq1_OPS),ID00014)==(ID00014);
  List_Header(Machine(COMP_1seq1_OPS),ID00015)==(ID00015);
  List_Header(Machine(COMP_1seq1_OPS),ID00016)==(ID00016);
  List_Header(Machine(COMP_1seq1_OPS),ID00017)==(ID00017);
  List_Header(Machine(COMP_1seq1_OPS),ID00018)==(ID00018);
  List_Header(Machine(COMP_1seq1_OPS),ID00019)==(ID00019);
  List_Header(Machine(COMP_1seq1_OPS),ID00020)==(ID00020);
  List_Header(Machine(COMP_1seq1_OPS),ID00021)==(ID00021);
  List_Header(Machine(COMP_1seq1_OPS),ID00022)==(ID00022);
  List_Header(Machine(COMP_1seq1_OPS),ID00023)==(ID00023);
  List_Header(Machine(COMP_1seq1_OPS),ID00024)==(ID00024);
  List_Header(Machine(COMP_1seq1_OPS),ID00025)==(ID00025);
  List_Header(Machine(COMP_1seq1_OPS),ID00026)==(ID00026);
  List_Header(Machine(COMP_1seq1_OPS),ID00027)==(ID00027);
  List_Header(Machine(COMP_1seq1_OPS),ID00028)==(ID00028);
  List_Header(Machine(COMP_1seq1_OPS),ID00029)==(ID00029);
  List_Header(Machine(COMP_1seq1_OPS),ID00030)==(ID00030);
  List_Header(Machine(COMP_1seq1_OPS),ID00031)==(ID00031);
  List_Header(Machine(COMP_1seq1_OPS),ID00032)==(ID00032);
  List_Header(Machine(COMP_1seq1_OPS),ID00033)==(ID00033);
  List_Header(Machine(COMP_1seq1_OPS),ID00034)==(ID00034);
  List_Header(Machine(COMP_1seq1_OPS),ID00035)==(ID00035);
  List_Header(Machine(COMP_1seq1_OPS),ID00036)==(ID00036);
  List_Header(Machine(COMP_1seq1_OPS),ID00037)==(ID00037);
  List_Header(Machine(COMP_1seq1_OPS),ID00038)==(ID00038);
  List_Header(Machine(COMP_1seq1_OPS),ID00039)==(ID00039)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(COMP_1seq1_OPS),ID00000)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00001)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00002)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00003)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00004)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00005)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00006)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00007)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00008)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00009)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00010)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00011)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00012)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00013)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00014)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00015)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00016)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00017)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00018)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00019)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00020)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00021)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00022)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00023)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00024)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00025)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00026)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00027)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00028)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00029)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00030)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00031)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00032)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00033)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00034)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00035)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00036)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00037)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00038)==(btrue);
  List_Precondition(Machine(COMP_1seq1_OPS),ID00039)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00039)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00038)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00037)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00036)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00035)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00034)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00033)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00032)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00031)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00030)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00029)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00028)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00027)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00026)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00025)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00024)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00023)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00022)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00021)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00020)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00019)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00018)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00017)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00016)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00015)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00014)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00013)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00012)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00011)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00010)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00009)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00008)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00007)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00006)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00005)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00004)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00003)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00002)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00001)==(btrue | skip);
  Expanded_List_Substitution(Machine(COMP_1seq1_OPS),ID00000)==(btrue | skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00000)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00001)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00002)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00003)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00004)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00005)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00006)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00007)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00008)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00009)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00010)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00011)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00012)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00013)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00014)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00015)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00016)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00017)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00018)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00019)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00020)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00021)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00022)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00023)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00024)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00025)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00026)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00027)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00028)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00029)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00030)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00031)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00032)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00033)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00034)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00035)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00036)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00037)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00038)==(skip);
  List_Substitution(Machine(COMP_1seq1_OPS),ID00039)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(COMP_1seq1_OPS))==(?);
  Inherited_List_Constants(Machine(COMP_1seq1_OPS))==(?);
  List_Constants(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(COMP_1seq1_OPS))==(?);
  Context_List_Defered(Machine(COMP_1seq1_OPS))==(?);
  Context_List_Sets(Machine(COMP_1seq1_OPS))==(?);
  List_Valuable_Sets(Machine(COMP_1seq1_OPS))==(?);
  Inherited_List_Enumerated(Machine(COMP_1seq1_OPS))==(?);
  Inherited_List_Defered(Machine(COMP_1seq1_OPS))==(?);
  Inherited_List_Sets(Machine(COMP_1seq1_OPS))==(?);
  List_Enumerated(Machine(COMP_1seq1_OPS))==(?);
  List_Defered(Machine(COMP_1seq1_OPS))==(?);
  List_Sets(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(COMP_1seq1_OPS))==(?);
  Expanded_List_HiddenConstants(Machine(COMP_1seq1_OPS))==(?);
  List_HiddenConstants(Machine(COMP_1seq1_OPS))==(?);
  External_List_HiddenConstants(Machine(COMP_1seq1_OPS))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(COMP_1seq1_OPS))==(btrue);
  Context_List_Properties(Machine(COMP_1seq1_OPS))==(btrue);
  Inherited_List_Properties(Machine(COMP_1seq1_OPS))==(btrue);
  List_Properties(Machine(COMP_1seq1_OPS))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00000)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00001)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00002)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00003)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00004)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00005)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00006)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00007)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00008)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00009)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00010)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00011)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00012)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00013)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00014)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00015)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00016)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00017)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00018)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00019)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00020)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00021)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00022)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00023)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00024)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00025)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00026)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00027)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00028)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00029)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00030)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00031)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00032)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00033)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00034)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00035)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00036)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00037)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00038)==(?);
  List_ANY_Var(Machine(COMP_1seq1_OPS),ID00039)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(COMP_1seq1_OPS)) == (? | ? | check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter | ? | ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039 | ? | ? | ? | COMP_1seq1_OPS);
  List_Of_HiddenCst_Ids(Machine(COMP_1seq1_OPS)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(COMP_1seq1_OPS)) == (?);
  List_Of_VisibleVar_Ids(Machine(COMP_1seq1_OPS)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(COMP_1seq1_OPS)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(COMP_1seq1_OPS)) == (Type(check_OPER_CALL) == Mvl(btype(INTEGER,?,?));Type(check_WHILE) == Mvl(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvl(btype(INTEGER,?,?));Type(check_CASE) == Mvl(btype(INTEGER,?,?));Type(check_IF) == Mvl(btype(INTEGER,?,?));Type(check_BECOME) == Mvl(btype(INTEGER,?,?));Type(check_BLOCK) == Mvl(btype(INTEGER,?,?));Type(check_boolexp) == Mvl(btype(BOOL,?,?));Type(cond1) == Mvl(btype(BOOL,?,?));Type(max_counter) == Mvl(btype(INTEGER,?,?));Type(counter) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(COMP_1seq1_OPS)) == (Type(ID00039) == Cst(No_type,No_type);Type(ID00038) == Cst(No_type,No_type);Type(ID00037) == Cst(No_type,No_type);Type(ID00036) == Cst(No_type,No_type);Type(ID00035) == Cst(No_type,No_type);Type(ID00034) == Cst(No_type,No_type);Type(ID00033) == Cst(No_type,No_type);Type(ID00032) == Cst(No_type,No_type);Type(ID00031) == Cst(No_type,No_type);Type(ID00030) == Cst(No_type,No_type);Type(ID00029) == Cst(No_type,No_type);Type(ID00028) == Cst(No_type,No_type);Type(ID00027) == Cst(No_type,No_type);Type(ID00026) == Cst(No_type,No_type);Type(ID00025) == Cst(No_type,No_type);Type(ID00024) == Cst(No_type,No_type);Type(ID00023) == Cst(No_type,No_type);Type(ID00022) == Cst(No_type,No_type);Type(ID00021) == Cst(No_type,No_type);Type(ID00020) == Cst(No_type,No_type);Type(ID00019) == Cst(No_type,No_type);Type(ID00018) == Cst(No_type,No_type);Type(ID00017) == Cst(No_type,No_type);Type(ID00016) == Cst(No_type,No_type);Type(ID00015) == Cst(No_type,No_type);Type(ID00014) == Cst(No_type,No_type);Type(ID00013) == Cst(No_type,No_type);Type(ID00012) == Cst(No_type,No_type);Type(ID00011) == Cst(No_type,No_type);Type(ID00010) == Cst(No_type,No_type);Type(ID00009) == Cst(No_type,No_type);Type(ID00008) == Cst(No_type,No_type);Type(ID00007) == Cst(No_type,No_type);Type(ID00006) == Cst(No_type,No_type);Type(ID00005) == Cst(No_type,No_type);Type(ID00004) == Cst(No_type,No_type);Type(ID00003) == Cst(No_type,No_type);Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type));
  Observers(Machine(COMP_1seq1_OPS)) == (Type(ID00039) == Cst(No_type,No_type);Type(ID00038) == Cst(No_type,No_type);Type(ID00037) == Cst(No_type,No_type);Type(ID00036) == Cst(No_type,No_type);Type(ID00035) == Cst(No_type,No_type);Type(ID00034) == Cst(No_type,No_type);Type(ID00033) == Cst(No_type,No_type);Type(ID00032) == Cst(No_type,No_type);Type(ID00031) == Cst(No_type,No_type);Type(ID00030) == Cst(No_type,No_type);Type(ID00029) == Cst(No_type,No_type);Type(ID00028) == Cst(No_type,No_type);Type(ID00027) == Cst(No_type,No_type);Type(ID00026) == Cst(No_type,No_type);Type(ID00025) == Cst(No_type,No_type);Type(ID00024) == Cst(No_type,No_type);Type(ID00023) == Cst(No_type,No_type);Type(ID00022) == Cst(No_type,No_type);Type(ID00021) == Cst(No_type,No_type);Type(ID00020) == Cst(No_type,No_type);Type(ID00019) == Cst(No_type,No_type);Type(ID00018) == Cst(No_type,No_type);Type(ID00017) == Cst(No_type,No_type);Type(ID00016) == Cst(No_type,No_type);Type(ID00015) == Cst(No_type,No_type);Type(ID00014) == Cst(No_type,No_type);Type(ID00013) == Cst(No_type,No_type);Type(ID00012) == Cst(No_type,No_type);Type(ID00011) == Cst(No_type,No_type);Type(ID00010) == Cst(No_type,No_type);Type(ID00009) == Cst(No_type,No_type);Type(ID00008) == Cst(No_type,No_type);Type(ID00007) == Cst(No_type,No_type);Type(ID00006) == Cst(No_type,No_type);Type(ID00005) == Cst(No_type,No_type);Type(ID00004) == Cst(No_type,No_type);Type(ID00003) == Cst(No_type,No_type);Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type))
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
