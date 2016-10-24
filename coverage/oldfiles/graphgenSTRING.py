from xml.dom import minidom
import instgen
from collections import defaultdict
'''
minidom: Module responsible of manipulating a xml file in a tree.
instgen: Module to generate every instruction.
defaultdict: Module of dicts
'''

"""
Starting the process of building a graph, passing the BXML file

Note: While building our graph of the implementation, after the initialisation, there will exists at least an END and a CONDITION node.
Every node added to the graph manipulates the END node

The '*' in some comments means that the END node will be manipulated

This file is also used to build graphs of the called operations. But in this case, the first and the last node are a little bit different.
"""

"""
Initialisation of the dicts (graphs)

nodemap: the dict used as a graph. The first node is always the call and last node always the end.
nodetype: this dict contains if the node is a condition, while, instruction, call, skip. It guide us while making the predicate for the inputs.
nodecond: this dict contains if the previous node was false or true. It guide us while making the predicate for the inputs.
nodeiva: this dict contains the invariant of the while's
"""
nodemap = defaultdict(list) #Graph dict
nodetype = dict() #Dict of the type of the nodes
nodedata = dict() #Dict of the data of the nodes
nodecond = dict() #Dict of the previous condition of the node. If the parent is a Condition node we know if the path comes from the True or the False condition.
nodeinva = dict() #Dict with the invariant of the while and where it end.

def startMap(opmch):
    '''
    Function responsible for the initialisation of the map.
    
    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    '''
    #Initialisation of the Graph, the first node is always the Call
    nodemap[str(len(nodemap) + 1)].append('0') #Initialisation with 0, None.
    nodetype[str(len(nodetype) + 1)] = "Condition"
    nodedata[str(len(nodedata) + 1)] = instgen.make_precondition(opmch.getElementsByTagName("Precondition")[0])
    nodecond[str(len(nodecond) + 1)] = "True"
    nodeinva[str(len(nodeinva) + 1)] = ""
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap)-1))
    nodecond[str(len(nodecond) + 1)] = "True"

def mapAssig(node, opmch):
    '''
    Adding an Instruction node to the Graph.

    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the assignement
    '''
    nodetype[str(len(nodetype) + 1)] = "Instruction"
    nodedata[str(len(nodedata) + 1)] = instgen.make_assig(node)
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap) - 1))
    nodecond[str(len(nodecond) + 1)] = "True"
    nodeinva[str(len(nodemap) - 1)] = instgen.make_inst(node.childNodes.item(3))

def mapIf(node, opmch):
    '''
    Adding an If to the Graph.

    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the If
    '''
    #If Condition
    condition = node.childNodes.item(3)
    nodetype[str(len(nodetype) + 1)] = "Condition"
    nodedata[str(len(nodedata) + 1)] = instgen.make_inst(condition)
    nodeinva[str(len(nodeinva) + 1)] = ""
    conditionNode = str(len(nodemap)) #To add in the END*
    nodemap[str(len(nodemap) + 1)].append(conditionNode) #Adding in the END* node
    #Then
    nodecond[str(int(conditionNode)+1)] = "True"
    then = node.childNodes.item(5)
    makeMap(then, opmch)
    thenNode = str(len(nodemap)-1) #To add in the END*
    nodecond[str(int(thenNode) + 1)] = "True and False"
    #Else
    if node.lastChild.previousSibling.tagName == "Else": #Check if the ELSE exists
        nodecond[str(int(thenNode) + 1)] = "False"
        makeMap(node.childNodes.item(7), opmch)
        elseNode = str(len(nodemap)-1) #To add in the END*
    #Connecting the END node
    if node.lastChild.previousSibling.tagName == "Else":
        nodemap[str(len(nodemap))].append(thenNode) #Adding in the END
        aux = nodemap[str(int(thenNode) + 1)]
        nodemap[str(int(thenNode) + 1)] = [conditionNode]
        for key in aux:
            if key not in nodemap[str(len(nodemap))]:
                nodemap[str(len(nodemap))].append(key)
    else:
        nodemap[str(len(nodemap))].append(conditionNode) #Adding in the END

def mapWhile(node, opmch):
    '''
    Adding an While to the Graph

    
    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the while
    '''
    #WhileCondition
    condition = node.childNodes.item(3)
    nodetype[str(len(nodetype) + 1)] = "ConditionWhile"
    nodedata[str(len(nodedata) + 1)] = instgen.make_inst(condition)
    nodeinva[str(len(nodeinva) + 1)] = ""
    conditionNode = str(len(nodemap)) #To Connect at the END*
    nodemap[str(len(nodemap) + 1)].append(conditionNode)
    nodeinva[conditionNode] = instgen.make_inst(node.childNodes.item(7))
    #WhileBody
    nodecond[str(int(conditionNode)+1)] = "True"
    body = node.childNodes.item(5)
    makeMap(body, opmch)
    bodyNode = str(len(nodemap) - 1) #To connect at the END*
    #Connecting the while nodes
    nodemap[conditionNode].append(bodyNode)
    nodemap[str(int(bodyNode) + 1)] = [conditionNode]
    nodecond[str(int(bodyNode) + 1)] = "False"
    
def mapSkip(node, opmch):
    '''
    Adding a SKIP to the Graph
    
    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the Skip
    '''
    nodetype[str(len(nodetype)+ 1)] = "Instruction"
    nodedata[str(len(nodedata) + 1)] = "Skip"
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap) - 1))
    nodecond[str(len(nodecond) + 1)] = "True"
    nodeinva[str(len(nodeinva) + 1)] = ""

def mapOperationcall(node, opmch):
    '''
    Adding a Operation Call to the Graph
    
    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the Operation_Call
    '''
    nodetype[str(len(nodetype) + 1)] = "Call"
    nodedata[str(len(nodedata) + 1)] = instgen.make_operationcall(node)
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap) - 1))
    nodecond[str(len(nodecond) + 1)] = "True"
    nodeinva[str(len(nodeinva) + 1)] = ""
    
def mapNary(node, opmch):
    '''
    Handling the Nary_Sub and adding every child in the Graph
    
    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the Nary_Sub
    '''
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            makeMapNary(childnode, opmch)

def makeMapNary(node, opmch):
    '''
    Surfing the tree and adding every child of the Nary_Sub node to the Graph

    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: The node of the Nary_Sub
    '''
    tag = node.tagName
    if tag == "Assignement_Sub":
        mapAssig(node, opmch)
    if tag == "If_Sub":
        mapIf(node, opmch)
    if tag == "While":
        mapWhile(node, opmch)
    if tag == "VAR_IN":
        makeMap(node, opmch)
    if tag == "Skip":
        mapSkip(node, opmch)
    if tag == "Operation_Call":
        mapOperationcall(node, opmch)

def makeMap(node, opmch):
    '''
    Surfing the tree and adding every child to the Graph

    
    Input:
    opmch: The node of the operation in the machine (to get the Precondition)
    node: One of the nodes inside the Tree
    '''
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            tag = childnode.tagName
            if tag == "Body":
                if node.tagName == "Operation":
                    startMap(opmch) #Initialisation of the Graph
                    makeMap(childnode, opmch)
                else:
                    makeMap(childnode, opmch)
            if tag == "Assignement_Sub":
                mapAssig(childnode, opmch)
            if tag == "If_Sub":
                mapIf(childnode, opmch)
            if tag == "Nary_Sub":
                mapNary(childnode, opmch)
            if tag == "VAR_IN":
                makeMap(childnode, opmch)
            if tag == "While":
                mapWhile(childnode, opmch)
            if tag == "Skip":
                mapSkip(childnode, opmch)
            if tag == "Operation_Call":
                mapOperationcall(childnode, opmch)

def mapOperations(operationimp, operationmch):
    '''
    Start function, where we start the mapping.
    
    Input:
    operationmch: The node of the operation in the machine (to get the Precondition)
    operationimp: The node of the operation in the implementation
    '''
    makeMap(operationimp, operationmch)
    nodetype[str(len(nodetype)+ 1)] = "END" #Adding a type for the END node
    nodedata[str(len(nodedata) + 1)] = "END" #Adding data for the END node
    nodeinva[str(len(nodeinva) + 1)] = ""

def startMapOperation(node):
    '''
    Start the map for called operations. It works a little bit different from the principal operation being evaluated.

    Input:
    node: A node in the tree of the implementation
    '''
    nodemap[str(len(nodemap) + 1)].append('0') #Initialisation with 0, None.
    nodetype[str(len(nodetype) + 1)] = "Inputs"
    nodedata[str(len(nodedata) + 1)] = instgen.make_inputs(node.getElementsByTagName("Input_Parameters")[0])
    nodecond[str(len(nodecond) + 1)] = "True"
    nodeinva[str(len(nodeinva) + 1)] = ""
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap)-1))
    nodecond[str(len(nodecond) + 1)] = "True"

def makeMapOperation(node, opmch = ""):
    '''
    Surfing the tree and adding every child to the graph

    Inputs:
    node: A node in the tree of the implementation
    opmch: As it use ALMOST the same functions of the principal operation and we need to pass a opmch in these operations, we set it to "".
    '''
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            tag = childnode.tagName
            if tag == "Body":
                if node.tagName == "Operation":
                    startMapOperation(node) #Initialisation of the Graph #The only different thing
                    makeMap(childnode, opmch)
                else:
                    makeMap(childnode, opmch)
            if tag == "Assignement_Sub":
                mapAssig(childnode, opmch)
            if tag == "If_Sub":
                mapIf(childnode, opmch)
            if tag == "Nary_Sub":
                mapNary(childnode, opmch)
            if tag == "VAR_IN":
                makeMap(childnode, opmch)
            if tag == "While":
                mapWhile(childnode, opmch)
            if tag == "Skip":
                mapSkip(childnode, opmch)
            if tag == "Operation_Call":
                mapOperationcall(childnode, opmch)

def mapOperationsCall(operation):
    '''
    Start function to OperationCalls

    Input:
    operation: The node Operation_Call in the implementation tree
    '''
    makeMapOperation(operation)
    nodetype[str(len(nodetype) + 1)] = "END" #Adding a type for the END node
    nodedata[str(len(nodedata) + 1)] = instgen.make_inputs(operation.getElementsByTagName("Output_Parameters")[0]) #Adding the output parameters to the end node
    nodeinva[str(len(nodeinva) + 1)] = ""

def clearGraphs():
    '''
    Function to clear all graphs (Used to implementations with more then one operation.
    '''
    nodemap.clear()
    nodetype.clear()
    nodedata.clear()
    nodecond.clear()
    nodeinva.clear()

#To test uncomment the next comment.

"""
impName = "whilenested_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine   

for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            mapOperations(operationImp, operationMch)

for key in sorted(nodemap.keys()):
    print(key, nodemap[key], nodetype[key], nodedata[key], nodecond[key], nodeinva[key])
"""
