import buildpredicate
import instgen
import os
from xml.dom import minidom
'''
predicate: module responsible for making the predicate that walk through a path.
minidom: module responsible for making a tree from a xml file.
'''

def CodeCoverage(operationImp, operationMch, paths, inputs, operationname, nodeStatus, importedMch, seesMch, impName):
    '''
    Code Coverage, function responsible of making the Code Coverage, in CC we need to exercise every instruction of the code at least once.

    Input:
    operationImp: The node of the operation in the implementation tree.
    paths: All paths of the graph of the operation
    inputs: The inputs of the operation
    operationname: The name of the operation
    nodeStatus: A dict with every node status, initially every nodeStatus is False
    importedMch: A list with the parse of all imported implementations
    impName: The implementation Name

    Variables:
    count: a counter to we know which path has the more uncovered nodes
    pathToCover: the path to be covered
    aux: A scapegoat variable, to dont erase the paths variable
    covered: the answer if the operation is code covered or not

    Return:
    covered: If the operation is covered or not
    '''
    #Initialisation
    count = dict()
    pathToCover = 1
    allInVariables = list()
    allOutVariables = list()
    allUserVariables = list()
    aux = paths
    covered = False
    #Process
    while(len(aux) != 0 and covered == False):
        countcover = 0
        for p in sorted(aux.keys()): #Searching for the path with the biggest number of non covered nodes
            count[p] = 0
            for node in paths[p]:
                if nodeStatus[node] == False:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                    pathToCover = p
        ExistValues, inVariables, outVariables, userVariables = makePredicateCodeCoverage(operationImp, operationMch, aux[pathToCover],
                                                                                          pathToCover, inputs, operationname, nodeStatus,
                                                                                          importedMch, seesMch, impName) #Finding the predicate
        if ExistValues:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
            allUserVariables.append(userVariables)
        for node in nodeStatus: #Counting if all branches were covered, if True, the while stops.
            if nodeStatus[node] == True:
                countcover += 1
        if countcover == len(nodeStatus): 
            covered = True
        del aux[pathToCover] #Deleting the path of aux to start a new path
        for p in sorted(aux.keys()):
            count[p] = 0
            for node in paths[p]:
                if nodeStatus[node] == False:
                    count[p] += 1
            if count[p] == 0: #If all nodes of a path are covered, delete this path from aux
                del aux[p]
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
    return covered, allInVariables, allOutVariables, allUserVariables

def BranchCoverage(operationImp, operationMch, branchesPaths, branchStatus, paths, inputs, operationname, importedMch, seesMch, impName):
    '''
    Branch Coverage, function responsible of making the Branch Coverage, in BC we need to exercise every branch of the code at least once.

    Input:
    operationImp: The node of the operation in the implementation tree.
    paths: All paths of the graph of the operation
    inputs: The inputs of the operation
    operationname: The name of the operation
    branchesPaths: A dict with the branches of a given path
    branchesStatus: A dict with every branch status, initially every branchStatus is False (uncovered)
    importedMch: A list with the parse of all imported implementations
    impName: The implementation Name

    Variables:
    count: a counter to we know which path has the more uncovered nodes
    pathToCover: the path to be covered
    aux: A scapegoat variable, to dont erase the paths variable
    covered: the answer if the operation is code covered or not

    Return:
    covered: If the operation is covered or not
    '''
    #Initialisation
    count = dict()
    allInVariables = list()
    allOutVariables = list()
    allUserVariables = list()
    pathToCover = 1
    aux = paths
    covered = False
    #Process
    while(len(aux) != 0 and covered == False):
        countcover = 0
        for p in sorted(aux.keys()): #Searching for the path with the biggest number of non covered branches
            count[p] = 0
            for branch in branchesPaths[p]:
                if branchStatus[branch] == False:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                    pathToCover = p
        ExistValues, inVariables, outVariables, userVariables = makePredicateBranchCoverage(operationImp, operationMch, aux[pathToCover],
                                                                                            branchStatus, branchesPaths, pathToCover, inputs,
                                                                                            operationname, importedMch, seesMch, impName)
        if ExistValues:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
            allUserVariables.append(userVariables)
        for branch in branchStatus: #Counting if all branches were covered, if True, the while stops.
            if branchStatus[branch] == True:
                countcover += 1
        if countcover == len(branchStatus): 
            covered = True
        del aux[pathToCover] #Deleting the path of aux to start a new path
        for p in sorted(aux.keys()): #Searching for the path with the biggest number of non covered branches
            count[p] = 0
            for branch in branchesPaths[p]:
                if branchStatus[branch] == False:
                    count[p] += 1
            if count[p] == 0: #If all branches of this path are covered, delete this path from aux
                del aux[p]
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number        
    return covered, allInVariables, allOutVariables, allUserVariables

def PathCoverage(operationImp, operationMch, paths, inputs, operationname, importedMch, seesMch, impName):
    '''
    Path Coverage, function responsible of making the Path Coverage, in PC we need to exercise every path of the code at least once.

    Input:
    operationImp: The node of the operation in the implementation tree.
    paths: All paths of the graph of the operation
    inputs: The inputs of the operation
    operationname: The name of the operation
    importedMch: A list with the parse of all imported implementations
    impName: The implementation Name

    Variables:
    count: a counter to we know which path has the more uncovered nodes
    pathToCover: the path to be covered
    aux: A scapegoat variable, to dont erase the paths variable
    covered: the answer if the operation is code covered or not

    Return:
    covered: If the operation is covered or not
    '''
    #Initialisation
    count = dict()
    allInVariables = list()
    allOutVariables = list()
    allUserVariables = list()
    pathToCover = 1
    aux = paths
    covered = True
    #Process
    while(len(aux) != 0 and covered == True):
        covered, inVariables, outVariables, userVariables = makePredicatePathCoverage(operationImp, operationMch, aux[pathToCover],
                                                                                      pathToCover, inputs, operationname,
                                                                                      importedMch, seesMch, impName) #Finding the predicate
        if covered:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
            allUserVariables.append(userVariables)
        del aux[pathToCover] #Deleting the path of aux to start a new path
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
    return covered, allInVariables, allOutVariables, allUserVariables

def makePredicateBranchCoverage(operationImp, operationMch, path, branchStatus, branchesPaths, pathToCover, inputs, operationName, importedMch, seesMch, impName):
    '''
    Make the predicate for Branch Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    path: The path being evaluated
    inputs: The inputs of the operation
    operationname: The name of the operation
    branchesPaths: A dict with the branches of a given path
    branchesStatus: A dict with every branch status, initially every branchStatus is False (uncovered)
    importedMch: A list with the parse of all imported implementations
    pathToCover: The number of the path in the path dicts

    Variables:
    way: A scapegoat variable to do not erase the path variable
    predicate: The predicate (a string)
    whilemutables: Every variable that change inside the while

    Output:
    It says to the user if the path can be walked (and the inputs for this) or not
    '''
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Branch Coverage - trying to get inputs for guide "+str(pathToCover), inputs)
    if ExistValues == True:
        print("Input(s) were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, docXML,
                                                       operationImp, importedMch, operationName, impName, variables, variablesList)
        if ExistValues:
            for branch in branchesPaths[pathToCover]: #Setting all branches of the path to True (Covered)
                branchStatus[branch] = True
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The branches of this path were NOT covered\n")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList

def makePredicatePathCoverage(operationImp, operationMch, path, pathToCover, inputs, operationName, importedMch, seesMch, impName):
    '''
    Make the predicate for Path Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    path: The path being evaluated
    inputs: The inputs of the operation
    operationname: The name of the operation
    importedMch: A list with the parse of all imported implementations
    pathToCover: The number of the path in the path dicts

    Variables:
    way: A scapegoat variable to do not erase the path variable
    predicate: The predicate (a string)
    whilemutables: Every variable that change inside the while

    Output:
    It says to the user if the path can be walked (and the inputs for this) or not
    ExistValues: Boolean, if exist inputs that satisfy the predicate, than it return True, otherwise return false
    '''
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues:
        print("Input(s) were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, docXML,
                                                       operationImp, importedMch, operationName, impName, variables, variablesList)        
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("This path can NOT be covered\n")
        output = []
    return ExistValues, variables, output, variablesList

def makePredicateCodeCoverage(operationImp, operationMch, path, pathToCover, inputs, operationName, nodeStatus, importedMch, seesMch, impName):
    '''
    Make the predicate for Code Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    inputs: The inputs of the operation
    operationname: The name of the operation
    nodeStatus: A dict with every node status, initially every nodeStatus is False
    importedMch: A list with the parse of all imported implementations
    path: The path being evaluated
    pathToCover: The number of the path in the path dicts

    Variables:
    way: A scapegoat variable to do not erase the path variable
    predicate: The predicate (a string)
    whilemutables: Every variable that change inside the while

    Output:
    It says to the user if the path can be walked (and the inputs for this) or not
    '''
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Code Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues:
        print("Input(s) were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, docXML,
                                          operationImp, importedMch, operationName, impName, variables, variablesList)
        if ExistValues:
            for node in path: #Setting all branches of the path to True (Covered)
                nodeStatus[node] = True
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The nodes of this path were NOT covered yet\n")
    return ExistValues, variables, output, variablesList

def addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList):
    for childnode in operationImp.parentNode.parentNode.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if (childnode.tagName == "Parameters" or childnode.tagName == "Variables" or
                childnode.tagName == 'Concrete_Variables' or childnode.tagName == 'Abstract_Variables'):
                allId = childnode.getElementsByTagName('Id')
                for Id in allId:
                    if Id.getAttribute not in inputs:
                        inputs.append(Id.getAttribute('value'))
                        variablesList.append(Id.getAttribute('value'))
    solveAddVariablesToInputImportsAndSees(operationImp, importedMch, operationMch, inputs, variablesList)
    solveAddVariablesToInputImportsAndSees(operationImp, seesMch, operationMch, inputs, variablesList, True)
    
def solveAddVariablesToInputImportsAndSees(operationImp, machines, operationMch, inputs, variablesList, isSees = False):
    for mch in machines:
        importedImplementation = buildpredicate.buildpaths.graphgen.getImpWithImportedMch(mch)
        if importedImplementation == None and isSees == False:
            print('There is a machine that don\'t have implementation, this may break the algorithm')
        else:
            for childnode in importedImplementation.firstChild.childNodes:
                if childnode.nodeType != childnode.TEXT_NODE:
                    if (childnode.tagName == "Parameters" or childnode.tagName == "Variables" or
                        childnode.tagName == 'Concrete_Variables' or childnode.tagName == 'Abstract_Variables'):
                        allId = childnode.getElementsByTagName('Id')
                        for Id in allId:
                            if Id.getAttribute not in inputs:
                                inputs.append(Id.getAttribute('value'))
                                variablesList.append(Id.getAttribute('value'))

def getFixedNames(operationImp, importedMch, seesMch, operationMch):
    fixedNames = list()
    solveFixedNames(operationImp.parentNode.parentNode.childNodes, fixedNames) #Implementation
    for mch in importedMch: #Imported machines
        solveFixedNames(mch.firstChild.childNodes, fixedNames)
    solveFixedNames(operationMch.parentNode.parentNode.childNodes, fixedNames) #Machine of the implementation
    for mch in seesMch:
        solveFixedNames(mch.firstChild.childNodes, fixedNames)
    return fixedNames

def solveFixedNames(clauses, fixedNames):
    for childnode in clauses:
            if childnode.nodeType != childnode.TEXT_NODE:
                tag = childnode.tagName
                if tag == "Parameters" or tag == "Concrete_Constants" or tag == "Constants" or tag == "Abstract_Constants":
                    allId = childnode.getElementsByTagName('Id')
                    for Id in allId:
                        if Id.getAttribute not in fixedNames:
                            fixedNames.append(Id.getAttribute('value'))
                if childnode.tagName == "Sets":
                    for setTree in childnode.childNodes:
                        if setTree.nodeType != setTree.TEXT_NODE:
                            allId = childnode.getElementsByTagName('Id')
                            for Id in allId:
                                if Id.getAttribute not in fixedNames:
                                    fixedNames.append(Id.getAttribute('value'))

def getOutputsVariables(operationImp):
    '''
    Function responsible for getting the Inputs for an operation
    Input:
    operationImp : The operation node in the implementation tree
    
    Output:
    entries: A list with all the inputs
    '''
    if operationImp.getElementsByTagName("Output_Parameters") != []:
        inputs = instgen.make_inputs(operationImp.getElementsByTagName("Output_Parameters")[0])
        inputs = inputs.replace(" ", "") #Eliminating blank spaces
        entries = list()
        commas = list()
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
    else:
        return []
        
#For testing uncomment the next lines
'''
impName = "triple_case_case_case_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine   

entries = list()
commas = list()

for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            buildpaths.graphgen.mapOperations(operationImp, operationMch)
            buildpaths.makepaths(graphgen.nodemap)
            buildpaths.makenodes(graphgen.nodemap)
            inputs = instgen.make_inputs(operationImp.getElementsByTagName("Input_Parameters")[0])
            inputs = inputs.replace(" ", "") #Eliminating blank spaces
            for i in range(len(inputs)-1):
                if inputs[i] == ',':
                    commas.append(i)
            for i in range(len(commas)):
                if i == 0:
                    entries.append(inputs[1:commas[0]:])
                    entries.append(inputs[commas[0]+1:commas[i+1]:])
                else:
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[i]+1:commas[i+1]:])
            operationname = operationImp.getAttribute("name")
            CodeCoverage(buildpaths.paths, entries, operationname, buildpaths.nodeStatus)

'''
