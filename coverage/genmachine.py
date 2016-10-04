import codecs

def printAssertion(predicate, inputs):
    text = "ASSERTIONS\n"
    text += "#"+inputs+".("+predicate+")\n"
    return text

def createMachineFile(predicate, inputs, coverage, path, operationname):
    #Printing the file Machine
    name_mch = "MCH_PRE_"+coverage+"_OPERATION_"+operationname+"_PATH"+str(path)
    assertion = printAssertion(predicate, inputs)
    mch = "MACHINE \n"+name_mch+"\n"+assertion+"\n"+"END"
    myfile = open("PredicatesMachines/"+name_mch+".mch", "w")
    myfile.write(mch)
    myfile.close()
    return name_mch

