import buildpaths
import graphgen
import makecoverage
import instgen
import createBTestSet
import testTranslation

'''
buildpaths: buildpaths is the module responsible to create the paths and the branches, it depends of the graphgen.
graphgen: graphgen is the module responsible to create every graph used in the coverage.
coverage: module with the resolution of each coverage.
instgen: module to generate the instructions.
minidom: module to read the bxml file in a tree.
'''

# Initialisation
'''
In the initialisation we get all the implementations of the imported machines, also we get the machine of the implementation being evaluated.
impName: Name of the implementation
imp: Variable with the parse of the implementation bxml
mch: Variable with the parse of the implementation bxml
importedMch: list of parses, with all implementation imported.
operationsimp: An node with all the operations of the implementation
operationsmch: An node with all the operations of the machine
'''


def DoBranchCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName,
                     directory, atelierBDir, copy_directory, proBPath, refinementMch):
    """
    Function responsible of doing the Branch Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more branches could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    """
    # Initialisation
    print("Checking if the implementation " + impName + " is Branch Covered\n")
    allcovered = True
    allInVariablesForTest = dict()
    allOutVariablesForTest = dict()
    variablesList = dict()
    variablesTypeList = dict()
    operationsNames = list()
    coveredPercentage = list()
    count = 0
    notCovered = dict()
    # Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                count += 1
                operationname = operationImp.getAttribute("name")
                print("Checking if the operation " + operationname + " is Branch Covered")
                if operationImp.getElementsByTagName('Input_Parameters') != []:
                    inputs = getInputs(operationImp)
                else:
                    inputs = []
                operationMch = operationsmch.firstChild.nextSibling
                # if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != [] and (
                #    operationMch.getAttribute('name') !=
                #    operationImp.getAttribute('name')):
                #    localOperations = operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[
                #        0].getElementsByTagName('Operation')
                #    for operation in localOperations:
                #        if operation.getAttribute('name') == operationImp.getAttribute('name'):
                #            operationMch = operation
                while operationMch.getAttribute("name") != operationImp.getAttribute(
                        "name"):  # Surfing to the machine operation equal the imp operation
                    operationMch = operationMch.nextSibling.nextSibling  # Jumping a TEXT_NODE
                graphgen.mapOperations(operationImp, operationMch, directory + '\\bdp', importedMch, seesMch, refinementMch)
                buildpaths.makepaths(graphgen.nodemap)  # Building paths
                buildpaths.makebranches(buildpaths.paths)  # Building branches
                for key in buildpaths.paths:  # Printing the paths (for control)
                    print(key, buildpaths.paths[key])
                # for key in sorted(buildpaths.graphgen.nodemap.keys()):
                #    print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key],
                #          buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key], buildpaths.graphgen.nodeinva[key])
                covered, allInVariables, allOutVariables, vL,\
                vTypeL = makecoverage.BranchCoverage(operationImp, operationMch, buildpaths.branchesPath,
                                                     buildpaths.branchesStatus, buildpaths.paths, inputs, operationname,
                                                     importedMch, seesMch, impName, directory + '\\bdp', atelierBDir,
                                                     proBPath, copy_directory)
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                variablesList[count] = allInVariables
                variablesList[count] = variablesTypeList
                if covered:
                    print("The operation " + operationname + " is covered by Branch Coverage\n")
                    coveredPercentage.append(100)
                else:
                    notCovered[count] = []
                    countFails = 0
                    for branch in buildpaths.branchesStatus:  # Printing where it failed to reach
                        if not buildpaths.branchesStatus[branch]:
                            countFails += 1
                            for i in range(len(branch)):
                                if branch[i] == '-':
                                    node1 = branch[0:i:]
                                    node2 = branch[i + 1:len(branch):]
                            if instgen.selfcaller(graphgen.nodedata[node2]) != "TRUE = TRUE":
                                inode2 = instgen.selfcaller(graphgen.nodedata[node2])
                            else:
                                inode2 = "END"
                            if instgen.selfcaller(graphgen.nodedata[node1]) != "TRUE = TRUE":
                                inode1 = instgen.selfcaller(graphgen.nodedata[node1])
                            else:
                                inode1 = "END"
                            notCovered[count].append([inode1, inode2])
                            print(
                                "There is no way to reach the instruction " + inode2 + " passing through the instruction " + inode1)
                    coveredPercentage.append(100 * (len(buildpaths.branchesStatus) - countFails) / len(buildpaths.branchesStatus))
                    print("The operation " + operationname + " is NOT covered by Branch Coverage\n")
                    allcovered = False
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
    if allcovered:
        print("All operations of " + impName + " are covered by Branch Coverage!")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "branch")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Branch Coverage', directory, atelierBDir,
                                copy_directory, "branch")
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Branch Coverage.")
        print("Now they translation will be tested. (For the possible tests)")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "branch")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Branch Coverage', directory, atelierBDir,
                                copy_directory, "branch", True)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage


def DoPathCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                   atelierBDir, copy_directory, proBPath, refinementMch):
    """
    Function responsible of doing the Path Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more paths could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    """
    # Initialisation
    allCovered = True
    allInVariablesForTest = dict()
    allOutVariablesForTest = dict()
    operationsNames = list()
    notCovered = dict()
    coveredPercentage = list()
    count = 0
    print("Checking if the implementation " + impName + " is Path Covered\n")
    # Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                count += 1
                operationname = operationImp.getAttribute("name")
                print("Checking if the operation " + operationname + " is Path Covered")
                if operationImp.getElementsByTagName('Input_Parameters') != []:
                    inputs = getInputs(operationImp)
                else:
                    inputs = []
                operationMch = operationsmch.firstChild.nextSibling
                # if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != [] and (
                #    operationMch.getAttribute('name') !=
                #    operationImp.getAttribute('name')):
                #    localOperations = operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[
                #        0].getElementsByTagName('Operation')
                #    for operation in localOperations:
                #        if operation.getAttribute('name') == operationImp.getAttribute('name'):
                #            operationMch = operation
                while operationMch.getAttribute("name") != operationImp.getAttribute(
                        "name"):  # Surfing to the machine operation equal the imp operation
                    operationMch = operationMch.nextSibling.nextSibling  # Jumping a TEXT_NODE
                graphgen.mapOperations(operationImp, operationMch, directory + '\\bdp', importedMch, seesMch, refinementMch)
                buildpaths.makepaths(graphgen.nodemap)  # Building paths
                covered, allInVariables, allOutVariables, uncoveredPaths = makecoverage.PathCoverage(operationImp,
                                                                                                     operationMch,
                                                                                                     buildpaths.paths,
                                                                                                     inputs,
                                                                                                     operationname,
                                                                                                     importedMch,
                                                                                                     seesMch,
                                                                                                     impName,
                                                                                                     directory + '\\bdp',
                                                                                                     atelierBDir,
                                                                                                     proBPath, copy_directory)
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                if covered:
                    print("The operation: " + operationname + " is covered by Path Coverage\n")
                    coveredPercentage.append(100)
                else:
                    print("The operation: " + operationname + " is NOT covered by Path Coverage\n")
                    notCovered[count] = []
                    allCovered = False
                    for path in uncoveredPaths:
                        pathNodes = []
                        for node in buildpaths.paths[path]:
                            if node == '1':
                                pathNodes.append('Operation Start')
                            elif node == str(max(graphgen.nodemap.keys())):
                                pathNodes.append('Operation End')
                            else:
                                pathNodes.append(instgen.selfcaller(graphgen.nodedata[node]))
                        notCovered[count].append([path, pathNodes])
                    coveredPercentage.append(
                        100 * (len(buildpaths.paths.keys()) - len(uncoveredPaths)) / len(buildpaths.paths.keys()))
            graphgen.clearGraphs()
            buildpaths.clearGraphs()
    if allCovered:
        print("All operations of " + impName + " are covered by Path Coverage!\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "path")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Path Coverage', directory, atelierBDir, copy_directory,
                                "path")
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Path Coverage.\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "path")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Path Coverage', directory, atelierBDir, copy_directory,
                                "path", True)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage


def DoCodeCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                   atelierBDir, copy_directory, proBPath, refinementMch):
    """
    Function responsible of doing the Path Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more nodes could not be visited.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    """
    # Initialisation
    allcovered = True
    allInVariablesForTest = dict()
    allOutVariablesForTest = dict()
    operationsNames = list()
    notCovered = dict()
    coveredPercentage = list()
    count = 0
    print("Checking if the implementation " + impName + " is Code Covered\n")
    # Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                count += 1
                operationname = operationImp.getAttribute("name")
                print("Checking if the operation " + operationname + " is Code Covered")
                if operationImp.getElementsByTagName('Input_Parameters') != []:
                    inputs = getInputs(operationImp)
                else:
                    inputs = []
                operationMch = operationsmch.firstChild.nextSibling
                # if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != [] and (
                #    operationMch.getAttribute('name') !=
                #    operationImp.getAttribute('name')):
                #    localOperations = operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[
                #        0].getElementsByTagName('Operation')
                #    for operation in localOperations:
                #        if operation.getAttribute('name') == operationImp.getAttribute('name'):
                #            operationMch = operation
                while operationMch.getAttribute("name") != operationImp.getAttribute(
                        "name"):  # Surfing to the machine operation equal the imp operation
                    operationMch = operationMch.nextSibling.nextSibling  # Jumping a TEXT_NODE
                graphgen.mapOperations(operationImp, operationMch, directory + '\\bdp', importedMch, seesMch, refinementMch)
                buildpaths.makepaths(graphgen.nodemap)  # Building paths
                buildpaths.makenodes(graphgen.nodemap)  # Building node, setting them to False (uncovered).
                for key in buildpaths.paths:
                    print(key, buildpaths.paths[key])
                covered, allInVariables, allOutVariables = makecoverage.CodeCoverage(operationImp,
                                                                                     operationMch,
                                                                                     buildpaths.paths,
                                                                                     inputs,
                                                                                     operationname,
                                                                                     buildpaths.nodeStatus,
                                                                                     importedMch,
                                                                                     seesMch, impName,
                                                                                     directory + '\\bdp',
                                                                                     atelierBDir,
                                                                                     proBPath, copy_directory)
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                if covered:
                    print("The operation " + operationname + " is covered by Code Coverage\n")
                    coveredPercentage.append(100)
                else:
                    notCovered[count] = []
                    countNonCoveredNodes = 0
                    for node in buildpaths.nodeStatus:  # Priting where it failed to reach
                        if not buildpaths.nodeStatus[node]:
                            countNonCoveredNodes += 1
                            if graphgen.nodedata[node] != "END":
                                inode = instgen.selfcaller(graphgen.nodedata[node])
                            else:
                                inode = "END"
                            notCovered[count].append(inode)
                            print("There is no way to reach the instruction " + inode)
                    print("The operation " + operationname + " is NOT covered by Code Coverage\n")
                    coveredPercentage.append(100 * (len(buildpaths.nodeStatus.keys()) - countNonCoveredNodes) / len(
                        buildpaths.nodeStatus.keys()))
                    allcovered = False
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
    if allcovered:
        print("All operations of " + impName + " are covered by Code Coverage!\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "code")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Code Coverage', directory, atelierBDir,
                                copy_directory, "code")
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Code Coverage.\n")
        print("Creating TestSet! (For the possible tests)")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "code")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Code Coverage', directory, atelierBDir, copy_directory,
                                "code", True)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage


def DoLineCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                   atelierBDir, copy_directory, proBPath):
    '''
    Function responsible of doing the Path Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more paths could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    '''
    # Initialisation
    allcovered = True
    allInVariablesForTest = dict()
    allOutVariablesForTest = dict()
    operationsNames = list()
    count = 0
    print("Checking if the implementation " + impName + " is Line/Code Covered\n")
    # Process
    for operationImp in operationsimp.childNodes:
        if allcovered == True:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                if operationImp.tagName == 'Operation':
                    count += 1
                    operationname = operationImp.getAttribute("name")
                    print("Checking if the operation " + operationname + " is Line Covered")
                    if operationImp.getElementsByTagName('Input_Parameters') != []:
                        inputs = getInputs(operationImp)
                    else:
                        inputs = []
                    operationMch = operationsmch.firstChild.nextSibling
                    # if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != [] and (
                    #    operationMch.getAttribute('name') !=
                    #    operationImp.getAttribute('name')):
                    #    localOperations = operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[
                    #        0].getElementsByTagName('Operation')
                    #    for operation in localOperations:
                    #        if operation.getAttribute('name') == operationImp.getAttribute('name'):
                    #            operationMch = operation
                    while operationMch.getAttribute("name") != operationImp.getAttribute(
                            "name"):  # Surfing to the machine operation equal the imp operation
                        operationMch = operationMch.nextSibling.nextSibling  # Jumping a TEXT_NODE
                    graphgen.mapOperations(operationImp, operationMch, directory + '\\bdp', importedMch, seesMch)
                    for key in sorted(buildpaths.graphgen.nodemap.keys()):
                        print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key],
                              buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key],
                              buildpaths.graphgen.nodeinva[key])
                    covered, allInVariables, allOutVariables, allUserVariables = makecoverage.LineCoverage(operationImp,
                                                                                                           operationMch,
                                                                                                           inputs,
                                                                                                           operationname,
                                                                                                           importedMch,
                                                                                                           seesMch,
                                                                                                           impName,
                                                                                                           directory + '\\bdp',
                                                                                                           atelierBDir,
                                                                                                           proBPath, copy_directory)
    '''
                        if covered == True:
                        print("The operation: "+operationname+" is covered by Line Coverage\n")
                        operationsNames.append(operationname)
                        allInVariablesForTest[count] = allInVariables
                        allOutVariablesForTest[count] = allOutVariables
                    else:
                        print("The operation: "+operationname+" is NOT covered by Line Coverage\n")
                        allcovered = False
                    graphgen.clearGraphs()
                    buildpaths.clearGraphs()
        else:
            if operationImp.nodeType != operationImp.TEXT_NODE:
                operationname = operationImp.getAttribute("name")
                print("One operation could NOT be covered, skipping trying to cover "+operationname+"\n")
    if allcovered == True:
        print("All operations of "+impName+" are covered by Line Coverage!\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch, includedMch, operationsNames, directory, copy_directory)
        print('Testing the Translation')
        testTranslation.runTest(imp, mch, importedMch, seesMch, 'Line Coverage', directory, atelierBDir, copy_directory)
        print('Test file generated')
        return 0
    else:
        print(impName+" is NOT covered by Line Coverage.\n")
        return 1
    '''
    return None, None, None, None


def DoClauseCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                     atelierBDir, copy_directory, proBPath, refinementMch):
    """
    Function responsible of doing the Clause Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more paths could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    """
    # Initialisation
    allcovered = True
    allInVariablesForTest = dict()
    allOutVariablesForTest = dict()
    notCovered = dict()
    operationsNames = list()
    coveredPercentage = list()
    count = 0
    print("Checking if the implementation " + impName + " is Clause Covered\n")
    # Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                count += 1
                operationname = operationImp.getAttribute("name")
                print("Checking if the operation " + operationname + " is Clause Covered")
                if operationImp.getElementsByTagName('Input_Parameters') != []:
                    inputs = getInputs(operationImp)
                else:
                    inputs = []
                operationMch = operationsmch.firstChild.nextSibling
                # if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != [] and (
                #    operationMch.getAttribute('name') !=
                #    operationImp.getAttribute('name')):
                #    localOperations = operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[
                #        0].getElementsByTagName('Operation')
                #    for operation in localOperations:
                #        if operation.getAttribute('name') == operationImp.getAttribute('name'):
                #            operationMch = operation
                while operationMch.getAttribute("name") != operationImp.getAttribute(
                        "name"):  # Surfing to the machine operation equal the imp operation
                    operationMch = operationMch.nextSibling.nextSibling  # Jumping a TEXT_NODE
                graphgen.mapOperations(operationImp, operationMch, directory + '\\bdp', importedMch, seesMch, refinementMch)
                buildpaths.makepaths(graphgen.nodemap)
                for key in sorted(buildpaths.graphgen.nodemap.keys()):
                    print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key],
                          buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key],
                          buildpaths.graphgen.nodeinva[key])
                covered, allInVariables, allOutVariables, uncoveredPredicates, coveredClauses = makecoverage.ClauseCoverage(
                    operationImp, operationMch, inputs, buildpaths.paths,
                    operationname, importedMch, seesMch, impName,
                    directory + '\\bdp', atelierBDir, proBPath, copy_directory)
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                if covered:
                    print("The operation: " + operationname + " is covered by Clause Coverage\n")
                    coveredPercentage.append(100)
                else:
                    countUncovered = 0
                    notCovered[count] = []
                    print("The operation: " + operationname + " is NOT covered by Clause Coverage\n")
                    allcovered = False
                    for uncovPred in uncoveredPredicates:
                        notCovered[count].append(uncovPred)
                    for clause in coveredClauses.keys():
                        if not coveredClauses[clause]:
                            countUncovered += 1
                    coveredPercentage.append(
                        100 * (len(coveredClauses.keys()) - countUncovered) / len(coveredClauses.keys()))
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
    if allcovered:
        print("All operations of " + impName + " are covered by Clause Coverage!\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "clause")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Clause Coverage', directory, atelierBDir,
                                copy_directory, "clause")
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Clause Coverage.\n")
        print("Now they translation will be tested.")
        print("Creating TestSet! (For the possible tests)")
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "clause")
        print('Testing the Translation')
        testTranslation.runTest(imp, importedMch, seesMch, 'Clause Coverage', directory, atelierBDir,
                                copy_directory, "clause", True)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage


def getInputs(operationImp):  # NOW THAT I PASS THE OPERATIONIMP TO THE OTHER PROGRAMS, THIS CAN BE DONE AFTER.
    '''
    Function responsible for getting the Inputs for an operation
    Input:
    operationImp : The operation node in the implementation tree
    
    Output:
    entries: A list with all the inputs
    '''
    inputs = instgen.make_inputs(operationImp.getElementsByTagName("Input_Parameters")[0])
    inputs = inputs.replace(" ", "")  # Eliminating blank spaces
    entries = list()
    commas = list()
    if len(inputs) == 0:
        None
    else:
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

def checkIfItIsLocal(operationImp):
    if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != []:
        for localoperation in operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[0].getElementsByTagName('Operation'):
            if localoperation.getAttribute('name') == operationImp.getAttribute('name'):
                return True
    return False