import buildpredicate
import instgen
from xml.dom import minidom

'''
predicate: module responsible for making the predicate that walk through a path.
minidom: module responsible for making a tree from a xml file.
'''


def CodeCoverage(operationImp, operationMch, paths, inputs, operationName, nodeStatus, importedMch, seesMch, impName,
                 directory, atelierBDir, proBPath):
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
    # Initialisation
    count = dict()
    pathToCover = 1
    allInVariables = list()
    allOutVariables = list()
    aux = paths
    covered = False
    # Process
    while (len(aux) != 0 and covered == False):
        countcover = 0
        for p in sorted(aux.keys()):  # Searching for the path with the biggest number of non covered nodes
            count[p] = 0
            for node in paths[p]:
                if nodeStatus[node] == False:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                pathToCover = p
        ExistValues, inVariables, outVariables = makePredicateCodeCoverage(operationImp, operationMch,
                                                                                          aux[pathToCover],
                                                                                          pathToCover, inputs,
                                                                                          operationName, nodeStatus,
                                                                                          importedMch, seesMch, impName,
                                                                                          directory, atelierBDir,
                                                                                          proBPath)  # Finding the predicate
        if ExistValues:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
        for node in nodeStatus:  # Counting if all branches were covered, if True, the while stops.
            if nodeStatus[node] == True:
                countcover += 1
        if countcover == len(nodeStatus):
            covered = True
        del aux[pathToCover]  # Deleting the path of aux to start a new path
        for p in sorted(aux.keys()):
            count[p] = 0
            for node in paths[p]:
                if nodeStatus[node] == False:
                    count[p] += 1
            if count[p] == 0:  # If all nodes of a path are covered, delete this path from aux
                del aux[p]
        if len(aux) != 0:  # If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys())  # Passing the lowest number
    return covered, allInVariables, allOutVariables


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
    buildpredicate.setsSolver(operationImp.parentNode.parentNode, operationMch.parentNode.parentNode, importedMch,
                              seesMch)
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while (len(way) != 0):  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir)
        del way[len(way) - 1]
    ExistValues, variables, predicate = buildpredicate.checkPredicate(predicateXML,
                                                           "Code Coverage - trying to get inputs for path " + str(
                                                               pathToCover), inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An input option is " + variables + "\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames,
                                                       operationImp, importedMch, operationName, impName, variables,
                                                       variablesList, directory, atelierBDir, proBPath)
        if ExistValues:
            for node in path:  # Setting all branches of the path to True (Covered)
                nodeStatus[node] = True
    elif predicate != "":
        print("Inputs were NOT found for the predicate: " + predicate)
        print("The nodes of this path were NOT covered yet\n")
        output = []
    else:
        print("Operation Without Test")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output


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
    # Initialisation
    count = dict()
    allInVariables = list()
    allOutVariables = list()
    pathToCover = 1
    aux = paths
    covered = False
    # Process
    while (len(aux) != 0 and not covered):
        countcover = 0
        for p in sorted(aux.keys()):  # Searching for the path with the biggest number of non covered branches
            count[p] = 0
            for branch in branchesPaths[p]:
                if not branchStatus[branch]:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                pathToCover = p
        ExistValues, inVariables, outVariables = makePredicateBranchCoverage(operationImp, operationMch,
                                                                                            aux[pathToCover],
                                                                                            branchStatus, branchesPaths,
                                                                                            pathToCover, inputs,
                                                                                            operationName, importedMch,
                                                                                            seesMch, impName, directory,
                                                                                            atelierBDir, proBPath)
        if ExistValues:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
        for branch in branchStatus:  # Counting if all branches were covered, if True, the while stops.
            if branchStatus[branch]:
                countcover += 1
        if countcover == len(branchStatus):
            covered = True
        del aux[pathToCover]  # Deleting the path of aux to start a new path
        for p in sorted(aux.keys()):  # Searching for the path with the biggest number of non covered branches
            count[p] = 0
            for branch in branchesPaths[p]:
                if not branchStatus[branch]:
                    count[p] += 1
            if count[p] == 0:  # If all branches of this path are covered, delete this path from aux
                del aux[p]
        if len(aux) != 0:  # If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys())  # Passing the lowest number
    return covered, allInVariables, allOutVariables


def makePredicateBranchCoverage(operationImp, operationMch, path, branchStatus, branchesPaths, pathToCover,
                                inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    """
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
    """
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    buildpredicate.setsSolver(operationImp.parentNode.parentNode, operationMch.parentNode.parentNode, importedMch,
                              seesMch)
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while len(way) != 0:  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir)
        del way[len(way) - 1]
    ExistValues, variables, predicate = buildpredicate.checkPredicate(predicateXML,
                                                                      "Branch Coverage - trying to get inputs for "
                                                                      "guide " + str(
                                                                          pathToCover), inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An input option is " + variables + "\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames,
                                                       operationImp, importedMch, operationName, impName,
                                                       variables, variablesList, directory, atelierBDir, proBPath)
        if ExistValues:
            for branch in branchesPaths[pathToCover]:  # Setting all branches of the path to True (Covered)
                branchStatus[branch] = True
    else:
        print("Inputs were NOT found for the predicate: " + predicate)
        print("The branches of this path were NOT covered\n")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output


def PathCoverage(operationImp, operationMch, paths, inputs, operationName, importedMch, seesMch, impName, directory,
                 atelierBDir, proBPath):
    """
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
    """
    # Initialisation
    allInVariables = list()
    allOutVariables = list()
    uncoveredPaths = list()
    pathToCover = 1
    aux = paths.copy()
    allcovered = True
    # Process
    while len(aux) != 0:
        covered, inVariables, outVariables = makePredicatePathCoverage(operationImp, operationMch,
                                                                                      aux[pathToCover],
                                                                                      pathToCover, inputs,
                                                                                      operationName,
                                                                                      importedMch, seesMch, impName,
                                                                                      directory,
                                                                                      atelierBDir,
                                                                                      proBPath)  # Finding the predicate
        if covered:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
        else:
            uncoveredPaths.append(pathToCover)
        del aux[pathToCover]  # Deleting the path of aux to start a new path
        if len(aux) != 0:  # If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys())  # Passing the lowest number
        if len(uncoveredPaths) != 0:
            allcovered = False
    return allcovered, allInVariables, allOutVariables, uncoveredPaths


def makePredicatePathCoverage(operationImp, operationMch, path, pathToCover, inputs, operationName,
                              importedMch, seesMch, impName, directory, atelierBDir, proBPath):
    """
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
    """
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    buildpredicate.setsSolver(operationImp.parentNode.parentNode, operationMch.parentNode.parentNode, importedMch,
                              seesMch)
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while (len(way) != 0):  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir)
        del way[len(way) - 1]
    ExistValues, variables, predicate = buildpredicate.checkPredicate(predicateXML,
                                                           "Path Coverage - trying to get inputs for path " + str(
                                                               pathToCover), inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An option is " + variables + "\n")
        output, ExistValues = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames,
                                                       operationImp, importedMch, operationName, impName, variables,
                                                       variablesList, directory, atelierBDir, proBPath)
    else:
        print("Inputs were NOT found for the predicate: " + predicate)
        print("This path can NOT be covered\n")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output


def LineCoverage(operationImp, operationMch, inputs, operationName, importedMch, seesMch, impName, directory,
                 atelierBDir, proBPath):
    allInVariables = list()
    allOutVariables = list()
    allUserVariables = list()
    for node in sorted(buildpredicate.buildpaths.graphgen.nodemap.keys()):
        if (buildpredicate.buildpaths.graphgen.nodetype[node] == "Instruction"
            or buildpredicate.buildpaths.graphgen.nodetype[node] == "Skip"
            or buildpredicate.buildpaths.graphgen.nodetype[node] == "Call"):
            for previousNode in buildpredicate.buildpaths.graphgen.nodemap[node]:
                if buildpredicate.buildpaths.graphgen.nodetype[previousNode] == "ConditionWhile" or \
                                buildpredicate.buildpaths.graphgen.nodetype[previousNode] == "Condition":
                    buildpredicate.buildpaths.makePartialPaths(buildpredicate.buildpaths.graphgen.nodemap, node)
                    for pathkey in sorted(buildpredicate.buildpaths.paths.keys()):
                        covered, inVariables, outVariables, userVariables = makePredicateLineCoverage(operationImp,
                                                                                                      operationMch,
                                                                                                      node,
                                                                                                      buildpredicate.buildpaths.paths[
                                                                                                          pathkey],
                                                                                                      inputs,
                                                                                                      operationName,
                                                                                                      importedMch,
                                                                                                      seesMch,
                                                                                                      impName,
                                                                                                      directory,
                                                                                                      atelierBDir,
                                                                                                      proBPath)
                        if covered:
                            allInVariables.append(inVariables)
                            allOutVariables.append(outVariables)
                            allUserVariables.append(userVariables)
                            break
                        else:
                            if pathkey == max(buildpredicate.buildpaths.paths.keys()):
                                return False, allInVariables, allOutVariables, allUserVariables
                    buildpredicate.buildpaths.clearGraphs()
    return True, allInVariables, allOutVariables, allUserVariables


def makePredicateLineCoverage(operationImp, operationMch, node, path, inputs, operationName, importedMch, seesMch,
                              impName, directory, atelierBDir, proBPath):
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
    while (len(way) != 0):  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Line Coverage - trying to reach line " + node,
                                                           inputs, proBPath)
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An option is " + variables + "\n")
        # output, ExistValues = buildpredicate.getOutput(path, node, inputs, outputs, fixedNames, docXML,
        #                                               operationImp, importedMch, operationName, impName, variables,
        #                                               variablesList, directory, atelierBDir)
        output = []
    else:
        print("Inputs were NOT found for the predicate: " + predicate)
        print("The line " + node + " can NOT be covered yet\n")
        output = []
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList


def ClauseCoverage(operationImp, operationMch, inputs, completePaths, operationName, importedMch, seesMch, impName,
                   directory, atelierBDir, proBPath):
    allInVariables = list()
    allOutVariables = list()
    clauseData = list()
    clauseMap = dict()
    clauseCond = list()
    coveredClauses = dict()
    nodemapKeys = list()
    uncoveredPredicates = list()
    allCovered = True
    predNumber = 1
    clauseNumber = 1
    covered = True
    for node in sorted(buildpredicate.buildpaths.graphgen.nodemap.keys()):  # The key is a string, changing for int
        nodemapKeys.append(int(node))
    for node in sorted(nodemapKeys):
        maxnode = node
        for father in buildpredicate.buildpaths.graphgen.nodemap[str(node)]:
            if maxnode < int(father):
                maxnode = int(father)
        if ((buildpredicate.buildpaths.graphgen.nodetype[str(node)] == "Condition"
             or (buildpredicate.buildpaths.graphgen.nodetype[str(node)] == "ConditionWhile"
                 and maxnode > node)) and str(node) != '1'):
            clauseNumber = getClauses(buildpredicate.buildpaths.graphgen.nodedata[str(node)], clauseData, clauseMap,
                                      clauseCond, predNumber, clauseNumber)
            previousPaths = len(buildpredicate.buildpaths.partialPaths.keys())
            buildpredicate.buildpaths.makePartialPaths(buildpredicate.buildpaths.graphgen.nodemap, str(node))
            for key in clauseMap[str(predNumber)]:
                coveredClauses[key] = False
                coveredClauses[-key] = False
            for pathkey in sorted(buildpredicate.buildpaths.partialPaths.keys()):
                originalVarList = []
                for var in allInVariables:
                    originalVarList.append(var)
                if pathkey > previousPaths:
                    covered, fixedNames, outputs, variablesList, docXML = makePredicateClauseCoverage(operationImp,
                                                                                                      operationMch,
                                                                                                      str(node),
                                                                                                      buildpredicate.buildpaths.partialPaths[
                                                                                                          pathkey],
                                                                                                      clauseData,
                                                                                                      clauseMap,
                                                                                                      predNumber,
                                                                                                      inputs,
                                                                                                      operationName,
                                                                                                      importedMch,
                                                                                                      seesMch, impName,
                                                                                                      directory,
                                                                                                      atelierBDir,
                                                                                                      allInVariables,
                                                                                                      proBPath,
                                                                                                      coveredClauses)
                    if covered:
                        break
                    else:
                        allInVariables = originalVarList
            if not covered:
                allCovered = False
                uncoveredPredicates.append(instgen.selfcaller(buildpredicate.buildpaths.graphgen.nodedata[str(node)]))
            predNumber += 1
    print(buildpredicate.buildpaths.paths)
    for i in range(len(allInVariables)):
        ExistValues = False
        if i > 0:
            buildpredicate.setsSolver(operationImp.parentNode.parentNode, operationMch.parentNode.parentNode,
                                      importedMch, seesMch)
        for completePathsKey in sorted(completePaths.keys()):
            for pathkey in sorted(buildpredicate.buildpaths.partialPaths.keys()):
                countPartial = 0
                for node in buildpredicate.buildpaths.partialPaths[pathkey]:
                    if node in completePaths[completePathsKey]:
                        countPartial += 1
                if countPartial == len(buildpredicate.buildpaths.partialPaths[pathkey]):
                    out, ExistValues = buildpredicate.getOutput(completePaths[completePathsKey], completePathsKey,
                                                                allInVariables[i], outputs,
                                                                fixedNames, operationImp, importedMch,
                                                                operationName,
                                                                impName, allInVariables[i], variablesList, directory,
                                                                atelierBDir, proBPath)
                    if ExistValues:
                        allOutVariables.append(out)
                        break
            if ExistValues:
                break
    buildpredicate.buildpaths.partialPaths.clear()
    # print(allInVariables, allOutVariables)
    # for i in range(len(allInVariables)):
    #    print(allInVariables[i], allOutVariables[i])
    return allCovered, allInVariables, allOutVariables, uncoveredPredicates, coveredClauses


def makePredicateClauseCoverage(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber,
                                inputs, operationName, importedMch, seesMch, impName, directory, atelierBDir,
                                allInVariables, proBPath, coveredClauses):
    ExistValues = True
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    buildpredicate.setsSolver(operationImp.parentNode.parentNode, operationMch.parentNode.parentNode, importedMch,
                              seesMch)
    outputs = getOutputsVariables(operationImp)
    variablesList = list()
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    testClauses(operationImp, node, path, clauseData, clauseMap, predNumber, inputs,
                operationName, importedMch, impName, directory, atelierBDir, proBPath, allInVariables,
                fixedNames, outputs, docXML, predicateXML, min(clauseMap[str(predNumber)]), coveredClauses)
    for clause in coveredClauses.keys():
        if not coveredClauses[clause]:
            ExistValues = False
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, fixedNames, outputs, variablesList, docXML


def testClauses(operationImp, node, path, clauseData, clauseMap, predNumber, inputs, operationName, importedMch,
                impName, directory, atelierBDir, proBPath, allInVariables, fixedNames, outputs, docXML, predicateXML,
                clauseToTest, coveredClauses, testingClauses=[]):
    needTest = False
    testingClauses.append(clauseToTest)
    enteredInPositive = False
    for clause in coveredClauses.keys():
        if not coveredClauses[clause]:
            needTest = True
    needTest2 = len(testingClauses)
    for clause in testingClauses:
        if coveredClauses[clause]:
            needTest2 -= 1
    if needTest and needTest2 != 0:
        enteredInPositive = True
        way = list()
        posMut = list()
        changedVariablesWhile = list()
        if clauseToTest == min(clauseMap[str(predNumber)]):
            predicateXML.appendChild(docXML.createTextNode("\n"))
            predicateXML.appendChild(clauseData[clauseToTest-1].cloneNode(20))
            predicateXML.appendChild(docXML.createTextNode("\n"))
        elif clauseToTest == min(clauseMap[str(predNumber)])+1: #Create Nary_Pred
            naryPred = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20),
                                                                  clauseData[clauseToTest-1].cloneNode(20),
                                                                  "&", docXML)
            predicateXML.replaceChild(naryPred, predicateXML.firstChild.nextSibling)
        else:
            predicateXML.firstChild.nextSibling.appendChild(clauseData[clauseToTest-1].cloneNode(20))
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode("\n"))
        positivePredicateXML = predicateXML.cloneNode(20)  # THE CLAUSES
        for key in path:
            way.append(key)
        del way[len(way) - 1]
        while len(way) != 0:  # While there is nodes in the way, get the predicate
            node = way[len(way) - 1]
            predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                          inputs, outputs, fixedNames,
                                                                                          docXML, posMut, operationImp,
                                                                                          importedMch, operationName,
                                                                                          impName,
                                                                                          changedVariablesWhile,
                                                                                          directory,
                                                                                          atelierBDir)
            del way[len(way) - 1]
        ExistValues, variables, predicate = buildpredicate.checkPredicate(predicateXML,
                                                                          "Clause coverage - trying to reach line " + node,
                                                                          inputs, proBPath)
        if ExistValues:
            print("Found inputs for the predicate: " + predicate)
            print("The inputs are: "+ variables)
            coveredClauses[clauseToTest] = True
            if variables not in allInVariables:
                allInVariables.append(variables)
            if clauseToTest < max(clauseMap[str(predNumber)]):
                testClauses(operationImp, node, path, clauseData, clauseMap, predNumber, inputs, operationName,
                            importedMch, impName, directory, atelierBDir, proBPath, allInVariables, fixedNames, outputs,
                            docXML, positivePredicateXML.cloneNode(20), clauseToTest + 1, coveredClauses, testingClauses)
        else:
            print("Not found inputs for the predicate: " + predicate + " testing the negative anyway")
    del testingClauses[-1]
    needTest = False
    testingClauses.append(-clauseToTest)
    for clause in coveredClauses.keys():
        if not coveredClauses[clause]:
            needTest = True
    needTest2 = len(testingClauses)
    for clause in testingClauses:
        if coveredClauses[clause]:
            needTest2 -= 1
    if needTest and needTest2 != 0:
        if enteredInPositive:
            predicateXML = positivePredicateXML.cloneNode(20)
            if clauseToTest == min(clauseMap[str(predNumber)]):
                unaryNode = buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20),
                                                                        docXML)
                predicateXML.replaceChild(unaryNode, predicateXML.firstChild.nextSibling)
            else:
                unaryNode = buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20),
                                                                        docXML)
                predicateXML.firstChild.nextSibling.replaceChild(unaryNode,
                                                                 predicateXML.firstChild.nextSibling.lastChild.previousSibling)
        else:
            if clauseToTest == min(clauseMap[str(predNumber)]):
                predicateXML.appendChild(docXML.createTextNode("\n"))
                predicateXML.appendChild(buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20), docXML))
                predicateXML.appendChild(docXML.createTextNode("\n"))
            elif clauseToTest == min(clauseMap[str(predNumber)]) + 1:  # Create Nary_Pred
                naryPred = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20),
                                                                      buildpredicate.nodescreator.createUnaryNode(
                                                                          clauseData[clauseToTest - 1].cloneNode(20), docXML),
                                                                      "&", docXML)
                predicateXML.replaceChild(naryPred, predicateXML.firstChild.nextSibling)
            else:
                predicateXML.firstChild.nextSibling.appendChild(buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20)), docXML)
                predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode("\n"))

        negativePredicateXML = predicateXML.cloneNode(20)
        way = []
        posMut = []
        changedVariablesWhile = []
        for key in path:
            way.append(key)
        del way[len(way) - 1]
        while len(way) != 0:  # While there is nodes in the way, get the predicate
            node = way[len(way) - 1]
            predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                          inputs, outputs, fixedNames,
                                                                                          docXML, posMut, operationImp,
                                                                                          importedMch, operationName,
                                                                                          impName,
                                                                                          changedVariablesWhile,
                                                                                          directory,
                                                                                          atelierBDir)
            del way[len(way) - 1]
        ExistValues, variables, predicate = buildpredicate.checkPredicate(predicateXML,
                                                                          "Clause coverage - trying to reach line " + node,
                                                                          inputs, proBPath)
        if ExistValues:
            print("Found inputs for the predicate: " + predicate)
            print("The inputs are: " + variables)
            coveredClauses[-clauseToTest] = True
            if variables not in allInVariables:
                allInVariables.append(variables)
            if clauseToTest < max(clauseMap[str(predNumber)]):
                testClauses(operationImp, node, path, clauseData, clauseMap, predNumber, inputs, operationName,
                            importedMch, impName, directory, atelierBDir, proBPath, allInVariables, fixedNames, outputs,
                            docXML, negativePredicateXML.cloneNode(20), clauseToTest + 1, coveredClauses, testingClauses)
        else:
            print("Not found inputs for the predicate: " + predicate + " end of test for this combination of clauses")
    del testingClauses[-1]


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
                    if Id.getAttribute('value') not in inputs:
                        inputs.append(Id.getAttribute('value'))
                        variablesList.append(Id.getAttribute('value'))
    for childnode in operationMch.parentNode.parentNode.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if (childnode.tagName == "Parameters" or childnode.tagName == "Variables" or
                        childnode.tagName == 'Concrete_Variables' or childnode.tagName == 'Abstract_Variables'):
                allId = childnode.getElementsByTagName('Id')
                for Id in allId:
                    if Id.getAttribute('value') not in inputs:
                        inputs.append(Id.getAttribute('value'))
                        variablesList.append(Id.getAttribute('value'))
    solveAddVariablesToInputImportsAndSees(operationImp, importedMch, operationMch, inputs, variablesList, directory)
    solveAddVariablesToInputImportsAndSees(operationImp, seesMch, operationMch, inputs, variablesList, directory, True)


def solveAddVariablesToInputImportsAndSees(operationImp, machines, operationMch, inputs, variablesList, directory,
                                           isSees=False):
    for mch in machines:
        importedImplementation = buildpredicate.buildpaths.graphgen.getImpWithImportedMch(mch, directory)
        if importedImplementation is None and isSees == False:
            print('There is a machine that don\'t have implementation, this may break the algorithm')
        else:
            for childnode in importedImplementation.firstChild.childNodes:
                if childnode.nodeType != childnode.TEXT_NODE:
                    if (childnode.tagName == "Parameters" or childnode.tagName == "Variables" or
                                childnode.tagName == 'Concrete_Variables' or childnode.tagName == 'Abstract_Variables'):
                        allId = childnode.getElementsByTagName('Id')
                        for Id in allId:
                            if not Id.getAttribute('value') in inputs:
                                inputs.append(Id.getAttribute('value'))
                                variablesList.append(Id.getAttribute('value'))


def getFixedNames(operationImp, importedMch, seesMch, operationMch):
    fixedNames = list()
    solveFixedNames(operationImp.parentNode.parentNode.childNodes, fixedNames)  # Implementation
    for mch in importedMch:  # Imported machines
        solveFixedNames(mch.firstChild.childNodes, fixedNames)
    solveFixedNames(operationMch.parentNode.parentNode.childNodes, fixedNames)  # Machine of the implementation
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
                        # if childnode.tagName == "Sets":
                        #    for setTree in childnode.childNodes:
                        #        if setTree.nodeType != setTree.TEXT_NODE:
                        #            allId = childnode.getElementsByTagName('Id')
                        #            for Id in allId:
                        #                if Id.getAttribute not in fixedNames:
                        #                    fixedNames.append(Id.getAttribute('value'))


def getOutputsVariables(operationImp):
    """
    Function responsible for getting the Outputs for an operation
    Input:
    operationImp : The operation node in the implementation tree

    Output:
    entries: A list with all the inputs
    """
    if operationImp.getElementsByTagName("Output_Parameters") != []:
        inputs = instgen.make_inputs(operationImp.getElementsByTagName("Output_Parameters")[0])
        inputs = inputs.replace(" ", "")  # Eliminating blank spaces
        entries = list()
        commas = list()
        for i in range(len(inputs) - 1):
            if inputs[i] == ',':
                commas.append(i)
        if len(commas) == 0:
            entries.append(inputs[1:len(inputs) - 1:])
            return entries
        else:
            for i in range(len(commas)):
                if i == 0:
                    entries.append(inputs[1:commas[0]:])
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i] + 1:len(inputs) - 1:])
                    else:
                        entries.append(inputs[commas[0] + 1:commas[i + 1]:])
                else:
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i] + 1:len(inputs) - 1:])
                    else:
                        entries.append(inputs[commas[i] + 1:commas[i + 1]:])
            return entries
    else:
        return []


# For testing uncomment the next lines
'''
impName = "triple_case_case_case_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine   

entries = list()
commas = list()
'''
