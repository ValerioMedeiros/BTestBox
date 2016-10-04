'''
Created on Feb 9, 2016

@author: valerio
'''
import codecs
import subprocess


def executeSubWithReturn(cmd, n="" , out=True):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    output, errors = p.communicate()
    if out:
        if p.returncode==0:
            print("Prob executed successfully ("+n+")")
            print(output)

        else:
            print("Prob - error reported in "+n+" and the return code is "+str(p.returncode))
            print(output)
            print(errors)

    return p.returncode, output, errors

def executeSub(cmd, n="" , out=True):
    rcode, output, errors = executeSubWithReturn(cmd, n , out)
    return rcode

makefile_text = '''#Defining variables used in compilation.

PATH_B2LLVM +=../../../Programas/b2llvm/b2llvm.py
PATH_XMLS +=../../testes_e_examplos_gerais/general_examples_bxml/


ifeq ($(OS),Windows_NT)
    CCFLAGS += -D WIN32
    ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
        CCFLAGS += -D AMD64
    endif
    ifeq ($(PROCESSOR_ARCHITECTURE),x86)
        CCFLAGS += -D IA32
    endif
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        CCFLAGS += -D LINUX
				PATH_PROB +=../../../Programas/ProB_Linux/probcli.sh
				PATH_C4B +=../../../Programas/Atelier_B_utils_Linux_64/b2c
    endif
    ifeq ($(UNAME_S),Darwin)
        CCFLAGS += -D OSX
				PATH_PROB +=../../../Programas/ProB_OSX/probcli.sh
				PATH_C4B +=../../../Programas/Atelier_B_utils_OSX/b2c

    endif
    UNAME_P := $(shell uname -p)
    ifeq ($(UNAME_P),x86_64)
        	CCFLAGS += -D AMD64
    endif
    ifneq ($(filter %86,$(UNAME_P)),)
        CCFLAGS += -D IA32
    endif
    ifneq ($(filter arm%,$(UNAME_P)),)
        CCFLAGS += -D ARM
    endif
endif



all: verbose updateLLVM clang llc clangFinal clean

verbose:
	@echo '************  RUNNING THE TESTS ON #FILENAMECOMP# /($(UNAME_S))-$(CCFLAGS) ************'

updateLLVM:
	cp ../#FILENAMECOMP#.llvm* .

b2llvm:	*.imp
	@echo "*** chamando o B2LLVM ($?) ***"
	$(PATH_B2LLVM) -m comp  $(basename $?) $(basename $?).llvm $(PATH_XMLS) project.xml .

#c4b: *.imp
		#echo "*** chamando o c4b ($?) ***"
		#$(PATH_C4B) --m  $?
				#-m comp  $(basename $?) $(basename $?).llvm $(PATH_XMLS) project.xml .

clang:
	clang -S -emit-llvm -c *.c

llc:
	for f in *.ll; do\
		sed -e :a -e '$d;N;2,5ba' -e 'P;D'  $$f > tmp;\
        mv tmp $$f;\
		llc $$f;\
	done;
	for f in *.llvm; do\
		llc $$f;\
	done;

clangFinal:
	clang -o execute *.s  &>comp_log
	./execute --no-exec

prob:
	for f in *.imp; do\
		$(PATH_PROB) $$f -test_description description.xml;\
	done;


probanime:

	for f in *.imp; do\
		$(PATH_PROB) -animate 5 -his history.txt -his_option show_init -his_option show_states $$f;\
	done;


clean:
	rm *.ll *.s 

'''





def writefile(content, path_make):
    f = open(path_make,'w')
    f.write(content)
    f.close()
