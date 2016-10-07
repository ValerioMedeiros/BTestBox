import buildpaths
import callprob
import re

def makePredicateBranchCoverage(path, branchStatus, branchesPaths, pathToCover, inputs, operationname):
    """Make the predicate for Branch Coverage"""
    predicate = ""
    whilepredicate = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, node, whilepredicate = findpredicate(node, predicate, way, path, whilepredicate) #Find the predicate
        del way[len(way) - 1]
    if whilepredicate == "":
        predicate = "("+predicate+")"
    else:
        predicate = "("+predicate+" & "+whilepredicate+")"
    ExistValues, variables = checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for branch in branchesPaths[pathToCover]: #Setting all branches of the path to True (Covered)
            branchStatus[branch] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The branches of this path can NOT be covered yet\n")

def makePredicatePathCoverage(path, pathToCover, inputs, operationname):
    """Make the predicate for Path Coverage"""
    predicate = ""
    whilepredicate = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, node, whilepredicate = findpredicate(node, predicate, way, path, whilepredicate) #Find the predicate
        del way[len(way) - 1]
    if whilepredicate == "":
        predicate = "("+predicate+")"
    else:
        predicate = "("+predicate+" & "+whilepredicate+")"
    ExistValues, variables = checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        print("Inputs were found for the predicate: "+predicate)
        print("An option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("This path can NOT be covered\n")
    return ExistValues

def makePredicateCodeCoverage(path, pathToCover, inputs, operationname, nodeStatus):
    """Make the predicate for Code Coverage"""
    predicate = ""
    whilepredicate = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, node, whilepredicate = findpredicate(node, predicate, way, path, whilepredicate) #Find the predicate
        del way[len(way) - 1]
    if whilepredicate == "":
        predicate = "("+predicate+")"
    else:
        predicate = "("+predicate+" & "+whilepredicate+")"
    ExistValues, variables = checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for node in path: #Setting all branches of the path to True (Covered)
            nodeStatus[node] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The nodes of this path were NOT covered yet\n")

def findpredicate(node, predicate, aux, path, whilepredicate):
    """Find and return the predicate in a string"""
    newpredicate = ""
    predicatewhile = ""
    whilemutables = ""
    if "ENDWHILE" in buildpaths.graphgen.nodeinva[node]: #Found a WHILE
        newpredicate = predicate.replace(" & not("+buildpaths.graphgen.nodedata[path[len(aux)]]+")","")
        whilenode = path[len(aux)]
        predicatewhile = findPredicateWhile(node, predicate, aux, path, whilemutables, newpredicate, whilenode)
    else:
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
                    usingRegex = r"\b" + re.escape(variable) + r"\b" #Using regex to change the string
                    predicate = re.sub(usingRegex, inst, predicate) #Replacing using regex
        elif buildpaths.graphgen.nodetype[node] == "Operation Call": #*Not implemented yet*
            None
    if predicatewhile != "":
        return "", node, predicatewhile
    else:
        return predicate + newpredicate, node, whilepredicate

def findPredicateWhile(node, predicate, aux, path, whilemutables, newpredicate, whilenode):
    """Find and return the predicate inside the while in a string"""
    predicatewhile = ""
    if buildpaths.graphgen.nodetype[node] == "ConditionWhile" and node == whilenode:
        newpredicate += " & "+buildpaths.graphgen.nodedata[node]
        newpredicate += " & "+buildpaths.graphgen.nodeinva[node]
        predicatewhile += "#("+whilemutables[:len(whilemutables)-1:]+").("+newpredicate+")"
    else:
        if buildpaths.graphgen.nodetype[node] == "Condition":
            """If enters here, then we shall add it to the predicate"""
            if newpredicate != "": #Check if the predicate is empty, if not, add " & "
                newpredicate +=" & "
            if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
                """Check if the condition is false and add a "not(" before the predicate"""
                newpredicate += "not("
            else:
                newpredicate += "("
            newpredicate += buildpaths.graphgen.nodedata[node] #add the data to the NEWpredicate, and the join with the predicate
            newpredicate += ")"
        elif buildpaths.graphgen.nodetype[node] == "Instruction":
            """If enters here, then we may change the predicate with the data of the instruction"""
            if "ENDWHILE" in buildpaths.graphgen.nodeinva[node] and (buildpaths.graphgen.nodeinva[node].replace(" ENDWHILE", "") not in whilemutables):
                whilemutables += buildpaths.graphgen.nodeinva[node].replace(" ENDWHILE", "")
                whilemutables += ","
            elif buildpaths.graphgen.nodeinva[node] not in whilemutables:
                whilemutables += buildpaths.graphgen.nodeinva[node]
                whilemutables += ","
        elif buildpaths.graphgen.nodetype[node] == "Operation Call": #*Not implemented yet*
            None
        del aux[len(aux) - 1]
        node = aux[len(aux) - 1]
        predicatewhile = findPredicateWhile(node, predicate, aux, path, whilemutables, newpredicate, whilenode)
    return predicatewhile
    
def checkPredicate(predicate, message, inputs):
    """Check if the generated predicate can hold true"""
    entry = ""
    ans, variables = callprob.evaluate(predicate, message, inputs)
    for variable in variables:
              entry += variable+" "
    return ans, entry
