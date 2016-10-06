import buildpaths
import callprob
from xml.dom import minidom
import re

def PathCoverage(paths, inputs, operationname):
    """Path Coverage"""
    #Initialisation
    count = dict()
    pathToCover = 1
    aux = paths
    covered = True
    #Process
    while(len(aux) != 0 and covered == True):
        covered = makePredicate(aux[pathToCover], pathToCover, inputs, operationname) #Finding the predicate
        del aux[pathToCover] #Deleting the path of aux to start a new path
        if len(aux) != 0: #If still existing a path, pathToCover receives the lowest number
            pathToCover = min(aux.keys()) #Passing the lowest number
    return covered

def makePredicate(path, pathToCover, inputs, operationname):
    """Finding the predicate, change the call if the implementation has while"""
    thereIsWhile = False #To check if has a while
    whilenodes = list()
    bodypaths = dict()
    for node in path:
        if buildpaths.graphgen.nodetype[node] == "ConditionWhile":
            thereIsWhile = True #Change if it has a while
            if node not in whilenodes:
                whilenodes.append(node)
    if thereIsWhile == True:
        for node in whilenodes:
            whilebodypaths[str(len(bodypaths)+1)] = buildpaths.makewhilebody(buildpaths.graphgen.nodemap, str(int(node)+1), node)
        #makePredicateWithWhile(path, pathToCover, whilebodypaths) # *Not implemented yet*
    else:
        ans = makePredicateWithoutWhile(path, pathToCover, inputs, operationname)
    return ans

def makePredicateWithoutWhile(path, pathToCover, inputs, operationname):
    """Make the predicate if the implementation don't have a while structure"""
    predicate = ""
    aux = list()
    for key in path:
        aux.append(key)
    while(len(aux) != 0): #While there is nodes in the aux, get the predicate
        node = aux[len(aux) - 1]
        predicate = findpredicate(node, predicate, aux, path) #Find the predicate
        del aux[len(aux) - 1]
    predicate = "(" + predicate + ")"
    ExistValues, variables = checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        print("Inputs were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The branches of this path can NOT be covered yet\n")
    return ExistValues

def makePredicateWithWhile(path, pathToCover, whilebodypath):
    """Make the predicate if the implementation have a while structure"""
    predicate = ""
    aux = list()
    auxwhile = list()
    limit = 100
    for key in path:
        aux.append(key)
        auxwhile.append(key)
    ntry = 0
    while(limit != ntry):
        while(len(aux) != 0):
            node = aux[len(aux) - 1]
            predicate = findpredicate(node, predicate, aux, path)
            del aux[len(aux) - 1]
        ExistValues = checkPredicate(predicate, pathToCover, inputs, operationname)
        if ExistValues == True:
            limit = ntry
        else:
            for way in whilebodypath:
                None
                    

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
        else:
            newpredicate += "("
        newpredicate += buildpaths.graphgen.nodedata[node] #add the data to the NEWpredicate, and the join with the predicate
        if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
            """Check if the condition is false and add a ")" after the predicate, closing the not""" 
            newpredicate += ")"
        else:
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
                #usingRegex = r"\b(?=\w)" + re.escape(variable) + r"\b(?!\w)" #Using regex to change the string
                usingRegex = r"\b" + re.escape(variable) + r"\b" #Using regex to change the string
                predicate = re.sub(usingRegex, inst, predicate) #Replacing using regex
    elif buildpaths.graphgen.nodetype[node] == "Operation Call": #*Not implemented yet*
        None
    return predicate + newpredicate

def checkPredicate(predicate, message, inputs):
    """Check if the generated predicate can hold true"""
    entry = ""
    ans, variables = callprob.evaluate(predicate, message, inputs)
    for variable in variables:
              entry += variable+" "
    return ans, entry
