#!/usr/bin/python2.7
'''
Created on Feb 9, 2016

@author: valerio
'''

import os
import sys
import argparse
import shutil
import src.generate
import src.utils
import src.gui2

import time




if True:
    for arg in sys.argv:
        print arg+" ",
    print ("\n"+("-"*80))

parser = argparse.ArgumentParser(add_help=False)

progdescription='Generates C test for B modules.'

parser = argparse.ArgumentParser(parents=[parser],description=progdescription)

parser.add_argument('probcli_path',
                    help='path of ProB (probcli.sh)')
parser.add_argument('b_module',
                    help='name of the B module (implementation)')

parser.add_argument('directory',
                    help='when set, the program will lookup files in that directory')
parser.add_argument('settings',
                    help='project settings file')
parser.add_argument('out_dir',
                    help='output C test directory')
parser.add_argument('-m', '--mode', choices=['b2c','b2llvm','ComenC','all'], default='comp',
                    help='Selects code generation mode.')
parser.add_argument('output_directory', nargs='?',
                    help='defines the output file directory')


args = parser.parse_args()


print(" BTestKit code generation configuration")
print("- ProBcli path: " + args.probcli_path)
print("- B module: " + args.b_module)
print("- C test output directory: " + args.out_dir)
print("- BXML directory: " + args.directory)
print("- code generation mode: " + args.mode)
print("- B project settings file: " + args.settings)

# Create the directory
directory_test = args.out_dir + os.sep + "btest_"+args.b_module
if not os.path.exists(directory_test):
    os.makedirs(directory_test)

#Executa the ProB



parameters_tests = {"defined": False, "max_cases":"0" ,"languages":[],"heuristic":"","criteria":""}

src.gui2.draw_gui(parameters_tests)

if not(parameters_tests["defined"]):
    print("No script tests defined!")
    exit()

start_time = time.time()
src.utils.executeSub(""+args.probcli_path+" -animate "+str(3+int(parameters_tests["max_cases"])) +" -his "+directory_test+os.sep+"history.txt -his_option show_init -his_option show_states "+args.directory+os.sep+args.b_module+".imp",args.b_module,True)


#caminho,arquivo = ("../../Testes/PrimeirosExemplos/Array", 'test_results.xml')  
#caminho,arquivo = ("../../Testes/PrimeirosExemplos/Calculator", 'test_results.xml')    
#caminho,arquivo = ("../../Testes/PrimeirosExemplos/Counter", 'test_results.xml')
#caminho,arquivo = ("../../Testes/PrimeirosExemplos/ATM", 'test_results.xml')

#resultado = gerar_casos_de_testes_xml(caminho, arquivo)
res = src.generate.gerar_casos_de_testes_history(directory_test+os.sep+"history.txt", args.b_module)


# Grava o Makefile e o arquivo gerado de testes
src.utils.writefile(src.utils.makefile_text.replace("#FILENAMECOMP#",args.b_module) , directory_test+os.sep+"Makefile")

shutil.copyfile(os.path.dirname(os.path.abspath(__file__))+os.sep+"libs/cutest.h", directory_test+os.sep+"cutest.h")



#Gerar os testes e grava os resultados
f = open(directory_test+os.sep+args.b_module+"_btest.c" ,'w')
f.write(res) 
f.close() 
print("Btest executed successfully")
print("Random animation of  %s operations and time of execution: %s seconds." % (int(parameters_tests["max_cases"]),(time.time() - start_time)))

spent_time_to_run_lot = time.time() - start_time
seconds_in_one_hour= 60*60
slots_in_one_hour = seconds_in_one_hour/spent_time_to_run_lot
print("Estimated random animation of  %d operations in one hour " % (slots_in_one_hour*int(parameters_tests["max_cases"])) )