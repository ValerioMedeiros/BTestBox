import buildpaths
import graphgen
import branchcoverage
import instgen
from xml.dom import minidom

"""Careful while reading this algorithm, operation and operations are different things"""

def DoBranchCoverage():
    #Initialisation
    imp = minidom.parse("guptaex_i.bxml")
    mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
    mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
    operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
    operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine
    
    #Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            inputs = instgen.make_inputs(operationImp.getElementsByTagName("Input_Parameters")[0])
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            operationname = operationImp.getAttribute("name")
            graphgen.mapOperations(operationImp, operationMch)
            buildpaths.makepaths(graphgen.nodemap) #Building paths
            buildpaths.makebranches(buildpaths.paths) #Building branches
            branchcoverage.BranchCoverage(buildpaths.branchesPath, buildpaths.branchesStatus, buildpaths.paths, inputs, operationname)

DoBranchCoverage()
