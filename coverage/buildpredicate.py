import buildpaths
from xml.dom import minidom
import callprob
import solveroc
import nodescreator
import instgen
import re

'''
buildpaths: module responsible of building the paths, branchStatus, branchesPaths
solverop: module responsible of solving the predicate for operation calls
re: Regex module
callprob: module responsible of calling ProB to evaluate a predicate
solveroc: module to solve the operation call
'''


SETSdict = dict()  # A dict of the members of all sets
SETSComponentsId = dict()
numberOfEnumeratedSetComponents = 0


def makePredicateXML(node, predicateXML, way, path, inputs, outputs, fixedNames, docXML, posMut,
                     operationImp, importedMch, operationName, impName, variablesList, variablesTypesList,
                     changedVariablesWhile, directory, atelierBDir, arrayModification, changedVariablesOC=[]):
    """
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
    """
    if " ENDWHILE" in buildpaths.graphgen.nodecond[node]:
        startWhile = node  # The node that start the while
        condWhile = path[len(way)]  # The node that contain the type ConditionWhile
        predicateXML, newPosMut = buildWhile(node, predicateXML, predicateXML.cloneNode(20), docXML,
                                             way, path, inputs, startWhile, condWhile, posMut, operationImp,
                                             docXML.createElement('Body'), impName,
                                             operationName, outputs, fixedNames, changedVariablesOC, importedMch,
                                             directory, atelierBDir)
        for mut in newPosMut:
            if mut not in posMut:
                posMut.append(mut)
        if predicateXML.getElementsByTagName('Quantified_Pred') != []:
            changedVariablesWhile = solveroc.changeVariablesNames(predicateXML, inputs, outputs, fixedNames, changedVariablesWhile, posMut)
    elif buildpaths.graphgen.nodetype[node] == "Condition" or (buildpaths.graphgen.nodetype[node] == "ConditionWhile"
                                                               and int(way[len(way) - 1]) < int(way[len(way) - 2])):
        predicateXML = buildCondition(node, predicateXML, way, path, docXML)
    elif buildpaths.graphgen.nodetype[node] == "ConditionWhile":
        if int(path[len(way)]) > int(node) + 1:
            predicateXML = buildConditionWhileNotWhile(node, predicateXML, docXML)
        else:
            predicateXML = addConditionToPredicate(buildpaths.graphgen.nodedata[node].cloneNode(10), predicateXML, docXML)
            predicateXML = addConditionToPredicate(buildpaths.graphgen.nodeinva[node].cloneNode(10), predicateXML, docXML)
    elif buildpaths.graphgen.nodetype[node] == "Instruction":
        predicateXML = buildInstruction(node, predicateXML, posMut, variablesList, variablesTypesList, arrayModification)
    elif buildpaths.graphgen.nodetype[node] == "Call":
        if predicateXML.hasChildNodes():
            predicateXML, changedVariablesOC = solveroc.buildOperationCall(node, predicateXML.cloneNode(10), docXML,
                                                                           operationImp,
                                                                           importedMch, operationName, impName, posMut,
                                                                           inputs, fixedNames, outputs,
                                                                           changedVariablesOC, directory, atelierBDir)
    return predicateXML, posMut, changedVariablesWhile


def buildWhile(node, predicateXML, clonePredicateXML, docXML, way, path, inputs, startWhile,
               condWhile, posMut, operationImp, whilePredicateXML, impName,
               operationName, outputs, fixedNames, changedVariablesOC, importedMch, directory, atelierBDir):
    """
    Make the predicate in a XML

    Inputs:
    node: The actual node in the path being evaluated
    predicateXML: The predicate in the form of a XML tree
    clonePredicateXML: A clone of the predicateXML
    way: The path that remaining to be walked
    path: The path to be walked (complete path)
    inputs: The inputs of the operation
    docXML: The XML document
    posMut: The variables that are quantified inside a while
    operationImp: The operation in the implementation
    importedMch: All the imported machines
    operationName: The name of the operation being evaluated
    impName: The name of the implementation being evaluated
    startWhile: The node that start the while (the one that the nodecond has the ENDWHILE)
    condWhile: The node that the nodetype is ConditionWhile
    whilePredicateXML: The predicate of the nodes inside the while

    Return:
    predicateXML: The predicate in the form of XML tree after evaluating the node(s)
    posMut: The variables that are quantified inside a while
    """
    if " ENDWHILE" in buildpaths.graphgen.nodecond[
        node] and node != condWhile and node != startWhile:  # Found a while inside a while
        # Building the inside
        startWhileIN = node
        condWhileIN = path[len(way)]
        newPredicateXML, newposMut = buildWhile(node, whilePredicateXML, whilePredicateXML.cloneNode(20), docXML, way,
                                                path, inputs,
                                                startWhileIN, condWhileIN, [], operationImp,
                                                docXML.createElement('Body'), impName,
                                                operationName, outputs, fixedNames, changedVariablesOC, importedMch,
                                                directory, atelierBDir)
        for mutable in newposMut:
            if mutable not in posMut:
                posMut.append(mutable)
        whilePredicateXML = newPredicateXML
        # Doing the False Guard (Continuing the previous while)
        newPredicateXML, newposMut = buildWhile(path[len(way) - 2], predicateXML, clonePredicateXML, docXML, way, path,
                                                inputs,
                                                startWhile, condWhile, posMut, operationImp,
                                                whilePredicateXML.cloneNode(20), impName,
                                                operationName, outputs, fixedNames, changedVariablesOC, importedMch,
                                                directory, atelierBDir)
        for mutable in newposMut:
            if mutable not in posMut:
                posMut.append(mutable)
        del way[len(way) - 1]
        return newPredicateXML, posMut
    elif buildpaths.graphgen.nodetype[
        node] == "ConditionWhile" and node == condWhile:  # Stop the while and return predicate
        # InsideWhile
        quantPredVariables, posMut = getMutables(inputs, condWhile, posMut, docXML)
        quantPredNode = docXML.createElement('Quantified_Pred')
        quantPredNode.setAttribute('type', '#')
        if whilePredicateXML.hasChildNodes():
            if whilePredicateXML.firstChild.nextSibling.tagName == "Nary_Pred":
                whilePredicateXML.firstChild.nextSibling.appendChild(buildpaths.graphgen.nodedata[node].cloneNode(10))
                whilePredicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
                whilePredicateXML.firstChild.nextSibling.appendChild(buildpaths.graphgen.nodeinva[node].cloneNode(10))
                whilePredicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
            else:
                naryPredNode = nodescreator.createNaryPred(whilePredicateXML.firstChild.nextSibling,
                                                           buildpaths.graphgen.nodedata[node].cloneNode(10), '&',
                                                           docXML)
                whilePredicateXML.insertBefore(naryPredNode, whilePredicateXML.firstChild.nextSibling)
                whilePredicateXML.firstChild.nextSibling.appendChild(buildpaths.graphgen.nodeinva[node].cloneNode(10))
                whilePredicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
        else:
            naryPredNode = nodescreator.createNaryPred(buildpaths.graphgen.nodedata[node].cloneNode(10),
                                                       buildpaths.graphgen.nodeinva[node].cloneNode(10), '&', docXML)
            whilePredicateXML.appendChild(docXML.createTextNode('\n'))
            whilePredicateXML.appendChild(naryPredNode)
            whilePredicateXML.appendChild(docXML.createTextNode('\n'))
        # Putting Quantified_Pred tree together
        quantPredNode.appendChild(docXML.createTextNode('\n'))
        quantPredNode.appendChild(docXML.createElement('Attr'))
        quantPredNode.appendChild(docXML.createTextNode('\n'))
        quantPredNode.appendChild(quantPredVariables)
        quantPredNode.appendChild(docXML.createTextNode('\n'))
        quantPredNode.appendChild(whilePredicateXML)
        quantPredNode.appendChild(docXML.createTextNode('\n'))
        # FalseGuard
        quantPredVariablesFG = quantPredVariables.cloneNode(5)
        quantPredNodeFG = docXML.createElement(('Quantified_Pred'))
        quantPredNodeFG.setAttribute('type', '#')
        predicateXML = clonePredicateXML
        if predicateXML.firstChild.nextSibling.tagName == "Nary_Pred":
            predicateXML.firstChild.nextSibling.appendChild(buildpaths.graphgen.nodeinva[node].cloneNode(10))
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
        else:
            naryPredNode = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling,
                                                       buildpaths.graphgen.nodeinva[node].cloneNode(10), '&', docXML)
            predicateXML.insertBefore(naryPredNode, predicateXML.firstChild.nextSibling)
        quantPredNodeFG.appendChild(docXML.createTextNode('\n'))
        quantPredNodeFG.appendChild(docXML.createElement('Attr'))
        quantPredNodeFG.appendChild(docXML.createTextNode('\n'))
        quantPredNodeFG.appendChild(quantPredVariablesFG)
        quantPredNodeFG.appendChild(docXML.createTextNode('\n'))
        quantPredNodeFG.appendChild(predicateXML)
        quantPredNodeFG.appendChild(docXML.createTextNode('\n'))
        naryPredNode = nodescreator.createNaryPred(quantPredNode, quantPredNodeFG, '&', docXML)
        pred = minidom.getDOMImplementation()
        newDocXML = pred.createDocument(None, "Condition", None)
        newPredicateXML = newDocXML.documentElement
        newPredicateXML.appendChild(docXML.createTextNode('\n'))
        newPredicateXML.appendChild(naryPredNode)
        newPredicateXML.appendChild(docXML.createTextNode('\n'))
        return newPredicateXML, posMut
    elif buildpaths.graphgen.nodetype[node] == "Condition" or (buildpaths.graphgen.nodetype[node] == "ConditionWhile"
                                                               and int(way[len(way) - 1]) < int(way[len(way) - 2])):
        whilePredicateXML = buildCondition(node, whilePredicateXML, way, path, docXML)
    elif buildpaths.graphgen.nodetype[
        node] == "ConditionWhile":  # Every remaining ConditionWhile means that we have While that did not enter
        # In this case, the condition while will behaviour like a condition, but we need to add the invariant
        whilePredicateXML = buildConditionWhileNotWhile(node, whilePredicateXML, docXML)
    elif buildpaths.graphgen.nodetype[node] == "Instruction":
        # Here we shall get the possible mutables *important step since we need to know who put inside the exists*
        # posMut -> possible mutables
        if buildpaths.graphgen.nodeinva[node] not in posMut:
            posMut.append(buildpaths.graphgen.nodeinva[node])
    elif buildpaths.graphgen.nodetype[node] == "Call":
        if whilePredicateXML.hasChildNodes():
            whilePredicateXML, changedVariablesOC = solveroc.buildOperationCallInsideWhile(node,
                                                                                           whilePredicateXML.cloneNode(
                                                                                               10), docXML,
                                                                                           operationImp,
                                                                                           importedMch, operationName,
                                                                                           impName, [], inputs, fixedNames,
                                                                                           outputs, changedVariablesOC,
                                                                                           directory, atelierBDir)
        if predicateXML.hasChildNodes():
            predicateXML, changedVariablesOC = solveroc.buildOperationCallInsideWhile(node, predicateXML.cloneNode(10),
                                                                                      docXML, operationImp,
                                                                                      importedMch, operationName,
                                                                                      impName, [], inputs, fixedNames, outputs,
                                                                                      changedVariablesOC, directory,
                                                                                      atelierBDir)
        mystr = buildpaths.graphgen.nodeinva[node]
        wordList = re.sub("[^\w]", " ", mystr).split()
        for word in wordList:
            if word not in posMut:
                posMut.append(word)
    del way[len(way) - 1]
    node = way[len(way) - 1]
    predicateXML, posMut = buildWhile(node, predicateXML, predicateXML.cloneNode(10), docXML, way, path, inputs,
                                      startWhile, condWhile, posMut, operationImp, whilePredicateXML, impName,
                                      operationName, outputs, fixedNames, changedVariablesOC, importedMch,
                                      directory, atelierBDir)
    return predicateXML, posMut


def solveRemainingPred(predicateXML, docXML):
    """
    Function to repair the predicateXML after saving the quantified predicates

    predicateXML: The predicate in the form of a XML tree (not well formed)
    docXML: The XML document

    Return:
    newPred: The predicate well formed and prepared to be inserted in the new while
    """
    newPred = docXML.createElement("Predicate")
    for child in predicateXML.firstChild.nextSibling.childNodes:
        if child.nodeType != child.TEXT_NODE:
            newPred = solveNewPred(newPred, child, docXML)
    return newPred


def solveNewPred(newPred, child, docXML):
    """
    Function to solve the NewPred

    Inputs:
    newPred: The predicate being solved in the solveRemainingPred function
    child: The child to be inserted in the newPred
    docXML: The XML document

    Return:
    newPred: The predicate solved
    """
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


def addConditionToPredicate(instNode, predicateXML, docXML):
    """
    Function to build the Condition While when is not entering the While (The guard is false in the first try)

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document

    Return:
    predicateXML: The predicate in the form of a XML tree
    """
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


def buildConditionWhileNotWhile(node, predicateXML, docXML):
    """
    Function to build the Condition While when is not entering the While (The guard is false in the first try)

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document

    Return:
    predicateXML: The predicate in the form of a XML tree
    """
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
    """
    Function to build the Condition of a If or a While

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document
    way: The path that remaining to be walked
    path: The path to be walked (complete path)

    Return:
    predicateXML: The predicate in the form of a XML tree
    """
    instNode = buildpaths.graphgen.nodedata[node].cloneNode(10)
    if predicateXML.hasChildNodes():
        if predicateXML.firstChild.nextSibling.tagName != "Nary_Pred":
            if buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "False" or \
                            buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "True and False":
                instNode = nodescreator.createUnaryNode(instNode, docXML)
                naryPredNode = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling, instNode, '&', docXML)
                predicateXML.insertBefore(naryPredNode, predicateXML.firstChild.nextSibling)
            else:
                naryPredNode = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling, instNode, '&', docXML)
                predicateXML.insertBefore(naryPredNode, predicateXML.firstChild.nextSibling)
        else:
            if buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "False" or \
                            buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "True and False":
                instNode = nodescreator.createUnaryNode(instNode, docXML)
            predicateXML.firstChild.nextSibling.appendChild(instNode)
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode("\n"))
    else:
        if buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "False" or \
                        buildpaths.graphgen.nodecond[path[len(way)]].replace(" ENDWHILE", "") == "True and False":
            instNode = nodescreator.createUnaryNode(instNode, docXML)
        predicateXML.appendChild(docXML.createTextNode("\n"))
        predicateXML.appendChild(instNode)
        predicateXML.appendChild(docXML.createTextNode("\n"))
    return predicateXML


def buildInstruction(node, predicateXML, posMut, variablesList, variablesTypeList, arrayModification):
    """
    Function to change the predicate with the instruction

    Inputs:
    node: The node being evaluated
    predicateXML: The predicate in the form of a XML tree
    docXML: The XML document
    posMut: The variables that are quantified inside a while
    outputXML: The output of the operation

    Return:
    predicateXML: The predicate in the form of a XML tree
    """
    if predicateXML.hasChildNodes():
        variablesId = buildpaths.graphgen.nodedata[node].getElementsByTagName("Variables")[0]
        variablesId = variablesId.getElementsByTagName("Id")[0].getAttribute("value")
        if variablesId in variablesList:
            for i in range(len(variablesList)):
                if variablesList[i] == variablesId:
                    arrayIndex = []
                    allId = buildpaths.graphgen.nodedata[node].getElementsByTagName("Variables")[0].getElementsByTagName('Id')
                    for i in range(len(allId)):
                        if i > 0:
                            arrayIndex.append(allId[i].cloneNode(20))
        values = buildpaths.graphgen.nodedata[node].getElementsByTagName("Values")[0]
        values = values.firstChild.nextSibling
        allId = predicateXML.getElementsByTagName("Id")
        for Id in allId:
            if Id.getAttribute("value") == variablesId:
                if Id.getAttribute("value") in posMut:
                    parent = Id.parentNode
                    isInQuant = False
                    while not parent.parentNode is None:  # ESSE WHILE PODE TAH ERRADO é while parent.parentNode != None
                        if parent.tagName == "Quantified_Pred":
                            isInQuant = True
                        parent = parent.parentNode
                    if not isInQuant:
                        cloneValues = values.cloneNode(5)
                        Id.parentNode.replaceChild(cloneValues, Id)
                else:
                    cloneValues = values.cloneNode(5)
                    Id.parentNode.replaceChild(cloneValues, Id)
                for i in range(len(arrayModification)):
                    arrayName, indexList, value = arrayModification[i]
                    for index in indexList:
                        allIdInsideTheArray = index.getElementsByTagName('Id')
                        for idInsideTheArray in allIdInsideTheArray:
                            if idInsideTheArray.getAttribute('value') == variablesId:
                                idInsideTheArray.parentNode.replaceChild(values.cloneNode(20), idInsideTheArray)
        if variablesId in variablesList: # IF THE VARIABLE IS AN ARRAY
            for i in range(len(variablesList)):  # FOR THE OUTPUTS
                if variablesList[i] == variablesId:
                    if variablesTypeList[i][0] == 'Array':
                        for Id in allId:
                            if Id.getAttribute('value') == 'output'+variablesId:
                                arrayModification.append(['output'+variablesId, arrayIndex, values.cloneNode(20)])
            for i in range(len(variablesList)):  # FOR ALL THE OTHER VARIABLES
                if variablesList[i] == variablesId:
                    if variablesTypeList[i][0] == 'Array':
                        for Id in allId:
                            if Id.getAttribute('value') == variablesId:
                                arrayModification.append([variablesId, arrayIndex, values.cloneNode(20)])
    return predicateXML


def getArrayIndexNumber(arrayIndex, predicateXML):
    indexChanges = list()
    for index in arrayIndex:
            allExpComparison = predicateXML.getElementsByTagName('Exp_Comparison')
            for expComparison in allExpComparison:
                if expComparison.firstChild.nextSibling.tagName == 'Attr':
                    count = 3
                else:
                    count = 1
                if expComparison.childNodes.item(count).tagName == 'Id':
                    if expComparison.childNodes.item(count).getAttribute('value') == index:
                        indexChanges.append(expComparison.childNodes.item(count+2).getAttribute('value'))
    return indexChanges


def getMutables(inputs, condWhile, posMut, docXML):
    """
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
    """
    # Get the whilemutables
    # The whilemutables are every variable that changes in the while scope
    mutables = list()
    mystr = instgen.make_inst(buildpaths.graphgen.nodeinva[condWhile])
    wordList = re.sub("[^\w]", " ", mystr).split()
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


def getOutput(path, pathToCover, inputs, outputs, fixedNames, operationImp, operationMch,
              importedMch, seesMch, operationName, impName, predicateInputs, variablesList, variablesTypeList,
              directory, atelierBDir, proBPath, copy_directory):
    """
    Get the output for a given input and operation
    """
    pred = minidom.getDOMImplementation()
    docXML = pred.createDocument(None, "Condition", None)
    predicateXML = docXML.documentElement
    predicateXML.appendChild(docXML.createTextNode('\n'))
    predicateXML.appendChild(buildpaths.graphgen.nodedata[str(len(buildpaths.graphgen.nodemap))].cloneNode(10))
    predicateXML.appendChild(docXML.createTextNode('\n'))
    sizeList = addVariablesToThePredicate(variablesList, predicateXML, docXML, variablesTypeList, predicateInputs)
    way = list()
    posMut = list()
    changedVariablesWhile = list()
    outputList = list()
    arrayModification = list()
    for out in outputs:
        outputList.append(out)
    for i in range(len(outputs)):
        outputList.append("output" + outputs[i])
    for key in path:
        way.append(key)
    while len(way) != 0:  # While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicateXML, posmut, changedVariablesWhile = makePredicateXML(node, predicateXML, way, path, inputs,
                                                                       outputList, fixedNames, docXML, posMut,
                                                                       operationImp, importedMch, operationName,
                                                                       impName, variablesList, variablesTypeList,
                                                                       changedVariablesWhile, directory, atelierBDir,
                                                                       arrayModification)
        del way[len(way) - 1]
    outputList = []
    auxList = list()
    auxTypeList = list()
    for i in range(len(variablesList)):
        if i < sizeList:
            auxList.append(variablesList[i])
            auxTypeList.append(variablesTypeList[i])
    variablesList = auxList
    variablesTypeList = auxTypeList
    for i in range(len(outputs)):
        outputList.append("output" + outputs[i])
    for i in range(len(variablesList)):
        outputList.append('output' + variablesList[i])
    for inp in inputs:
        if inp not in variablesList:
            variablesList.append(inp)
            variablesTypeList.append(['Normal', ''])
    addTheInputsToThePredicateXML(predicateXML, predicateInputs, docXML, variablesList, variablesTypeList)
    if arrayModification != []:
        solveArrayModification(predicateXML, arrayModification)
    ExistValues, OutputVariables, predicate = checkPredicate(predicateXML, "Getting the outputs for guide " + str(pathToCover),
                                                                                   outputList, proBPath, copy_directory, operationImp,
                                                                                   operationMch, importedMch, seesMch, predicateInputs)
    if ExistValues:
        OutputVariables = insertSetsInOutputVariables(OutputVariables, predicate, predicateXML, predicateInputs,
                                                      outputList)
        for i in range(len(outputList)):
            usingRegex = r"\b" + re.escape(outputList[i]) + r"\b"  # Using regex to change the string
            for j in range(len(OutputVariables)):
                if outputList[i] in OutputVariables[j]:
                    outputList[i] = outputList[i][6::]
                    OutputVariables[j] = re.sub(usingRegex, outputList[i], OutputVariables[j])  # Replacing using regex
        print("Output(s) were found for the predicate: " + predicate)
        print("The output(s) for the input(s) ", predicateInputs, " is/are ", OutputVariables)
    else:
        print("Output(s) were NOT found for the predicate: " + predicate)
        print('Outputs not found, this operation cannot be covered')
    return OutputVariables, ExistValues


def addTheInputsToThePredicateXML(predicateXML, predicateInputs, docXML, variablesList, variablesTypeList):
    inputsPredicateXML = docXML.createElement('Condition')
    for i in range(len(predicateInputs)):
        for j in range(len(predicateInputs[i])):
            if predicateInputs[i][j] == '=':
                variable = predicateInputs[i][:j-1:]
                value = predicateInputs[i][j+1::]
                variableXML = docXML.createElement('Id')
                variableXML.setAttribute('value', variable)
                for k in range(len(variablesList)):
                    if variablesList[k] == variable:
                        variableXML.setAttribute('typref', variablesTypeList[k][1])
                        if variablesTypeList[k][0] == 'Array':
                            valuesXML = transformArrayInXML(value[1::], docXML)
                        else:
                            valuesXML = docXML.createElement('Id')
                            valuesXML.setAttribute('value', value)
                        expComparison = nodescreator.createExpComparison(variableXML, valuesXML, '=', docXML)
        addXMLtoXML(inputsPredicateXML, expComparison, docXML)
    addXMLtoXML(predicateXML, inputsPredicateXML, docXML)


def addXMLtoXML(principalXML, addedXLM, docXML):
    if principalXML.hasChildNodes():
        if principalXML.firstChild.nextSibling.tagName == 'Nary_Exp':
            principalXML.firstChild.nextSibling.appendChild(addedXLM)
            principalXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
        else:
            naryPred = nodescreator.createNaryPred(principalXML.firstChild.nextSibling, addedXLM, '&', docXML)
            principalXML.insertBefore(naryPred, principalXML.firstChild.nextSibling)
    else:
        principalXML.appendChild(docXML.createTextNode('\n'))
        principalXML.appendChild(addedXLM)
        principalXML.appendChild(docXML.createTextNode('\n'))


def solveArrayModification(predicateXML, arrayModification):
    allExpComparison = predicateXML.getElementsByTagName('Exp_Comparison')
    print(instgen.selfcaller(predicateXML))
    for i in range(len(arrayModification)):
        arrayName, indexList, value = arrayModification[i]
        for j in range(len(indexList)):
            while not is_number(indexList[j].getAttribute('value')):
                for expComparison in allExpComparison:
                    if expComparison.firstChild.nextSibling.tagName == 'Attr':
                        count = 3
                    else:
                        count = 1
                    if expComparison.childNodes.item(count).tagName == 'Id' and expComparison.getAttribute('op') == '=':
                        if expComparison.childNodes.item(count).getAttribute('value') == indexList[j].getAttribute('value'):
                            parent = expComparison.childNodes.item(count)
                            isInQuant = False
                            while not parent.parentNode is None:
                                if parent.tagName == "Quantified_Pred":
                                    isInQuant = True
                                parent = parent.parentNode
                            if not isInQuant:
                                indexList[j] = expComparison.childNodes.item(count+2).cloneNode(20)
    for i in range(len(arrayModification)):
        arrayName, indexList, value = arrayModification[i]
        for expComparison in allExpComparison:
            if expComparison.firstChild.nextSibling.tagName == 'Attr':
                count = 3
            else:
                count = 1
            if expComparison.childNodes.item(count).tagName == 'Id' and expComparison.getAttribute('op') == '=':
                if expComparison.childNodes.item(count).getAttribute('value') == arrayName:
                    allArrayCouple = expComparison.childNodes.item(count+2).getElementsByTagName('Binary_Exp')
                    for arrayCouple in allArrayCouple:
                        if arrayCouple.firstChild.nextSibling.tagName == 'Attr':
                            countCouple = 3
                        else:
                            countCouple = 1
                        if arrayCouple.childNodes.item(countCouple).getAttribute('value') == indexList[0].getAttribute('value').replace(' ', ''):
                            arrayCouple.replaceChild(value.cloneNode(20), arrayCouple.childNodes.item(countCouple+2))


def insertSetsInOutputVariables(OutputVariables, predicate, predicateXML, inputsString, outputList):
    predicateWithSets = instgen.make_inst(predicateXML)
    for inputs in inputsString:
        predicateWithSets = predicateWithSets[:len(predicateWithSets) - 1:] + " & " + inputs + ")"
    print(predicateWithSets)
    print(predicate)
    if str(predicateWithSets) != str(predicate):
        for i in range(len(predicateWithSets)):
            if predicate[i] != predicateWithSets[i]:
                saver = i
                j = i
                k = i
                while predicateWithSets[i] != " ":
                    i += 1
                while predicate[j] != " ":
                    j += 1
                predicate = predicate[:saver:] + predicateWithSets[saver:i:] + predicate[j::]
                countSpaces = 0
                while countSpaces < 3 and k != 0:
                    if predicate[k] == " ":
                        countSpaces += 1
                    k -= 1
                if (predicate[k+1:saver-3:]) in outputList:
                    for w in range(len(OutputVariables)):
                        if (predicate[k+1:saver-3:]) in OutputVariables[w]:
                            startOfTheChange = re.search(r'\b%s\b' % predicate[k+1:saver-3:], OutputVariables[w]).end() + 3
                            OutputVariables[w] = OutputVariables[w][:startOfTheChange:] + predicateWithSets[saver:i:]
    return OutputVariables


def addVariablesToThePredicate(variablesList, predicateXML, docXML, variablesTypeList, inputs):
    outputVariables = list()
    outputVariablesType = list()
    sizeList = len(variablesList)
    for i in range(len(variablesList)):
        variableOutputNode = docXML.createElement('Id')
        variableOutputNode.setAttribute('value', 'output' + variablesList[i])
        outputVariables.append('output' + str(variablesList[i]))
        outputVariablesType.append(variablesTypeList[i])
        variableOutputNode.appendChild(docXML.createTextNode('\n'))
        variableOutputNode.appendChild(docXML.createElement('Attr'))
        variableOutputNode.appendChild(docXML.createTextNode('\n'))
        if variablesTypeList[i][0] == "Array":
            for entry in inputs:
                for j in range(len(entry)):
                    if entry[j] == '=':
                        pos = j
                        break
                if entry[:pos-1:] == variablesList[i]:
                    variableNode = transformArrayInXML(entry[pos+2::], docXML)
        else:
            variableNode = docXML.createElement('Id')
            variableNode.setAttribute('value', variablesList[i])
            variableNode.appendChild(docXML.createTextNode('\n'))
            variableNode.appendChild(docXML.createElement('Attr'))
            variableNode.appendChild(docXML.createTextNode('\n'))
        expComparisonNode = nodescreator.createExpComparison(variableOutputNode, variableNode, '=', docXML)
        if predicateXML.firstChild.nextSibling.tagName != 'Nary_Pred':
            naryPred = nodescreator.createNaryPred(predicateXML.firstChild.nextSibling, expComparisonNode, '&', docXML)
            predicateXML.insertBefore(naryPred, predicateXML.firstChild.nextSibling)
        else:
            predicateXML.firstChild.nextSibling.appendChild(expComparisonNode)
            predicateXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
    for i in range(len(outputVariables)):
        variablesList.append(outputVariables[i])
        variablesTypeList.append(outputVariablesType[i])
    return sizeList


def transformArrayInXML(valuesString, docXML):
    naryExp = docXML.createElement('Nary_Exp')
    naryExp.setAttribute('op', '{')
    naryExp.appendChild(docXML.createTextNode('\n'))
    naryExp.appendChild(docXML.createElement('Attr'))
    naryExp.appendChild(docXML.createTextNode('\n'))
    positions = list()
    for i in range(len(valuesString)):
        if valuesString[i] == ',':
            positions.append(i)
    for i in range(len(positions)):
        if i == 0:
            for j in range(len(valuesString[:positions[i]:])):
                if valuesString[:positions[i]:][j] == '|':
                    bar = j
                if valuesString[:positions[i]:][j] == '>':
                    arrow = j
            firstChild = docXML.createElement('Id')
            firstChild.setAttribute('value', valuesString[2:bar:])
            secondChild = docXML.createElement('Id')
            secondChild.setAttribute('value', valuesString[arrow+1:positions[i]-1])
            exp = nodescreator.createBinaryExp(firstChild, secondChild, '|->', docXML)
        else:
            for j in range(len(valuesString[positions[i-1]+1:positions[i]:])):
                if valuesString[positions[i-1]+1:positions[i]:][j] == '|':
                    bar = j
                if valuesString[positions[i-1]+1:positions[i]:][j] == '>':
                    arrow = j
            firstChild = docXML.createElement('Id')
            firstChild.setAttribute('value', valuesString[positions[i-1]+1:positions[i]:][1:bar:])
            secondChild = docXML.createElement('Id')
            secondChild.setAttribute('value', valuesString[positions[i-1]+1:positions[i]:][arrow+1:len(valuesString[positions[i-1]+1:positions[i]:])-1:])
            exp = nodescreator.createBinaryExp(firstChild, secondChild, '|->', docXML)
        naryExp.appendChild(exp)
        naryExp.appendChild(docXML.createTextNode('\n'))
        if i == max(range(len(positions))):
            for j in range(len(valuesString[positions[i]+1:len(valuesString)-1:])):
                if valuesString[positions[i]+1:len(valuesString)-1:][j] == '|':
                    bar = j
                if valuesString[positions[i]+1:len(valuesString)-1:][j] == '>':
                    arrow = j
            firstChild = docXML.createElement('Id')
            firstChild.setAttribute('value', valuesString[positions[i]+1:len(valuesString)-1:][1:bar:])
            secondChild = docXML.createElement('Id')
            secondChild.setAttribute('value', valuesString[positions[i]+1:len(valuesString)-1:][arrow+1:len(valuesString[positions[i]+1:len(valuesString)-2]):])
            exp = nodescreator.createBinaryExp(firstChild, secondChild, '|->', docXML)
            naryExp.appendChild(exp)
            naryExp.appendChild(docXML.createTextNode('\n'))
    return naryExp


def checkPredicate(predicateXML, message, inputs, proBPath, copy_directory, imp, mch, importedMch, seesMch, inputsString = []):
    """
    Check if the generated predicate can hold true

    Input:
    predicate: The predicate
    message: A message to appear to the user
    inputs: The inputs of the operation

    Output:
    ans: The answer if the predicate is false or true
    entry: A possible entry to the predicate be true (if exists)
    """
    setsSolver(predicateXML, imp.parentNode.parentNode, mch.parentNode.parentNode, importedMch, seesMch)
    predicate = instgen.make_inst(predicateXML)
    if inputsString != []:
        for inp in inputsString:
            predicate = predicate[:len(predicate) - 1:] + " & " + inp + ")"
    ans, variables = callprob.evaluate(predicate, message, inputs, proBPath, copy_directory)
    reSwapSets(predicateXML, imp.parentNode.parentNode)
    SETSdict.clear()
    SETSComponentsId.clear()
    global numberOfEnumeratedSetComponents
    numberOfEnumeratedSetComponents = 0
    return ans, variables, predicate


def reSwapSets(predicateXML, imp):
    allTypes = imp.getElementsByTagName('Type')
    IDInPredicateXML = predicateXML.getElementsByTagName('Id')
    for Id in IDInPredicateXML:
        typeRef = Id.getAttribute('typref')
        for tipo in allTypes:
            if tipo.getAttribute('id') == typeRef:
                typeName = tipo.firstChild.nextSibling.getAttribute('value')
                if typeName in SETSdict.keys():
                    if is_number(Id.getAttribute('value')):
                        Id.setAttribute('value', SETSComponentsId[int(Id.getAttribute('value'))])


def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False


def setsSolver(predicateXML, imp, mch, importedMch, seesMch):
    setsSwapNames(imp, predicateXML)
    setsSwapNames(mch, predicateXML)
    for imporMch in importedMch:
        setsSwapNames(imporMch.firstChild, predicateXML)
    for imporMch in seesMch:
        setsSwapNames(imporMch.firstChild, predicateXML)


def setsSwapNames(principal, predicateXML):
    global numberOfEnumeratedSetComponents
    for clauses in principal.childNodes:
        if clauses.nodeType != clauses.TEXT_NODE:
            if clauses.tagName == 'Sets':
                for set in clauses.childNodes:
                    if set.nodeType != set.TEXT_NODE:
                        if set.tagName == "Set":
                            setName = set.firstChild.nextSibling.getAttribute("value")
                            if setName not in SETSdict:
                                SETSdict[setName] = []
                                enumerate_ids = set.getElementsByTagName('Enumerated_Values')[0]
                                enumerate_ids = enumerate_ids.getElementsByTagName('Id')
                                for id in enumerate_ids:
                                    SETSdict[setName].append(id.getAttribute('value'))
                                    SETSComponentsId[numberOfEnumeratedSetComponents] = id.getAttribute('value')
                                    allIdInThePredicate = predicateXML.getElementsByTagName('Id')
                                    for idInThePredicate in allIdInThePredicate:
                                        if idInThePredicate.getAttribute('value') == SETSComponentsId[numberOfEnumeratedSetComponents] :
                                            idInThePredicate.setAttribute('value', numberOfEnumeratedSetComponents)
                                    numberOfEnumeratedSetComponents += 1


# For testing purpose uncomment this block
'''
from xml.dom import minidom
import instgen
import coverage

def getInputs(operationImp):
    inputs = instgen.make_inputs(operationImp.getElementsByTagName("Input_Parameters")[0])
    inputs = inputs.replace(" ", "") #Eliminating blank spaces
    entries = list()
    commas = list()
    if len(inputs) == 0:
        None
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

impName = "excall_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
importedMch = list()
for childnode in imp.getElementsByTagName("Machine")[0].childNodes:
    if childnode.nodeType != childnode.TEXT_NODE:
        if childnode.tagName == "Imports":
            importedMchTree = imp.getElementsByTagName("Imports")[0] #Getting all Imports branch
            importedMchTree = importedMchTree.getElementsByTagName("Referenced_Machine")[0] #Getting all referenced machine
            importedMchTree = importedMchTree.getElementsByTagName("Name")#Getting all names of imported machines
            for name in importedMchTree:
                importedMch.append(minidom.parse(name.firstChild.data+".bxml")) #Getting the imported abstraction machine
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine

for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            buildpaths.graphgen.mapOperations(operationImp, operationMch)
            buildpaths.makepaths(buildpaths.graphgen.nodemap)
            buildpaths.makebranches(buildpaths.paths)
            inputs = getInputs(operationImp)
for key in sorted(buildpaths.graphgen.nodemap.keys()):
    print(key, buildpaths.graphgen.nodemap[key], buildpaths.graphgen.nodetype[key], buildpaths.graphgen.nodedata[key], buildpaths.graphgen.nodecond[key], buildpaths.graphgen.nodeinva[key])
for key in sorted(buildpaths.paths.keys()):
    print(key, buildpaths.paths[key])
    
pathToCover = 1
coverage.makePredicateBranchCoverage(operationImp.childNodes.item(3), buildpaths.paths[pathToCover], buildpaths.branchesStatus, buildpaths.branchesPath, pathToCover, inputs, operationMch, importedMch)
'''
