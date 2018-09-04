import buildpredicate
import instgen
from xml.dom import minidom
import time

'''
predicate: module responsible for making the predicate that walk through a path.
minidom: module responsible for making a tree from a xml file.
'''


def CodeCoverage(operationImp, operationMch, paths, inputs, operationName, nodeStatus, importedMch, seesMch, impName,
                 directory, atelierBDir, proBPath, copy_directory, times, operationNumber, maxint):
    """
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
    """
    # Initialisation
    count = dict()
    pathToCover = 1
    allInVariables = list()
    allOutVariables = list()
    outputs, outputsTypes = getOutputsVariables(operationImp)
    aux = paths
    covered = False
    # Process
    tempoAvaliacaoTotal = 0
    start_time_GeneratingTests = time.time()
    while len(aux) != 0 and not covered:
        countcover = 0
        for p in sorted(aux.keys()):  # Searching for the path with the biggest number of non covered nodes
            count[p] = 0
            for node in paths[p]:
                if not nodeStatus[node]:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                pathToCover = p

        ExistValues, inVariables, outVariables, vL, vTypeL, tempoAvaliacaoUmPath = makePredicateCodeCoverage(operationImp, operationMch,
                                                                                       aux[pathToCover],
                                                                                       pathToCover, inputs, outputs,
                                                                                       operationName, nodeStatus,
                                                                                       importedMch, seesMch, impName,
                                                                                       directory, atelierBDir,
                                                                                       proBPath,
                                                                                       copy_directory, maxint)  # Finding the predicate
        for i in range(len(outputs)):
            vL.append(outputs[i])
            vTypeL.append(outputsTypes[i])
        if ExistValues:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
        for node in nodeStatus:  # Counting if all branches were covered, if True, the while stops.
            if nodeStatus[node]:
                countcover += 1
        if countcover == len(nodeStatus):
            covered = True
        del aux[pathToCover]  # Deleting the path of aux to start a new path
        for p in sorted(aux.keys()):
            count[p] = 0
            for node in paths[p]:
                if not nodeStatus[node]:
                    count[p] += 1
            if count[p] == 0:  # If all nodes of a path are covered, delete this path from aux
                del aux[p]
        if len(aux) != 0:  # If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys())  # Passing the lowest number
        tempoAvaliacaoTotal += tempoAvaliacaoUmPath
    times[operationNumber].append(time.time() - start_time_GeneratingTests - tempoAvaliacaoTotal)
    times[operationNumber].append(tempoAvaliacaoTotal)
    return covered, allInVariables, allOutVariables, vL, vTypeL


def makePredicateCodeCoverage(operationImp, operationMch, path, pathToCover, inputs, outputs, operationName,
                              nodeStatus, importedMch, seesMch, impName, directory, atelierBDir, proBPath,
                              copy_directory, maxint):
    """
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
    """
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    variablesTypeList = list()
    arrayModification = list()
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                        directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while len(way) != 0:  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName, variablesList,
                                                                                      variablesTypeList,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir, arrayModification)
        del way[len(way) - 1]
    buildpredicate.addVariablesToBePrinted(operationImp, importedMch, seesMch, operationMch, inputs, variablesList,
                                           variablesTypeList,
                                           directory)
    ExistValues, variables, predicate, tempoAvaliacaoEntrada = buildpredicate.checkPredicate(predicateXML,
                                                                      "Statement Coverage - trying to get inputs for path " + str(
                                                                          pathToCover) + "of the operation " + operationName, inputs+variablesList, proBPath,
                                                                      copy_directory,
                                                                      operationImp, operationMch, importedMch, seesMch, maxint)
    tempoAvaliacaoSaida = 0
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An input option is ", variables)
        output, ExistValues, tempoAvaliacaoSaida = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, operationImp,
                                                       operationMch, importedMch, seesMch,
                                                       operationName, impName, variables, variablesList,
                                                       variablesTypeList, directory, atelierBDir, proBPath,
                                                       copy_directory, maxint)
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
        for node in path:  # Setting all branches of the path to True (Covered)
            nodeStatus[node] = True
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList, variablesTypeList, tempoAvaliacaoEntrada + tempoAvaliacaoSaida


def BranchCoverage(operationImp, operationMch, branchesPaths, branchStatus, paths, inputs, operationName,
                   importedMch, seesMch, impName, directory, atelierBDir, proBPath, copy_directory, times, operationNumber, maxint):
    """
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
    """
    # Initialisation
    count = dict()
    allInVariables = list()
    allOutVariables = list()
    pathToCover = 1
    outputs, outputsTypes = getOutputsVariables(operationImp)
    aux = paths
    covered = False
    tempoAvaliacaoTotal = 0
    # Process
    start_time_GeneratingTests = time.time()
    while len(aux) != 0 and not covered:
        countcover = 0
        for p in sorted(aux.keys()):  # Searching for the path with the biggest number of non covered branches
            count[p] = 0
            for branch in branchesPaths[p]:
                if not branchStatus[branch]:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                pathToCover = p
        ExistValues, inVariables, outVariables, vL, vTypeL, tempoAvaliacaoUmPath = makePredicateBranchCoverage(operationImp, operationMch,
                                                                                         aux[pathToCover],
                                                                                         branchStatus, branchesPaths,
                                                                                         pathToCover, inputs, outputs,
                                                                                         operationName, importedMch,
                                                                                         seesMch, impName, directory,
                                                                                         atelierBDir, proBPath,
                                                                                         copy_directory, maxint)
        for i in range(len(outputs)):
            vL.append(outputs[i])
            vTypeL.append(outputsTypes[i])
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
        tempoAvaliacaoTotal += tempoAvaliacaoUmPath
    times[operationNumber].append(time.time() - start_time_GeneratingTests - tempoAvaliacaoTotal)
    times[operationNumber].append(tempoAvaliacaoTotal)
    return covered, allInVariables, allOutVariables, vL, vTypeL


def makePredicateBranchCoverage(operationImp, operationMch, path, branchStatus, branchesPaths, pathToCover, inputs,
                                outputs, operationName, importedMch, seesMch, impName, directory, atelierBDir, proBPath,
                                copy_directory, maxint):
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
    variablesTypeList = list()
    arrayModification = list()
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                        directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while len(way) != 0:  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName, variablesList,
                                                                                      variablesTypeList,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir, arrayModification)
        del way[len(way) - 1]
    buildpredicate.addVariablesToBePrinted(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                            directory)
    ExistValues, variables, predicate, tempoAvaliacaoEntrada = buildpredicate.checkPredicate(predicateXML,
                                                                      "Branch Coverage - trying to get inputs for "
                                                                      "guide " + str(
                                                                          pathToCover) + "of the operation " + operationName, inputs + variablesList, proBPath,
                                                                      copy_directory,
                                                                      operationImp, operationMch, importedMch, seesMch, maxint)
    tempoAvalicaoSaida = 0
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An input option is ", variables)
        output, ExistValues, tempoAvalicaoSaida = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, operationImp,
                                                       operationMch, importedMch, seesMch,
                                                       operationName, impName, variables, variablesList,
                                                       variablesTypeList, directory, atelierBDir, proBPath,
                                                       copy_directory, maxint)
        if ExistValues:
            for branch in branchesPaths[pathToCover]:  # Setting all branches of the path to True (Covered)
                branchStatus[branch] = True
    elif predicate != "":
        print("Inputs were NOT found for the predicate: " + predicate)
        print("The branches of this path were NOT covered\n")
        output = []
    else:
        print("Operation Without Test")
        output = []
        for branch in branchesPaths[pathToCover]:  # Setting all branches of the path to True (Covered)
            branchStatus[branch] = True
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList, variablesTypeList, tempoAvaliacaoEntrada + tempoAvalicaoSaida


def PathCoverage(operationImp, operationMch, paths, inputs, operationName, importedMch, seesMch, impName, directory,
                 atelierBDir, proBPath, copy_directory, times, operationNumber, maxint):
    """
    Path Coverage, function responsible of making the Path Coverage, in PC we need to exercise every path of the code at
    least once.

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
    aux: A scapegoat variable, to don't erase the paths variable
    covered: the answer if the operation is code covered or not

    Return:
    covered: If the operation is covered or not
    """
    # Initialisation
    allInVariables = list()
    allOutVariables = list()
    uncoveredPaths = list()
    outputs, outputsTypes = getOutputsVariables(operationImp)
    pathToCover = 1
    aux = paths.copy()
    allcovered = True
    start_time_GeneratingTests = time.time()
    tempoAvaliacaoTotal = 0
    # Process
    while len(aux) != 0:
        covered, inVariables, outVariables, vL, vTypeL, hasPredicate, tempoAvaliacaoUmPath = makePredicatePathCoverage(operationImp, operationMch,
                                                                                   aux[pathToCover], pathToCover,
                                                                                   inputs, outputs,
                                                                                   operationName, importedMch, seesMch,
                                                                                   impName,
                                                                                   directory, atelierBDir, proBPath,
                                                                                   copy_directory, maxint)
        for i in range(len(outputs)):
            vL.append(outputs[i])
            vTypeL.append(outputsTypes[i])
        if covered and hasPredicate:
            allInVariables.append(inVariables)
            allOutVariables.append(outVariables)
        else:
            if not hasPredicate:
                uncoveredPaths.append(pathToCover)
        del aux[pathToCover]  # Deleting the path of aux to start a new path
        if len(aux) != 0:  # If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys())  # Passing the lowest number
        if len(uncoveredPaths) != 0:
            allcovered = False
        tempoAvaliacaoTotal += tempoAvaliacaoUmPath
    times[operationNumber].append(time.time() - start_time_GeneratingTests - tempoAvaliacaoTotal)
    times[operationNumber].append(tempoAvaliacaoTotal)
    return allcovered, allInVariables, allOutVariables, uncoveredPaths, vL, vTypeL


def makePredicatePathCoverage(operationImp, operationMch, path, pathToCover, inputs, outputs, operationName,
                              importedMch, seesMch, impName, directory, atelierBDir, proBPath, copy_directory, maxint):
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
    variablesTypeList = list()
    arrayModification = list()
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                        directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while len(way) != 0:  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName, variablesList,
                                                                                      variablesTypeList,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir, arrayModification)
        del way[len(way) - 1]
    buildpredicate.addVariablesToBePrinted(operationImp, importedMch, seesMch, operationMch, inputs, variablesList,
                                           variablesTypeList,
                                           directory)
    ExistValues, variables, predicate, tempoAvaliacaoEntrada = buildpredicate.checkPredicate(predicateXML,
                                                                      "Path Coverage - trying to get inputs for path " + str(
                                                                          pathToCover) + "of the operation " + operationName, inputs+variablesList, proBPath,
                                                                      copy_directory,
                                                                      operationImp, operationMch, importedMch, seesMch, maxint)
    tempoAvaliacaoSaida = 0
    if ExistValues:
        print("Input(s) were found for the predicate: " + predicate)
        print("An input option is ", variables)
        output, ExistValues, tempoAvaliacaoSaida = buildpredicate.getOutput(path, pathToCover, inputs, outputs, fixedNames, operationImp,
                                                       operationMch, importedMch, seesMch,
                                                       operationName, impName, variables, variablesList,
                                                       variablesTypeList, directory, atelierBDir, proBPath,
                                                       copy_directory, maxint)
        covered = True
    elif predicate != "":
        print("Inputs were NOT found for the predicate: " + predicate)
        print("This path can NOT be covered\n")
        output = []
        covered = False
    else:
        print("Operation Without Test")
        output = []
        ExistValues = True
        covered = False
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, variables, output, variablesList, variablesTypeList, covered, tempoAvaliacaoEntrada + tempoAvaliacaoSaida


'''
def LineCoverage(operationImp, operationMch, inputs, operationName, importedMch, seesMch, impName, directory,
                 atelierBDir, proBPath, copy_directory):
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
                                                                                                      proBPath, copy_directory)
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
                              impName, directory, atelierBDir, proBPath, copy_directory):
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    variablesList = list()
    variablesTypeList = list()
    outputs = getOutputsVariables(operationImp)
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList, directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    for key in path:
        way.append(key)
    while (len(way) != 0):  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut, changedVariablesWhile = buildpredicate.makePredicateXML(node, predicateXML, way, path,
                                                                                      inputs, outputs, fixedNames,
                                                                                      docXML, posMut, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName, variablesList,
                                                                                      variablesTypeList,
                                                                                      changedVariablesWhile, directory,
                                                                                      atelierBDir)
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Line Coverage - trying to reach line " + node,
                                                           inputs, proBPath, copy_directory)
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
'''


def ClauseCoverage(operationImp, operationMch, inputs, completePaths, operationName, importedMch, seesMch, impName,
                   directory, atelierBDir, proBPath, copy_directory, times, operationNumber, maxint):
    allInVariables = list()
    allOutVariables = list()
    clauseData = list()
    clauseMap = dict()
    clauseCond = list()
    coveredClauses = dict()
    nodemapKeys = list()
    uncoveredPredicates = list()
    partialPathForInput = list()
    outputs, outputsTypes = getOutputsVariables(operationImp)
    originalVarList = []
    originalVarListType = []
    allCovered = True
    predNumber = 1
    clauseNumber = 1
    covered = True
    start_time_GeneratingTests = time.time()
    tempoAvaliacaoTotalEntradas = 0
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
            covered = False
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
                    print(buildpredicate.buildpaths.partialPaths[pathkey])
                    covered, fixedNames, variablesList, docXML, variablesListType, allVariablesOperation, tempoAvaliacaoUmPath = \
                        makePredicateClauseCoverage(operationImp, operationMch, str(node),
                                                    buildpredicate.buildpaths.partialPaths[pathkey], clauseData,
                                                    clauseMap, predNumber, inputs, outputs, operationName,
                                                    importedMch, seesMch, impName, directory, atelierBDir,
                                                    allInVariables, proBPath, coveredClauses, copy_directory, maxint)
                    tempoAvaliacaoTotalEntradas += tempoAvaliacaoUmPath
                    if covered:
                        for variable in allInVariables:
                            if variable not in originalVarList:
                                partialPathForInput.append(pathkey)
                        break
                    else:
                        allInVariables = originalVarList
            if not covered:
                allCovered = False
                uncoveredPredicates.append(instgen.selfcaller(buildpredicate.buildpaths.graphgen.nodedata[str(node)]))
            predNumber += 1
    for completePathsKey in sorted(completePaths.keys()):
        print(completePathsKey, completePaths[completePathsKey])
    tempoAvaliacaoSaidaTotal = 0
    for i in range(len(allInVariables)):
        ExistValues = False
        for completePathsKey in sorted(completePaths.keys()):

            countPartial = 0
            originalVarList = []
            originalVarListType = []
            for j in range(len(variablesList)):
                originalVarList.append(variablesList[j])
                originalVarListType.append(variablesListType[j])
            for node in buildpredicate.buildpaths.partialPaths[partialPathForInput[i]]:
                if node in completePaths[completePathsKey]:
                    countPartial += 1
            if countPartial == len(buildpredicate.buildpaths.partialPaths[partialPathForInput[i]]):
                out, ExistValues, tempoAvaliacaoSaida = buildpredicate.getOutput(completePaths[completePathsKey], completePathsKey,
                                                            allVariablesOperation, outputs,
                                                            fixedNames, operationImp, operationMch, importedMch,
                                                            seesMch, operationName, impName, allInVariables[i],
                                                            originalVarList, originalVarListType, directory,
                                                            atelierBDir, proBPath, copy_directory, maxint)
                tempoAvaliacaoSaidaTotal += tempoAvaliacaoSaida
            for j in range(len(outputs)):
                originalVarList.append(outputs[j])
                originalVarListType.append(outputsTypes[j])
            if ExistValues:
                allOutVariables.append(out)
                break
    buildpredicate.buildpaths.partialPaths.clear()
    # print(allInVariables, allOutVariables)
    # for i in range(len(allInVariables)):
    #    print(allInVariables[i], allOutVariables[i])
    tempoAvaliacaoTotal = tempoAvaliacaoTotalEntradas + tempoAvaliacaoSaidaTotal
    times[operationNumber].append(time.time() - (start_time_GeneratingTests + tempoAvaliacaoTotal))
    times[operationNumber].append(tempoAvaliacaoTotal)
    return allCovered, allInVariables, allOutVariables, uncoveredPredicates, coveredClauses, originalVarList, \
           originalVarListType


def makePredicateClauseCoverage(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber,
                                inputs, outputs, operationName, importedMch, seesMch, impName, directory, atelierBDir,
                                allInVariables, proBPath, coveredClauses, copy_directory, maxint):
    ExistValues = True
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement

    allVariablesOperation = list()
    variablesList = list()
    variablesTypeList = list()
    arrayModification = list()
    tempoAvaliacao = 0
    sizeinputs = len(inputs)
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                        directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    tempoAvaliacao = testClauses(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs, operationName,
                importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables, variablesList,
                variablesTypeList, fixedNames, outputs, docXML, predicateXML, min(clauseMap[str(predNumber)]),
                coveredClauses, copy_directory, arrayModification, tempoAvaliacao, maxint)
    for variable in inputs:
        allVariablesOperation.append(variable)
    for clause in coveredClauses.keys():
        if not coveredClauses[clause]:
            ExistValues = False
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, fixedNames, variablesList, docXML, variablesTypeList, allVariablesOperation, tempoAvaliacao


def testClauses(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs, operationName,
                importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables, variablesList,
                variablesTypeList, fixedNames, outputs, docXML, predicateXML, clauseToTest, coveredClauses,
                copy_directory, arrayModification, tempoAvaliacao, maxint, testingClauses=[]):
    needTest = False
    testingClauses.append(clauseToTest)
    enteredInPositive = False
    timeFirstPart = 0
    timeSecondPart = 0
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
            predicateXML.appendChild(clauseData[clauseToTest - 1].cloneNode(20))
            predicateXML.appendChild(docXML.createTextNode("\n"))
        elif clauseToTest == min(clauseMap[str(predNumber)]) + 1:  # Create Nary_Pred
            naryPred = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20),
                                                                  clauseData[clauseToTest - 1].cloneNode(20),
                                                                  "&", docXML)
            predicateXML.replaceChild(naryPred, predicateXML.firstChild.nextSibling)
        else:
            predicateXML.firstChild.nextSibling.appendChild(clauseData[clauseToTest - 1].cloneNode(20))
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
                                                                                          impName, variablesList,
                                                                                          variablesTypeList,
                                                                                          changedVariablesWhile,
                                                                                          directory,
                                                                                          atelierBDir,
                                                                                          arrayModification)
            del way[len(way) - 1]
        ExistValues, variables, predicate, timeFirstPart = buildpredicate.checkPredicate(predicateXML,
                                                                          "Clause coverage - trying to reach line " + node,
                                                                          inputs, proBPath, copy_directory,
                                                                          operationImp, operationMch, importedMch,
                                                                          seesMch, maxint)
        if ExistValues:
            print("Found inputs for the predicate: " + predicate)
            print("The inputs are: ", variables)
            coveredClauses[clauseToTest] = True
            if variables not in allInVariables:
                allInVariables.append(variables)
            if clauseToTest < max(clauseMap[str(predNumber)]):
                timeFirstPart = testClauses(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs,
                            operationName,
                            importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables,
                            variablesList,
                            variablesTypeList, fixedNames, outputs, docXML, positivePredicateXML.cloneNode(20),
                            clauseToTest + 1, coveredClauses, copy_directory, arrayModification, timeFirstPart, maxint, testingClauses)
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
                predicateXML.appendChild(
                    buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20), docXML))
                predicateXML.appendChild(docXML.createTextNode("\n"))
            elif clauseToTest == min(clauseMap[str(predNumber)]) + 1:  # Create Nary_Pred
                naryPred = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20),
                                                                      buildpredicate.nodescreator.createUnaryNode(
                                                                          clauseData[clauseToTest - 1].cloneNode(20),
                                                                          docXML),
                                                                      "&", docXML)
                predicateXML.replaceChild(naryPred, predicateXML.firstChild.nextSibling)
            else:
                predicateXML.firstChild.nextSibling.appendChild(
                    buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20)), docXML)
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
                                                                                          impName, variablesList,
                                                                                          variablesTypeList,
                                                                                          changedVariablesWhile,
                                                                                          directory,
                                                                                          atelierBDir,
                                                                                          arrayModification)
            del way[len(way) - 1]
        ExistValues, variables, predicate, timeSecondPart = buildpredicate.checkPredicate(predicateXML,
                                                                          "Clause coverage - trying to reach line " + node,
                                                                          inputs, proBPath, copy_directory,
                                                                          operationImp, operationMch, importedMch,
                                                                          seesMch, maxint)
        if ExistValues:
            print("Found inputs for the predicate: " + predicate)
            print("The inputs are: ", variables)
            coveredClauses[-clauseToTest] = True
            if variables not in allInVariables:
                allInVariables.append(variables)
            if clauseToTest < max(clauseMap[str(predNumber)]):
                timeSecondPart = testClauses(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs,
                            operationName,
                            importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables,
                            variablesList,
                            variablesTypeList, fixedNames, outputs, docXML, negativePredicateXML.cloneNode(20),
                            clauseToTest + 1, coveredClauses, copy_directory, arrayModification, timeSecondPart, maxint, testingClauses)
        else:
            print("Not found inputs for the predicate: " + predicate + " end of test for this combination of clauses")
    del testingClauses[-1]
    return tempoAvaliacao + timeFirstPart + timeSecondPart


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


def CombinatorialCoverage(operationImp, operationMch, inputs, completePaths, operationName, importedMch, seesMch, impName,
                   directory, atelierBDir, proBPath, copy_directory, times, operationNumber, maxint):
    allInVariables = list()
    allInVariablesNew = list()
    allOutVariables = list()
    clauseData = list()
    clauseMap = dict()
    clauseCond = list()
    coveredClauses = dict()
    nodemapKeys = list()
    uncoveredPredicates = list()
    partialPathForInput = list()
    outputs, outputsTypes = getOutputsVariables(operationImp)
    originalVarList = []
    originalVarListType = []
    allCovered = True
    predNumber = 1
    clauseNumber = 1
    covered = True
    start_time_GeneratingTests = time.time()
    tempoAvaliacaoTotalEntradas = 0
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
            covered = False
            clauseNumber = getClauses(buildpredicate.buildpaths.graphgen.nodedata[str(node)], clauseData, clauseMap,
                                      clauseCond, predNumber, clauseNumber)
            previousPaths = len(buildpredicate.buildpaths.partialPaths.keys())
            buildpredicate.buildpaths.makePartialPaths(buildpredicate.buildpaths.graphgen.nodemap, str(node))
            """for key in clauseMap[str(predNumber)]:
                coveredClauses[key] = False
                coveredClauses[-key] = False"""
            for pathkey in sorted(buildpredicate.buildpaths.partialPaths.keys()):
                originalVarList = []
                for var in allInVariables:
                    originalVarList.append(var)
                if pathkey > previousPaths:
                    print(buildpredicate.buildpaths.partialPaths[pathkey])
                    covered, fixedNames, variablesList, docXML, variablesListType, allVariablesOperation, tempoAvaliacaoUmPath = \
                        makePredicateCombinatorialCoverage(operationImp, operationMch, str(node),
                                                    buildpredicate.buildpaths.partialPaths[pathkey], clauseData,
                                                    clauseMap, predNumber, inputs, outputs, operationName,
                                                    importedMch, seesMch, impName, directory, atelierBDir,
                                                    allInVariables, proBPath, coveredClauses, copy_directory, maxint)
                    tempoAvaliacaoTotalEntradas += tempoAvaliacaoUmPath
                    if covered:
                        for variable in allInVariables:
                            if variable not in originalVarList:
                                partialPathForInput.append(pathkey)
                        break
                    else:
                        allInVariables = originalVarList
            if not covered:
                allCovered = False
                uncoveredPredicates.append(instgen.selfcaller(buildpredicate.buildpaths.graphgen.nodedata[str(node)]))
            predNumber += 1
    for completePathsKey in sorted(completePaths.keys()):
        print(completePathsKey, completePaths[completePathsKey])
    tempoAvaliacaoSaidaTotal = 0
    for i in range(len(allInVariables)):
        ExistValues = False
        for completePathsKey in sorted(completePaths.keys()):
            countPartial = 0
            originalVarList = []
            originalVarListType = []
            for j in range(len(variablesList)):
                originalVarList.append(variablesList[j])
                originalVarListType.append(variablesListType[j])
            for node in buildpredicate.buildpaths.partialPaths[partialPathForInput[i]]:
                if node in completePaths[completePathsKey]:
                    countPartial += 1
            if countPartial == len(buildpredicate.buildpaths.partialPaths[partialPathForInput[i]]):
                out, ExistValues, tempoAvaliacaoSaida = buildpredicate.getOutput(completePaths[completePathsKey], completePathsKey,
                                                            allVariablesOperation, outputs,
                                                            fixedNames, operationImp, operationMch, importedMch,
                                                            seesMch, operationName, impName, allInVariables[i],
                                                            originalVarList, originalVarListType, directory,
                                                            atelierBDir, proBPath, copy_directory, maxint)
                tempoAvaliacaoSaidaTotal += tempoAvaliacaoSaida
            for j in range(len(outputs)):
                originalVarList.append(outputs[j])
                originalVarListType.append(outputsTypes[j])
            if ExistValues:
                allOutVariables.append(out)
                break
    buildpredicate.buildpaths.partialPaths.clear()
    # print(allInVariables, allOutVariables)
    # for i in range(len(allInVariables)):
    #    print(allInVariables[i], allOutVariables[i])
    for i in range(len(allInVariables)):
        if allInVariables[i] != []:
            allInVariablesNew.append(allInVariables[i])
    allInVariables = []
    for i in range(len(allInVariablesNew)):
        if allInVariablesNew[i] != []:
            allInVariables.append(allInVariablesNew[i])
    tempoAvaliacaoTotal = tempoAvaliacaoTotalEntradas + tempoAvaliacaoSaidaTotal
    times[operationNumber].append(time.time() - (start_time_GeneratingTests + tempoAvaliacaoTotal))
    times[operationNumber].append(tempoAvaliacaoTotal)
    return allCovered, allInVariables, allOutVariables, uncoveredPredicates, coveredClauses, originalVarList, \
           originalVarListType, clauseNumber, clauseData


def makePredicateCombinatorialCoverage(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber,
                                inputs, outputs, operationName, importedMch, seesMch, impName, directory, atelierBDir,
                                allInVariables, proBPath, coveredClauses, copy_directory, maxint):
    ExistValues = True
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement

    allVariablesOperation = list()
    variablesList = list()
    variablesTypeList = list()
    arrayModification = list()
    sizeinputs = len(inputs)
    tempoAvaliacao = 0
    addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                        directory)
    fixedNames = getFixedNames(operationImp, importedMch, seesMch, operationMch)
    tempoAvaliacao = testClausesCombinatorial(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs, operationName,
                importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables, variablesList,
                variablesTypeList, fixedNames, outputs, docXML, predicateXML, min(clauseMap[str(predNumber)]),
                coveredClauses, copy_directory, arrayModification, tempoAvaliacao, maxint)
    for variable in inputs:
        allVariablesOperation.append(variable)
    for clause in coveredClauses.keys():
        if not coveredClauses[clause]:
            ExistValues = False
    if len(inputs) > sizeinputs:
        for i in range(len(inputs)):
            if i > sizeinputs - 1:
                inputs.pop()
    return ExistValues, fixedNames, variablesList, docXML, variablesTypeList, allVariablesOperation, tempoAvaliacao


def testClausesCombinatorial(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs, operationName,
                importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables, variablesList,
                variablesTypeList, fixedNames, outputs, docXML, predicateXML, clauseToTest, coveredClauses,
                copy_directory, arrayModification, tempoAvaliacao, maxint, testingClauses=[]):
    #needTest = False
    testingClauses.append(clauseToTest)
    #enteredInPositive = False
    #for clause in coveredClauses.keys():
    #    if not coveredClauses[clause]:
    #        needTest = True
    #needTest2 = len(testingClauses)
    #for clause in testingClauses:
    #   if coveredClauses[clause]:
    #        needTest2 -= 1
    #if needTest and needTest2 != 0:
    #    enteredInPositive = True
    way = list()
    posMut = list()
    timeFirstPart = 0
    timeSecondPart = 0
    changedVariablesWhile = list()
    if clauseToTest == min(clauseMap[str(predNumber)]):
        predicateXML.appendChild(docXML.createTextNode("\n"))
        predicateXML.appendChild(clauseData[clauseToTest - 1].cloneNode(20))
        predicateXML.appendChild(docXML.createTextNode("\n"))
    elif clauseToTest == min(clauseMap[str(predNumber)]) + 1:  # Create Nary_Pred
        naryPred = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20),
                                                              clauseData[clauseToTest - 1].cloneNode(20),
                                                              "&", docXML)
        predicateXML.replaceChild(naryPred, predicateXML.firstChild.nextSibling)
    else:
        predicateXML.firstChild.nextSibling.appendChild(clauseData[clauseToTest - 1].cloneNode(20))
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
                                                                                      impName, variablesList,
                                                                                      variablesTypeList,
                                                                                      changedVariablesWhile,
                                                                                      directory,
                                                                                      atelierBDir,
                                                                                      arrayModification)
        del way[len(way) - 1]
    ExistValues, variables, predicate, timeFirstPart = buildpredicate.checkPredicate(predicateXML,
                                                                      "Combinatorial Coverage - trying to reach line " + node,
                                                                      inputs, proBPath, copy_directory,
                                                                      operationImp, operationMch, importedMch,
                                                                      seesMch, maxint)
    if ExistValues:
        print("Found inputs for the predicate: " + predicate)
        print("The inputs are: ", variables)
        coveredClauses[clauseToTest] = True
    if variables not in allInVariables:
        allInVariables.append(variables)
        if clauseToTest < max(clauseMap[str(predNumber)]):
            timeFirstPart = testClausesCombinatorial(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs,
                        operationName,
                        importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables,
                        variablesList,
                        variablesTypeList, fixedNames, outputs, docXML, positivePredicateXML.cloneNode(20),
                        clauseToTest + 1, coveredClauses, copy_directory, arrayModification, timeFirstPart, maxint, testingClauses)
    else:
        print("Not found inputs for the predicate: " + predicate + " testing the negative anyway")
    del testingClauses[-1]
    #needTest = False
    testingClauses.append(-clauseToTest)
    #for clause in coveredClauses.keys():
    #    if not coveredClauses[clause]:
    #        needTest = True
    #needTest2 = len(testingClauses)
    #for clause in testingClauses:
    #    if coveredClauses[clause]:
    #        needTest2 -= 1
    #if needTest and needTest2 != 0:
    #if enteredInPositive:
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
    #else:
    #        if clauseToTest == min(clauseMap[str(predNumber)]):
    #            predicateXML.appendChild(docXML.createTextNode("\n"))
    #            predicateXML.appendChild(
    #                buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20), docXML))
    #            predicateXML.appendChild(docXML.createTextNode("\n"))
    #       elif clauseToTest == min(clauseMap[str(predNumber)]) + 1:  # Create Nary_Pred
    #            naryPred = buildpredicate.nodescreator.createNaryPred(predicateXML.firstChild.nextSibling.cloneNode(20),
    #                                                                  buildpredicate.nodescreator.createUnaryNode(
    #                                                                      clauseData[clauseToTest - 1].cloneNode(20),
    #                                                                      docXML),
    #                                                                  "&", docXML)
    #           predicateXML.replaceChild(naryPred, predicateXML.firstChild.nextSibling)
    #       else:
    #           predicateXML.firstChild.nextSibling.appendChild(
    #                buildpredicate.nodescreator.createUnaryNode(clauseData[clauseToTest - 1].cloneNode(20)), docXML)
    #            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode("\n"))
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
                                                                                      impName, variablesList,
                                                                                      variablesTypeList,
                                                                                      changedVariablesWhile,
                                                                                      directory,
                                                                                      atelierBDir,
                                                                                      arrayModification)
        del way[len(way) - 1]
    ExistValues, variables, predicate, timeSecondPart = buildpredicate.checkPredicate(predicateXML,
                                                                      "Combinatorial Coverage - trying to reach line " + node,
                                                                      inputs, proBPath, copy_directory,
                                                                      operationImp, operationMch, importedMch,
                                                                      seesMch, maxint)
    if ExistValues:
        print("Found inputs for the predicate: " + predicate)
        print("The inputs are: ", variables)
        coveredClauses[-clauseToTest] = True
        if variables not in allInVariables:
            allInVariables.append(variables)
        if clauseToTest < max(clauseMap[str(predNumber)]):
            timeSecondPart = testClausesCombinatorial(operationImp, operationMch, node, path, clauseData, clauseMap, predNumber, inputs,
                        operationName,
                        importedMch, seesMch, impName, directory, atelierBDir, proBPath, allInVariables,
                        variablesList,
                        variablesTypeList, fixedNames, outputs, docXML, negativePredicateXML.cloneNode(20),
                        clauseToTest + 1, coveredClauses, copy_directory, arrayModification, timeSecondPart, maxint, testingClauses)
    else:
        print("Not found inputs for the predicate: " + predicate + " end of test for this combination of clauses")
    del testingClauses[-1]
    return tempoAvaliacao + timeFirstPart + timeSecondPart

def addVariablesToInput(operationImp, importedMch, seesMch, operationMch, inputs, variablesList, variablesTypeList,
                         directory):
        for childnode in operationImp.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                if (childnode.tagName == "Parameters" or childnode.tagName == "Input_Parameters"):
                    allId = childnode.getElementsByTagName('Id')
                    for Id in allId:
                        if Id.getAttribute('value') not in inputs:
                            inputs.append(Id.getAttribute('value'))
                            variablesList.append(Id.getAttribute('value'))
                            getVariableType(operationImp.parentNode.parentNode, Id.getAttribute('typref'),
                                            variablesTypeList)
        for childnode in operationMch.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                if (childnode.tagName == "Parameters" or childnode.tagName == "Input_Parameters"):
                    allId = childnode.getElementsByTagName('Id')
                    for Id in allId:
                        if Id.getAttribute('value') not in inputs:
                            inputs.append(Id.getAttribute('value'))
                            variablesList.append(Id.getAttribute('value'))
                            getVariableType(operationImp.parentNode.parentNode, Id.getAttribute('typref'),
                                            variablesTypeList)
        solveAddVariablesToInputImportsAndSees(importedMch, inputs, variablesList, variablesTypeList, directory)
        solveAddVariablesToInputImportsAndSees(seesMch, inputs, variablesList, variablesTypeList, directory, True)

def getVariableType(principal, variableType, variablesTypeList):
    for childnode in principal.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == 'TypeInfos':
                allTypes = childnode.getElementsByTagName('Type')
                for typ in allTypes:
                    if typ.getAttribute('id') == variableType:
                        if typ.getElementsByTagName('Binary_Exp') != []:
                            variablesTypeList.append(
                                ['Array', typ.getAttribute('id'), typ.firstChild.nextSibling.cloneNode(20)])
                        else:
                            variablesTypeList.append(
                                ['Normal', typ.getAttribute('id'), typ.firstChild.nextSibling.cloneNode(20)])


def solveAddVariablesToInputImportsAndSees(machines, inputs, variablesList, variablesTypeList, directory,
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
                                getVariableType(childnode.parentNode, Id.getAttribute('typref'), variablesTypeList)


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
    if operationImp.getElementsByTagName("Output_Parameters") != []:
        if operationImp.getElementsByTagName("Output_Parameters")[0].parentNode.tagName == "Operation":
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
    """
    outputList = []
    outputTypeList = []
    for childnode in operationImp.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == "Output_Parameters":
                for output in childnode.childNodes:
                    if output.nodeType != output.TEXT_NODE:
                        if output.tagName == "Id":
                            outputList.append(output.getAttribute('value'))
                            getVariableType(operationImp.parentNode.parentNode, output.getAttribute('typref'), outputTypeList)
    return outputList, outputTypeList


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
