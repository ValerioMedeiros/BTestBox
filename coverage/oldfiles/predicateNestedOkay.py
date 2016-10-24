import buildpaths
import callprob
import re

def makePredicateBranchCoverage(path, branchStatus, branchesPaths, pathToCover, inputs, operationname):
    """Make the predicate for Branch Coverage"""
    way = list()
    predicate = ""
    whilemutables = ""
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, whilemutables = findpredicate(node, predicate, way, path, whilemutables, inputs) #Find the predicate
        del way[len(way) - 1]
    predicate = "("+predicate+")"
    ExistValues, variables = checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for branch in branchesPaths[pathToCover]: #Setting all branches of the path to True (Covered)
            branchStatus[branch] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The branches of this path were NOT covered\n")

def makePredicatePathCoverage(path, pathToCover, inputs, operationname):
    """Make the predicate for Path Coverage"""
    predicate = ""
    whilemutables = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, whilemutables = findpredicate(node, predicate, way, path, whilemutables, inputs) #Find the predicate
        del way[len(way) - 1]
    predicate = "("+predicate+")"
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
    whilemutables = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, whilemutables = findpredicate(node, predicate, way, path, whilemutables, inputs) #Find the predicate
        del way[len(way) - 1]
    predicate = "("+predicate+")"
    ExistValues, variables = checkPredicate(predicate, "Path Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for node in path: #Setting all branches of the path to True (Covered)
            nodeStatus[node] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The nodes of this path were NOT covered yet\n")

def findpredicate(node, predicate, aux, path, whilemutables, inputs):
    #Find and return the predicate in a string
    newpredicate = ""
    if " ENDWHILE" in buildpaths.graphgen.nodeinva[node]:
        startwhile = node #The node that start the while 
        condwhile = path[len(aux)] #The node that contain the type ConditionWhile
        newpredicate, newposmut = findPredicateWhile(node, predicate, aux, path, inputs, startwhile, condwhile, condwhile)
        for mutable in newposmut:
            if mutable not in whilemutables:
                whilemutables += " "+mutable
        return newpredicate, whilemutables
    elif buildpaths.graphgen.nodetype[node] == "Condition" or (buildpaths.graphgen.nodetype[node] == "ConditionWhile" and
                                                         aux[len(aux)-1] < aux[len(aux)-2]):
        if predicate != "": #Check if the predicate is empty, if not, add " & "
            newpredicate +=" & "
        if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
            #Check if the condition is false and add a "not(" before the predicate
            newpredicate += "not("
        else:
            newpredicate += "("
        newpredicate += buildpaths.graphgen.nodedata[node] #add the data to the NEWpredicate, and the join with the predicate
        newpredicate += ")"
    elif buildpaths.graphgen.nodetype[node] == "ConditionWhile": #This means that the ConditionWhile is a false condition
        newpredicate += " & "
        newpredicate += "not("+buildpaths.graphgen.nodedata[node]+")" #Receives the negation of the guard
        newpredicate += " & ("+buildpaths.graphgen.nodeinva[node]+")" #Receives the invariant of the loop
    elif buildpaths.graphgen.nodetype[node] == "Instruction":
        for i in range(len(buildpaths.graphgen.nodedata[node])): #Searches the assignement (can be improved using regex)
            if buildpaths.graphgen.nodedata[node][i] == ':' and buildpaths.graphgen.nodedata[node][i+1] == '=': #Find here the assingnement is done
                variable = buildpaths.graphgen.nodedata[node][:i:] #Get everything before the assingnement
                inst = buildpaths.graphgen.nodedata[node][i+2::] #Get everything after the assingnement
                variable = variable.replace(" ", "") #Eliminating all blank spaces
                inst = inst.replace(" ", "") #Eliminating all blank spaces
                inst = "(" + inst + ")"
                if variable not in whilemutables:
                    usingRegex = r"\b" + re.escape(variable) + r"\b" #Using regex to change the string
                    predicate = re.sub(usingRegex, inst, predicate) #Replacing using regex
    elif buildpaths.graphgen.nodetype[node] == "Operation Call": #*Not implemented yet*
        None
    return predicate + newpredicate, whilemutables

def findPredicateWhile(node, predicate, aux, path, inputs, startwhile, condwhile, firstwhile, whilepredicate = "", posmut = []):
    #Find the predicate inside a while
    #whilepredicate are the conditions inside the while, starting with none until anyone appear
    #We need to know when it first entered the while to get the mutables
    newpredicate = ""
    if " ENDWHILE" in buildpaths.graphgen.nodeinva[node] and node != condwhile and node != startwhile: #Found a while inside a while
        #THE VARIABLE PREDICATE IS THE NEGATION OF THE GUARD AND EVERYTHING BEFORE THE WHILE
        #THE WHILEPREDICATE IS EVERY CONDITION INSIDE A WHILE
        startwhileIN = node
        condwhileIN = path[len(aux)]
        #Doing the Inside
        newpredicate, newposmut = findPredicateWhile(node, whilepredicate, aux, path, inputs, startwhileIN, condwhileIN, firstwhile, "", [])
        for mutable in newposmut:
            if mutable not in posmut:
                posmut.append(mutable)
        whilepredicate = newpredicate
        #Doing the False Guard (Continuing the previous while)
        newpredicate, newposmut = findPredicateWhile(path[len(aux)-2], predicate, aux, path, inputs, startwhile, condwhile, firstwhile, whilepredicate, posmut)
        for mutable in newposmut:
            if mutable not in posmut:
                posmut.append(mutable)
        return newpredicate, posmut
    elif buildpaths.graphgen.nodetype[node] == "ConditionWhile" and node == condwhile: #Stop the while and return predicate
        #InsideWhile
        whilemutables, posmut = getMutables(node, inputs, path, condwhile, firstwhile, posmut)
        newpredicate += "(#("+whilemutables+")."
        if whilepredicate == "":
            newpredicate += "("+buildpaths.graphgen.nodedata[node]+" & "+buildpaths.graphgen.nodeinva[node]+"))"
        else:
            newpredicate += "("+whilepredicate+" & "+buildpaths.graphgen.nodedata[node]+" & "+buildpaths.graphgen.nodeinva[node]+"))"
        #FalseGuard
        newpredicate += " & (#("+whilemutables+")."
        newpredicate += "("+predicate+" & "+buildpaths.graphgen.nodeinva[node]+"))" #The predicate is the one before the while
        return newpredicate, posmut
    elif buildpaths.graphgen.nodetype[node] == "Condition" or (buildpaths.graphgen.nodetype[node] == "ConditionWhile" and
                                                               aux[len(aux)-1] < aux[len(aux)-2]):
        if whilepredicate != "": #Check if the predicate is empty, if not, add " & "
            whilepredicate +=" & "
        if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
            #Check if the condition is false and add a "not(" before the predicate
            whilepredicate += "not("
        else:
            whilepredicate += "("
        whilepredicate += buildpaths.graphgen.nodedata[node] #add the data to the whilepredicate
        whilepredicate += ")"
    elif buildpaths.graphgen.nodetype[node] == "ConditionWhile": #Every remaining ConditionWhile means that we have While that did not enter
        #In this case, the condition while will behaviour like a condition, but we need to add the invariant
        if whilepredicate != "":
            whilepredicate += " & "
        whilepredicate += "not("+buildpaths.graphgen.nodedata[node]+")" #Receives the negation of the condition
        whilepredicate += " & ("+buildpaths.graphgen.nodeinva[node]+")" #Receives the invariant of the loop
    elif buildpaths.graphgen.nodetype[node] == "Instruction":
        #Here we shall get the possible mutables *important step since we need to know who put inside the exists*
        #posmut -> possible mutables
        if buildpaths.graphgen.nodeinva[node].replace(" ENDWHILE", "") not in posmut:
            posmut.append(buildpaths.graphgen.nodeinva[node].replace(" ENDWHILE", ""))
    elif buildpaths.graphgen.nodetype[node] == "Operation Call": #*Not implemented yet*
        None
    del aux[len(aux)-1]
    node = aux[len(aux) - 1]
    newpredicate, posmut = findPredicateWhile(node, predicate, aux, path, inputs, startwhile, condwhile, firstwhile, whilepredicate, posmut)
    return newpredicate, posmut

def getMutables(node, inputs, path, condwhile, firstwhile, posmut):
    #Get the whilemutables
    #The whilemutables are every variable that changes in the while scope
    whilemutables = ""
    mutables = list()
    mystr = buildpaths.graphgen.nodeinva[condwhile].replace(" ENDWHILE", "")
    wordList = re.sub("[^\w]", " ",  mystr).split()
    wordList = [x for x in wordList if not (x.isdigit() or x[0] == '-' and x[1:].isdigit())]
    for word in wordList:
        if word not in inputs:
            if word not in mutables:
                if word in posmut:
                    mutables.append(word)
    for mutable in mutables:
        whilemutables += mutable
        whilemutables += ","
    return whilemutables[:len(whilemutables)-1:], mutables
    
    
def checkPredicate(predicate, message, inputs):
    """Check if the generated predicate can hold true"""
    entry = ""
    ans, variables = callprob.evaluate(predicate, message, inputs)
    for variable in variables:
              entry += variable+" "
    return ans, entry

#The right sentence
# ((xx : NAT & yy:NAT) & (#(ii,aux).((#(jj,aux).(jj<yy & (jj>=0 & jj<=yy & aux = ii*yy + jj))) & (#(jj,aux).(not(jj<yy) & (jj>=0 & jj<=yy & aux=ii*yy+jj))) & ii<xx & (ii>=0 & ii<=xx & aux = ii*yy))) & (#(ii,aux).(not(ii<xx) & (ii>=0 & ii<=xx & aux = ii*yy))))
