import buildpredicate
import instgen
from xml.dom import minidom
'''
predicate: module responsible for making the predicate that walk through a path.
minidom: module responsible for making a tree from a xml file.
'''

def CodeCoverage(operationImp, paths, inputs, operationname, nodeStatus, importedMch, impName):
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
        makePredicateCodeCoverage(operationImp, aux[pathToCover], pathToCover, inputs, operationname, nodeStatus, importedMch, impName) #Finding the predicate
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
    return covered

def BranchCoverage(operationImp, branchesPaths, branchStatus, paths, inputs, operationname, importedMch, impName):
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
        makePredicateBranchCoverage(operationImp, aux[pathToCover], branchStatus, branchesPaths, pathToCover, inputs, operationname, importedMch, impName) #Finding the predicate
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
    return covered

def PathCoverage(operationImp, paths, inputs, operationname, importedMch, impName):
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
    pathToCover = 1
    aux = paths
    covered = True
    #Process
    while(len(aux) != 0 and covered == True):
        covered = makePredicatePathCoverage(operationImp, aux[pathToCover], pathToCover, inputs, operationname, importedMch, impName) #Finding the predicate
        del aux[pathToCover] #Deleting the path of aux to start a new path
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
    return covered

def makePredicateBranchCoverage(operationImp, path, branchStatus, branchesPaths, pathToCover, inputs, operationName, importedMch, impName):
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
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs,
                                                                          docXML, posMut, operationImp, importedMch,
                                                                          operationName, impName)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Branch Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for branch in branchesPaths[pathToCover]: #Setting all branches of the path to True (Covered)
            branchStatus[branch] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The branches of this path were NOT covered\n")

def makePredicatePathCoverage(operationImp, path, pathToCover, inputs, operationName, importedMch, impName):
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
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs,
                                                                          docXML, posMut, operationImp, importedMch,
                                                                          operationName, impName)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        print("Inputs were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("This path can NOT be covered\n")
    return ExistValues

def makePredicateCodeCoverage(operationImp, path, pathToCover, inputs, operationName, nodeStatus, importedMch, impName):
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
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posMut = buildpredicate.makePredicateXML(node, predicateXML, way, path, inputs,
                                                                          docXML, posMut, operationImp, importedMch,
                                                                          operationName, impName)
        del way[len(way) - 1]
    predicate = instgen.make_inst(predicateXML)
    ExistValues, variables = buildpredicate.checkPredicate(predicate, "Code Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for node in path: #Setting all branches of the path to True (Covered)
            nodeStatus[node] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The nodes of this path were NOT covered yet\n")

#For testing uncomment the next lines
"""
impName = "While_i"
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
"""
