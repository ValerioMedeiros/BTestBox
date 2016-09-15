# -*- encoding: utf-8 -*-
import codecs
import collections
import random
import shutil
import time

import functions_tests as f


# aux functions
def operations_ID():
    name = "ID"+"{:0>5d}=\n".format(operations_ID.count_name)
    operations_ID.count_name+=1
    return name
operations_ID.count_name=0

def replace_all(content,dic):
    for i, j in dic.items():
        if( i in content):
            content = content.replace(i, j)
        else:
            print("ERROR: text not found to be replaced:"+i+" by:"+j )
    return content


const = "\n CONCRETE_CONSTANTS const1 \n PROPERTIES const1 : INT VALUES const1 = 1024"

var = "\n CONCRETE_VARIABLES counter, max_counter, cond1, check_boolexp, check_BLOCK, check_BECOME, check_IF, check_CASE, check_SEQUENCE, check_WHILE, check_OPER_CALL"
var+= "\n INVARIANT counter : NAT & max_counter : NAT& cond1 : BOOL & check_boolexp : BOOL & check_BLOCK: INT &  check_BECOME: INT &  check_IF: INT &  check_CASE: INT &  check_SEQUENCE: INT &  check_WHILE : INT & check_OPER_CALL : INT"
var+= "\n INITIALISATION counter:= 1; max_counter:= 1024; cond1:=TRUE; check_boolexp:=TRUE; check_BLOCK:= 0 ;  check_BECOME:= 0 ;   check_IF:= 0 ;   check_CASE:= 0 ;   check_SEQUENCE:= 0 ;   check_WHILE := 0; check_OPER_CALL := 0\n"

base_instructions = [
" BEGIN\n check_BLOCK := check_BLOCK + 1 \n END\n",
#" VAR tmp IN tmp:=0; check_VAR := check_VAR + 1 END",
" check_BECOME := check_BECOME+1\n",
" check_OPER_CALL <-- do_int(counter)\n",
" IF counter mod 2 = 0 THEN\n check_IF := check_IF+1 \nELSIF counter mod 3 = 0 THEN\n check_IF := check_IF+3  \nELSE check_IF := check_IF+ 10  END\n",
" CASE check_CASE mod 2 \nOF EITHER 0 THEN\n check_CASE := check_CASE + 1  \nELSE check_CASE := check_CASE + 3 \nEND \nEND",
" check_SEQUENCE := counter+1;\n cond1 := bool(counter mod 3 = 0) \n",
" check_WHILE:=0;\n WHILE check_WHILE < (1000 -(counter*3))mod 1000 DO\n  check_WHILE:= check_WHILE+1 \nINVARIANT 1=1 \nVARIANT (1000-check_WHILE) END\n",
" check_boolexp := bool ( counter mod 3 = 0 )"]



#Generating operations with deep 1

instructions_ = ''';
"BEGIN", Instruction, "END";'''
#"VAR", Ident+",", "IN", Instruction, "END";\n'''

#instructions_ +='''Ren_ident, [ "(",  Term+"," , ")" ], ":=" Term;
#Ren_ident, ":=", Array_expression; # The BTEst cannot eval yet array
#Ren_ident, ":=", "bool", "(", Condition, ")";
#Ren_ident, ("'", Ident)+, ":=", Term;'''      # The BTEst cannot eval yet array
#[(Ren_ident)+",", "<--"], Ren_ident, ["(", (Term | Literal_string)+",", ")"]; # It is used in do_int
#'''
instructions_ = instructions_+'''
"IF", Condition, "THEN", Instruction, {"ELSIF", Condition, "THEN", Instruction}, ["ELSE", Instruction], "END";
"CASE", Simple_term, "OF", "EITHER", Simple_term+",", "THEN", Instruction, {"OR", Simple_term+",", "THEN", Instruction} ["ELSE", Instruction], "END", "END";
Instruction, ";", Instruction;
"WHILE", Condition, "DO", Instruction, "INVARIANT", Predicate, "VARIANT", Expression, "END";
'''


#Adjusting the grammar representation to real examples
dic = collections.OrderedDict()
dic["\""] = ""
dic["+"]=""
dic[","]=""
dic["["]=""
dic["]"]=""
dic["{"]=""
dic["}"]=""
dic["WHILE Condition DO Instruction INVARIANT Predicate"] = "WHILE counter > max_counter/2 &  check_WHILE<1000 DO Instruction; check_WHILE:= check_WHILE+1 INVARIANT 1=1"
dic["VARIANT Expression END"] = "VARIANT (100000-check_WHILE) END"
#dic[" Array_expression"]="{ 0|-> 1, 1|->2}"
dic[" Condition "]=" counter > max_counter/2 "
#dic[" Predicate "]=" 1=1 "
dic["CASE Simple_term OF"]="CASE counter mod 2 OF"
dic["EITHER Simple_term THEN"]="EITHER 0 THEN check_CASE:=check_CASE+1;"
dic["OR Simple_term THEN"]="OR 1 THEN check_CASE:=check_CASE+3;"
#dic[" VARIANT Expression END"]="  VARIANT check_BLOCK END"
#dic["VAR Ident IN"]="VAR step IN step:=1; Instruction; check_VAR := check_VAR + step; "

#simple_term
#Ren_ident
#term
instructions_ = replace_all( instructions_,dic)



#print(instructions_)

number_of_operatins=0
operations_imp = "OPERATIONS\n"
gen_inst = instructions_.split(";\n")
gen_inst.pop(0) # remove empty first element
gen_inst.pop() # remove empty last element





def get_base_inst():
    """ Provides one basic instruction in sequence """
    global ind_base_Inst, base_instructions
    tmp = ind_base_Inst
    ind_base_Inst = (ind_base_Inst+1) % len(base_instructions)
    return "\n"+ base_instructions[tmp]+"\n"

def print_instructions_nested( i, depth,current_gen_inst=None):
    global base_instructions, gen_inst
    #print("i:"+str(i)+" de:"+ str(depth))
    #print(" c:"+ str(current_gen_inst))
    
    #total = len(base_instructions)*len(gen_inst)**depth
    ind = (int(i/depth)) % len(gen_inst) #**depth 
    
    if (depth==1): # Basic instructions
        
        if current_gen_inst == None:
            res = gen_inst[ind].replace("Instruction",get_base_inst(),1)
        else:
            res = current_gen_inst.replace("Instruction",get_base_inst(),1)
        while True:
            if "Instruction" in res: #The remaining nested instructions
                #res = res.replace("Instruction",random.choice(base_instructions)) #Random
                res = res.replace("Instruction",get_base_inst(),1) #Random
            else:
                return res+"\n"

    else:
         # Gen_Inst
        if current_gen_inst == None:
            res = gen_inst[ind]
        else:
            res = gen_inst[ind].replace("Instruction",current_gen_inst)
        #res = print_instructions_nested( i, depth-1 , gen_inst[i % len(gen_inst)] )
        
        res = print_instructions_nested( i, depth-1 , res )
        return res


def print_Operations(depth, seq_cmds, base_instructions,isImplementation):
    global ind_base_Inst
    ind_base_Inst = 0
    number_of_operations=operations_ID.count_name=0
    operations = ""
    
    #total = len(base_instructions)*len(gen_inst)**depth # sequential
    #total = len(base_instructions)*len(gen_inst)*depth # nested - First version
    total = len(base_instructions)*len(gen_inst)**depth # nested - First version
    inst=[]
    for i in range(total):
        inst.append(print_instructions_nested( i, depth))
        print("Generated:%d %%"%(100*i/total))

    for i in range(total):
        if isImplementation :
            #operations+= operations_ID() + "BEGIN\n "+ print_instructions_sequenctial(i,base_instructions, gen_inst, depth)+"\n END\n\n" #Old
            if seq_cmds == 1:
                init_body = "BEGIN\n/*Comb Block1*/\n"+ inst[i]
            else:    
                init_body = "BEGIN\n/*Comb Block1*/\n"+ inst[i]+";\n/*Comb inv Block2*/\n" +inst[total-1-i]
            operations+= operations_ID() + init_body
            rbody=""
            for i in range(3,seq_cmds+1):
                rbody +=";\n/* Block "+str(i)+"*/\n" +random.choice(inst)
            operations+= rbody +";\n counter := (counter+1)mod max_counter\n END\n\n"
            print("Printed:%d %%"%(100*i/total))
        else:
            operations+= operations_ID() + "BEGIN skip \nEND\n\n"
        number_of_operations+=1
        if number_of_operations != total:
            operations+= "PointAndComma"
    return operations



#Printing the file IMPLEMENTATION

f.print_example_title("Printing the component with nested instructions")
depth = 5
seq_cmds = 1 # default 10
name_mch ="COMP_"+str(depth)+"seq"+str(seq_cmds)+"_OPS"
name_imp ="COMP_"+str(depth)+"seq"+str(seq_cmds)+"_OPS_IMP"
header = "IMPLEMENTATION "+name_imp+" REFINES "+name_mch+"\n IMPORTS COMPIMP" + const
operations = print_Operations(depth,seq_cmds , base_instructions,True).replace("PointAndComma",";")
imp = header +var + "OPERATIONS\n" + operations + "\nEND"
#myfile = codecs.open("B0_grammar_TestSet/"+name_imp+".imp","w", "utf-8-sig")
myfile = open("B0_grammar_TestSet/"+name_imp+".imp","w")
myfile.write(imp)
myfile.close()



#Printing the file MACHINE

operations_mch = print_Operations(depth, seq_cmds,base_instructions,False)
dic = collections.OrderedDict()
#dic[";"]="||"
dic["PointAndComma"] ="; "
operations_mch = replace_all( operations_mch,dic)

var = var.replace(";","||").replace("CONCRETE_VARIABLES","ABSTRACT_VARIABLES")
mch = "MACHINE "+name_mch+"\n " +var+ "OPERATIONS\n" + operations_mch + "\n END"
#myfile = codecs.open("B0_grammar_TestSet/"+name_mch+".mch","w", "utf-8-sig")
myfile = open("B0_grammar_TestSet/"+name_mch+".mch","w")
myfile.write(mch)
myfile.close()

shutil.copyfile("B0_grammar_TestSet/"+name_mch+".mch","/Users/valerio/Dropbox/B_Resources/ExamplesB0/"+name_mch+".mch")
shutil.copyfile("B0_grammar_TestSet/"+name_imp+".imp","/Users/valerio/Dropbox/B_Resources/ExamplesB0/"+name_imp+".imp")


pProject = "/Users/valerio/Dropbox/B_Resources/ExamplesB0/"
pBXML = "/Applications/AtelierB_4.3/AtelierB.app/AB/bbin/macosx/bxml"
pOut ="/Users/valerio/Dropbox/B_Resources/ExamplesB0/"
command = pBXML+' -a  -i4 -I '+ pProject + ' -O'+pOut+' '+pProject+name_imp+".imp"

f.print_example_title("BXML working")
start_time = time.time()
res = f.execute(command,"B0Check "+name_imp+".imp",name_imp+".imp")
if res==0: print("Ok - BXML")
print("Time: %.2f s"%(time.time() - start_time))


#f.print_example_title("Generating C code using b2c")
#TODO:Medir o tempo

#start_time = time.time()

#f.execute('/Applications/AtelierB_4.3/AtelierB.app/AB/bbin/macosx/b2c  -D /Users/valerio/Dropbox/B_Resources/ExamplesB0/bdp/ExamplesB0.db '+name_imp+'.imp ',name_imp,"")
#print("Time: %.2f s"%(time.time() - start_time))

#f.print_example_title("Compiling the example")

#f.execute('gcc -c out_C/'+name_imp+'.c ',name_imp,"")

#f.print_example_title("Generating C code using b2llvm")
