from xml.dom import minidom
import os 
import graphgen
import buildpaths

def solvePredicateCalledImplementation(calledOperation, calledMachineName):
    calledOperationImp = getImpWithCalledOperation(calledOperation, calledMachineName)
    sizenodemap = len(buildpaths.graphgen.nodemap) #Size of the graph before any alteration
    sizepaths = max(buildpaths.paths) #Size of the paths before any alteration
    buildpaths.graphgen.mapImplementationOperationCall(calledOperationImp) #The calledOperation is operation of a mch
    buildpaths.makepathsOperationCall(buildpaths.graphgen.nodemap, sizenodemap + 1)
    printDicts(sizepaths, sizenodemap)
    for path in buildpaths.paths:
        if path > sizepaths:
            predicate, outputs = findPredicatePath(path)

def findPredicatePath(path):
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML = buildPredicateImplementation(node, predicateXML, way, path, inputs, docXML, operationImp, importedMch, operationName, impName)
        del way[len(way) - 1]

def getImpWithCalledOperation(calledOperation, calledMachineName):
    for file in os.listdir('/Users/Diego Oliveira/Documents/BTestBox/coverage/'):
        if file.endswith(".bxml"):
            bxmlfile = minidom.parse(file)
            root = bxmlfile.firstChild
            if root.getAttribute('type') == 'implementation':
                abstraction = root.getElementsByTagName('Abstraction')[0]
                if abstraction.firstChild.data == calledMachineName:
                    importedImplementationOperations = root.getElementsByTagName('Operation')
                    for importedImplementationOperation in importedImplementationOperations:
                        if importedImplementationOperation.getAttribute('name') == calledOperation.getAttribute('name'):
                            return importedImplementationOperation
    return None

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

def buildPredicateImplementation(node, predicateXML, way, path):
    '''
    Make the predicate in a XML

    Inputs:
    node: The actual node in the path being evaluated
    predicateXML: The predicate in the form of a XML tree
    way: The path that remaining to be walked
    path: The path to be walked (complete path)
    inputs: The inputs of the operation
    docXML: The XML document
    posMut: The variables that are quantified inside a while
    operationImp: The operation in the implementation
    importedMch: All the imported machines
    operationName: The name of the operation being evaluated
    impName: The name of the implementation being evaluated

    Return:
    predicateXML: The predicate in the form of XML tree after evaluating the node(s)
    posMut: The variables that are quantified inside a while
    '''
    if buildpaths.graphgen.nodetype[node] == "Condition" or (buildpaths.graphgen.nodetype[node] == "ConditionWhile"
                                                               and int(way[len(way)-1]) < int(way[len(way)-2])):
        predicateXML = buildCondition(node, predicateXML, way, path, docXML)
    elif buildpaths.graphgen.nodetype[node] == "ConditionWhile":
        predicateXML = buildConditionWhileNotWhile(node, predicateXML, docXML)
    elif buildpaths.graphgen.nodetype[node] == "Instruction":
        predicateXML = buildInstruction(node, predicateXML, docXML, posMut)
    elif buildpaths.graphgen.nodetype[node] == "Call":
        if predicateXML.hasChildNodes():
            predicateXML = solveroc.buildOperationCall(node, predicateXML.cloneNode(10), docXML, operationImp, importedMch, operationName, impName, posMut)
    return predicateXML, posMut

def solveRemainingPred(predicateXML, docXML):
    '''
    Function to repair the predicateXML after saving the quantified predicates

    predicateXML: The predicate in the form of a XML tree (not well formed)
    docXML: The XML document

    Return:
    newPred: The predicate well formed and prepared to be inserted in the new while
    '''
    newPred = docXML.createElement("Predicate")
    for child in predicateXML.firstChild.nextSibling.childNodes:
        if child.nodeType != child.TEXT_NODE:
            newPred = solveNewPred(newPred, child, docXML)
    return newPred

def solveNewPred(newPred, child, docXML):
    '''
    Function to solve the NewPred

    Inputs:
    newPred: The predicate being solved in the solveRemainingPred function
    child: The child to be inserted in the newPred
    docXML: The XML document

    Return:
    newPred: The predicate solved
    '''
    if newPred.hasChildNodes():
        if newPred.firstChild.nextSibling.tagName != "Nary_Pred":
            naryPredNode = nodescreator.createNaryPred(newPred.firstChild.nextSibling, child, '&', docXML)
            newPred.insertBefore(naryPredNode, newPred.firstChild.nextSibling)
        else:
            newPred.firstChild.nextSibling.appendChild(child)
            newPred.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
    else:
        newPred.appendChild(docXML.createTextNode('\n'))
        newPred.appendChild(child)
        newPred.appendChild(docXML.createTextNode('\n'))
    return newPred

def buildConditionWhileNotWhile(node, predicateXML, docXML):
    '''
    Function to build the Condition While when is not entering the While (The guard is false in the first try)

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document

    Return:
    predicateXML: The predicate in the form of a XML tree
    '''
    unaryNode = nodescreator.createUnaryNode(buildpaths.graphgen.nodedata[node].cloneNode(10), docXML)
    instNode = nodescreator.createNaryPred(unaryNode, buildpaths.graphgen.nodeinva[node].cloneNode(10), '&', docXML)
    if predicateXML.hasChildNodes():
        if predicateXML.firstChild.nextSibling.tagName != 'Nary_Pred':
            naryPredNode = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling, instNode, '&', docXML)
            predicateXML.insertBefore(naryPredNode, predicateXML.firstChild.nextSibling)
        else:
            predicateXML.firstChild.nextSibling.appendChild(instNode)
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
    else:
        predicateXML.appendChild(docXML.createTextNode('\n'))
        predicateXML.appendChild(instNode)
        predicateXML.appendChild(docXML.createTextNode('\n'))
    return predicateXML

def buildCondition(node, predicateXML, way, path, docXML):
    '''
    Function to build the Condition of a If or a While

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document
    way: The path that remaining to be walked
    path: The path to be walked (complete path)

    Return:
    predicateXML: The predicate in the form of a XML tree
    '''
    instNode = buildpaths.graphgen.nodedata[node].cloneNode(10)
    if predicateXML.hasChildNodes():
        if predicateXML.firstChild.nextSibling.tagName != "Nary_Pred":                
            if buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "False" or buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "True and False":
                instNode = nodescreator.createUnaryNode(instNode, docXML)
                naryPredNode = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling, instNode, '&', docXML)
                predicateXML.insertBefore(naryPredNode, predicateXML.firstChild.nextSibling)
            else:
                naryPredNode = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling, instNode, '&', docXML)
                predicateXML.insertBefore(naryPredNode, predicateXML.firstChild.nextSibling)
        else:
            if buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "False" or buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "True and False":
                instNode = nodescreator.createUnaryNode(instNode, docXML)
            predicateXML.firstChild.nextSibling.appendChild(instNode)
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode("\n"))
    else:
        if buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "False" or buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "True and False":
            instNode = nodescreator.createUnaryNode(instNode, docXML)
        predicateXML.appendChild(docXML.createTextNode("\n"))
        predicateXML.appendChild(instNode)
        predicateXML.appendChild(docXML.createTextNode("\n"))
    return predicateXML

def buildInstruction(node, predicateXML, docXML, posMut):
    '''
    Function to change the predicate with the instruction

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document
    posMut: The variables that are quantified inside a while
    outputXML: The output of the operation

    Return:
    predicateXML: The predicate in the form of a XML tree
    '''
    if predicateXML.hasChildNodes():
        variablesId = buildpaths.graphgen.nodedata[node].getElementsByTagName("Variables")[0]
        variablesId = variablesId.getElementsByTagName("Id")[0].getAttribute("value")
        values = buildpaths.graphgen.nodedata[node].getElementsByTagName("Values")[0]
        values = values.firstChild.nextSibling
        allId = predicateXML.getElementsByTagName("Id")
        for Id in allId:
            if Id.getAttribute("value") == variablesId:
                if Id.getAttribute("value") in posMut:
                    parent = Id.parentNode
                    isInQuant = False
                    while(parent.parentNode != None):
                        if parent.tagName == "Quantified_Pred":
                            isInQuant = True
                        parent = parent.parentNode
                    if isInQuant == False:
                        cloneValues = values.cloneNode(5)
                        Id.parentNode.replaceChild(cloneValues, Id)
                else:
                    cloneValues = values.cloneNode(5)
                    Id.parentNode.replaceChild(cloneValues, Id)
    return predicateXML

def getMutables(node, inputs, path, condWhile, posMut, docXML):
    '''
    Function to get each variable that changes inside a while

    Input:
    inputs: The inputs of the operation
    node: The actual node being evaluated
    path: The being run in the while
    condwhile: The node that has the invariant of the while
    firstwhile: The node that ends the while (if is not a nested while, it is the same than condwhile)

    Output:
    whilemutables[:len(whilemutables)-1:]: A string of the variables that change inside the while, the format is Ex: xx,yy
    mutables: Every variable that changes inside an while
    '''
    #Get the whilemutables
    #The whilemutables are every variable that changes in the while scope
    mutables = list()
    mystr = instgen.make_inst(buildpaths.graphgen.nodeinva[condWhile])
    wordList = re.sub("[^\w]", " ",  mystr).split()
    wordList = [x for x in wordList if not (x.isdigit() or x[0] == '-' and x[1:].isdigit())]
    for word in wordList:
        if word not in inputs:
            if word not in mutables:
                if word in posMut:
                    mutables.append(word)
    variablesNode = docXML.createElement("Variables")
    variablesNode.appendChild(docXML.createTextNode('\n'))
    for mutable in mutables:
        mutableIdNode = docXML.createElement("Id")
        mutableIdNode.setAttribute("value", mutable)
        mutableIdNode.appendChild(docXML.createTextNode('\n'))
        mutableIdNode.appendChild(docXML.createElement("Attr"))
        variablesNode.appendChild(mutableIdNode)
        variablesNode.appendChild(docXML.createTextNode('\n'))
    return variablesNode, mutables
    
def checkPredicate(predicate, message, inputs):
    '''
    Check if the generated predicate can hold true

    Input:
    predicate: The predicate
    message: A message to appear to the user
    inputs: The inputs of the operation

    Output:
    ans: The answer if the predicate is false or true
    entry: A possible entry to the predicate be true (if exists)
    '''
    entry = ""
    ans, variables = callprob.evaluate(predicate, message, inputs)
    for variable in variables:
              entry += variable+" "
    return ans, entry
