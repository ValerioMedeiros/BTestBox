import buildpaths
import graphgen
from xml.dom import minidom
import re

"""
First of all, be careful since this is not well implemented. Implementations with more than one operation, while structure and operation calls
shall not work properly. Everything will be handled before, the implementations with more than one operation can even work.
"""

#To change the implementation, change the next line
doc = minidom.parse("guptaex_i.bxml")
operations = doc.getElementsByTagName("Operations")[0] #Surfing until Operations
graphgen.mapOperations(operations) #Creating graph #Still need to get the precondition of the operation in the abstract machine
buildpaths.makepaths(graphgen.nodemap) #Building paths
buildpaths.makebranches(buildpaths.paths) #Building branches

def BranchCoverage(branchesPaths, branchStatus, paths):
    """Branch Coverage"""
    #Initialisation
    count = dict()
    pathToCover = 1
    aux = paths
    covered = False
    #Process
    while(len(aux) != 0 and covered == False):
        countcover = 0
        for p in sorted(aux.keys()): #Searching for the path with the biggest number of non covered branches
            count[p] = 0
            for branch in branchesPaths[p]:
                if branchStatus[branch] == False:
                    count[p] += 1
            if count[p] > count[pathToCover]:
                    pathToCover = p
        predicate = makePredicate(aux[pathToCover], branchStatus, branchesPaths, pathToCover) #Finding the predicate
        for branch in branchStatus: #Setting all branches of the path to True (Covered) -> It only shall occur if the predicate can hold True *Not implemented yet*
            if branchStatus[branch] == True:
                countcover += 1
        if countcover == len(branchStatus): #Counting if all branches were covered, if True, the while stops.
            covered = True
        del aux[pathToCover] #Deleting the path of aux to start a new path
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
        print(predicate + "\n") #Priting the predicate, this is not the final version

def makePredicate(path, branchStatus, branchesPaths, pathToCover):
    """Finding the predicate, change the call if the implementation has while"""
    thereIsWhile = False #To check if has a while
    for node in path:
        if buildpaths.graphgen.nodetype[node] == "ConditionWhile":
            thereIsWhile = True #Change if it has a while
    if thereIsWhile == True:
        predicate = makePredicateWithWhile(path, body, branchStatus, branchesPaths, pathToCover) # *Not implemented yet*
    else:
        predicate = makePredicateWithoutWhile(path, branchStatus, branchesPaths, pathToCover) 
    return predicate

def makePredicateWithoutWhile(path, branchStatus, branchesPaths, pathToCover):
    predicate = ""
    aux = list()
    for key in path:
        aux.append(key)
    while(len(aux) != 0): #While there is nodes in the aux, get the predicate
        node = aux[len(aux) - 1]
        predicate = findpredicate(node, predicate, aux, path) #Find the predicate
        del aux[len(aux) - 1]
        for branch in branchesPaths[pathToCover]:
            branchStatus[branch] = True
    return predicate

def findpredicate(node, predicate, aux, path):
    newpredicate = ""
    if buildpaths.graphgen.nodetype[node] == "Condition" or buildpaths.graphgen.nodetype[node] == "ConditionWhile":
        """If enters here, then we shall add it to the predicate"""
        if predicate != "": #Check if the predicate is empty, if not, add " & "
            newpredicate +=" & "
        if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
            """Check if the condition is false and add a "not(" before the predicate"""
            newpredicate += "not("
        newpredicate += buildpaths.graphgen.nodedata[node] #add the data to the NEWpredicate, and the join with the predicate
        if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
            """Check if the condition is false and add a ")" after the predicate, closing the not""" 
            newpredicate += ")"
    elif buildpaths.graphgen.nodetype[node] == "Instruction":
        """If enters here, then we may change the predicate with the data of the instruction"""
        for i in range(len(buildpaths.graphgen.nodedata[node])): #Searches the assignement (can be improved using regex)
            if buildpaths.graphgen.nodedata[node][i] == ':' and buildpaths.graphgen.nodedata[node][i+1] == '=': #Find here the assingnement is done
                variable = buildpaths.graphgen.nodedata[node][:i:] #Get everything before the assingnement
                inst = buildpaths.graphgen.nodedata[node][i+2::] #Get everything after the assingnement
                variable = variable.replace(" ", "") #Eliminating all blank spaces
                inst = inst.replace(" ", "") #Eliminating all blank spaces
                inst = "(" + inst + ")"
                usingRegex = r"\b(?=\w)" + re.escape(variable) + r"\b(?!\w)" #Using regex to change the string
                predicate = re.sub(usingRegex, inst, predicate) #Replacing using regex
    elif buildpaths.graphgen.nodetype[node] == "Operation Call": #*Not implemented yet*
        None
    return predicate + newpredicate

BranchCoverage(buildpaths.branchesPath, buildpaths.branchesStatus, buildpaths.paths)
