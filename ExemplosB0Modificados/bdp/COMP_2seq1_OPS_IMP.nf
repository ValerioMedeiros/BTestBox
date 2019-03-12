Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(COMP_2seq1_OPS_IMP))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(COMP_2seq1_OPS_IMP))==(Machine(COMP_2seq1_OPS));
  Level(Implementation(COMP_2seq1_OPS_IMP))==(1);
  Upper_Level(Implementation(COMP_2seq1_OPS_IMP))==(Machine(COMP_2seq1_OPS))
END
&
THEORY LoadedStructureX IS
  Implementation(COMP_2seq1_OPS_IMP)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(COMP_2seq1_OPS_IMP))==(COMPIMP);
  Inherited_List_Includes(Implementation(COMP_2seq1_OPS_IMP))==(COMPIMP)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Context_List_Variables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Abstract_List_Variables(Implementation(COMP_2seq1_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  Local_List_Variables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Variables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  External_List_Variables(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Abstract_List_VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  External_List_VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Expanded_List_VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter);
  Internal_List_VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Abstract_List_Invariant(Implementation(COMP_2seq1_OPS_IMP))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT);
  Expanded_List_Invariant(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Context_List_Invariant(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  List_Invariant(Implementation(COMP_2seq1_OPS_IMP))==(counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Expanded_List_Assertions(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Context_List_Assertions(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  List_Assertions(Implementation(COMP_2seq1_OPS_IMP))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(COMP_2seq1_OPS_IMP))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(COMP_2seq1_OPS_IMP))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(COMP_2seq1_OPS_IMP))==((1: INT | counter:=1);(1024: INT | max_counter:=1024);cond1:=TRUE;check_boolexp:=TRUE;(0: INT | check_BLOCK:=0);(0: INT | check_BECOME:=0);(0: INT | check_IF:=0);(0: INT | check_CASE:=0);(0: INT | check_SEQUENCE:=0);(0: INT | check_WHILE:=0);(0: INT | check_OPER_CALL:=0));
  Context_List_Initialisation(Implementation(COMP_2seq1_OPS_IMP))==(skip);
  List_Initialisation(Implementation(COMP_2seq1_OPS_IMP))==(counter:=1;max_counter:=1024;cond1:=TRUE;check_boolexp:=TRUE;check_BLOCK:=0;check_BECOME:=0;check_IF:=0;check_CASE:=0;check_SEQUENCE:=0;check_WHILE:=0;check_OPER_CALL:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(COMP_2seq1_OPS_IMP),Machine(COMPIMP))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(COMP_2seq1_OPS_IMP),Machine(COMPIMP))==(btrue);
  List_Constraints(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  List_Context_Constraints(Implementation(COMP_2seq1_OPS_IMP))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(COMP_2seq1_OPS_IMP))==(ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039,ID00040,ID00041,ID00042,ID00043,ID00044,ID00045,ID00046,ID00047,ID00048,ID00049,ID00050,ID00051,ID00052,ID00053,ID00054,ID00055,ID00056,ID00057,ID00058,ID00059,ID00060,ID00061,ID00062,ID00063,ID00064,ID00065,ID00066,ID00067,ID00068,ID00069,ID00070,ID00071,ID00072,ID00073,ID00074,ID00075,ID00076,ID00077,ID00078,ID00079,ID00080,ID00081,ID00082,ID00083,ID00084,ID00085,ID00086,ID00087,ID00088,ID00089,ID00090,ID00091,ID00092,ID00093,ID00094,ID00095,ID00096,ID00097,ID00098,ID00099,ID00100,ID00101,ID00102,ID00103,ID00104,ID00105,ID00106,ID00107,ID00108,ID00109,ID00110,ID00111,ID00112,ID00113,ID00114,ID00115,ID00116,ID00117,ID00118,ID00119,ID00120,ID00121,ID00122,ID00123,ID00124,ID00125,ID00126,ID00127,ID00128,ID00129,ID00130,ID00131,ID00132,ID00133,ID00134,ID00135,ID00136,ID00137,ID00138,ID00139,ID00140,ID00141,ID00142,ID00143,ID00144,ID00145,ID00146,ID00147,ID00148,ID00149,ID00150,ID00151,ID00152,ID00153,ID00154,ID00155,ID00156,ID00157,ID00158,ID00159,ID00160,ID00161,ID00162,ID00163,ID00164,ID00165,ID00166,ID00167,ID00168,ID00169,ID00170,ID00171,ID00172,ID00173,ID00174,ID00175,ID00176,ID00177,ID00178,ID00179,ID00180,ID00181,ID00182,ID00183,ID00184,ID00185,ID00186,ID00187,ID00188,ID00189,ID00190,ID00191,ID00192,ID00193,ID00194,ID00195,ID00196,ID00197,ID00198,ID00199);
  List_Operations(Implementation(COMP_2seq1_OPS_IMP))==(ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039,ID00040,ID00041,ID00042,ID00043,ID00044,ID00045,ID00046,ID00047,ID00048,ID00049,ID00050,ID00051,ID00052,ID00053,ID00054,ID00055,ID00056,ID00057,ID00058,ID00059,ID00060,ID00061,ID00062,ID00063,ID00064,ID00065,ID00066,ID00067,ID00068,ID00069,ID00070,ID00071,ID00072,ID00073,ID00074,ID00075,ID00076,ID00077,ID00078,ID00079,ID00080,ID00081,ID00082,ID00083,ID00084,ID00085,ID00086,ID00087,ID00088,ID00089,ID00090,ID00091,ID00092,ID00093,ID00094,ID00095,ID00096,ID00097,ID00098,ID00099,ID00100,ID00101,ID00102,ID00103,ID00104,ID00105,ID00106,ID00107,ID00108,ID00109,ID00110,ID00111,ID00112,ID00113,ID00114,ID00115,ID00116,ID00117,ID00118,ID00119,ID00120,ID00121,ID00122,ID00123,ID00124,ID00125,ID00126,ID00127,ID00128,ID00129,ID00130,ID00131,ID00132,ID00133,ID00134,ID00135,ID00136,ID00137,ID00138,ID00139,ID00140,ID00141,ID00142,ID00143,ID00144,ID00145,ID00146,ID00147,ID00148,ID00149,ID00150,ID00151,ID00152,ID00153,ID00154,ID00155,ID00156,ID00157,ID00158,ID00159,ID00160,ID00161,ID00162,ID00163,ID00164,ID00165,ID00166,ID00167,ID00168,ID00169,ID00170,ID00171,ID00172,ID00173,ID00174,ID00175,ID00176,ID00177,ID00178,ID00179,ID00180,ID00181,ID00182,ID00183,ID00184,ID00185,ID00186,ID00187,ID00188,ID00189,ID00190,ID00191,ID00192,ID00193,ID00194,ID00195,ID00196,ID00197,ID00198,ID00199)
END
&
THEORY ListInputX IS
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(?);
  List_Input(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(?);
  List_Output(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(ID00000);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(ID00001);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(ID00002);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(ID00003);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(ID00004);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(ID00005);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(ID00006);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(ID00007);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(ID00008);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(ID00009);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(ID00010);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(ID00011);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(ID00012);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(ID00013);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(ID00014);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(ID00015);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(ID00016);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(ID00017);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(ID00018);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(ID00019);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(ID00020);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(ID00021);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(ID00022);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(ID00023);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(ID00024);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(ID00025);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(ID00026);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(ID00027);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(ID00028);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(ID00029);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(ID00030);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(ID00031);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(ID00032);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(ID00033);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(ID00034);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(ID00035);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(ID00036);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(ID00037);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(ID00038);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(ID00039);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(ID00040);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(ID00041);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(ID00042);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(ID00043);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(ID00044);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(ID00045);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(ID00046);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(ID00047);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(ID00048);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(ID00049);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(ID00050);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(ID00051);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(ID00052);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(ID00053);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(ID00054);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(ID00055);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(ID00056);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(ID00057);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(ID00058);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(ID00059);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(ID00060);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(ID00061);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(ID00062);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(ID00063);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(ID00064);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(ID00065);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(ID00066);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(ID00067);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(ID00068);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(ID00069);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(ID00070);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(ID00071);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(ID00072);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(ID00073);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(ID00074);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(ID00075);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(ID00076);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(ID00077);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(ID00078);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(ID00079);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(ID00080);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(ID00081);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(ID00082);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(ID00083);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(ID00084);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(ID00085);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(ID00086);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(ID00087);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(ID00088);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(ID00089);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(ID00090);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(ID00091);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(ID00092);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(ID00093);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(ID00094);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(ID00095);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(ID00096);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(ID00097);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(ID00098);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(ID00099);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(ID00100);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(ID00101);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(ID00102);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(ID00103);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(ID00104);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(ID00105);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(ID00106);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(ID00107);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(ID00108);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(ID00109);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(ID00110);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(ID00111);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(ID00112);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(ID00113);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(ID00114);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(ID00115);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(ID00116);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(ID00117);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(ID00118);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(ID00119);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(ID00120);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(ID00121);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(ID00122);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(ID00123);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(ID00124);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(ID00125);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(ID00126);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(ID00127);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(ID00128);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(ID00129);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(ID00130);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(ID00131);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(ID00132);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(ID00133);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(ID00134);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(ID00135);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(ID00136);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(ID00137);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(ID00138);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(ID00139);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(ID00140);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(ID00141);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(ID00142);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(ID00143);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(ID00144);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(ID00145);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(ID00146);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(ID00147);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(ID00148);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(ID00149);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(ID00150);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(ID00151);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(ID00152);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(ID00153);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(ID00154);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(ID00155);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(ID00156);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(ID00157);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(ID00158);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(ID00159);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(ID00160);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(ID00161);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(ID00162);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(ID00163);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(ID00164);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(ID00165);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(ID00166);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(ID00167);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(ID00168);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(ID00169);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(ID00170);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(ID00171);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(ID00172);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(ID00173);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(ID00174);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(ID00175);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(ID00176);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(ID00177);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(ID00178);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(ID00179);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(ID00180);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(ID00181);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(ID00182);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(ID00183);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(ID00184);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(ID00185);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(ID00186);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(ID00187);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(ID00188);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(ID00189);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(ID00190);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(ID00191);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(ID00192);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(ID00193);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(ID00194);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(ID00195);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(ID00196);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(ID00197);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(ID00198);
  List_Header(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(ID00199)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(btrue);
  Own_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(btrue);
  List_Precondition(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(btrue | (0: INT | check_OPER_CALL:=0);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);check_boolexp:=bool(counter = 0)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & not(counter = 1) ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter = 0) & not(counter = 1) ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(btrue | counter>max_counter ==> (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1) [] not(counter>max_counter) ==> (counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(btrue | counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> (counter>max_counter ==> check_boolexp:=bool(counter = 0) [] not(counter>max_counter) ==> (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(btrue | (counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(btrue | check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10));(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(btrue | WHILE counter>max_counter & check_WHILE<1000 DO (0: INT | check_OPER_CALL:=0);(check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1) INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(btrue | (0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10)))) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3))) [] not(counter = 0) & not(counter = 1) ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(btrue | not(counter = 1) & counter = 0 ==> ((check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1);(check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1)) [] not(counter = 0) & counter = 1 ==> ((check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3);(check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1)) [] not(counter = 0) & not(counter = 1) ==> (0: INT | check_OPER_CALL:=0);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(btrue | counter>max_counter ==> ((counter+1: INT & counter: INT & 1: INT | check_SEQUENCE:=counter+1);cond1:=bool(counter = 0)) [] not(counter>max_counter) ==> (counter>max_counter ==> ((0: INT | check_WHILE:=0);WHILE check_WHILE<counter DO check_WHILE+1: INT & check_WHILE: INT & 1: INT | check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END) [] not(counter>max_counter) ==> check_boolexp:=bool(counter = 0));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(btrue | counter>max_counter ==> (0: INT | check_OPER_CALL:=0) [] not(counter>max_counter) ==> (counter>max_counter ==> (counter = 0 ==> (check_IF+1: INT & check_IF: INT & 1: INT | check_IF:=check_IF+1) [] not(counter = 0) ==> (counter = 1 ==> (check_IF+3: INT & check_IF: INT & 3: INT | check_IF:=check_IF+3) [] not(counter = 1) ==> (check_IF+10: INT & check_IF: INT & 10: INT | check_IF:=check_IF+10))) [] not(counter>max_counter) ==> (check_CASE = 0 ==> (check_CASE+1: INT & check_CASE: INT & 1: INT | check_CASE:=check_CASE+1) [] not(check_CASE = 0) ==> (check_CASE+3: INT & check_CASE: INT & 3: INT | check_CASE:=check_CASE+3)));(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(btrue | (check_BECOME+1: INT & check_BECOME: INT & 1: INT | check_BECOME:=check_BECOME+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  Expanded_List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(btrue | (check_BLOCK+1: INT & check_BLOCK: INT & 1: INT | check_BLOCK:=check_BLOCK+1);(counter+1: INT & counter: INT & 1: INT | counter:=counter+1));
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00000)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00001)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00002)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00003)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00004)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00005)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00006)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00007)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00008)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00009)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00010)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00011)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00012)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00013)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00014)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00015)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00016)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00017)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00018)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00019)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00020)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00021)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00022)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00023)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00024)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00025)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00026)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00027)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00028)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00029)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00030)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00031)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00032)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00033)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00034)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00035)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00036)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00037)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00038)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00039)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00040)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00041)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00042)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00043)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00044)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00045)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00046)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00047)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00048)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00049)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00050)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00051)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00052)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00053)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00054)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00055)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00056)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00057)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00058)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00059)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00060)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00061)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00062)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00063)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00064)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00065)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00066)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00067)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00068)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00069)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00070)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00071)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00072)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00073)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00074)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00075)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00076)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00077)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00078)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00079)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00080)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00081)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00082)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00083)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00084)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00085)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00086)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00087)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00088)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00089)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00090)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00091)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00092)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00093)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00094)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00095)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00096)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00097)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00098)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00099)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00100)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00101)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00102)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00103)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00104)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00105)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00106)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00107)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00108)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00109)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00110)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00111)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00112)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00113)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00114)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00115)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00116)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00117)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00118)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00119)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00120)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00121)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00122)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00123)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00124)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00125)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00126)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00127)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00128)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00129)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00130)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00131)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00132)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00133)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00134)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00135)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00136)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00137)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00138)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00139)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00140)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00141)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00142)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00143)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00144)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00145)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00146)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00147)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00148)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00149)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00150)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00151)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00152)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00153)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00154)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00155)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00156)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00157)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00158)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00159)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00160)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00161)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00162)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00163)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00164)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00165)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00166)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00167)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00168)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00169)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00170)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00171)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00172)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00173)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00174)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00175)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00176)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00177)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00178)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00179)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00180)==(BEGIN BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00181)==(BEGIN check_BECOME:=check_BECOME+1 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00182)==(IF counter>max_counter THEN check_OPER_CALL:=0 ELSIF counter>max_counter THEN IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END ELSE CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00183)==(IF counter>max_counter THEN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSIF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSE check_boolexp:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00184)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;BEGIN check_BLOCK:=check_BLOCK+1 END OR 1 THEN check_CASE:=check_CASE+3;check_BECOME:=check_BECOME+1 ELSE check_OPER_CALL:=0 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00185)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END OR 1 THEN check_CASE:=check_CASE+3;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END ELSE check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00186)==(check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_boolexp:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00187)==(BEGIN check_BLOCK:=check_BLOCK+1 END;check_BECOME:=check_BECOME+1;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00188)==(WHILE counter>max_counter & check_WHILE<1000 DO check_OPER_CALL:=0;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00189)==(WHILE counter>max_counter & check_WHILE<1000 DO IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00190)==(BEGIN CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00191)==(BEGIN check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00192)==(IF counter>max_counter THEN check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END ELSIF counter>max_counter THEN check_boolexp:=bool(counter = 0) ELSE BEGIN check_BLOCK:=check_BLOCK+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00193)==(IF counter>max_counter THEN check_BECOME:=check_BECOME+1 ELSIF counter>max_counter THEN check_OPER_CALL:=0 ELSE IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00194)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END OR 1 THEN check_CASE:=check_CASE+3;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0) ELSE check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00195)==(CASE counter OF EITHER 0 THEN check_CASE:=check_CASE+1;check_boolexp:=bool(counter = 0) OR 1 THEN check_CASE:=check_CASE+3;BEGIN check_BLOCK:=check_BLOCK+1 END ELSE check_BECOME:=check_BECOME+1 END END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00196)==(check_OPER_CALL:=0;IF counter = 0 THEN check_IF:=check_IF+1 ELSIF counter = 1 THEN check_IF:=check_IF+3 ELSE check_IF:=check_IF+10 END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00197)==(CASE check_CASE OF EITHER 0 THEN check_CASE:=check_CASE+1 ELSE check_CASE:=check_CASE+3 END END;check_SEQUENCE:=counter+1;cond1:=bool(counter = 0);counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00198)==(WHILE counter>max_counter & check_WHILE<1000 DO check_WHILE:=0;WHILE check_WHILE<counter DO check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 1000-check_WHILE END;check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1);
  List_Substitution(Implementation(COMP_2seq1_OPS_IMP),ID00199)==(WHILE counter>max_counter & check_WHILE<1000 DO check_boolexp:=bool(counter = 0);check_WHILE:=check_WHILE+1 INVARIANT counter: NAT & max_counter: NAT & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INT & check_BECOME: INT & check_IF: INT & check_CASE: INT & check_SEQUENCE: INT & check_WHILE: INT & check_OPER_CALL: INT VARIANT 100000-check_WHILE END;counter:=counter+1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(COMP_2seq1_OPS_IMP))==(const1);
  Inherited_List_Constants(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Constants(Implementation(COMP_2seq1_OPS_IMP))==(const1)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Context_List_Defered(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Context_List_Sets(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Own_Enumerated(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Valuable_Sets(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Inherited_List_Enumerated(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Inherited_List_Defered(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Inherited_List_Sets(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Enumerated(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Defered(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_Sets(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(COMP_2seq1_OPS_IMP))==(?);
  Expanded_List_HiddenConstants(Implementation(COMP_2seq1_OPS_IMP))==(?);
  List_HiddenConstants(Implementation(COMP_2seq1_OPS_IMP))==(?);
  External_List_HiddenConstants(Implementation(COMP_2seq1_OPS_IMP))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Context_List_Properties(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Inherited_List_Properties(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  List_Properties(Implementation(COMP_2seq1_OPS_IMP))==(const1: INT)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(COMP_2seq1_OPS_IMP))==(btrue);
  Values_Subs(Implementation(COMP_2seq1_OPS_IMP))==(const1: 1024);
  List_Values(Implementation(COMP_2seq1_OPS_IMP))==(const1 = 1024)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(COMP_2seq1_OPS_IMP),Machine(COMPIMP))==(do_int)
END
&
THEORY InheritedEnvX IS
  Constants(Implementation(COMP_2seq1_OPS_IMP))==(Type(const1) == Cst(btype(INTEGER,?,?)));
  VisibleVariables(Implementation(COMP_2seq1_OPS_IMP))==(Type(counter) == Mvv(btype(INTEGER,?,?));Type(max_counter) == Mvv(btype(INTEGER,?,?));Type(cond1) == Mvv(btype(BOOL,?,?));Type(check_boolexp) == Mvv(btype(BOOL,?,?));Type(check_BLOCK) == Mvv(btype(INTEGER,?,?));Type(check_BECOME) == Mvv(btype(INTEGER,?,?));Type(check_IF) == Mvv(btype(INTEGER,?,?));Type(check_CASE) == Mvv(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvv(btype(INTEGER,?,?));Type(check_WHILE) == Mvv(btype(INTEGER,?,?));Type(check_OPER_CALL) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(COMP_2seq1_OPS_IMP))==(Type(ID00199) == Cst(No_type,No_type);Type(ID00198) == Cst(No_type,No_type);Type(ID00197) == Cst(No_type,No_type);Type(ID00196) == Cst(No_type,No_type);Type(ID00195) == Cst(No_type,No_type);Type(ID00194) == Cst(No_type,No_type);Type(ID00193) == Cst(No_type,No_type);Type(ID00192) == Cst(No_type,No_type);Type(ID00191) == Cst(No_type,No_type);Type(ID00190) == Cst(No_type,No_type);Type(ID00189) == Cst(No_type,No_type);Type(ID00188) == Cst(No_type,No_type);Type(ID00187) == Cst(No_type,No_type);Type(ID00186) == Cst(No_type,No_type);Type(ID00185) == Cst(No_type,No_type);Type(ID00184) == Cst(No_type,No_type);Type(ID00183) == Cst(No_type,No_type);Type(ID00182) == Cst(No_type,No_type);Type(ID00181) == Cst(No_type,No_type);Type(ID00180) == Cst(No_type,No_type);Type(ID00179) == Cst(No_type,No_type);Type(ID00178) == Cst(No_type,No_type);Type(ID00177) == Cst(No_type,No_type);Type(ID00176) == Cst(No_type,No_type);Type(ID00175) == Cst(No_type,No_type);Type(ID00174) == Cst(No_type,No_type);Type(ID00173) == Cst(No_type,No_type);Type(ID00172) == Cst(No_type,No_type);Type(ID00171) == Cst(No_type,No_type);Type(ID00170) == Cst(No_type,No_type);Type(ID00169) == Cst(No_type,No_type);Type(ID00168) == Cst(No_type,No_type);Type(ID00167) == Cst(No_type,No_type);Type(ID00166) == Cst(No_type,No_type);Type(ID00165) == Cst(No_type,No_type);Type(ID00164) == Cst(No_type,No_type);Type(ID00163) == Cst(No_type,No_type);Type(ID00162) == Cst(No_type,No_type);Type(ID00161) == Cst(No_type,No_type);Type(ID00160) == Cst(No_type,No_type);Type(ID00159) == Cst(No_type,No_type);Type(ID00158) == Cst(No_type,No_type);Type(ID00157) == Cst(No_type,No_type);Type(ID00156) == Cst(No_type,No_type);Type(ID00155) == Cst(No_type,No_type);Type(ID00154) == Cst(No_type,No_type);Type(ID00153) == Cst(No_type,No_type);Type(ID00152) == Cst(No_type,No_type);Type(ID00151) == Cst(No_type,No_type);Type(ID00150) == Cst(No_type,No_type);Type(ID00149) == Cst(No_type,No_type);Type(ID00148) == Cst(No_type,No_type);Type(ID00147) == Cst(No_type,No_type);Type(ID00146) == Cst(No_type,No_type);Type(ID00145) == Cst(No_type,No_type);Type(ID00144) == Cst(No_type,No_type);Type(ID00143) == Cst(No_type,No_type);Type(ID00142) == Cst(No_type,No_type);Type(ID00141) == Cst(No_type,No_type);Type(ID00140) == Cst(No_type,No_type);Type(ID00139) == Cst(No_type,No_type);Type(ID00138) == Cst(No_type,No_type);Type(ID00137) == Cst(No_type,No_type);Type(ID00136) == Cst(No_type,No_type);Type(ID00135) == Cst(No_type,No_type);Type(ID00134) == Cst(No_type,No_type);Type(ID00133) == Cst(No_type,No_type);Type(ID00132) == Cst(No_type,No_type);Type(ID00131) == Cst(No_type,No_type);Type(ID00130) == Cst(No_type,No_type);Type(ID00129) == Cst(No_type,No_type);Type(ID00128) == Cst(No_type,No_type);Type(ID00127) == Cst(No_type,No_type);Type(ID00126) == Cst(No_type,No_type);Type(ID00125) == Cst(No_type,No_type);Type(ID00124) == Cst(No_type,No_type);Type(ID00123) == Cst(No_type,No_type);Type(ID00122) == Cst(No_type,No_type);Type(ID00121) == Cst(No_type,No_type);Type(ID00120) == Cst(No_type,No_type);Type(ID00119) == Cst(No_type,No_type);Type(ID00118) == Cst(No_type,No_type);Type(ID00117) == Cst(No_type,No_type);Type(ID00116) == Cst(No_type,No_type);Type(ID00115) == Cst(No_type,No_type);Type(ID00114) == Cst(No_type,No_type);Type(ID00113) == Cst(No_type,No_type);Type(ID00112) == Cst(No_type,No_type);Type(ID00111) == Cst(No_type,No_type);Type(ID00110) == Cst(No_type,No_type);Type(ID00109) == Cst(No_type,No_type);Type(ID00108) == Cst(No_type,No_type);Type(ID00107) == Cst(No_type,No_type);Type(ID00106) == Cst(No_type,No_type);Type(ID00105) == Cst(No_type,No_type);Type(ID00104) == Cst(No_type,No_type);Type(ID00103) == Cst(No_type,No_type);Type(ID00102) == Cst(No_type,No_type);Type(ID00101) == Cst(No_type,No_type);Type(ID00100) == Cst(No_type,No_type);Type(ID00099) == Cst(No_type,No_type);Type(ID00098) == Cst(No_type,No_type);Type(ID00097) == Cst(No_type,No_type);Type(ID00096) == Cst(No_type,No_type);Type(ID00095) == Cst(No_type,No_type);Type(ID00094) == Cst(No_type,No_type);Type(ID00093) == Cst(No_type,No_type);Type(ID00092) == Cst(No_type,No_type);Type(ID00091) == Cst(No_type,No_type);Type(ID00090) == Cst(No_type,No_type);Type(ID00089) == Cst(No_type,No_type);Type(ID00088) == Cst(No_type,No_type);Type(ID00087) == Cst(No_type,No_type);Type(ID00086) == Cst(No_type,No_type);Type(ID00085) == Cst(No_type,No_type);Type(ID00084) == Cst(No_type,No_type);Type(ID00083) == Cst(No_type,No_type);Type(ID00082) == Cst(No_type,No_type);Type(ID00081) == Cst(No_type,No_type);Type(ID00080) == Cst(No_type,No_type);Type(ID00079) == Cst(No_type,No_type);Type(ID00078) == Cst(No_type,No_type);Type(ID00077) == Cst(No_type,No_type);Type(ID00076) == Cst(No_type,No_type);Type(ID00075) == Cst(No_type,No_type);Type(ID00074) == Cst(No_type,No_type);Type(ID00073) == Cst(No_type,No_type);Type(ID00072) == Cst(No_type,No_type);Type(ID00071) == Cst(No_type,No_type);Type(ID00070) == Cst(No_type,No_type);Type(ID00069) == Cst(No_type,No_type);Type(ID00068) == Cst(No_type,No_type);Type(ID00067) == Cst(No_type,No_type);Type(ID00066) == Cst(No_type,No_type);Type(ID00065) == Cst(No_type,No_type);Type(ID00064) == Cst(No_type,No_type);Type(ID00063) == Cst(No_type,No_type);Type(ID00062) == Cst(No_type,No_type);Type(ID00061) == Cst(No_type,No_type);Type(ID00060) == Cst(No_type,No_type);Type(ID00059) == Cst(No_type,No_type);Type(ID00058) == Cst(No_type,No_type);Type(ID00057) == Cst(No_type,No_type);Type(ID00056) == Cst(No_type,No_type);Type(ID00055) == Cst(No_type,No_type);Type(ID00054) == Cst(No_type,No_type);Type(ID00053) == Cst(No_type,No_type);Type(ID00052) == Cst(No_type,No_type);Type(ID00051) == Cst(No_type,No_type);Type(ID00050) == Cst(No_type,No_type);Type(ID00049) == Cst(No_type,No_type);Type(ID00048) == Cst(No_type,No_type);Type(ID00047) == Cst(No_type,No_type);Type(ID00046) == Cst(No_type,No_type);Type(ID00045) == Cst(No_type,No_type);Type(ID00044) == Cst(No_type,No_type);Type(ID00043) == Cst(No_type,No_type);Type(ID00042) == Cst(No_type,No_type);Type(ID00041) == Cst(No_type,No_type);Type(ID00040) == Cst(No_type,No_type);Type(ID00039) == Cst(No_type,No_type);Type(ID00038) == Cst(No_type,No_type);Type(ID00037) == Cst(No_type,No_type);Type(ID00036) == Cst(No_type,No_type);Type(ID00035) == Cst(No_type,No_type);Type(ID00034) == Cst(No_type,No_type);Type(ID00033) == Cst(No_type,No_type);Type(ID00032) == Cst(No_type,No_type);Type(ID00031) == Cst(No_type,No_type);Type(ID00030) == Cst(No_type,No_type);Type(ID00029) == Cst(No_type,No_type);Type(ID00028) == Cst(No_type,No_type);Type(ID00027) == Cst(No_type,No_type);Type(ID00026) == Cst(No_type,No_type);Type(ID00025) == Cst(No_type,No_type);Type(ID00024) == Cst(No_type,No_type);Type(ID00023) == Cst(No_type,No_type);Type(ID00022) == Cst(No_type,No_type);Type(ID00021) == Cst(No_type,No_type);Type(ID00020) == Cst(No_type,No_type);Type(ID00019) == Cst(No_type,No_type);Type(ID00018) == Cst(No_type,No_type);Type(ID00017) == Cst(No_type,No_type);Type(ID00016) == Cst(No_type,No_type);Type(ID00015) == Cst(No_type,No_type);Type(ID00014) == Cst(No_type,No_type);Type(ID00013) == Cst(No_type,No_type);Type(ID00012) == Cst(No_type,No_type);Type(ID00011) == Cst(No_type,No_type);Type(ID00010) == Cst(No_type,No_type);Type(ID00009) == Cst(No_type,No_type);Type(ID00008) == Cst(No_type,No_type);Type(ID00007) == Cst(No_type,No_type);Type(ID00006) == Cst(No_type,No_type);Type(ID00005) == Cst(No_type,No_type);Type(ID00004) == Cst(No_type,No_type);Type(ID00003) == Cst(No_type,No_type);Type(ID00002) == Cst(No_type,No_type);Type(ID00001) == Cst(No_type,No_type);Type(ID00000) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(COMP_2seq1_OPS_IMP)) == (const1 | ? | ? | ? | ID00000,ID00001,ID00002,ID00003,ID00004,ID00005,ID00006,ID00007,ID00008,ID00009,ID00010,ID00011,ID00012,ID00013,ID00014,ID00015,ID00016,ID00017,ID00018,ID00019,ID00020,ID00021,ID00022,ID00023,ID00024,ID00025,ID00026,ID00027,ID00028,ID00029,ID00030,ID00031,ID00032,ID00033,ID00034,ID00035,ID00036,ID00037,ID00038,ID00039,ID00040,ID00041,ID00042,ID00043,ID00044,ID00045,ID00046,ID00047,ID00048,ID00049,ID00050,ID00051,ID00052,ID00053,ID00054,ID00055,ID00056,ID00057,ID00058,ID00059,ID00060,ID00061,ID00062,ID00063,ID00064,ID00065,ID00066,ID00067,ID00068,ID00069,ID00070,ID00071,ID00072,ID00073,ID00074,ID00075,ID00076,ID00077,ID00078,ID00079,ID00080,ID00081,ID00082,ID00083,ID00084,ID00085,ID00086,ID00087,ID00088,ID00089,ID00090,ID00091,ID00092,ID00093,ID00094,ID00095,ID00096,ID00097,ID00098,ID00099,ID00100,ID00101,ID00102,ID00103,ID00104,ID00105,ID00106,ID00107,ID00108,ID00109,ID00110,ID00111,ID00112,ID00113,ID00114,ID00115,ID00116,ID00117,ID00118,ID00119,ID00120,ID00121,ID00122,ID00123,ID00124,ID00125,ID00126,ID00127,ID00128,ID00129,ID00130,ID00131,ID00132,ID00133,ID00134,ID00135,ID00136,ID00137,ID00138,ID00139,ID00140,ID00141,ID00142,ID00143,ID00144,ID00145,ID00146,ID00147,ID00148,ID00149,ID00150,ID00151,ID00152,ID00153,ID00154,ID00155,ID00156,ID00157,ID00158,ID00159,ID00160,ID00161,ID00162,ID00163,ID00164,ID00165,ID00166,ID00167,ID00168,ID00169,ID00170,ID00171,ID00172,ID00173,ID00174,ID00175,ID00176,ID00177,ID00178,ID00179,ID00180,ID00181,ID00182,ID00183,ID00184,ID00185,ID00186,ID00187,ID00188,ID00189,ID00190,ID00191,ID00192,ID00193,ID00194,ID00195,ID00196,ID00197,ID00198,ID00199 | ? | imported(Machine(COMPIMP)) | ? | COMP_2seq1_OPS_IMP);
  List_Of_HiddenCst_Ids(Implementation(COMP_2seq1_OPS_IMP)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(COMP_2seq1_OPS_IMP)) == (const1);
  List_Of_VisibleVar_Ids(Implementation(COMP_2seq1_OPS_IMP)) == (check_OPER_CALL,check_WHILE,check_SEQUENCE,check_CASE,check_IF,check_BECOME,check_BLOCK,check_boolexp,cond1,max_counter,counter | ?);
  List_Of_Ids_SeenBNU(Implementation(COMP_2seq1_OPS_IMP)) == (?: ?);
  List_Of_Ids(Machine(COMPIMP)) == (? | ? | ? | ? | do_int | ? | ? | ? | COMPIMP);
  List_Of_HiddenCst_Ids(Machine(COMPIMP)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(COMPIMP)) == (?);
  List_Of_VisibleVar_Ids(Machine(COMPIMP)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(COMPIMP)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(COMP_2seq1_OPS_IMP)) == (Type(const1) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(COMP_2seq1_OPS_IMP)) == (Type(check_OPER_CALL) == Mvv(btype(INTEGER,?,?));Type(check_WHILE) == Mvv(btype(INTEGER,?,?));Type(check_SEQUENCE) == Mvv(btype(INTEGER,?,?));Type(check_CASE) == Mvv(btype(INTEGER,?,?));Type(check_IF) == Mvv(btype(INTEGER,?,?));Type(check_BECOME) == Mvv(btype(INTEGER,?,?));Type(check_BLOCK) == Mvv(btype(INTEGER,?,?));Type(check_boolexp) == Mvv(btype(BOOL,?,?));Type(cond1) == Mvv(btype(BOOL,?,?));Type(max_counter) == Mvv(btype(INTEGER,?,?));Type(counter) == Mvv(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(COMP_2seq1_OPS_IMP))==(?)
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
  TypingPredicate(Implementation(COMP_2seq1_OPS_IMP))==(counter: INTEGER & max_counter: INTEGER & cond1: BOOL & check_boolexp: BOOL & check_BLOCK: INTEGER & check_BECOME: INTEGER & check_IF: INTEGER & check_CASE: INTEGER & check_SEQUENCE: INTEGER & check_WHILE: INTEGER & check_OPER_CALL: INTEGER)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(COMP_2seq1_OPS_IMP),Machine(COMPIMP))==(?);
  ImportedVisVariablesList(Implementation(COMP_2seq1_OPS_IMP),Machine(COMPIMP))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
