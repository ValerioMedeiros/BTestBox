from xml.dom import minidom
import sys
import os
import codecs
import nodescreator
import subprocess
import solverocimp
import buildpaths
import instgen

def buildOperationCallWithOutput(node, predicateXML, outputXML, docXML, operationImp, importedMch, operationName, impName, posMut):
    '''
    Return the predicate of a called operation

    Input:
    operationImp: The operation of the implementation (the one being evaluated)
    node: The node with the type "Call"
    importedMch: All imported machines
    operationName: The name of the operation of the implementation (the one being evaluated)
    predicateXML: The predicate until now in form of a XML tree
    docXML: The XML document
    posMut: All variables quantified inside the while
    impName: The name of the implementation

    Return:
    predicateXML: The predicate until now in form of a XML tree
    '''
    calledOperation, operationInputs, operationOutputs, calledMachineName, deteminism = getMchWithTheCalledOperation(operationImp, node, importedMch, operationName)
    if not(deteminism):
        predicateXML = solverocimp.solvePredicateCalledImplementation(calledOperation, calledMachineName)
    else:
        operationIBXML = getOperationIBXML(impName, operationName, calledOperation,
                                                                             operationImp, operationInputs, operationOutputs)
        auxXML = modifyPredicateXML(predicateXML, operationIBXML)
        output = make_Sub_Calculus(operationIBXML.cloneNode(10), auxXML)
        predicateXML.replaceChild(output.firstChild.firstChild.nextSibling.lastChild.previousSibling.cloneNode(10),
                              predicateXML.firstChild.nextSibling)
        auxXML = modifyPredicateXML(outputXML, operationIBXML)
        output = make_Sub_Calculus(operationIBXML, auxXML)
        outputXML.replaceChild(output.firstChild.firstChild.nextSibling.lastChild.previousSibling.cloneNode(10),
                              outputXML.firstChild.nextSibling)
        #os.remove("encodeddocumentinput.xml")
        #os.remove("encodeddocumentoutput.xml")
        #os.remove(impName+".ibxml")
    return predicateXML, outputXML

def buildOperationCall(node, predicateXML, docXML, operationImp, importedMch, operationName, impName, posMut):
    '''
    Return the predicate of a called operation

    Input:
    operationImp: The operation of the implementation (the one being evaluated)
    node: The node with the type "Call"
    importedMch: All imported machines
    operationName: The name of the operation of the implementation (the one being evaluated)
    predicateXML: The predicate until now in form of a XML tree
    docXML: The XML document
    posMut: All variables quantified inside the while
    impName: The name of the implementation

    Return:
    predicateXML: The predicate until now in form of a XML tree
    '''
    calledOperation, operationInputs, operationOutputs, calledMachineName, deteminism = getMchWithTheCalledOperation(operationImp, node, importedMch, operationName)
    if not(deteminism):
        predicateXML = solverocimp.solvePredicateCalledImplementation(calledOperation, calledMachineName)
    else:
        operationIBXML = getOperationIBXML(impName, operationName, calledOperation,
                                                                             operationImp, operationInputs, operationOutputs)
        auxXML = modifyPredicateXML(predicateXML, operationIBXML)
        output = make_Sub_Calculus(operationIBXML, auxXML)
        predicateXML.replaceChild(output.firstChild.firstChild.nextSibling.lastChild.previousSibling.cloneNode(10),
                              predicateXML.firstChild.nextSibling)
        #os.remove("encodeddocumentinput.xml")
        #os.remove("encodeddocumentoutput.xml")
        #os.remove(impName+".ibxml")
    return predicateXML

def modifyPredicateXML(predicateXML, operationIBXML):
    '''
    Return the predicate of a called operation

    Input:
    operationIBXML: The operation in form of a XML tree (the operation call is already replaced)
    predicateXML: The predicate until now in form of a XML tree

    Return:
    predicateXML: The predicate until now in form of a XML tree
    '''
    IDsInPredicate = predicateXML.getElementsByTagName('Id')
    IDsInIBXML = operationIBXML.getElementsByTagName('Output_Parameters')[0]
    IDsInIBXML = IDsInIBXML.getElementsByTagName('Id')
    for ID in IDsInPredicate:
        for IDibxml in IDsInIBXML:
            if ID.getAttribute('value') == IDibxml.getAttribute('value'):
                ID.parentNode.replaceChild(IDibxml.cloneNode(10), ID)
    return predicateXML

def getMchWithTheCalledOperation(operationImp, node, importedMch, ImpOperationName):
    '''
    Return properties of the called operation.

    Input:
    operationImp: The operation of the implementation (the one being evaluated)
    node: The node with the type "Call"
    importedMch: All imported machines
    ImpOperationName: The name of the operation of the implementation (the one being evaluated)

    Return:
    calledOperationName : The name of the called operation
    calledOperationInputsInTheImp : The inputs of the called operation in the implementation
    calledOperationOutputsInTheImp : The outputs of the called operation in the implementation
    '''
    calledop = buildpaths.graphgen.nodedata[node]
    opname = calledop.getElementsByTagName("Name")[0].firstChild.nextSibling.getAttribute("value")
    for mch in importedMch:
        operations = mch.getElementsByTagName("Operation")
        for operation in operations:
            if operation.getAttribute("name") == opname:
                if testDeterminism(operation):
                    calledMachineName = mch.firstChild.getAttribute('name')
                    if calledop.getElementsByTagName("Input_Parameters") != []:
                        calledOperationInputsInTheImp = buildpaths.graphgen.nodedata[node].getElementsByTagName("Input_Parameters")[0]
                    else:
                        calledOperationInputsInTheImp = []
                    if calledop.getElementsByTagName("Output_Parameters") != []:
                        calledOperationOutputsIntheImp = buildpaths.graphgen.nodedata[node].getElementsByTagName("Output_Parameters")[0]
                    else:
                        calledOperationInputsInTheImp = []
                    return operation, calledOperationInputsInTheImp, calledOperationOutputsIntheImp, calledMachineName, True
                else:
                    return operation, None, None, mch.firstChild.getAttribute('name'), False
    return None, None, None, None, False

def testDeterminism(subst):
    if subst.getElementsByTagName('Select') != [] or subst.tagName == 'Select':
        return False
    if subst.getElementsByTagName('Nary_Sub') != []:
        if len(subst.getElementsByTagName('Nary_Sub')) > 1:
            for element in subst.getElementsByTagName('Nary_Sub'):
                if element.getAttribute('op') == 'CHOICE':
                    return False
        else:
            if subst.getElementsByTagName('Nary_Sub')[0].getAttribute('op') == "CHOICE":
                return False
    if (subst.tagName == 'Nary_Sub' and subst.getAttribute('op') == "CHOICE"):
        return False
    if subst.getElementsByTagName('ANY_Sub') != [] or subst.tagName == 'ANY_Sub':
        return False
    if subst.getElementsByTagName('Becomes_In') != [] or subst.tagName == 'Becomes_In':
        return False
    if subst.getElementsByTagName('Becomes_Such_That') != [] or subst.tagName == 'Becomes_Such_That':
        return False
    return True

def checkPuts(Parameters, ImpParameters):
    '''
    Return if the operation is the same (check only the inputs or the outputs)

    Input:
    Parameters: The outputs or the inputs of the machine
    ImpParameters: The outputs or the inputs of the implementation
    
    Return:
    ans: True means that the parameters are equal, False that are different (this is used to know if the same)
    '''
    ans = True
    IDs = Parameters.getElementsByTagName('Id')
    ImpIDs = ImpParameters.getElementsByTagName('Id')
    for i in range(len(IDs)):
        if IDs[i].getAttribute('value') != ImpIDs[i].getAttribute('value'):
            ans = False
    return ans

def checkOperationCall(operationCalls, operationImp, calledOperation, operationInputs, operationOutputs):
    '''
    Check if exist the operation called in the operation call, if true, return the called operation, else return None

    Input:
    operationImp: The operation of the implementation (the one being evaluated)
    calledOperationName: The name of the operation of the called operation
    operationCalls: All the Operation Calls of the operation being evaluated
    operationInputs: The inputs of the called operation in the implementation
    operationOutputs: The outputs of the called operation in the implementation

    Return:
    operationCall if the called operation is found, otherwise return None and an error is raised
    '''
    for operationCall in operationCalls:
        for child in operationCall.childNodes:
            if child.nodeType != child.TEXT_NODE:
                if child.tagName == "Operation":
                    if child.getAttribute('name') == calledOperation.getAttribute('name'):
                        okayOperation = True
                if child.tagName == 'Input_Parameters':
                    inputsIDs = child
                    okayInputs = checkPuts(inputsIDs, operationInputs)
                if child.tagName == 'Output_Parameters':
                    outputsIDs = child
                    okayOutputs = checkPuts(outputsIDs, operationOutputs)
                    outputsIDsCalledOperation = child.parentNode.getElementsByTagName('Output_Parameters')[1].cloneNode(10)
        if operationInputs == []:
            okayInputs = True
        if operationOutputs == []:
            okayOutputs = True
        if okayOperation == True & okayInputs == True & okayOutputs == True:
            return operationCall
    return None

def getOperationIBXML(impName, operationName, calledOperation, operationImp, operationInputs, operationOutputs):
    '''
    Return the IBXML tree of the implementation operation. The IBXML is a XML file that contains the substitution of the Operation Call.

    Input:
    impName: The name of the implementation
    operationImp: The operation of the implementation (the one being evaluated)
    operationName: The name of the operation of the implementation (the one being evaluated)
    calledOperationName: The name of the operation of the called operation
    operationInputs: The inputs of the called operation in the implementation
    operationOutputs: The outputs of the called operation in the implementation

    Return:
    operationIBXML: The IBXML of the implementation.
    The IBXML is a XML file that contains the substitution of the Operation Call.
    '''
    args = ["/Program Files (x86)/Atelier B full 4.4.0-beta.2/bbin/win32/pog.exe"]
    args.append("-i")
    args.append(impName+".bxml")
    p = subprocess.call(args)
    ibxml = minidom.parse(impName+".ibxml")
    for child in ibxml.firstChild.childNodes:
        if child.nodeType != child.TEXT_NODE:
            if child.tagName == "Operations":
                for operation in child.childNodes:
                    if operation.nodeType != operation.TEXT_NODE:
                        if operation.getAttribute('name') == operationName:
                            operationCalls = operation.getElementsByTagName('Operation_Call')
                            operationIBXML = checkOperationCall(operationCalls, operationImp, calledOperation, operationInputs, operationOutputs)
                            if operationIBXML != None:
                                return operationIBXML
    return None

def make_Sub_Calculus(calledOperation, predicateXML):
    '''
    Call the exe that make the substitution of the predicate, and return a predicate XML as output

    Input:
    calledOperation: The called operation tree
    predicateXML: The predicate until now

    Return:
    outputXML: The output in a XML tree
    '''
    impl = minidom.getDOMImplementation()
    subCalcXML = impl.createDocument(None, "Sub_Calculus_Father", None)
    root = subCalcXML.documentElement
    calcSub = subCalcXML.createElement("Sub_Calculus")
    root.appendChild(calcSub)
    calcSub.appendChild(calledOperation)
    calcSub.appendChild(predicateXML.firstChild.nextSibling.cloneNode(10))
    encodeddocument = subCalcXML.toprettyxml(encoding="utf-8")
    f = open("/Users/Diego Oliveira/Documents/BTestBox/coverage/encodeddocumentinput.xml", 'bw')
    f.write(encodeddocument)
    f.close()
    args = "/Users/Diego Oliveira/AtelierB/installatelierb/bbin/win32/substitution_calculus_pred.exe"
    p = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
    output, errors = p.communicate()
    if p.returncode==0:
        print("Calculus_pred executed successfully")
        #print(output)
    else:
        print("Calculus_pred - error reported and the return code is "+str(p.returncode))
        #print(output)
        print(errors)
    f = open("/Users/Diego Oliveira/Documents/BTestBox/coverage/encodeddocumentoutput.xml", 'bw')
    f.write(output)
    f.close()
    outputXML = minidom.parse("encodeddocumentoutput.xml")
    return outputXML
    
