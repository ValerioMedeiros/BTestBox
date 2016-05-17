import sys
import b2llvm.codebuf as codebuf
from b2llvm.strutils import NL, SP, TB


modulo = sys.modules[__name__]

buf = None

#Todo: Tabulacao


def chamador(node,*param):
    if param!= None:
        return getattr(modulo, 'p_'+node.tag)(node, *param)
    else:
        return getattr(modulo, 'p_'+node.tag)(node)


def print_xml(root, componente , comentarios, caracter ):
    global buf
    buf = codebuf.CodeBuffer(comentarios, caracter)
    cont=0
    for child in root:
        cont+=1
        buf.trace.out("Definition of Root.")
        buf.trace.tab()
        buf.code("void case_test_{0}(void){1}\n",str(cont),"{")
        buf.code(TB+"{0}$state$ state;\n",componente)
        buf.code(TB+"{0}$init$(&state);\n",componente)
        chamador(child)
        buf.code("{0}\n","}")
        buf.trace.untab()
    return(buf.contents())

def p_test_case(node ):
    cont=0
    for child in node:
        buf.trace.out("Definition of test case ("+str(cont)+")" )
        buf.trace.tab()
        chamador(child)
        buf.trace.untab()

def p_initialisation(node ):
    for child in node:
        buf.trace.out("Definition of initialisation.")
        buf.trace.tab()
        chamador(child)
        buf.trace.untab()

def p_step(node ):
    for child in node:
        buf.trace.out("Definition of step.")
        buf.trace.tab()
        chamador(child)
        buf.trace.untab()
        
def p_modified(node ):
    for child in node:
        buf.trace.out("Definition of modified.")
        buf.trace.tab()
        chamador(child)
        buf.trace.untab()
        
def p_value(node ):
    #print( node.keys())
    buf.code(TB+"state.{0} =  {1}\n", node.get('name'),node.findtext('.'))
    
