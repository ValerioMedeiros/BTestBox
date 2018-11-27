import buildpaths
import graphgen
import makecoverage
import instgen
import createBTestSet
import testTranslation
import os
import time
from threading import Thread
#from queue import Queue
import multiprocessing


import sys
is_py2 = sys.version[0] == '2'
if is_py2:
    import Queue as queue
else:
    import queue as queue


#Definindo a fila maxima
queueOfOperations = queue.Queue(maxsize=0)
# Number of cores capable of doing calculation or the number of calculations at the same time
cores = 1
#cores = multiprocessing.cpu_count()
operationsList = list()



def DoBranchCoverageThreads(operationImp, qVars, count, result):
   # while not queue.empty():
        #work = queue.get()  # fetch new work from the Queue
    operationsmch, times, directory = qVars.queue[count-1]["operationsmch"], qVars.queue[count-1]["times"], qVars.queue[count-1]["directory"]
    importedMch, seesMch, refinementMch = qVars.queue[count-1]["importedMch"], qVars.queue[count-1]["seesMch"], qVars.queue[count-1]["refinementMch"]
    impName, atelierBDir, proBPath = qVars.queue[count-1]["impName"], qVars.queue[count-1]["atelierBDir"], qVars.queue[count-1]["proBPath"]
    copy_directory, maxint, operationsNames = qVars.queue[count-1]["copy_directory"], qVars.queue[count-1]["maxint"], qVars.queue[count-1]["operationsNames"]
    allInVariablesForTest, allOutVariablesForTest, variablesList = qVars.queue[count-1]["allInVariablesForTest"], qVars.queue[count-1]["allOutVariablesForTest"], qVars.queue[count-1]["variablesList"]
    variablesTypeList, coveredPercentage, notCovered = qVars.queue[count-1]["variablesTypeList"], qVars.queue[count-1]["coveredPercentage"], qVars.queue[count-1]["notCovered"]
    branchCoverageProcess(count, operationImp, operationsmch, times, directory, importedMch, seesMch, refinementMch,
                  impName, atelierBDir, proBPath, copy_directory, maxint, operationsNames,
                  allInVariablesForTest, allOutVariablesForTest, variablesList, variablesTypeList,
                  coveredPercentage, notCovered)
        #queue.task_done()
    return True



'''
buildpaths: buildpaths is the module responsible to create the paths and the branches, it depends of the graphgen.
graphgen: graphgen is the module responsible to create every graph used in the coverage.
coverage: module with the resolution of each coverage.
instgen: module to generate the instructions.
minidom: module to read the bxml file in a tree.
'''

#Processo dentro de DoBranchCoverage Comentado
def branchCoverageProcess(count, operationImp, operationsmch, times, directory, importedMch, seesMch, refinementMch,
                          impName, atelierBDir, proBPath, copy_directory, maxint, operationsNames,
                          allInVariablesForTest, allOutVariablesForTest, variablesList, variablesTypeList,
                          coveredPercentage, notCovered):
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
                start_time = time.time()
                times[count] = list()
                graphgen.mapOperations(operationImp, operationMch, directory + os.sep +'bdp', importedMch, seesMch, refinementMch)
                times[count].append(time.time() - start_time)
                start_time = time.time()
                buildpaths.makepaths(graphgen.nodemap)  # Building paths
                buildpaths.makebranches(buildpaths.paths)  # Building branches
                times[count].append(time.time() - start_time)
                for key in buildpaths.paths:  # Printing the paths (for control)
                    print(key, buildpaths.paths[key])
                # for key in sorted(buildpaths.graphgen.nodemap.keys()):
                #    print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key],
                #          buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key], buildpaths.graphgen.nodeinva[key])
                covered, allInVariables, allOutVariables, vL,\
                vTypeL = makecoverage.BranchCoverage(operationImp, operationMch, buildpaths.branchesPath,
                                                     buildpaths.branchesStatus, buildpaths.paths, inputs, operationname,
                                                     importedMch, seesMch, impName, directory + os.sep +'bdp', atelierBDir,
                                                     proBPath, copy_directory, times, count, maxint)
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                variablesList[count] = vL
                variablesTypeList[count] = vTypeL
                if covered:
                    print("The operation " + operationname + " is covered by Branch Coverage\n")
                    coveredPercentage.append(100)
                else:
                    countFails = 0
                    notCovered[count] = []
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

def DoBranchCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName,
                     directory, atelierBDir, copy_directory, proBPath, refinementMch, translator, translatorProfile,
                     compiler, maxint):
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
    times = dict()
    # Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                operationsList.append(operationImp)

    # Continue the process with threads if there is a operation
    if operationsList != []:
        # Populating Queue with tasks
        # Also depends of the number of operations, the results have to respect the number of operations
        results = [{} for x in operationsList]

        # Load up the queue with the operations to fetch and the index for each job (as a tuple):
        for i in range(len(operationsList)):
            # Need the index and the url in each queue item.
            queueOfOperations.put((i, operationsList[i]))

        # List of variables (used for control)
        listOfVariables = [{"operationsmch": 0, "times": 0}] * len(operationsList)

        # Creating a queue that you serve as stack and our counter
        qVars = queue.Queue()
        qVars.put({"operationsmch":operationsmch, "times":times,
                   "directory":directory, "importedMch":importedMch, "seesMch":seesMch, "refinementMch":refinementMch,
                   "impName":impName, "atelierBDir":atelierBDir, "proBPath":proBPath, "copy_directory":copy_directory,
                   "maxint":maxint, "operationsNames":operationsNames, "allInVariablesForTest":allInVariablesForTest,
                   "allOutVariablesForTest":allOutVariablesForTest, "variablesList":variablesList,
                   "variablesTypeList":variablesTypeList, "coveredPercentage":coveredPercentage,
                   "notCovered":notCovered})

        # Creating and adding the first of the queue to the stack
        stack = queue.Queue(maxsize=cores)
        stack.put(queueOfOperations.get())

        # Starting worker threads on queue processing
        # for i in range(num_threads):
        while True:
            # Empilha as remanescentes
            for i in range(min(cores, queueOfOperations.qsize())):
                stack.put(queueOfOperations.get())

            #apagar #for i in range(stack.qsize()):
            while not stack.empty():
                count = + 1
                print('Starting thread ', i)

                operationImp = stack.get()

                worker = Thread(target=DoBranchCoverageThreads, args=(operationImp, qVars, count, results))


                worker.setDaemon(True)  # Setting threads as "daemon" allows main program to
                                        # Exit eventually even if these don't finish
                                        # Correctly.
                worker.start()
                stack.task_done()
                print('Finishing thread ', i)
        # Now we wait until the queue has been processed
            if queueOfOperations.qsize() <= 0:
                break
        stack.join()


    if allcovered:
        print("All operations of " + impName + " are covered by Branch Coverage!")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        times[0] = list()
        start_time_createSets = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "branch", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time_createSets)
        print('Testing the Translation')
        start_time_runTets = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Branch Coverage', directory, atelierBDir,
                                copy_directory, "branch", translator, translatorProfile, compiler)
        times[0].append(time.time() - start_time_runTets)
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Branch Coverage.")
        print("Now they translation will be tested. (For the possible tests)")
        print("Creating TestSet!")
        times[0] = list()
        start_time_createSets = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "branch", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time_createSets)
        print('Testing the Translation')
        start_time_runTets = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Branch Coverage', directory, atelierBDir,
                                copy_directory, "branch", translator, translatorProfile, compiler, True)
        times[0].append(time.time() - start_time_runTets)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage, times


def DoPathCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                   atelierBDir, copy_directory, proBPath, refinementMch, translator, translatorProfile,
                     compiler, maxint):
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
    variablesList = dict()
    variablesTypeList = dict()
    operationsNames = list()
    notCovered = dict()
    coveredPercentage = list()
    times = dict()
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
                times[count] = list()
                start_time = time.time()
                graphgen.mapOperations(operationImp, operationMch, directory + os.sep +'bdp', importedMch, seesMch, refinementMch)
                times[count].append(time.time() - start_time)
                start_time = time.time()
                buildpaths.makepaths(graphgen.nodemap)  # Building paths
                times[count].append(time.time() - start_time)
                covered, allInVariables, allOutVariables, uncoveredPaths, vL,\
                vTypeL = makecoverage.PathCoverage(operationImp, operationMch, buildpaths.paths, inputs, operationname,
                                                   importedMch, seesMch, impName, directory + os.sep +'bdp', atelierBDir,
                                                   proBPath, copy_directory, times, count, maxint)
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                variablesList[count] = vL
                variablesTypeList[count] = vTypeL
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
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "path", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Path Coverage', directory, atelierBDir, copy_directory,
                                "path", translator, translatorProfile, compiler)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Path Coverage.\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "path", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Path Coverage', directory, atelierBDir, copy_directory,
                                "path", translator, translatorProfile, compiler, True)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage, times


def DoCodeCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                   atelierBDir, copy_directory, proBPath, refinementMch, translator, translatorProfile,
                     compiler, maxint):
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
    variablesList = dict()
    variablesTypeList = dict()
    operationsNames = list()
    notCovered = dict()
    coveredPercentage = list()
    times = dict()
    count = 0
    print("Checking if the implementation " + impName + " is Statement Covered\n")
    # Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            if operationImp.tagName == 'Operation' and not checkIfItIsLocal(operationImp):
                count += 1
                operationname = operationImp.getAttribute("name")
                print("Checking if the operation " + operationname + " is Statement Covered")
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
                times[count] = list()
                start_time = time.time()
                graphgen.mapOperations(operationImp, operationMch, directory + os.sep +'bdp', importedMch, seesMch, refinementMch)
                times[count].append(time.time() - start_time)
                start_time = time.time()
                buildpaths.makepaths(graphgen.nodemap)  # Building paths
                buildpaths.makenodes(graphgen.nodemap)  # Building node, setting them to False (uncovered).
                times[count].append(time.time() - start_time)
                for key in buildpaths.paths:
                    print(key, buildpaths.paths[key])
                covered, allInVariables, allOutVariables, vL,\
                vTypeL = makecoverage.CodeCoverage(operationImp, operationMch, buildpaths.paths, inputs, operationname,
                                                   buildpaths.nodeStatus, importedMch, seesMch, impName,
                                                   directory + os.sep +'bdp', atelierBDir, proBPath, copy_directory, times, count, maxint)
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                variablesList[count] = vL
                variablesTypeList[count] = vTypeL
                if covered:
                    print("The operation " + operationname + " is covered by Statement Coverage\n")
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
                    print("The operation " + operationname + " is NOT covered by Statement Coverage\n")
                    coveredPercentage.append(100 * (len(buildpaths.nodeStatus.keys()) - countNonCoveredNodes) / len(
                        buildpaths.nodeStatus.keys()))
                    allcovered = False
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
    if allcovered:
        print("All operations of " + impName + " are covered by Statement Coverage!\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "statement", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Statement Coverage', directory, atelierBDir,
                                copy_directory, "statement", translator, translatorProfile, compiler)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Statement Coverage.\n")
        print("Creating TestSet! (For the possible tests)")
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "statement", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Statement Coverage', directory, atelierBDir, copy_directory,
                                "statement", translator, translatorProfile, compiler, True)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage, times


'''
def DoLineCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                   atelierBDir, copy_directory, proBPath):
    ''''''
    Function responsible of doing the Path Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more paths could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    ''''''
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
                    graphgen.mapOperations(operationImp, operationMch, directory + os.sep +'bdp', importedMch, seesMch)
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
                                                                                                           directory + os.sep +'bdp',
                                                                                                           atelierBDir,
                                                                                                           proBPath, copy_directory)

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
    return None, None, None, None
'''


def DoClauseCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                     atelierBDir, copy_directory, proBPath, refinementMch, translator, translatorProfile,
                     compiler, maxint):
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
    variablesList = dict()
    variablesTypeList = dict()
    notCovered = dict()
    times = dict()
    operationsNames = list()
    coveredPercentage = list()
    count = 0
    times = dict()
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
                times[count] = list()
                start_time = time.time()
                graphgen.mapOperations(operationImp, operationMch, directory + os.sep +'bdp', importedMch, seesMch, refinementMch)
                times[count].append(time.time() - start_time)
                start_time = time.time()
                buildpaths.makepaths(graphgen.nodemap)
                times[count].append(time.time() - start_time)
                for key in sorted(buildpaths.graphgen.nodemap.keys()):
                    print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key],
                          buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key],
                          buildpaths.graphgen.nodeinva[key])
                covered, allInVariables, allOutVariables,\
                uncoveredPredicates, coveredClauses, vL, \
                vTypeL = makecoverage.ClauseCoverage(operationImp, operationMch, inputs, buildpaths.paths,
                                                     operationname, importedMch, seesMch, impName,
                                                     directory + os.sep +'bdp', atelierBDir, proBPath, copy_directory, times, count, maxint)
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                variablesList[count] = vL
                variablesTypeList[count] = vTypeL
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
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "clause", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Clause Coverage', directory, atelierBDir,
                                copy_directory, "clause", translator, translatorProfile, compiler)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Clause Coverage.\n")
        print("Now they translation will be tested.")
        print("Creating TestSet! (For the possible tests)")
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "clause", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Clause Coverage', directory, atelierBDir,
                                copy_directory, "clause", translator, translatorProfile, compiler, True)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage, times


def DoCombinatorialCoverage(imp, mch, importedMch, seesMch, includedMch, operationsmch, operationsimp, impName, directory,
                     atelierBDir, copy_directory, proBPath, refinementMch, translator, translatorProfile,
                     compiler, maxint):
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
    variablesList = dict()
    variablesTypeList = dict()
    notCovered = dict()
    operationsNames = list()
    coveredPercentage = list()
    times = dict()
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
                times[count] = list()
                start_time = time.time()
                graphgen.mapOperations(operationImp, operationMch, directory + os.sep +'bdp', importedMch, seesMch, refinementMch)
                times[count].append(time.time() - start_time)
                start_time = time.time()
                buildpaths.makepaths(graphgen.nodemap)
                times[count].append(time.time() - start_time)
                for key in sorted(buildpaths.graphgen.nodemap.keys()):
                    print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key],
                          buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key],
                          buildpaths.graphgen.nodeinva[key])
                covered, allInVariables, allOutVariables,\
                uncoveredPredicates, coveredClauses, vL, \
                vTypeL, clauseNumber, clauseData = makecoverage.CombinatorialCoverage(operationImp, operationMch, inputs, buildpaths.paths,
                                                     operationname, importedMch, seesMch, impName,
                                                     directory + os.sep +'bdp', atelierBDir, proBPath, copy_directory, times, count, maxint)
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
                operationsNames.append(operationname)
                allInVariablesForTest[count] = allInVariables
                allOutVariablesForTest[count] = allOutVariables
                variablesList[count] = vL
                variablesTypeList[count] = vTypeL
                coveredClausesNumber = 0
                coveredCountedClauses = list()
                for eachClause in coveredClauses.keys():
                    coveredClausesNumber += 1
                    coveredCountedClauses.append(eachClause)
                if coveredClausesNumber == clauseNumber:
                    print("The operation: " + operationname + " is covered by Combinatorial Coverage\n")
                    coveredPercentage.append(100)
                    allcovered = True
                else:
                    countUncovered = 0
                    notCovered[count] = []
                    print("The operation: " + operationname + " is NOT covered by Combinatorial Coverage\n")
                    allcovered = False
                    allClausesList = list()
                    for i in range(int(clauseNumber/2)):
                        allClausesList.append(i+1)
                        allClausesList.append(-i-1)
                    for eachClause in allClausesList:
                        if eachClause not in coveredClauses:
                            text = ""
                            endtext = ""
                            if eachClause < 0:
                                text += "not("
                                endtext += ")"
                            notCovered[count].append(text + instgen.selfcaller(clauseData[abs(eachClause)-1]) + endtext)
                    coveredPercentage.append(100 * (clauseNumber - coveredClausesNumber) / clauseNumber)
                graphgen.clearGraphs()
                buildpaths.clearGraphs()
    if allcovered:
        print("All operations of " + impName + " are covered by Combinatorial Coverage!\n")
        print("Now they translation will be tested.")
        print("Creating TestSet!")
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "combinatorial", variablesList,
                                  variablesTypeList)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Combinatorial Coverage', directory, atelierBDir,
                                copy_directory, "combinatorial", translator, translatorProfile, compiler)
        print('Test file generated')
    else:
        print(impName + " is NOT covered by Combinatorial Coverage.\n")
        print("Now they translation will be tested.")
        print("Creating TestSet! (For the possible tests)")
        times[0] = list()
        start_time = time.time()
        createBTestSet.createTest(allInVariablesForTest, allOutVariablesForTest, imp, mch, importedMch, seesMch,
                                  includedMch, operationsNames, directory, copy_directory, "combinatorial", variablesList,
                                  variablesTypeList)
        times[0].append(time.time() - start_time)
        print('Testing the Translation')
        start_time = time.time()
        testTranslation.runTest(imp, importedMch, seesMch, 'Clause CoveCombinatorial', directory, atelierBDir,
                                copy_directory, "combinatorial", translator, translatorProfile, compiler, True)
        times[0].append(time.time() - start_time)
        print('Test file generated')
    return allInVariablesForTest, allOutVariablesForTest, operationsNames, notCovered, coveredPercentage, times


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
    #Function to check is a operation belongs to local_operations clause
    if operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations') != []:
        for localoperation in operationImp.parentNode.parentNode.getElementsByTagName('Local_Operations')[0].getElementsByTagName('Operation'):
            if localoperation.getAttribute('name') == operationImp.getAttribute('name'):
                return True
    return False
