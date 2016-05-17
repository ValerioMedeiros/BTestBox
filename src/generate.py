import os
import xml.etree.ElementTree as ET
import src.printer_xml
import src.printer_history
import re


def gerar_casos_de_testes_xml(caminho, arquivo): 
    tree = ET.parse(caminho+os.sep+arquivo)
    root = tree.getroot()
    for c in os.listdir(caminho+os.sep):
        if c.endswith(".mch"):
            componente= c[:-4]
            print(componente)
    return src.printer_xml.print_xml(root,componente,False,"//")    

def gerar_casos_de_testes_history(path_history, b_module): 
    conteudo = open( path_history,"r").read()
    arquivo_sem_com = re.sub(re.compile("/\*.*?\*/",re.DOTALL ) ,"" ,conteudo) # remove os de multiplas linhas
    #string = re.sub(re.compile("//.*?\n" ) ,"" ,string) # remove os de uma linha
    chamadas_funcoes = arquivo_sem_com.replace("\n",'').split(";")
    chamadas_funcoes.insert(0, "init")
    tmp_est = re.sub(re.compile(".*?;\n" ) ,"" ,conteudo) # remove os de uma linha
    estados = tmp_est.split("/* Initialisation */")[1].replace("\n","").replace("/* Variables","").split("*/")[:-1]
    estados[len(estados)-1] =" ".join(estados[len(estados)-1].split(" ")[1:])
    
    return src.printer_history.imprime_testes(chamadas_funcoes,estados ,b_module,False,"//")    
           

def exemplo(value_initialisation, value, modified):
    
    print('''void Counterinitialisation_case_test_1(void){
    
    counter$state$ state;
    counter$init$(&state);
    
    int32_t exp_value = %d;
    bool exp_error = %d;'''%(value_initialisation[0], value_initialisation[1]),'''
    
    bool result = state.value == exp_value & state.error == exp_error;
    TEST_CHECK_(result , " Expected \%d , \%d got \%d,\%d ",exp_value, exp_error, state.value, state.error);

    
}/n''' )


