import buildpredicate
import instgen
import os
from xml.dom import minidom
'''
predicate: module responsible for making the predicate that walk through a path.
minidom: module responsible for making a tree from a xml file.
'''

def CodeCoverage(operationImp, operationMch, paths, inputs, operationName, nodeStatus, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    '''
    Code Coverage, function responsible of making the Code Coverage, in CC we need to exercise every instruction of the code at least once.

    Input:
    operationImp: The node of the operation in the implementation tree.
    paths: All paths of the graph of the operation
    inputs: The inputs of the operation
    operationName: The name of the operation
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
                                                                                          pathToCover, inputs, operationName, nodeStatus,
                                                                                          importedMch, seesMch, impName, directory, atelierBDir,
                                                                                          proBPath) #Finding the predicate
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

def makePredicateCodeCoverage(operationImp, operationMch, path, pathToCover, inputs, operationName,
                              nodeStatus, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    '''
    Make the predicate for Code Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    inputs: The inputs of the operation
    operationName: The name of the operation
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
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile, directory, atelierBDir)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Code Coverage - trying to get inputs for path "+str(pathToCover), inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, docXML,
                                                       operationImp, importedMch, operationName, impName, variables,
                                                       variablesList, directory, atelierBDir, proBPath)
        if ExistValues:
            for node in path: #Setting all branches of the path to True (Covered)
                nodeStatus[node] = True
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The nodes of this path were NOT covered yet\n")
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList

def BranchCoverage(operationImp, operationMch, branchesPaths, branchStatus, paths, inputs, operationName,
                   importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    '''
    Branch Coverage, function responsible of making the Branch Coverage, in BC we need to exercise every branch of the code at least once.

    Input:
    operationImp: The node of the operation in the implementation tree.
    paths: All paths of the graph of the operation
    inputs: The inputs of the operation
    operationName: The name of the operation
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
                                                                                            operationName, importedMch, seesMch, impName, directory,
                                                                                            atelierBDir, proBPath)
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

def makePredicateBranchCoverage(operationImp, operationMch, path, branchStatus, branchesPaths, pathToCover,
                                inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    '''
    Make the predicate for Branch Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    path: The path being evaluated
    inputs: The inputs of the operation
    operationName: The name of the operation
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
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile, directory, atelierBDir)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Branch Coverage - trying to get inputs for guide "+str(pathToCover), inputs, proBPath)
    if ExistValues == True:
        print("Input(s) were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, docXML,
                                                       operationImp, importedMch, operationName, impName, variables,
                                                       variablesList, directory, atelierBDir, proBPath)
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

def PathCoverage(operationImp, operationMch, paths, inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    '''
    Path Coverage, function responsible of making the Path Coverage, in PC we need to exercise every path of the code at least once.

    Input:
    operationImp: The node of the operation in the implementation tree.
    paths: All paths of the graph of the operation
    inputs: The inputs of the operation
    operationName: The name of the operation
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
                                                                                      pathToCover, inputs, operationName,
                                                                                      importedMch, seesMch, impName, directory,
                                                                                      atelierBDir, proBPath) #Finding the predicate
        if covered:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
            allUserVariables.append(userVariables)
        del aux[pathToCover] #Deleting the path of aux to start a new path
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
    return covered, allInVariables, allOutVariables, allUserVariables

def makePredicatePathCoverage(operationImp, operationMch, path, pathToCover, inputs, operationName,
                              importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    '''
    Make the predicate for Path Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    path: The path being evaluated
    inputs: The inputs of the operation
    operationName: The name of the operation
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
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile, directory, atelierBDir)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, docXML,
                                                       operationImp, importedMch, operationName, impName, variables,
                                                       variablesList, directory, atelierBDir, proBPath)        
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("This path can NOT be covered\n")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList

def LineCoverage(operationImp, operationMch, inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    count = dict()
    allInVariables = list()
    allOutVariables = list()
    allUserVariables = list()
    covered = True
    for node in sorted(buildpredicate.buildpaths.graphgen.nodemap.keys()):
        if (buildpredicate.buildpaths.graphgen.nodetype[node] == "Instruction" or buildpredicate.buildpaths.graphgen.nodetype[node] == "Skip"
            or buildpredicate.buildpaths.graphgen.nodetype[node] == "Call"):
            for previousNode in buildpredicate.buildpaths.graphgen.nodemap[node]:
                if buildpredicate.buildpaths.graphgen.nodetype[previousNode] == "ConditionWhile" or buildpredicate.buildpaths.graphgen.nodetype[previousNode] == "Condition":
                    buildpredicate.buildpaths.makepathsWithStart(buildpredicate.buildpaths.graphgen.nodemap, node)
                    for pathkey in sorted(buildpredicate.buildpaths.paths.keys()):
                        covered, inVariables, outVariables, userVariables = makePredicateLineCoverage(operationImp, operationMch, node,
                                                                                                      buildpredicate.buildpaths.paths[pathkey],
                                                                                                      inputs, operationName, importedMch, seesMch,
                                                                                                      impName, directory, atelierBDir, proBPath)
                        if covered == True:
                            allInVariables.append(inVariables)
                            allOutVariables.append(outVariables)
                            allUserVariables.append(userVariables)
                            break
                        else:
                            if pathkey == max(buildpredicate.buildpaths.paths.keys()):
                                return False, allInVariables, allOutVariables, allUserVariables
                    buildpredicate.buildpaths.clearGraphs()
    return True, allInVariables, allOutVariables, allUserVariables

def makePredicateLineCoverage(operationImp, operationMch, node, path, inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile, directory, atelierBDir)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Line Coverage - trying to reach line "+node, inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
        #output, ExistValues = buildpredicate.getOutput(path, node, inputs, outputs, fixedNames, docXML,
        #                                               operationImp, importedMch, operationName, impName, variables,
        #                                               variablesList, directory, atelierBDir)
        output = []
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The line "+node+" can NOT be covered yet\n")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList

def ClauseCoverage(operationImp, operationMch, inputs, completePaths, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    count = dict()
    allInVariables = list()
    allOutVariables = list()
    clauseData = list()
    clauseMap = dict()
    clauseCond = list()
    predNumber = 1
    clauseNumber = 1
    covered = True
    for node in sorted(buildpredicate.buildpaths.graphgen.nodemap.keys()):
        if ((buildpredicate.buildpaths.graphgen.nodetype[node] == "Condition" or buildpredicate.buildpaths.graphgen.nodetype[node] == "ConditionWhile")
            and node != '1'):
            clauseNumber = getClauses(buildpredicate.buildpaths.graphgen.nodedata[node], clauseData, clauseMap, clauseCond, predNumber, clauseNumber)
            buildpredicate.buildpaths.makePartialPaths(buildpredicate.buildpaths.graphgen.nodemap, node)
            for pathkey in sorted(buildpredicate.buildpaths.partialPaths.keys()):
                print(buildpredicate.buildpaths.partialPaths[pathkey])
                covered, fixedNames, outputs, variablesList, docXML = makePredicateClauseCoverage(operationImp, operationMch, node,
                                                                                                  buildpredicate.buildpaths.partialPaths[pathkey],
                                                                                                  clauseData, clauseMap, clauseCond, predNumber,
                                                                                                  inputs, operationName, importedMch,
                                                                                                  seesMch, impName, directory, atelierBDir,
                                                                                                  allInVariables, proBPath)
                if covered:
                    break
            predNumber += 1
    print(buildpredicate.buildpaths.partialPaths)
    for i in range(len(allInVariables)):
        ExistValues = False
        for completePathsKey in sorted(completePaths.keys()):
            for pathkey in sorted(buildpredicate.buildpaths.partialPaths.keys()):
                countPartial = 0
                for node in buildpredicate.buildpaths.partialPaths[pathkey]:
                    if node in completePaths[completePathsKey]:
                        countPartial += 1
                print(countPartial, completePaths[completePathsKey], buildpredicate.buildpaths.partialPaths[pathkey])
                if countPartial == len(buildpredicate.buildpaths.partialPaths[pathkey]):
                    out, ExistValues = buildpredicate.getOutput(completePaths[completePathsKey], completePathsKey, allInVariables[i], outputs,
                                                                fixedNames, docXML, operationImp, importedMch, operationName,
                                                                impName, allInVariables[i], variablesList, directory, atelierBDir, proBPath)
                    if ExistValues:
                        allOutVariables.append(out)
                        break
            if ExistValues:
                break
    buildpredicate.buildpaths.partialPaths.clear()
    print(allInVariables, allOutVariables)
    for i in range(len(allInVariables)):
        print(allInVariables[i], allOutVariables[i])
    return True, allInVariables, allOutVariables

def makePredicateClauseCoverage(operationImp, operationMch, node, path, clauseData, clauseMap, clauseCond, predNumber,
                                inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, allInVariables, proBPath):
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    outputs = getOutputsVariables(operationImp)
    variablesList = list()
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    del way[len(way)-1]
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp, importedMch, operationName,
                                                                                      impName, False, changedVariablesWhile, directory, atelierBDir)
        del way[len(way) - 1]
    ExistValues = testClauses(node, inputs, predicateXML, clauseMap, clauseData, predNumber, docXML,
                              min(clauseMap[str(predNumber)])-1, allInVariables, proBPath)
    if ExistValues:
        print('predicate covered by clause coverage')
    else:
        print('predicate cannot be covered')
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, fixedNames, outputs, variablesList, docXML

def testClauses(node, inputs, predicateXML, clauseMap, clauseData, predNumber, docXML, clauseToTest, allInVariables, proBPath):
    if predicateXML.hasChildNodes():
        if predicateXML.firstChild.nextSibling.tagName == "Nary_Pred":
            predicateXML.firstChild.nextSibling.appendChild(clauseData[clauseToTest])
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
        else:
            naryPredNode = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20), clauseData[clauseToTest], "&", docXML)
            predicateXML.insertBefore(naryPredNode, predicateXML.lastChild)
    else:
        predicateXML.appendChild(docXML.createTextNode('\n'))
        predicateXML.appendChild(clauseData[clauseToTest])
        predicateXML.appendChild(docXML.createTextNode('\n'))
    predicate = instgen.make_inst(predicateXML)
    positivePredicateXML = predicateXML.cloneNode(20)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Clause coverage - trying to reach line "+node, inputs, proBPath)
    if ExistValues:
        if variables not in allInVariables:
            print(variables, allInVariables)
            allInVariables.append(variables)
        print("Input(s) were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
        unaryNode = buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest], docXML)
        predicateXML.firstChild.nextSibling.insertBefore(unaryNode, predicateXML.firstChild.nextSibling.lastChild)
        predicate = instgen.make_inst(predicateXML)
        ExistValues, variables = buildpredicate.checkPredicate(predicate, "Clause coverage - trying to reach line "+node, inputs, proBPath)
        if ExistValues and clauseToTest < max(clauseMap[str(predNumber)])-1:
            if variables not in allInVariables:
                print(variables, allInVariables)
                allInVariables.append(variables)
            print("Input(s) were found for the predicate: "+predicate)
            print("An option is "+variables+"\n")
            ExistValues = testClauses(node, inputs, positivePredicateXML, clauseMap, clauseData, predNumber, docXML, clauseToTest+1, allInVariables, proBPath)
            if not(ExistValues):
                ExistValues = testClauses(node, inputs, predicateXML, clauseMap, clauseData, predNumber, docXML, clauseToTest+1, allInVariables, proBPath)
            if ExistValues:
                print("Input(s) were found for the predicate: "+predicate)
                print("An option is "+variables+"\n")
                if variables not in allInVariables:
                    print(variables, allInVariables)
                    allInVariables.append(variables)
            else:
                print("Failed in one inner clause")
        else:
            if ExistValues:
                if variables not in allInVariables:
                    print(variables, allInVariables)
                    allInVariables.append(variables)
                print("Input(s) were found for the predicate: "+predicate)
                print("An option is "+variables+"\n")
            else:
                print("Failed to find the negative value")
    else:
        print("Failed to find the positive value of the clause")
    return ExistValues
        
def getClauses(node, clauseData, clauseMap, clauseCond, predNumber, clauseNumber):
    if node.tagName == "Nary_Pred" or node.tagName == "Binary_Pred":
        for childnode in node.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                clauseCond.append(node.getAttribute('op'))
                clauseNumber = getClauses(childnode, clauseData, clauseMap, clauseCond, predNumber, clauseNumber)
    elif node.tagName != "Attr":
        clauseData.append(node.cloneNode(20))
        if str(predNumber) in clauseMap:
            clauseMap[str(predNumber)].append(clauseNumber)
        else:
            clauseMap[str(predNumber)] = [clauseNumber]
        clauseNumber += 1
    return clauseNumber

def addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory):
    for childnode in operationImp.parentNode.parentNode.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if (childnode.tagName == "Parameters" or childnode.tagName == "Variables" or
                childnode.tagName == 'Concrete_Variables' or childnode.tagName == 'Abstract_Variables'):
                allId = childnode.getElementsByTagName('Id')
                for Id in allId:
                    if Id.getAttribute not in inputs:
                        inputs.append(Id.getAttribute('value'))
                        variablesList.append(Id.getAttribute('value'))
    solveAddVariablesToInputImportsAndSees(operationImp, importedMch, operationMch, inputs, variablesList, directory)
    solveAddVariablesToInputImportsAndSees(operationImp, seesMch, operationMch, inputs, variablesList, directory, True)
    
def solveAddVariablesToInputImportsAndSees(operationImp, machines, operationMch, inputs, variablesList, directory, isSees = False):
    for mch in machines:
        importedImplementation = buildpredicate.buildpaths.graphgen.getImpWithImportedMch(mch, directory)
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
            operationName = operationImp.getAttribute("name")
            CodeCoverage(buildpaths.paths, entries, operationName, buildpaths.nodeStatus)

'''
