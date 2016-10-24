from xml.dom import minidom
from xml.dom.minidom import getDOMImplementation
import predicate
import buildpaths
import re

def getMchWithTheCalledOperation(operationImp, node, importedMch, ImpOperationName):
    calledop = operationImp.getElementsByTagName("Operation_Call")
    for op in calledop:
        opname = op.getElementsByTagName("Name")[0].firstChild.nextSibling.getAttribute("value")
        for mch in importedMch:
            operations = mch.getElementsByTagName("Operation")
            for operation in operations:
                if operation.getAttribute("name") == opname:
                    operationTree = operation
                    calledOperationName = operation.getAttribute("name")
    return operationTree, calledOperationName

def buildOperationCall(node, predicateXML, docXML, operationImp, importedMch, operationName):
    '''
    Return the predicate of a called operation

    Input:
    operationImp: The operation of the implementation (the one being evaluated)
    node: The node with the type "Call"
    importedMch: All implementations
    impOperationName: The name of the operation of the implementation (the one being evaluated)
    predicate: the predicate until now
    '''
    calledOperation, calledOperationName = getMchWithTheCalledOperation(operationImp, node, importedMch, impOperationName)
    make_Calculus_Sub(calledOperation, predicateXML, docXML)

def makeOperationBXMLFile(calledOperation, predicateXML):
    impl = getDOMImplementation()
    newXML = impl.createDocument(None, "Calculus_Sub", None)
    root = newXML.documentElement
    root.appendChild(calledOperation)
    root.appendChild(predicateXML)
    print(calledOperation.toprettyxml())
    
    
