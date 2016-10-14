from xml.dom import minidom
import predicate
import buildpaths
import re

def getMchWithTheCalledOperation(operationImp, node, importedMch, ImpOperationName):
    calledop = operationImp.getElementsByTagName("Operation_Call")
    for op in calledop:
        opname = op.getElementsByTagName("Name")[0].firstChild.nextSibling.getAttribute("value")
        for mch in importedMch:
            operations = mch.getElementsByTagName("Operation")
            for operation in operations:
                if operation.getAttribute("name") == opname:
                    operationTree = operation
                    calledOperationName = operation.getAttribute("name")
    return operationTree, calledOperationName

def clearDicts(sizepaths, sizenodemap):
    #Clear the dicts with the things used in the operation call
    for key in sorted(buildpaths.paths.keys()):
        if int(key) > sizepaths:
            del buildpaths.paths[key]
    for key in sorted(buildpaths.graphgen.nodemap.keys()):
        if int(key) > sizenodemap:
            del buildpaths.graphgen.nodemap[key]
            del buildpaths.graphgen.nodetype[key]
            del buildpaths.graphgen.nodedata[key]
            del buildpaths.graphgen.nodecond[key]
            del buildpaths.graphgen.nodeinva[key]

def printDicts(sizepaths, sizenodemap): #For control
    for key in sorted(buildpaths.paths.keys()):
        if int(key) > sizepaths:
            print(key, buildpaths.paths[key])
    for key in sorted(buildpaths.graphgen.nodemap.keys()):
        if int(key) > sizenodemap:
            print(key,
                  buildpaths.graphgen.nodemap[key],
                  buildpaths.graphgen.nodetype[key],
                  buildpaths.graphgen.nodedata[key],
                  buildpaths.graphgen.nodecond[key],
                  buildpaths.graphgen.nodeinva[key])
    
def getPredicateOP(operationImp, node, importedMch, impOperationName, predicate):
    #Return the predicate of a called operation
    #operationImp -> The operation of the implementation (the one being evaluated)
    #node -> The node with the type "Call"
    #importedMch -> All implementations
    #impOperationName -> The name of the operation of the implementation (the one being evaluated)
    #predicate -> the predicate until now
    auxpredicate = []
    extrapaths = 0
    calledOperation, calledOperationName = getMchWithTheCalledOperation(operationImp, node, importedMch, impOperationName)
    sizenodemap = len(buildpaths.graphgen.nodemap) #Size of the graph before any alteration
    sizepaths = max(buildpaths.paths) #Size of the paths before any alteration
    buildpaths.graphgen.mapOperationsCall(calledOperation) #The calledOperation is operation of a mch
    buildpaths.makepathsOperationCall(buildpaths.graphgen.nodemap, sizenodemap + 1)
    for path in buildpaths.paths:
        if path > sizepaths:
            pred, ep = findPredicateOP(path, importedMch, calledOperationName, calledOperation)
            auxpredicate.append(pred)
            extrapaths += ep
    predicate = changePredicate(predicate, auxpredicate, sizenodemap, node, calledOperationName, extrapaths, sizepaths)
    #printDicts(sizepaths, sizenodemap) #For control porpuses
    clearDicts(sizepaths, sizenodemap) #Cleaning the dicts, erasing the nodes created while getting the predicate of the operation
    return predicate

def changePredicate(predicate, auxpredicate, sizenodemap, node, calledOperationName, extrapaths, sizepaths):
    #Initialisation
    outputsInCode = list()
    predicateforoutput = list()
    outputsInCode = getOutputs(node)
    totalpaths = max(buildpaths.paths)
    inputsInCode = getInputs(node, calledOperationName)
    for i in range(len(inputsInCode)):
        inputsInCode[i] = inputsInCode[i][1::] #Fixing the inputInCode
    inputsInOperation = getInputsCalledOperation(str(sizenodemap+1))
    outputsInOperation = getInputsCalledOperation(str(sizenodemap)) #The function name is inputs, but it will get the outputs
    clauses = getClauses(predicate, node, outputsInCode)
    finalclauses = []
    for clause in clauses:
        finalclauses.append("")    
    #Process
    for i in range(len(auxpredicate)): #For each predicate in the predicate list
        for j in range(len(inputsInCode)): #For each input in the input list
            inputsInOperation[j] = inputsInOperation[j].replace(" ", "") #Eliminating all blank spaces
            inputsInCode[j] = inputsInCode[j].replace(" ", "") #Eliminating all blank spaces
            usingRegex = r'\b' + re.escape(inputsInOperation[j]) + r'\b' #Using regex to change the string
            auxpredicate[i] = re.sub(usingRegex, inputsInCode[j], auxpredicate[i]) #Replacing using regex
        predicateforoutput = dividePredicate(auxpredicate[i])
        for j in range(len(clauses)):
            for k in range(totalpaths - sizepaths - 1):
                outputsInCode[k] = outputsInCode[k].replace(" ", "") #Eliminating all blank spaces
                predicateforoutput[k] = predicateforoutput[k].replace(" ", "")
                usingRegex = r'\b' + re.escape(outputsInCode[k]) + r'\b' #Using regex to change the string
                if finalclauses[j] != "":
                    finalclauses[j] += " or "
                finalclauses[j] += re.sub(usingRegex, predicateforoutput[k], "("+clauses[j]+")")
    for i in range(len(finalclauses)):
        usingRegex = r'\b' + re.escape(clauses[i]) + r'\b' #Using regex to change the string
        predicate = re.sub(usingRegex, finalclauses[i], predicate)
    return predicate
            
def dividePredicate(predicate):
    predicates = list()
    commas = list()
    if len(predicate) == 0:
        return predicates
    else:
        for i in range(len(predicate)-1):
            if predicate[i] == ',':
                commas.append(i)
        if len(commas) == 0:
            predicates.append(predicate[1:len(predicate)-1:])
            return predicates
        else:
            for i in range(len(commas)):
                if i == 0:
                    predicates.append(inputs[1:commas[0]:])
                    if i == max(range(len(commas))):
                        predicates.append(predicate[commas[i]+1:len(predicate)-1:])
                    else:
                        predicates.append(predicate[commas[0]+1:commas[i+1]:])
                else:
                    if i == max(range(len(commas))):
                        predicates.append(predicate[commas[i]+1:len(predicate)-1:])
                    else:
                        predicates.append(predicate[commas[i]+1:commas[i+1]:])
            return predicates
    
def findPredicateOP(path, importedMch, calledOperationName, calledOperation):
    #Make and return the predicate
    predicate = ""
    extrapaths = 0
    way = list()
    for node in buildpaths.paths[path]:
        way.append(node)
    while(len(way) != 0):
        node = way[(len(way)-1)]
        predicate, extrapaths = makePredicate(node, predicate, extrapaths, importedMch, calledOperationName, calledOperation)
        del way[len(way) - 1]
    return predicate, extrapaths

def getClauses(predicate, node, outputs):
    control = list()
    clauses = list()
    positionclauses = list()
    for output in outputs:
        control.append([(a.start(), a.end()) for a in list(re.finditer(output, predicate))]) #Searches all occurrences of a output
    for i in range(len(outputs)): #For each output
        for j in range(len(control[i])): #Everytime it happens -> need to change the predicate
            left = control[i][j][0]
            left -= 1 #first character of the string which is not the Output
            right = control[i][j][1]
            right += 1 #first character of the string which is not the Output
            leftpara = -1 #Initialisation of the counter
            rightpara = -1 #Initialisation of the counter
            while(leftpara != 0 or rightpara != 0):
                if leftpara != 0:
                    if predicate[left] == '(':
                        leftpara += 1
                    elif predicate[left] == ')':
                        leftpara -= 1
                    else:
                        left -= 1
                if rightpara != 0:
                    if predicate[right] == '(':
                        rightpara -= 1
                    elif predicate[right] == ')':
                        rightpara += 1
                    else:
                        right += 1
            if [left,right+1] not in positionclauses:
                clauses.append(predicate[left+1:right:])
                positionclauses.append([left, right+1])
    return clauses

def makePredicate(node, predicate, nestedcall, importedMch, calledOperationName, calledOperation):
    #Make and return the predicate
    newpredicate = ""
    if buildpaths.graphgen.nodetype[node] == "END":
        newpredicate += buildpaths.graphgen.nodedata[node][1:len(buildpaths.graphgen.nodedata[node])-1:]
    if buildpaths.graphgen.nodetype[node] == "Instruction":
        for i in range(len(buildpaths.graphgen.nodedata[node])): #Searches the assignement (can be improved using regex)
            if buildpaths.graphgen.nodedata[node][i] == ':' and buildpaths.graphgen.nodedata[node][i+1] == '=': #Find here the assingnement is done
                variable = buildpaths.graphgen.nodedata[node][:i:] #Get everything before the assingnement
                inst = buildpaths.graphgen.nodedata[node][i+2::] #Get everything after the assingnement
                variable = variable.replace(" ", "") #Eliminating all blank spaces
                inst = inst.replace(" ", "")
                inst = "(" + inst + ")"
                usingRegex = r"\b" + re.escape(variable) + r"\b" #Using regex to change the string
                predicate = re.sub(usingRegex, inst, predicate) #Replacing using regex
    if buildpaths.graphgen.nodetype[node] == "Call":
        #auxpredicate, extrapaths = makePredicateCall(node, predicate, importedMch, calledOperationName, calledOperation)
        #for i in range(len(auxpredicate)):
        #    if newpredicate != "":
        #        newpredicate += " or "
        #    newpredicate += auxpredicate[i]
        #nestedpaths += extrapaths
        None
    if predicate == "":
        return newpredicate, nestedcall
    else:
        if newpredicate != "":
            return newpredicate+" & "+predicate, nestedcall
        else:
            return predicate, nestedcall

def makePredicateCall(node, predicate, importedMch, impOperationName, operationImp):
    #Return the predicate of a operation call inside other operation call
    auxpredicate = []
    calledOperation, calledOperationName = getMchWithTheCalledOperation(operationImp, node, importedMch, impOperationName)
    sizenodemap = len(buildpaths.graphgen.nodemap) #Size of the graph before any alteration
    sizepaths = max(buildpaths.paths) #Size of the paths before any alteration
    buildpaths.graphgen.mapOperationsCall(calledOperation) #The calledOperation is operation of a mch
    buildpaths.makepathsOperationCall(buildpaths.graphgen.nodemap, sizenodemap + 1)
    for path in buildpaths.paths:
        if path > sizepaths:
            auxpredicate.append(findPredicateOP(path, importedMch))
    aftersizepaths = max(buildpaths.paths)
    cleardicts(sizepaths, sizenodes)
    return auxpredicate, aftersizepaths - sizepaths - 1

def getOutputs(node):
    opstr = buildpaths.graphgen.nodedata[node]
    if '<--' in opstr:
        for i in range(len(opstr)):
            if opstr[i] == '<' and opstr[i+1] == '-' and opstr[i+2] == '-':
                outputs = opstr[:i-1:]
    entries = list()
    commas = list()
    if len(outputs) == 0:
        return entries
    else:
        for i in range(len(outputs)-1):
            if outputs[i] == ',':
                commas.append(i)
        if len(commas) == 0:
            entries.append(outputs[1:len(outputs)-1:])
            return entries
        else:
            for i in range(len(commas)):
                if i == 0:
                    entries.append(outputs[1:commas[0]:])
                    if i == max(range(len(commas))):
                        entries.append(outputs[commas[i]+1:len(outputs)-1:])
                    else:
                        entries.append(outputs[commas[0]+1:commas[i+1]:])
                else:
                    if i == max(range(len(commas))):
                        entries.append(outputs[commas[i]+1:len(outputs)-1:])
                    else:
                        entries.append(outputs[commas[i]+1:commas[i+1]:])
            return entries

def getInputs(node, calledOperationName):
    opstr = buildpaths.graphgen.nodedata[node]
    if '<--' in opstr:
        for i in range(len(opstr)):
            if opstr[i] == '<' and opstr[i+1] == '-' and opstr[i+2] == '-':
                inputs = opstr[i+3+len(calledOperationName)::]
    entries = list()
    commas = list()
    if len(inputs) == 0:
        return entries
    else:
        for i in range(len(inputs)-1):
            if inputs[i] == ',':
                commas.append(i)
        if len(commas) == 0:
            entries.append(inputs[1:len(inputs)-1:])
            return entries
        else:
            for i in range(len(commas)):
                if i == 0:
                    entries.append(inputs[1:commas[0]:])
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[0]+1:commas[i+1]:])
                else:
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[i]+1:commas[i+1]:])
            return entries

def getInputsCalledOperation(node):
    entries = list()
    commas = list()
    inputs = buildpaths.graphgen.nodedata[node]
    if len(inputs) == 0:
        return entries
    else:
        for i in range(len(inputs)-1):
            if inputs[i] == ',':
                commas.append(i)
        if len(commas) == 0:
            entries.append(inputs[1:len(inputs)-1:])
            return entries
        else:
            for i in range(len(commas)):
                if i == 0:
                    entries.append(inputs[1:commas[0]:])
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[0]+1:commas[i+1]:])
                else:
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[i]+1:commas[i+1]:])
            return entries
