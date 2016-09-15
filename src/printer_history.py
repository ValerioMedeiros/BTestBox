import re
import sys

import b2llvm.codebuf as codebuf
from b2llvm.strutils import NL, SP, TB


# replace multiple strings ( convert B exp to C exp)
rep = {"=": "==", " FALSE ": " 0 ", " TRUE ": " 1 ", " not":" ! "," or ":" || " } 
rep = dict((re.escape(k), v) for k, v in rep.iteritems())
pattern = re.compile("|".join(rep.keys()))

def imprime_testes(chamadas_funcoes,estados ,componente,comentarios,caracter):
    global buf
    buf = codebuf.CodeBuffer(comentarios, caracter)
    buf.code("{}","#include <stdio.h>\n#include <string.h> \n#include <stdint.h> \n#include \"cutest.h\"\n")
    buf.code("#include \"{}.llvm.h\"\n\n",componente)
    #TODO: get the machine name
    machine_name = componente[:-4]
    buf.code("{}$state$ state;\n\n",machine_name)
    
    p_print_state(machine_name,estados[0])

    p_initialisation(machine_name, estados[0] )
    estados.pop(0)
    chamadas_funcoes.pop(0)
    for cont in range(len(estados)):
        p_test_case(machine_name, chamadas_funcoes[cont], estados[cont], cont )
    
    buf.code("{}\n","TEST_LIST = {")
    
    buf.code(TB+"{},\n","{ \"case_test_init\" , case_test_init }")
    for cont in range(len(estados)):
        buf.code(TB+"{},\n","{ \"case_test_"+str(cont)+"\" , case_test_"+str(cont)+" }")
        
    buf.code(TB+"{}\n","{ 0 }")
    buf.code("{}\n","};")
    return(buf.contents())

def p_print_state(machine_name, estado ):
    exps = estado.split("&") 
    vars=[]
    for v in exps:
        vars.append(v.split("=")[0].replace(" ",""))
    
    buf.trace.out("//print state")
    buf.trace.tab()
    
    buf.code("void print_state(char * expected){0}\n","{")
    buf.code(TB+"printf(\"---- Expected -----\\n\");\n")
    #buf.code(TB+"printf(\""+ estado.replace("&","\\n") +"\\n\");\n")
    buf.code(TB+"printf(\" %s  \\n\",expected);\n")
    buf.code(TB+"printf(\"---- Returned -----\\n\");\n")
    for var in vars:
        buf.code(TB+"printf(\"{0}:%d\\n\",state.{0});\n",var)
    buf.code("{0}\n","}")
    buf.trace.untab()


def p_initialisation(componente, estados ):
    buf.trace.out("Definition of int")
    buf.trace.tab()
    buf.code("void case_test_{0}(void){1}\n","init","{")
    
    buf.code(TB+"{0}$init$(&state);\n",componente)
    #chamador(child)
    buf.code("{0}\n","}")
    buf.trace.untab()

def p_test_case(machine_name, chamadas_funcao, estado, cont ):
    buf.trace.out("Definition of test case ("+str(cont)+")" )
    buf.trace.tab()
    buf.code("void case_test_{0}(void){1}\n",str(cont),"{")
    
    #TODO: create a special case of return -->
    if not("-->" in chamadas_funcao): 
        buf.code(TB+"%s$%s(&state); \n"%(machine_name,chamadas_funcao))
    else:
        buf.code(TB+"// a get function \n")
    #TODO: 
    buf.code(TB+"bool result = {};\n",(convert_B_exp_C_exp(estado)))
    buf.code(TB+"TEST_CHECK_(result,  \"Identified error ({}) \");\n","case_test_"+str(cont))
    buf.code(TB+"if (!result) {0}\n","print_state(\""+estado.replace("&","\\n")+"\");")
    buf.code("{0}\n","}")
    buf.trace.untab()
        
def p_value(node ):
    #print( node.keys())
    buf.code(TB+"state.{0} =  {1}\n", node.get('name'),node.findtext('.'))
    
def convert_B_exp_C_exp(exp_string):
    
    res =  pattern.sub(lambda m: rep[re.escape(m.group(0))], exp_string)
    
    #TODO: except reserved words (FALSE, TRUE, AND, OR )
    # Add "state." before an identifier.
    return re.sub(r'([a-zA-Z_][a-zA-Z_0-9]*)\s*',    r' state.\1',  res).replace("state.TRUE","true").replace("state.FALSE","false")

    
    return res