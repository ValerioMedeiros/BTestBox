# -*- encoding: utf-8 -*-
import codecs
import collections
import pickle
import random
import shutil
import time

import functions_tests as f


#Printing the file IMPLEMENTATION
pProject = "/Users/valerio/Dropbox/B_Resources/ExamplesB0/"
pBXML = "/Applications/AtelierB_4.3/AtelierB.app/AB/bbin/macosx/bxml"
pOut ="/Users/valerio/Dropbox/B_Resources/ExamplesB0/bdp/"

processing_time_bxml = [[0, 0 , 0, 0 ], [0, 0 , 0, 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ]]
processing_time_b2llvm =  [[0, 0 , 0, 0 ], [0, 0 , 0, 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ]]
processing_time_llc =  [[0, 0 , 0, 0 ], [0, 0 , 0, 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ]]
processing_time_btest = [[0, 0 , 0, 0 ], [0, 0 , 0, 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ]]
processing_time_b2c =  [[0, 0 , 0, 0 ], [0, 0 , 0, 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ]]
processing_time_gcc =  [[0, 0 , 0, 0 ], [0, 0 , 0, 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ],[0, 0, 0 , 0 ]]

def increase(m):
    for i in m:
        i.append(0)
    t = []
    for i in range(len(m[0])):
        t.append(0)
    m.append(t)  
    
increase(processing_time_bxml)
increase(processing_time_b2llvm)
increase(processing_time_llc)
increase(processing_time_btest)
increase(processing_time_b2c)
increase(processing_time_gcc)


#processing_time_bxml = pickle.load(open( "processing_time_bxml.txt", "rb" ))
#processing_time_b2llvm = pickle.load(open( "processing_time_b2llvm.txt", "rb" ))
#processing_time_llc = pickle.load(open( "processing_time_llc.txt", "rb" ))
#processing_time_btest = pickle.load(open( "processing_time_btest.txt", "rb" ))
#processing_time_b2c = pickle.load(open( "processing_time_b2c.txt", "rb" ))
#processing_time_gcc = pickle.load(open( "processing_time_gcc.txt", "rb" ))



#depth_l = [2]
depth_l = [5]
#depth_l = [1]

#seq_cmds_l = [10, 50, 100,500,1000]
seq_cmds_l = [1]

for ind_depth, depth in enumerate(depth_l):
    for ind_seq, seq_cmds in enumerate(seq_cmds_l):
        f.print_example_title("*********** Depth:"+str(depth)+" sequence of commands:"+str(seq_cmds)+"*"*10)
        name_mch ="COMP_"+str(depth)+"seq"+str(seq_cmds)+"_OPS"
        name_imp ="COMP_"+str(depth)+"seq"+str(seq_cmds)+"_OPS_IMP"
        
        #command = pBXML+' -a  -i4 -I '+ pProject + ' -O'+pOut+' '+pProject+name_mch+".mch"
        #print(command)
        #res,processing_time_bxml[ind_seq][ind_depth] = f.execute_time(command,"B0Check "+name_mch+".mch",False)
        #if res==0: print("Ok - "+ name_mch+" BXML")
        
        
        #command = pBXML+' -a  -i4 -I '+ pProject + ' -O'+pOut+' '+pProject+name_imp+".imp"
        #print(command)
        #res,processing_time_bxml[ind_seq][ind_depth] = f.execute_time(command,"B0Check "+name_imp+".imp",False)
        #if res==0: print("Ok - "+ name_imp+" BXML ")
        
        #f.print_example_title("Generating LLVM code using B2LLVM")
        #res,processing_time_b2llvm[ind_seq][ind_depth] = f.execute_time('/Users/valerio/Dropbox/Doutorado/workspace/b2llvm/b2llvm.py  -a  -v  -m  comp  '+name_imp+'  '+name_imp+'.llvm  /media/B_Resources/ExamplesB0/bdp  project.xml  /media/B_Resources/ExamplesB0/lang')
        
        #f.print_example_title("Compiling LLVM code")
        #res,processing_time_llc[ind_seq][ind_depth] = f.execute_time('/opt/local/bin/llc-mp-3.5  /Users/valerio/Dropbox/B_Resources/ExamplesB0/lang/'+name_imp+'.llvm ',name_imp, False)
        
        f.print_example_title("Generating tests using ProB")
        res,processing_time_btest[ind_seq][ind_depth] = f.execute_time('/Users/valerio/Documents/Repository/Projeto_Testes_IFRN/Programas/python/btest.py  /Users/valerio/Applications/ProB/probcli.sh  -m  all  '+name_imp+'  /Users/valerio/Dropbox/B_Resources/ExamplesB0  project.xml  /media/B_Resources/ExamplesB0/lang ',name_imp, False) 
        
        #f.print_example_title("Generating C code using b2c")
        #res,processing_time_b2c[ind_seq][ind_depth] = f.execute_time('/Applications/AtelierB_4.3/AtelierB.app/AB/bbin/macosx/b2c  -D /Users/valerio/Dropbox/B_Resources/ExamplesB0/bdp/ExamplesB0.db '+name_imp+'.imp ',name_imp, False)
        #if res!=0: processing_time_b2c[ind_seq][ind_depth]=0
        
        #f.print_example_title("Compiling the example")
        #res,processing_time_gcc[ind_seq][ind_depth] = f.execute_time('gcc -c out_C/'+name_imp+'.c ',name_imp,False)
        #if res!=0: processing_time_gcc[ind_seq][ind_depth]=0
        




#pickle.dump(processing_time_bxml, open( "processing_time_bxml_rev.txt", "wb" ))
#pickle.dump(processing_time_b2llvm, open( "processing_time_b2llvm_rev.txt", "wb" ))
#pickle.dump(processing_time_llc, open( "processing_time_llc_rev.txt", "wb" ))
#pickle.dump(processing_time_btest, open( "processing_time_btest_rev.txt", "wb" ))
#pickle.dump(processing_time_b2c, open( "processing_time_b2c_rev.txt", "wb" ))
#pickle.dump(processing_time_gcc, open( "processing_time_gcc_rev.txt", "wb" ))
 


def print_table(processing_time_matriz):
    print "\t\t",
    for i in seq_cmds_l:
        print " %5.0f\t"%(i),
    print ""
    for ind_depth, time_depth in enumerate(processing_time_matriz):
        res = (depth_l[ind_depth] if ind_depth in range(len(depth_l)) else 0  )
        #res = (processing_time_matriz[ind_seq][ind_depth] if ind_depth in range(len(processing_time_matriz)) else 0  )
        print " %7.f\t"%(res),
        #for ind_seq, seq in enumerate(time_depth):
        for ind_seq in range(len(processing_time_matriz)):
            if  ind_seq in range(len(processing_time_matriz)) and ind_depth in  range(len(processing_time_matriz[ind_depth])):
                print " %4.3f\t"%(processing_time_matriz[ind_seq][ind_depth]),
            #print " %4.3f\t"%(seq),
            
        print ""

f.print_example_title("Printing table of BXML")
print_table(processing_time_bxml)

f.print_example_title("Printing table of B2LLVM")
print_table(processing_time_b2llvm)

f.print_example_title("Printing table of LLC")
print_table(processing_time_llc)

f.print_example_title("Printing table of BTest")
print_table(processing_time_btest)

f.print_example_title("Printing table of B2C")
print_table(processing_time_b2c)

f.print_example_title("Printing table of GCC")
print_table(processing_time_gcc)