from xml.dom import minidom
import instgen
from collections import defaultdict
import nodescreator
import os

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

self.nodemap: the dict used as a graph. The first node is always the call and last node always the end.
self.nodetype: this dict contains if the node is a condition, while, instruction, call, skip. It guide us while making the predicate for the inputs.
self.nodecond: this dict contains if the previous node was false or true. It guide us while making the predicate for the inputs.
nodeiva: this dict contains the invariant of the while's
"""

class Graph:
    def __init__(self):
        self.nodemap = defaultdict(list)  # Graph dict
        self.nodetype = dict()  # Dict of the type of the nodes
        self.nodedata = dict()  # Dict of the data of the nodes
        self.nodecond = dict()  # Dict of the previous condition of the node. If the parent is a Condition node we know if the
        # path comes from the True or the False condition.
        self.nodeinva = dict()  # Dict with the invariant of the while and where it end.

    def startMap(self, node, opmch, importedMch, seesMch, refinementMch, directory):
        '''
        Function responsible for the initialisation of the map.

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        '''
        # Initialisation of the Graph, the first node is always the Call
        self.nodemap[str(len(self.nodemap) + 1)].append('0')  # Initialisation with 0, None.
        self.solveFirstNodeData(node, opmch, importedMch, seesMch, refinementMch, directory)
        self.nodecond[str(len(self.nodecond) + 1)] = "True"
        self.nodeinva[str(len(self.nodeinva) + 1)] = ""
        self.nodemap[str(len(self.nodemap) + 1)].append(str(len(self.nodemap) - 1))
        self.nodecond[str(len(self.nodecond) + 1)] = "True"


    def solveFirstNodeData(self, node, opmch, importedMch, seesMch, refinementMch, directory):
        doc = minidom.getDOMImplementation()
        docXML = doc.createDocument(None, "Scapegoat", None)
        if opmch.getElementsByTagName("Precondition") != []:
            self.nodedata[str(len(self.nodedata) + 1)] = opmch.getElementsByTagName("Precondition")[0].cloneNode(20)
            self.nodetype[str(len(self.nodetype) + 1)] = "Condition"
        else:
            self.nodetype[str(len(self.nodetype) + 1)] = "PreconditionTrue"
            self.nodedata[str(len(self.nodedata) + 1)] = None
        for child in opmch.parentNode.parentNode.childNodes:  # In the machine of the Implementation
            if child.nodeType != child.TEXT_NODE:
                if child.tagName == 'Invariant' or child.tagName == 'Properties' or child.tagName == 'Constraints' or\
                                child.tagName == 'Values':
                    if self.nodetype[str(len(self.nodetype))] == "Condition":
                        if child.firstChild.nextSibling.tagName == "Attr":
                            if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                self.nodedata[str(len(self.nodedata))].appendChild(
                                    child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10))
                                self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                            else:
                                self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                    child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10),
                                    self.nodedata[str(len(self.nodedata))], '&', docXML)
                        else:
                            if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                self.nodedata[str(len(self.nodedata))].appendChild(child.firstChild.nextSibling.cloneNode(10))
                                self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                            else:
                                self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                    child.firstChild.nextSibling.cloneNode(10),
                                    self.nodedata[str(len(self.nodedata))], '&', docXML)
                    else:
                        self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                        self.nodetype[str(len(self.nodetype))] = "Condition"
                elif child.tagName == 'Assertions':
                    if self.nodetype[str(len(self.nodetype))] == "Condition":
                        if child.firstChild.nextSibling.tagName == "Attr":
                            count = 3
                        else:
                            count = 1
                        for i in range(len(child.childNodes)):
                            if child.childNodes.item(i).nodeType != child.childNodes.item(i).TEXT_NODE:
                                if i >= count:
                                    if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                        self.nodedata[str(len(self.nodedata))].appendChild(child.childNodes.item(count).cloneNode(10))
                                        self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                    else:
                                        self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                            child.childNodes.item(count).cloneNode(10),
                                            self.nodedata[str(len(self.nodedata))], '&', docXML)
                    else:
                        self.nodedata[str(len(self.nodedata))] = child
                        self.nodetype[str(len(self.nodetype))] = "Condition"
                elif child.tagName == 'Sets':
                    self.solveSets(child, docXML)
        self.SolveFirstNodeImportedAndSees(importedMch, directory)
        self.SolveFirstNodeImportedAndSees(seesMch, directory)
        for child in node.parentNode.parentNode.childNodes:  # In the Implementation
            if child.nodeType != child.TEXT_NODE:
                if child.tagName == 'Invariant' or child.tagName == 'Properties' or child.tagName == 'Constraints' or child.tagName == 'Values':
                    if self.nodetype[str(len(self.nodetype))] == "Condition":
                        if child.firstChild.nextSibling.tagName == "Attr":
                            if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                self.nodedata[str(len(self.nodedata))].appendChild(
                                    child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10))
                                self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                            else:
                                self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                    child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10),
                                    self.nodedata[str(len(self.nodedata))], '&', docXML)
                        else:
                            if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                self.nodedata[str(len(self.nodedata))].appendChild(child.firstChild.nextSibling.cloneNode(10))
                                self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                            else:
                                self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                    child.firstChild.nextSibling.cloneNode(10),
                                    self.nodedata[str(len(self.nodedata))], '&', docXML)
                    else:
                        self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                        self.nodetype[str(len(self.nodetype))] = "Condition"
                elif child.tagName == 'Assertions':
                    if self.nodetype[str(len(self.nodetype))] == "Condition":
                        if child.firstChild.nextSibling.tagName == "Attr":
                            count = 3
                        else:
                            count = 1
                        for i in range(len(child.childNodes)):
                            if child.childNodes.item(i).nodeType != child.childNodes.item(i).TEXT_NODE:
                                if i >= count:
                                    if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                        self.nodedata[str(len(self.nodedata))].appendChild(child.childNodes.item(count).cloneNode(10))
                                        self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                    else:
                                        self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                            child.childNodes.item(count).cloneNode(10),
                                            self.nodedata[str(len(self.nodedata))], '&', docXML)
                    else:
                        self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                        self.nodetype[str(len(self.nodetype))] = "Condition"
                elif child.tagName == 'Sets':
                    self.solveSets(child, docXML)
        for ref in refinementMch: #For the refinement
            for child in ref.firstChild.childNodes:
                if child.nodeType != child.TEXT_NODE:
                    if child.tagName == 'Invariant' or child.tagName == 'Properties' or child.tagName == 'Constraints' or child.tagName == 'Values':
                        if self.nodetype[str(len(self.nodetype))] == "Condition":
                            if child.firstChild.nextSibling.tagName == "Attr":
                                if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                    self.nodedata[str(len(self.nodedata))].appendChild(
                                        child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10))
                                    self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                else:
                                    self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                        child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10),
                                        self.nodedata[str(len(self.nodedata))], '&', docXML)
                            else:
                                if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                    self.nodedata[str(len(self.nodedata))].appendChild(child.firstChild.nextSibling.cloneNode(10))
                                    self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                else:
                                    self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                        child.firstChild.nextSibling.cloneNode(10),
                                        self.nodedata[str(len(self.nodedata))], '&', docXML)
                        else:
                            self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                            self.nodetype[str(len(self.nodetype))] = "Condition"
                    elif child.tagName == 'Assertions':
                        if self.nodetype[str(len(self.nodetype))] == "Condition":
                            if child.firstChild.nextSibling.tagName == "Attr":
                                count = 3
                            else:
                                count = 1
                            for i in range(len(child.childNodes)):
                                if child.childNodes.item(i).nodeType != child.childNodes.item(i).TEXT_NODE:
                                    if i >= count:
                                        if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                            self.nodedata[str(len(self.nodedata))].appendChild(
                                                child.childNodes.item(count).cloneNode(10))
                                            self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                        else:
                                            self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                                child.childNodes.item(count).cloneNode(10),
                                                self.nodedata[str(len(self.nodedata))], '&', docXML)
                        else:
                            self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                            self.nodetype[str(len(self.nodetype))] = "Condition"
                    elif child.tagName == 'Sets':
                        self.solveSets(child, docXML)
        if self.nodedata['1'] is None:
            firstTrue = docXML.createElement('Id')
            firstTrue.setAttribute('value', 'TRUE')
            firstTrue.appendChild(docXML.createTextNode('\n'))
            firstTrue.appendChild(docXML.createElement('Attr'))
            firstTrue.appendChild(docXML.createTextNode('\n'))
            secondTrue = docXML.createElement('Id')
            secondTrue.setAttribute('value', 'TRUE')
            secondTrue.appendChild(docXML.createTextNode('\n'))
            secondTrue.appendChild(docXML.createElement('Attr'))
            secondTrue.appendChild(docXML.createTextNode('\n'))
            self.nodedata['1'] = nodescreator.createExpComparison(firstTrue, secondTrue, '=', docXML)


    def solveSets(self, setsClause, docXML):
        allSet = setsClause.getElementsByTagName('Set')
        for set in allSet:
            if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                self.nodedata[str(len(self.nodedata))].appendChild(set.cloneNode(20))
                self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
            else:
                self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                    set.cloneNode(10),
                    self.nodedata[str(len(self.nodedata))], '&', docXML)

    def SolveFirstNodeImportedAndSees(self, machines, directory):
        for dcmt in machines:  # In the other imported machines
            for mch in dcmt.childNodes:
                for child in mch.childNodes:
                    if child.nodeType != child.TEXT_NODE:
                        if child.tagName == 'Invariant' or child.tagName == 'Properties' or child.tagName == 'Constraints' or child.tagName == 'Values':
                            if self.nodetype[str(len(self.nodetype))] == "Condition":
                                doc = minidom.getDOMImplementation()
                                docXML = doc.createDocument(None, "Scapegoat", None)
                                if child.firstChild.nextSibling.tagName == "Attr":
                                    if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                        self.nodedata[str(len(self.nodedata))].appendChild(
                                            child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10))
                                        self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                    else:
                                        self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                            child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10),
                                            self.nodedata[str(len(self.nodedata))], '&', docXML)
                                else:
                                    if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                        self.nodedata[str(len(self.nodedata))].appendChild(child.firstChild.nextSibling.cloneNode(10))
                                        self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                    else:
                                        self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                            child.firstChild.nextSibling.cloneNode(10),
                                            self.nodedata[str(len(self.nodedata))], '&', docXML)
                            else:
                                self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                                self.nodetype[str(len(self.nodetype))] = "Condition"
                        elif child.tagName == 'Assertions':
                            if self.nodetype[str(len(self.nodetype))] == "Condition":
                                doc = minidom.getDOMImplementation()
                                docXML = doc.createDocument(None, "Scapegoat", None)
                                if child.firstChild.nextSibling.tagName == "Attr":
                                    count = 3
                                else:
                                    count = 1
                                for i in range(len(child.childNodes)):
                                    if child.childNodes.item(i).nodeType != child.childNodes.item(i).TEXT_NODE:
                                        if i >= count:
                                            if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                                self.nodedata[str(len(self.nodedata))].appendChild(
                                                    child.childNodes.item(count).cloneNode(10))
                                                self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                            else:
                                                self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                                    child.childNodes.item(count).cloneNode(10),
                                                    self.nodedata[str(len(self.nodedata))], '&', docXML)
                            else:
                                self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                                self.nodetype[str(len(self.nodetype))] = "Condition"
                        elif child.tagName == 'Sets':
                            doc = minidom.getDOMImplementation()
                            docXML = doc.createDocument(None, "Scapegoat", None)
                            self.solveSets(child, docXML)
            imp = self.getImpWithImportedMch(dcmt, directory)
            for child in imp.firstChild.childNodes:
                if child.nodeType != child.TEXT_NODE:
                    if child.tagName == 'Invariant' or child.tagName == 'Properties' or child.tagName == 'Constraints' or child.tagName == 'Values':
                        if self.nodetype[str(len(self.nodetype))] == "Condition":
                            doc = minidom.getDOMImplementation()
                            docXML = doc.createDocument(None, "Scapegoat", None)
                            if child.firstChild.nextSibling.tagName == "Attr":
                                if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                    self.nodedata[str(len(self.nodedata))].appendChild(
                                        child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10))
                                    self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                else:
                                    self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                        child.firstChild.nextSibling.nextSibling.nextSibling.cloneNode(10),
                                        self.nodedata[str(len(self.nodedata))], '&', docXML)
                            else:
                                if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                    self.nodedata[str(len(self.nodedata))].appendChild(child.firstChild.nextSibling.cloneNode(10))
                                    self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                else:
                                    self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                        child.firstChild.nextSibling.cloneNode(10),
                                        self.nodedata[str(len(self.nodedata))], '&', docXML)
                        else:
                            self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                            self.nodetype[str(len(self.nodetype))] = "Condition"
                    elif child.tagName == 'Assertions':
                        if self.nodetype[str(len(self.nodetype))] == "Condition":
                            doc = minidom.getDOMImplementation()
                            docXML = doc.createDocument(None, "Scapegoat", None)
                            if child.firstChild.nextSibling.tagName == "Attr":
                                count = 3
                            else:
                                count = 1
                            for i in range(len(child.childNodes)):
                                if child.childNodes.item(i).nodeType != child.childNodes.item(i).TEXT_NODE:
                                    if i >= count:
                                        if self.nodedata[str(len(self.nodedata))].tagName == 'Nary_Pred':
                                            self.nodedata[str(len(self.nodedata))].appendChild(
                                                child.childNodes.item(count).cloneNode(10))
                                            self.nodedata[str(len(self.nodedata))].appendChild(docXML.createTextNode('\n'))
                                        else:
                                            self.nodedata[str(len(self.nodedata))] = nodescreator.createNaryPred(
                                                child.childNodes.item(count).cloneNode(10),
                                                self.nodedata[str(len(self.nodedata))], '&', docXML)
                        else:
                            self.nodedata[str(len(self.nodedata))] = child.cloneNode(20)
                            self.nodetype[str(len(self.nodetype))] = "Condition"
                    elif child.tagName == 'Sets':
                        doc = minidom.getDOMImplementation()
                        docXML = doc.createDocument(None, "Scapegoat", None)
                        self.solveSets(self, child, docXML)


    def getImpWithImportedMch(self, importedMch, directory):
        for file in os.listdir(directory):
            if file.endswith(".bxml"):
                bxmlfile = minidom.parse(directory + os.sep + file)
                root = bxmlfile.firstChild
                if root.getAttribute('type') == 'implementation':
                    abstraction = root.getElementsByTagName('Abstraction')[0]
                    if abstraction.firstChild.data == importedMch.firstChild.getAttribute('name'):
                        return bxmlfile
        return None


    def mapAssig(self, node):
        """
        Adding an Instruction node to the Graph.

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the assignement
        """
        self.nodetype[str(len(self.nodetype) + 1)] = "Instruction"
        self.nodedata[str(len(self.nodedata) + 1)] = node
        self.nodemap[str(len(self.nodemap) + 1)].append(str(len(self.nodemap) - 1))
        self.nodecond[str(len(self.nodecond) + 1)] = "True"
        self.nodeinva[str(len(self.nodemap) - 1)] = instgen.make_inst(node.childNodes.item(3))


    def mapIf(self, node, opmch):
        """
        Adding an If to the Graph.

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the If
        """
        thenNodeList = list()
        # If Condition
        for testenode in node.childNodes:
            if testenode.nodeType != testenode.TEXT_NODE:
                if testenode.tagName == "Condition":
                    condition = testenode
        # condition = node.childNodes.item(3)
        condition = condition.childNodes.item(1)
        self.nodetype[str(len(self.nodetype) + 1)] = "Condition"
        self.nodedata[str(len(self.nodedata) + 1)] = condition
        self.nodeinva[str(len(self.nodeinva) + 1)] = ""
        conditionNode = str(len(self.nodemap))  # To add in the END*
        self.nodemap[str(len(self.nodemap) + 1)].append(conditionNode)  # Adding in the END* node
        # Then
        self.nodecond[str(int(conditionNode) + 1)] = "True"
        for testenode in node.childNodes:
            if testenode.nodeType != testenode.TEXT_NODE:
                if testenode.tagName == "Then":
                    then = testenode
                    self.makeMap(then, opmch)
        # then = node.childNodes.item(5)
        # makeMap(then, opmch)
        thenNode = str(len(self.nodemap) - 1)  # To add in the END*
        thenNodeList = self.nodemap[str(len(self.nodemap))]  # To add in the END*
        self.nodecond[str(int(thenNode) + 1)] = "True and False"
        # Else
        if node.lastChild.previousSibling.tagName == "Else":  # Check if the ELSE exists
            self.nodecond[str(int(thenNode) + 1)] = "False"
            for testenode in node.childNodes:
                if testenode.nodeType != testenode.TEXT_NODE:
                    if testenode.tagName == "Else":
                        self.makeMap(testenode, opmch)
            # makeMap(node.childNodes.item(7), opmch)
            elseNode = str(len(self.nodemap) - 1)  # To add in the END*
        # Connecting the END node
        if node.lastChild.previousSibling.tagName == "Else":
            for thennode in thenNodeList:
                if thennode not in self.nodemap[str(len(self.nodemap))]:
                    self.nodemap[str(len(self.nodemap))].append(thennode)  # Adding in the END
            aux = self.nodemap[str(int(elseNode) + 1)]
            self.nodemap[str(int(thenNode) + 1)] = [conditionNode]
            for key in aux:
                if key not in self.nodemap[str(len(self.nodemap))]:
                    self.nodemap[str(len(self.nodemap))].append(key)
        else:
            self.nodemap[str(len(self.nodemap))].append(conditionNode)  # Adding in the END


    def mapCase(self, node, opmch):
        """
        Adding a Case to the Graph:

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the Case_Sub in the BXML tree
        """
        # First part of the condition for everycase
        for testenode in node.childNodes:
            if testenode.nodeType != testenode.TEXT_NODE:
                if testenode.tagName == "Value":
                    firstconditionpart = testenode.firstChild.nextSibling
        # firstconditionpart = node.childNodes.item(3).firstChild.nextSibling
        # The condition of every other case
        for testenode in node.childNodes:
            if testenode.nodeType != testenode.TEXT_NODE:
                if testenode.tagName == "Choices":
                    choices = testenode.childNodes
        # choices = node.childNodes.item(5).childNodes
        allThenNodes = list()
        for choice in choices:
            case = minidom.getDOMImplementation()
            caseXML = case.createDocument(None, "Scapegoat", None)
            caseCondition = caseXML.documentElement
            if choice.nodeType != choice.TEXT_NODE:
                for child in choice.childNodes:
                    if child.nodeType != choice.TEXT_NODE:
                        if child.tagName == "Value":
                            caseCondition.appendChild(nodescreator.createExpComparison(firstconditionpart.cloneNode(10),
                                                                                       child.firstChild.nextSibling.cloneNode(
                                                                                           10), '=', caseXML))
                if len(caseCondition.childNodes) > 1:
                    condition = nodescreator.createNaryPred(caseCondition.childNodes.item(0),
                                                            caseCondition.childNodes.item(1), 'or', caseXML)
                    for i in range(len(caseCondition.childNodes)):
                        if i > 1:
                            condition.appendChild(caseCondition.childNodes.item(i).cloneNode(10))
                            condition.appendChild(caseXML.createTextNode('\n'))
                else:
                    condition = caseCondition.firstChild
                self.nodetype[str(len(self.nodetype) + 1)] = "Condition"
                self.nodedata[str(len(self.nodedata) + 1)] = condition
                self.nodeinva[str(len(self.nodeinva) + 1)] = ""
                conditionNode = str(len(self.nodemap))  # To add in the END
                self.nodemap[str(len(self.nodemap) + 1)].append(conditionNode)  # Adding in the END* node
                # Then
                self.nodecond[str(int(conditionNode) + 1)] = "True"
                then = choice.getElementsByTagName('Then')[0]
                self.makeMap(then, opmch)
                thenNode = str(len(self.nodemap) - 1)  # To add in the END*
                self.nodecond[str(int(thenNode) + 1)] = "False"
                # Conecting an condition in the other (nested if's)
                for thennode in self.nodemap[str(int(thenNode) + 1)]:
                    if thennode not in allThenNodes:
                        allThenNodes.append(thennode)
                self.nodemap[str(int(thenNode) + 1)] = [conditionNode]
        if node.lastChild.previousSibling.tagName == "Else":
            # body = node.lastChild.previousSibling.firstChild.nextSibling
            # body = body.childNodes.item(3)
            for testenode in node.childNodes:
                if testenode.nodeType != testenode.TEXT_NODE:
                    if testenode.tagName == "Else":
                        for childTestNode in testenode.childNodes:
                            if childTestNode.nodeType != childTestNode.TEXT_NODE:
                                if childTestNode.tagName == "Choice":
                                    for childChildTestNode in childTestNode.childNodes:
                                        if childChildTestNode.nodeType != childChildTestNode.TEXT_NODE:
                                            if childChildTestNode.tagName == "Then":
                                                body = childChildTestNode
            self.nodecond[str(int(thenNode) + 1)] = "False"
            self.makeMap(body, opmch)
            elseNode = str(len(self.nodemap) - 1)  # To add in the END*
        else:
            allThenNodes.append(conditionNode)
        # Conecting the END
        self.nodecond[str(len(self.nodemap))] = "True and False"
        for thennode in allThenNodes:
            if thennode not in self.nodemap[str(len(self.nodemap))]:
                self.nodemap[str(len(self.nodemap))].append(thennode)


    def mapWhile(self, node, opmch):
        """
        Adding an While to the Graph


        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the while
        """
        # WhileCondition
        for childnode in node.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                if childnode.tagName == 'Condition':
                    condition = childnode.cloneNode(10)
                    condition = condition.childNodes.item(1)
        self.nodetype[str(len(self.nodetype) + 1)] = "ConditionWhile"
        self.nodedata[str(len(self.nodedata) + 1)] = condition
        self.nodeinva[str(len(self.nodeinva) + 1)] = ""
        conditionNode = str(len(self.nodemap))  # To Connect at the END*
        self.nodemap[str(len(self.nodemap) + 1)].append(conditionNode)
        for childnode in node.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                if childnode.tagName == 'Invariant':
                    self.nodeinva[conditionNode] = childnode.cloneNode(10)
        # WhileBody
        self.nodecond[str(int(conditionNode) + 1)] = "True"
        for childnode in node.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                if childnode.tagName == 'Body':
                    body = childnode.cloneNode(10)
        self.makeMap(body, opmch)
        bodyNode = str(len(self.nodemap) - 1)  # To connect at the END*
        # Connecting the while nodes
        self.nodemap[conditionNode].append(bodyNode)
        self.nodemap[str(int(bodyNode) + 1)] = [conditionNode]
        self.nodecond[str(int(bodyNode) + 1)] = "False"


    def mapSkip(self, node):
        """
        Adding a SKIP to the Graph

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the Skip
        """
        self.nodetype[str(len(self.nodetype) + 1)] = "Skip"
        self.nodedata[str(len(self.nodedata) + 1)] = node
        self.nodemap[str(len(self.nodemap) + 1)].append(str(len(self.nodemap) - 1))
        self.nodecond[str(len(self.nodecond) + 1)] = "True"
        self.nodeinva[str(len(self.nodeinva) + 1)] = ""


    def mapOperationcall(self, node):
        """
        Adding a Operation Call to the Graph

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the Operation_Call
        """
        self.nodetype[str(len(self.nodetype) + 1)] = "Call"
        self.nodedata[str(len(self.nodedata) + 1)] = node
        self.nodemap[str(len(self.nodemap) + 1)].append(str(len(self.nodemap) - 1))
        self.nodecond[str(len(self.nodecond) + 1)] = "True"
        outputs = ""
        for childNode in node.childNodes:
            if childNode.nodeType != childNode.TEXT_NODE:
                if childNode.tagName == "Output_Parameters":
                    outputs = instgen.make_outputParameters(childNode)
        self.nodeinva[str(len(self.nodeinva) + 1)] = outputs


    def mapNary(self, node, opmch):
        """
        Handling the Nary_Sub and adding every child in the Graph

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the Nary_Sub
        """
        for childnode in node.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                self.makeMapNary(childnode, opmch)


    def makeMapNary(self, node, opmch):
        '''
        Surfing the tree and adding every child of the Nary_Sub node to the Graph

        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: The node of the Nary_Sub
        '''
        tag = node.tagName
        if tag == "Assignement_Sub":
            self.mapAssig(node)
        if tag == "If_Sub":
            self.mapIf(node, opmch)
        if tag == "While":
            self.mapWhile(node, opmch)
        if tag == "VAR_IN":
            self.makeMap(node, opmch)
        if tag == "Skip":
            self.mapSkip(node)
        if tag == "Operation_Call":
            self.mapOperationcall(node)
        if tag == "Case_Sub":
            self.mapCase(node, opmch)


    def makeMap(self, node, opmch, importedMch=[], seesMch=[], refinementMch = [], directory=[]):
        """
        Surfing the tree and adding every child to the Graph


        Input:
        opmch: The node of the operation in the machine (to get the Precondition)
        node: One of the nodes inside the Tree
        """
        for childnode in node.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                tag = childnode.tagName
                if tag == "Body":
                    if node.tagName == "Operation":
                        self.startMap(node, opmch, importedMch, seesMch, refinementMch, directory)  # Initialisation of the Graph
                        self.makeMap(childnode, opmch)
                    else:
                        self.makeMap(childnode, opmch)
                if tag == "Assignement_Sub":
                    self.mapAssig(childnode)
                if tag == "If_Sub":
                    self.mapIf(childnode, opmch)
                if tag == "Nary_Sub":
                    self.mapNary(childnode, opmch)
                if tag == "VAR_IN":
                    self.makeMap(childnode, opmch)
                if tag == "While":
                    self.mapWhile(childnode, opmch)
                if tag == "Skip":
                    self.mapSkip(childnode)
                if tag == "Operation_Call":
                    self.mapOperationcall(childnode)
                if tag == "Case_Sub":
                    self.mapCase(childnode, opmch)


    def mapOperations(self, operationimp, operationmch, directory, importedMch=[], seesMch=[], refinementMch = []):
        """
        Start function, where we start mapping.
    
        Input:
        operationmch: The node of the operation in the machine (to get the Precondition)
        operationimp: The node of the operation in the implementation
        directory: The directory with the bxml files
        importedMch: List with the imported machines
        seesMch: List with the seen machines
        refinementMch: List with the refinements
        """

        self.makeMap(operationimp, operationmch, importedMch, seesMch, refinementMch, directory)
        self.nodetype[str(len(self.nodetype) + 1)] = "END"  # Adding a type for the END node
        outputs = None
        for childNode in operationimp.childNodes:
            if childNode.nodeType != childNode.TEXT_NODE:
                if childNode.tagName == "Output_Parameters":
                    outputs = childNode.cloneNode(10)
        doc = minidom.getDOMImplementation()
        docXML = doc.createDocument(None, "Scapegoat", None)
        finalOutputXML = docXML.createElement('Output')
        if outputs != None:
            for child in outputs.childNodes:
                if child.nodeType != child.TEXT_NODE:
                    outputNode = docXML.createElement('Id')
                    outputNode.setAttribute('value', 'output' + child.getAttribute('value'))
                    outputNode.appendChild(docXML.createTextNode('\n'))
                    outputNode.appendChild(docXML.createElement('Attr'))
                    outputNode.appendChild(docXML.createTextNode('\n'))
                    outputs.replaceChild(nodescreator.createExpComparison(outputNode, child.cloneNode(10), '=', docXML),
                                         child)
            for output in outputs.childNodes:
                if output.nodeType != output.TEXT_NODE:
                    if finalOutputXML.hasChildNodes():
                        if finalOutputXML.firstChild.nextSibling.tagName == 'Nary_Pred':
                            finalOutputXML.firstChild.nextSibling.appendChild(output)
                            finalOutputXML.firstChild.nextSibling.appendChild(docXML.createTextNode('\n'))
                        else:
                            naryPredNode = nodescreator.createNaryPred(finalOutputXML.firstChild.nextSibling, output, '&',
                                                                       docXML)
                            finalOutputXML.replaceChild(naryPredNode, finalOutputXML.firstChild.nextSibling)
                    else:
                        finalOutputXML.appendChild(docXML.createTextNode('\n'))
                        finalOutputXML.appendChild(output)
                        finalOutputXML.appendChild(docXML.createTextNode('\n'))
        else:
            firstTrue = docXML.createElement('Id')
            firstTrue.setAttribute('value', 'TRUE')
            firstTrue.appendChild(docXML.createTextNode('\n'))
            firstTrue.appendChild(docXML.createElement('Attr'))
            firstTrue.appendChild(docXML.createTextNode('\n'))
            secondTrue = docXML.createElement('Id')
            secondTrue.setAttribute('value', 'TRUE')
            secondTrue.appendChild(docXML.createTextNode('\n'))
            secondTrue.appendChild(docXML.createElement('Attr'))
            secondTrue.appendChild(docXML.createTextNode('\n'))
            finalOutputXML.appendChild(docXML.createTextNode('\n'))
            finalOutputXML.appendChild(nodescreator.createExpComparison(firstTrue, secondTrue, '=', docXML))
            finalOutputXML.appendChild(docXML.createTextNode('\n'))
        self.nodedata[str(len(self.nodedata) + 1)] = finalOutputXML.firstChild.nextSibling  # Adding data for the END node
        self.nodeinva[str(len(self.nodeinva) + 1)] = ""
        for key in sorted(self.nodemap.keys()):
            print(key, self.nodemap[key], self.nodetype[key], self.nodedata[key], self.nodecond[key], self.nodeinva[key])
    
    def clearGraphs(self):
        '''
        Function to clear all graphs (Used to implementations with more then one operation.
        '''
        self.nodemap.clear()
        self.nodetype.clear()
        self.nodedata.clear()
        self.nodecond.clear()
        self.nodeinva.clear()


# To test, uncomment the next comment.
'''
impName = "triple_while_while_while_i"
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

for key in sorted(self.nodemap.keys()):
    print(key, self.nodemap[key], self.nodetype[key], self.nodedata[key], self.nodecond[key], self.nodeinva[key])
'''
