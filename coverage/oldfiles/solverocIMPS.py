from xml.dom import minidom
import nodescreator
import graphgen
import sys
import os
import codecs
import subprocess

def buildOperationCall(node, predicateXML, docXML, operationImp, importedImp, operationName, impName, posMut):
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
    calledOperatio, operationInputs, operationOutputs = getImpWithTheCalledOperation(operationImp, node, importedImp, operationName)
    print(calledOperation)
    

def getImpWithTheCalledOperation(operationImp, node, importedImp, ImpOperationName):
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
    #One problem is when the mch has two implementations
    '''
    operationCall = graphgen.nodedata[node].getElementsByTagName('Name')[0]
    operationCallName = operationCall.firstChild.nextSibling.getAttribute('value')
    for imp in importedImp:
        importedMachineOperations = imp.getElementsByTagName('Operation')
        for importedMachineOperation in importedMachineOperations:
            if importedMachineOperation.getAttribute('name') == operationCallName:
                calledOperation = ImportedMachineOperation
                calledOperationInputsInTheImp = ImportedMachineOperation.getElementsByTagName("Input_Parameters")[0]
                calledOperationOutputsIntheImp = ImportedMachineOperation.getElementsByTagName("Output_Parameters")[0]
    return calledOperation, calledOperationInputsInTheImp, calledOperationOutputsIntheImp

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

def checkOperationCall(operationCalls, operationImp, calledOperationName, operationInputs, operationOutputs):
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
                    if child.getAttribute('name') == calledOperationName:
                        okayOperation = True
                        inputIDs = child.parentNode.getElementsByTagName("Input_Parameters")[0]
                        outputIDs = child.parentNode.getElementsByTagName("Output_Parameters")[0]
                        if inputIDs != None:
                            okayInputs = checkPuts(inputIDs, operationInputs)
                        else:
                            okayInputs = True
                        if outputIDs != None:
                            okayOutputs = checkPuts(outputIDs, operationOutputs)
                        else:
                            okayOutputs = True
                        if okayOperation == True & okayInputs == True & okayOutputs == True:
                            return operationCall
    return None
