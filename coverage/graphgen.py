from xml.dom import minidom
import instgen
from collections import defaultdict

"""
Starting the process of building a graph, passing the BXML file
If you want to test, just uncomment the next lines, remember to pass a proper implementation to the parser.
"""

"""doc = minidom.parse("ifwithtwo_i.bxml")
operations = doc.getElementsByTagName("Operations")[0]
mapOperations(operations) #Mapping all operations

for key in sorted(nodemap.keys()):
    print(key, nodemap[key], nodetype[key], nodedata[key], nodecond[key])"""

"""
Note: While building our graph of the implementation, after the initialisation, there will exists at least an END and a CONDITION node.
And every node added to the graph manipulates the END node

The '*' in some comments means that the END node will be manipulated
"""

"""Initialisation of the dicts (graphs)"""
nodemap = defaultdict(list) #Graph dict
nodetype = dict() #Dict of the type of the nodes
nodedata = dict() #Dict of the data of the nodes
nodecond = dict() #Dict of the previous condition of the node. If the parent is a Condition node we know if the path comes from the True or the False condition.

def startMap():
    """Initialisation of the Graph, the first node is always the Call"""
    nodemap[str(len(nodemap) + 1)].append('0') #Initialisation with 0, None.
    nodetype[str(len(nodetype) + 1)] = "Condition"
    nodedata[str(len(nodedata) + 1)] = "Operation Precondition" #Need to get the precondition in the abstract machine
    nodecond[str(len(nodecond) + 1)] = "True"
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap)-1))
    nodecond[str(len(nodecond) + 1)] = "True"


def mapAssig(node):
    """Adding an Instruction node to the Graph"""
    nodetype[str(len(nodetype) + 1)] = "Instruction"
    nodedata[str(len(nodedata) + 1)] = instgen.make_assig(node)
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap) - 1))
    nodecond[str(len(nodecond) + 1)] = "True"

def mapIf(node):
    """Adding an If to the Graph"""
    #If Condition
    condition = node.childNodes.item(3)
    nodetype[str(len(nodetype) + 1)] = "Condition"
    nodedata[str(len(nodedata) + 1)] = instgen.make_inst(condition)
    conditionNode = str(len(nodemap)) #To add in the END*
    nodemap[str(len(nodemap) + 1)].append(conditionNode) #Adding in the END* node
    #Then
    nodecond[str(int(conditionNode)+1)] = "True"
    then = node.childNodes.item(5)
    makeMap(then)
    thenNode = str(len(nodemap)-1) #To add in the END*
    nodecond[str(int(thenNode) + 1)] = "True and False"
    #Else
    if node.lastChild.previousSibling.tagName == "Else": #Check if the ELSE exists
        nodecond[str(int(thenNode) + 1)] = "False"
        makeMap(node.childNodes.item(7))
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

def mapWhile(node):
    """Adding an While to the Graph"""
    #WhileCondition
    condition = node.childNodes.item(3)
    nodetype[str(len(nodetype) + 1)] = "ConditionWhile"
    nodedata[str(len(nodedata) + 1)] = instgen.make_inst(condition)
    conditionNode = str(len(nodemap)) #To Connect at the END*
    nodemap[str(len(nodemap) + 1)].append(conditionNode)
    #WhileBody
    nodecond[str(int(conditionNode)+1)] = "True"
    body = node.childNodes.item(5)
    makeMap(body)
    bodyNode = str(len(nodemap) - 1) #To connect at the END*
    #Connecting the while nodes
    nodemap[conditionNode].append(bodyNode)
    nodemap[str(int(bodyNode) + 1)] = [conditionNode]
    nodecond[str(int(bodyNode) + 1)] = "False"

def mapSkip(node):
    """Adding a SKIP to the Graph"""
    nodetype[str(len(nodetype)+ 1)] = "Instruction"
    nodedata[str(len(nodedata) + 1)] = "Skip"
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap) - 1))

def mapOperationcall(node):
    """Adding a Operation Call to the Graph"""
    nodetype[str(len(nodetype) + 1)] = "Call"
    nodedata[str(len(nodedata) + 1)] = instgen.make_operationcall(node)
    nodemap[str(len(nodemap) + 1)].append(str(len(nodemap) - 1))
    nodetype[str(len(nodetype) + 1)] = ""    
    
def mapNary(node):
    """Handling the Nary_Sub and adding every child in the Graph"""
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            makeMapNary(childnode)

def makeMapNary(node):
    """Surfing the tree and adding every child of the Nary_Sub to the Graph"""
    tag = node.tagName
    if tag == "Assignement_Sub":
        mapAssig(node)
    if tag == "If_Sub":
        mapIf(node)
    if tag == "While":
        mapWhile(node)
    if tag == "VAR_IN":
        makeMap(node)
    if tag == "Skip":
        mapSkip(node)
    if tag == "Operation_Call":
        mapOperationcall(node)

def makeMap(node):
    """Surfing the tree and adding every child to the Graph"""
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            tag = childnode.tagName
            if tag == "Body":
                if node.tagName == "Operation":
                    startMap() #Initialisation of the Graph
                    makeMap(childnode)
                else:
                    makeMap(childnode)
            if tag == "Assignement_Sub":
                mapAssig(childnode)
            if tag == "If_Sub":
                mapIf(childnode)
            if tag == "Nary_Sub":
                mapNary(childnode)
            if tag == "VAR_IN":
                makeMap(childnode)
            if tag == "While":
                mapWhile(childnode)
            if tag == "Skip":
                mapSkip(childnode)
            if tag == "Operation_Call":
                mapOperationcall(childnode)

def mapOperations(node):
    """Start function, where we start the mapping"""
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            makeMap(childnode)
            nodetype[str(len(nodetype)+ 1)] = "Instruction" #Adding a type for the END node
            nodedata[str(len(nodedata) + 1)] = "END" #Adding data for the END node

