import buildpaths
import predicate
#import instgen
import graphgen
from xml.dom import minidom

"""
First of all, be careful since this is not well implemented. Implementations with more than one operation, while structure and operation calls
shall not work properly. Everything will be handled before, the implementations with more than one operation can even work.
"""

def CodeCoverage(paths, inputs, operationname, nodeStatus):
    """Code Coverage"""
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
        predicate.makePredicate(aux[pathToCover], pathToCover, inputs, operationname, nodeStatus) #Finding the predicate
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
