Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(COMP_1seq1_OPS_IMP))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(COMP_1seq1_OPS_IMP))==(Machine(COMP_1seq1_OPS));
  Level(Implementation(COMP_1seq1_OPS_IMP))==(1);
  Upper_Level(Implementation(COMP_1seq1_OPS_IMP))==(Machine(COMP_1seq1_OPS))
END
&
THEORY LoadedStructureX IS
  Implementation(COMP_1seq1_OPS_IMP)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(COMP_1seq1_OPS_IMP))==(COMPIMP);
  Inherited_List_Includes(Implementation(COMP_1seq1_OPS_IMP))==(COMPIMP)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Context_List_Variables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Abstract_List_Variables(Implementation(COMP_1seq1_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  Local_List_Variables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Variables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  External_List_Variables(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Abstract_List_VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  External_List_VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Expanded_List_VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  Internal_List_VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Abstract_List_Invariant(Implementation(COMP_1seq1_OPS_IMP))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT);
  Expanded_List_Invariant(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Context_List_Invariant(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  List_Invariant(Implementation(COMP_1seq1_OPS_IMP))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Expanded_List_Assertions(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Context_List_Assertions(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  List_Assertions(Implementation(COMP_1seq1_OPS_IMP))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(COMP_1seq1_OPS_IMP))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(COMP_1seq1_OPS_IMP))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(COMP_1seq1_OPS_IMP))==((1: INT | counter:=1);(1024: INT | max_counter:=1024);cond1:=TRUE;check_boolexp:=TRUE;(0: INT | check_BLOCK:=0);(0: INT | check_BECOME:=0);(0: INT | check_IF:=0);(0: INT | check_CASE:=0);(0: INT | check_SEQUENCE:=0);(0: INT | check_WHILE:=0);(0: INT | check_OPER_CALL:=0));
  Context_List_Initialisation(Implementation(COMP_1seq1_OPS_IMP))==(skip);
  List_Initialisation(Implementation(COMP_1seq1_OPS_IMP))==(counter:=1;max_counter:=1024;cond1:=TRUE;check_boolexp:=TRUE;check_BLOCK:=0;check_BECOME:=0;check_IF:=0;check_CASE:=0;check_SEQUENCE:=0;check_WHILE:=0;check_OPER_CALL:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(COMP_1seq1_OPS_IMP),Machine(COMPIMP))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(COMP_1seq1_OPS_IMP),Machine(COMPIMP))==(btrue);
  List_Constraints(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  List_Context_Constraints(Implementation(COMP_1seq1_OPS_IMP))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(COMP_1seq1_OPS_IMP))==(ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039);
  List_Operations(Implementation(COMP_1seq1_OPS_IMP))==(ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039)
END
&
THEORY ListInputX IS
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(?);
  List_Input(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(?);
  List_Output(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(ID00000);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(ID00001);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(ID00002);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(ID00003);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(ID00004);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(ID00005);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(ID00006);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(ID00007);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(ID00008);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(ID00009);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(ID00010);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(ID00011);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(ID00012);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(ID00013);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(ID00014);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(ID00015);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(ID00016);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(ID00017);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(ID00018);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(ID00019);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(ID00020);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(ID00021);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(ID00022);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(ID00023);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(ID00024);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(ID00025);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(ID00026);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(ID00027);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(ID00028);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(ID00029);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(ID00030);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(ID00031);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(ID00032);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(ID00033);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(ID00034);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(ID00035);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(ID00036);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(ID00037);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(ID00038);
  List_Header(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(ID00039)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(btrue);
  Own_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(btrue);
  List_Precondition(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(1: INT | check_OPER_CALL:=1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & not(counter = 1) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(btrue | counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(btrue | counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (1: INT | check_OPER_CALL:=1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(1: INT | check_OPER_CALL:=1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(btrue | counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)) [] not(counter>max_counter) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(btrue | (1: INT | check_OPER_CALL:=1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(btrue | check_boolexp:=bool(counter = 0);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (1: INT | check_OPER_CALL:=1) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(1: INT | check_OPER_CALL:=1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & not(counter = 1) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(btrue | counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1) [] not(counter>max_counter) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(btrue | counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (1: INT | check_OPER_CALL:=1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(1: INT | check_OPER_CALL:=1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(btrue | counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (counter>max_counter ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)) [] not(counter>max_counter) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(btrue | (1: INT | check_OPER_CALL:=1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(btrue | check_boolexp:=bool(counter = 0);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (1: INT | check_OPER_CALL:=1) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 0 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 0) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00000)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00001)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=1 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00002)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00003)==(check_boolexp:=bool(counter = 0);BEGIN check_BLOCK:=check_BLOCK+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00004)==(WHILE counter>max_counter & check_WHILE<1000 DO check_BECOME:=check_BECOME+1;check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00005)==(BEGIN check_OPER_CALL:=1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00006)==(IF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSIF counter>max_counter THEN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00007)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END OR 1 THEN check_CASE:=check_CASE+3;check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00008)==(check_BECOME:=check_BECOME+1;check_OPER_CALL:=1;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00009)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00010)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00011)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00012)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00013)==(IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00014)==(WHILE counter>max_counter & check_WHILE<1000 DO check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00015)==(BEGIN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00016)==(IF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSIF counter>max_counter THEN BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00017)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_OPER_CALL:=1 OR 1 THEN check_CASE:=check_CASE+3;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00018)==(check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00019)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00020)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00021)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=1 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00022)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00023)==(check_boolexp:=bool(counter = 0);BEGIN check_BLOCK:=check_BLOCK+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00024)==(WHILE counter>max_counter & check_WHILE<1000 DO check_BECOME:=check_BECOME+1;check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00025)==(BEGIN check_OPER_CALL:=1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00026)==(IF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSIF counter>max_counter THEN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00027)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END OR 1 THEN check_CASE:=check_CASE+3;check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00028)==(check_BECOME:=check_BECOME+1;check_OPER_CALL:=1;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00029)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00030)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00031)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00032)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00033)==(IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00034)==(WHILE counter>max_counter & check_WHILE<1000 DO check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00035)==(BEGIN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00036)==(IF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSIF counter>max_counter THEN BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00037)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_OPER_CALL:=1 OR 1 THEN check_CASE:=check_CASE+3;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 0 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00038)==(check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 1000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_1seq1_OPS_IMP),ID00039)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT 1 = 1 VARIANT 100000-check_WHILE END;counter:=counter+1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(COMP_1seq1_OPS_IMP))==(const1);
  Inherited_List_Constants(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Constants(Implementation(COMP_1seq1_OPS_IMP))==(const1)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Context_List_Defered(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Context_List_Sets(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Own_Enumerated(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Valuable_Sets(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Inherited_List_Enumerated(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Inherited_List_Defered(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Inherited_List_Sets(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Enumerated(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Defered(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_Sets(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(COMP_1seq1_OPS_IMP))==(?);
  Expanded_List_HiddenConstants(Implementation(COMP_1seq1_OPS_IMP))==(?);
  List_HiddenConstants(Implementation(COMP_1seq1_OPS_IMP))==(?);
  External_List_HiddenConstants(Implementation(COMP_1seq1_OPS_IMP))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Context_List_Properties(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Inherited_List_Properties(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  List_Properties(Implementation(COMP_1seq1_OPS_IMP))==(const1: INT)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(COMP_1seq1_OPS_IMP))==(btrue);
  Values_Subs(Implementation(COMP_1seq1_OPS_IMP))==(const1: 1024);
  List_Values(Implementation(COMP_1seq1_OPS_IMP))==(const1 = 1024)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(COMP_1seq1_OPS_IMP),Machine(COMPIMP))==(do_int)
END
&
THEORY InheritedEnvX IS
  Constants(Implementation(COMP_1seq1_OPS_IMP))==(Type(const1) == Cst(btype(INTEGER,?,?)));
  VisibleVariables(Implementation(COMP_1seq1_OPS_IMP))==(Type(counter) == Mvv(btype(INTEGER,?,?));Type(max_counter) == Mvv(btype(INTEGER,?,?));Type(cond1) == Mvv(btype(BOOL,?,?));Type(check_boolexp) == Mvv(btype(BOOL,?,?));Type(check_BLOCK) == Mvv(btype(INTEGER,?,?));Type(check_BECOME) == Mvv(btype(INTEGER,?,?));Type(check_IF) == Mvv(btype(INTEGER,?,?));Type(check_CASE) == Mvv(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvv(btype(INTEGER,?,?));Type(check_WHILE) == Mvv(btype(INTEGER,?,?));Type(check_OPER_CALL) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(COMP_1seq1_OPS_IMP))==(Type(ID00039) == Cst(No_type,No_type);Type(ID00038) == Cst(No_type,No_type);Type(ID00037) == Cst(No_type,No_type);Type(ID00036) == Cst(No_type,No_type);Type(ID00035) == Cst(No_type,No_type);Type(ID00034) == Cst(No_type,No_type);Type(ID00033) == Cst(No_type,No_type);Type(ID00032) == Cst(No_type,No_type);Type(ID00031) == Cst(No_type,No_type);Type(ID00030) == Cst(No_type,No_type);Type(ID00029) == Cst(No_type,No_type);Type(ID00028) == Cst(No_type,No_type);Type(ID00027) == Cst(No_type,No_type);Type(ID00026) == Cst(No_type,No_type);Type(ID00025) == Cst(No_type,No_type);Type(ID00024) == Cst(No_type,No_type);Type(ID00023) == Cst(No_type,No_type);Type(ID00022) == Cst(No_type,No_type);Type(ID00021) == Cst(No_type,No_type);Type(ID00020) == Cst(No_type,No_type);Type(ID00019) == Cst(No_type,No_type);Type(ID00018) == Cst(No_type,No_type);Type(ID00017) == Cst(No_type,No_type);Type(ID00016) == Cst(No_type,No_type);Type(ID00015) == Cst(No_type,No_type);Type(ID00014) == Cst(No_type,No_type);Type(ID00013) == Cst(No_type,No_type);Type(ID00012) == Cst(No_type,No_type);Type(ID00011) == Cst(No_type,No_type);Type(ID00010) == Cst(No_type,No_type);Type(ID00009) == Cst(No_type,No_type);Type(ID00008) == Cst(No_type,No_type);Type(ID00007) == Cst(No_type,No_type);Type(ID00006) == Cst(No_type,No_type);Type(ID00005) == Cst(No_type,No_type);Type(ID00004) == Cst(No_type,No_type);Type(ID00003) == Cst(No_type,No_type);Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(COMP_1seq1_OPS_IMP)) == (const1 | ? | ? | ? | ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039 | ? | imported(Machine(COMPIMP)) | ? | COMP_1seq1_OPS_IMP);
  List_Of_HiddenCst_Ids(Implementation(COMP_1seq1_OPS_IMP)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(COMP_1seq1_OPS_IMP)) == (const1);
  List_Of_VisibleVar_Ids(Implementation(COMP_1seq1_OPS_IMP)) == (check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter | ?);
  List_Of_Ids_SeenBNU(Implementation(COMP_1seq1_OPS_IMP)) == (?: ?);
  List_Of_Ids(Machine(COMPIMP)) == (? | ? | ? | ? | do_int | ? | ? | ? | COMPIMP);
  List_Of_HiddenCst_Ids(Machine(COMPIMP)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(COMPIMP)) == (?);
  List_Of_VisibleVar_Ids(Machine(COMPIMP)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(COMPIMP)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(COMP_1seq1_OPS_IMP)) == (Type(const1) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(COMP_1seq1_OPS_IMP)) == (Type(check_OPER_CALL) == Mvv(btype(INTEGER,?,?));Type(check_WHILE) == Mvv(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvv(btype(INTEGER,?,?));Type(check_CASE) == Mvv(btype(INTEGER,?,?));Type(check_IF) == Mvv(btype(INTEGER,?,?));Type(check_BECOME) == Mvv(btype(INTEGER,?,?));Type(check_BLOCK) == Mvv(btype(INTEGER,?,?));Type(check_boolexp) == Mvv(btype(BOOL,?,?));Type(cond1) == Mvv(btype(BOOL,?,?));Type(max_counter) == Mvv(btype(INTEGER,?,?));Type(counter) == Mvv(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(COMP_1seq1_OPS_IMP))==(?)
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
  TypingPredicate(Implementation(COMP_1seq1_OPS_IMP))==(counter: INTEGER & max_counter: INTEGER & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INTEGER & check_BECOME: INTEGER & check_IF: INTEGER & check_CASE: INTEGER & check_SEQUENCE: INTEGER & check_WHILE: INTEGER & check_OPER_CALL: INTEGER)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(COMP_1seq1_OPS_IMP),Machine(COMPIMP))==(?);
  ImportedVisVariablesList(Implementation(COMP_1seq1_OPS_IMP),Machine(COMPIMP))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
