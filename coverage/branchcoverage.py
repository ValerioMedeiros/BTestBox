import buildpaths
import genmachine
import utils
from xml.dom import minidom
import re

"""
First of all, be careful since this is not well implemented. Implementations with more than one operation, while structure and operation calls
shall not work properly. Everything will be handled before, the implementations with more than one operation can even work.
"""

def BranchCoverage(branchesPaths, branchStatus, paths, inputs, operationname):
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
        predicate = makePredicate(aux[pathToCover], branchStatus, branchesPaths, pathToCover, inputs, operationname) #Finding the predicate
        for branch in branchStatus: #Counting if all branches were covered, if True, the while stops.
            if branchStatus[branch] == True:
                countcover += 1
        if countcover == len(branchStatus): 
            covered = True
        del aux[pathToCover] #Deleting the path of aux to start a new path
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
        print(predicate + "\n") #Priting the predicate, this is not the final version

def makePredicate(path, branchStatus, branchesPaths, pathToCover, inputs, operationname):
    """Finding the predicate, change the call if the implementation has while"""
    thereIsWhile = False #To check if has a while
    for node in path:
        if buildpaths.graphgen.nodetype[node] == "ConditionWhile":
            thereIsWhile = True #Change if it has a while
    if thereIsWhile == True:
        predicate = makePredicateWithWhile(path, body, branchStatus, branchesPaths, pathToCover) # *Not implemented yet*
    else:
        predicate = makePredicateWithoutWhile(path, pathToCover)
        ExistValues = checkPredicate(predicate, pathToCover, inputs, operationname)
        if ExistValues == True:
            for branch in branchesPaths[pathToCover]: #Setting all branches of the path to True (Covered) -> It only shall occur if the predicate can hold True *Not implemented yet*
                branchStatus[branch] = True
    return predicate

def makePredicateWithoutWhile(path, pathToCover):
    """Make the predicate if the implementation don't have a while structure"""
    predicate = ""
    aux = list()
    for key in path:
        aux.append(key)
    while(len(aux) != 0): #While there is nodes in the aux, get the predicate
        node = aux[len(aux) - 1]
        predicate = findpredicate(node, predicate, aux, path) #Find the predicate
        del aux[len(aux) - 1]
    return predicate

def findpredicate(node, predicate, aux, path):
    """Find and return the predicate in a string"""
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

def checkPredicate(predicate, pathToCover, inputs, operationname):
    """Check if the generated predicate can hold true"""
    genmachine.createMachineFile(predicate, inputs, "BC", pathToCover, operationname) #Creating a B machine with the Precondition equal the predicate
    ##### INSERT utils.executeSub HERE #####
    return True
