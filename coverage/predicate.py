import buildpaths
import solverop
import callprob
import re
'''
buildpaths: module responsible of building the paths, branchStatus, branchesPaths
solverop: module responsible of solving the predicate for operation calls
re: Regex module
callprob: module responsible of calling ProB to evaluate a predicate
'''

def makePredicateBranchCoverage(operationImp, path, branchStatus, branchesPaths, pathToCover, inputs, operationname, importedImp):
    '''
    Make the predicate for Branch Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    path: The path being evaluated
    inputs: The inputs of the operation
    operationname: The name of the operation
    branchesPaths: A dict with the branches of a given path
    branchesStatus: A dict with every branch status, initially every branchStatus is False (uncovered)
    importedImp: A list with the parse of all imported implementations
    pathToCover: The number of the path in the path dicts

    Variables:
    way: A scapegoat variable to do not erase the path variable
    predicate: The predicate (a string)
    whilemutables: Every variable that change inside the while

    Output:
    It says to the user if the path can be walked (and the inputs for this) or not
    '''
    way = list()
    predicate = ""
    whilemutables = ""
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, whilemutables = findpredicate(operationImp, node, predicate, way, path, whilemutables, inputs, operationname, importedImp) #Find the predicate
        del way[len(way) - 1]
    predicate = "("+predicate+")"
    ExistValues, variables = checkPredicate(predicate, "Branch Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for branch in branchesPaths[pathToCover]: #Setting all branches of the path to True (Covered)
            branchStatus[branch] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The branches of this path were NOT covered\n")

def makePredicatePathCoverage(operationImp, path, pathToCover, inputs, operationname, importedImp):
    '''
    Make the predicate for Path Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    path: The path being evaluated
    inputs: The inputs of the operation
    operationname: The name of the operation
    importedImp: A list with the parse of all imported implementations
    pathToCover: The number of the path in the path dicts

    Variables:
    way: A scapegoat variable to do not erase the path variable
    predicate: The predicate (a string)
    whilemutables: Every variable that change inside the while

    Output:
    It says to the user if the path can be walked (and the inputs for this) or not
    ExistValues: Boolean, if exist inputs that satisfy the predicate, than it return True, otherwise return false
    '''
    predicate = ""
    whilemutables = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, whilemutables = findpredicate(operationImp, node, predicate, way, path, whilemutables, inputs, operationname, importedImp) #Find the predicate
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

def makePredicateCodeCoverage(operationImp, path, pathToCover, inputs, operationname, nodeStatus, importedImp):
    '''
    Make the predicate for Code Coverage

    Input:
    operationImp: The node of the operation in the implementation tree.
    inputs: The inputs of the operation
    operationname: The name of the operation
    nodeStatus: A dict with every node status, initially every nodeStatus is False
    importedImp: A list with the parse of all imported implementations
    path: The path being evaluated
    pathToCover: The number of the path in the path dicts

    Variables:
    way: A scapegoat variable to do not erase the path variable
    predicate: The predicate (a string)
    whilemutables: Every variable that change inside the while

    Output:
    It says to the user if the path can be walked (and the inputs for this) or not
    '''
    predicate = ""
    whilemutables = ""
    way = list()
    for key in path:
        way.append(key)
    while(len(way) != 0): #While there is nodes in the way, get the predicate
        node = way[len(way) - 1]
        predicate, whilemutables = findpredicate(operationImp, node, predicate, way, path, whilemutables, inputs, operationname, importedImp) #Find the predicate
        del way[len(way) - 1]
    predicate = "("+predicate+")"
    ExistValues, variables = checkPredicate(predicate, "Code Coverage - trying to get inputs for path "+str(pathToCover), inputs)
    if ExistValues == True:
        for node in path: #Setting all branches of the path to True (Covered)
            nodeStatus[node] = True
        print("Inputs were found for the predicate: "+predicate)
        print("An input option is "+variables+"\n")
    else:
        print("Inputs were NOT found for the predicate: "+predicate)
        print("The nodes of this path were NOT covered yet\n")

def findpredicate(operationImp, node, predicate, aux, path, whilemutables, inputs, operationname, importedImp):
    '''
    Function responsible to find and return the predicate for a given node (if it is a while node, it return the predicate for various nodes)

    Input:
    operationImp: The node of the operation in the implementation tree.
    node: The node being evaluated
    inputs: The inputs of the operation
    operationname: The name of the operation
    importedImp: A list with the parse of all imported implementations
    path: The path being evaluated
    aux = The way variable
    whilemutables: Every variable that change inside the while
    predicate: The actual predicate / The predicate before the while

    Outuput:
    Return the predicate
    whilemutables: A list of variables that change inside the while
    '''
    #Find and return the predicate in a string
    newpredicate = ""
    if " ENDWHILE" in buildpaths.graphgen.nodeinva[node]:
        startwhile = node #The node that start the while 
        condwhile = path[len(aux)] #The node that contain the type ConditionWhile
        #CHECK IF THE PREDICATE CONTAINS A #, IF YES, NEED TO MANAGE THE PREDICATE
        if "#" not in predicate:
            newpredicate, newposmut = findPredicateWhile(node, predicate, aux, path, inputs, operationname, startwhile, condwhile, condwhile, importedImp)
        else:
            pointer = predicate.find("#")
            previouswhile = predicate[pointer-1::] #previouswhile, saves the previous while
            predicate = predicate[:pointer-4:] #Erasing everything after the " & (#"
            newpredicate, newposmut = findPredicateWhile(node, predicate, aux, path, inputs, operationname, startwhile, condwhile, condwhile, importedImp)
            newpredicate = newpredicate+" & "+previouswhile
            predicate = ""
        for mutable in newposmut:
            if mutable not in whilemutables:
                whilemutables += " "+mutable
        return newpredicate, whilemutables
    elif buildpaths.graphgen.nodetype[node] == "Condition" or (buildpaths.graphgen.nodetype[node] == "ConditionWhile" and
                                                         int(aux[len(aux)-1]) < int(aux[len(aux)-2])):
        if buildpaths.graphgen.nodecond[path[len(aux)]] == "False" or buildpaths.graphgen.nodecond[path[len(aux)]] == "True and False":
            #Check if the condition is false and add a "not(" before the predicate
            newpredicate += "not("
        else:
            newpredicate += "("
        newpredicate += buildpaths.graphgen.nodedata[node] #add the data to the NEWpredicate, and the join with the predicate
        newpredicate += ")"
    elif buildpaths.graphgen.nodetype[node] == "ConditionWhile": #This means that the ConditionWhile is a false condition
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
    elif buildpaths.graphgen.nodetype[node] == "Call": #*Not implemented yet*
        newpredicate = solverop.getPredicateOP(operationImp, node, importedImp, operationname, predicate)
        predicate = ""
    if predicate == "":
        return newpredicate, whilemutables
    else:
        if newpredicate != "":
            return newpredicate+" & "+predicate, whilemutables
        else:
            return predicate, whilemutables

def findPredicateWhile(node, predicate, aux, path, inputs, operationname, startwhile, condwhile, firstwhile, importedImp, whilepredicate = "", posmut = []):
    '''
    Function responsible to find and return the predicate for a nodes inside a while

    Input:
    operationImp: The node of the operation in the implementation tree.
    node: The node being evaluated
    inputs: The inputs of the operation
    operationname: The name of the operation
    importedImp: A list with the parse of all imported implementations
    path: The path being evaluated
    aux = The way variable
    whilemutables: Every variable that change inside the while
    predicate: The actual predicate / The predicate before the while
    startwhile: The node that start the while
    condwhile: The node with the type of conditionwhile, the node that ends the while
    firstwhile: The node with the type of condition while, the node that ends the while (important for nested while)
    whilepredicate: The predicate inside the while
    posmut: A list of possible mutables inside the while / Different of while mutables

    Output:
    whilepredicate: The predicate inside the while but not inside a nested while
    posmut: A list of possible mutables inside the while / Different of while mutables
    '''
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
        newpredicate, newposmut = findPredicateWhile(node, whilepredicate, aux, path, inputs, operationname, startwhileIN, condwhileIN, firstwhile, importedImp, "", [])
        for mutable in newposmut:
            if mutable not in posmut:
                posmut.append(mutable)
        whilepredicate = newpredicate
        #Doing the False Guard (Continuing the previous while)
        newpredicate, newposmut = findPredicateWhile(path[len(aux)-2], predicate, aux, path, inputs, operationname, startwhile, condwhile, firstwhile, importedImp, whilepredicate, posmut)
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
                                                               int(aux[len(aux)-1]) < int(aux[len(aux)-2])):
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
    newpredicate, posmut = findPredicateWhile(node, predicate, aux, path, inputs, operationname, startwhile, condwhile, firstwhile, importedImp, whilepredicate, posmut)
    return newpredicate, posmut

def getMutables(node, inputs, path, condwhile, firstwhile, posmut):
    '''
    Function to get each variable that changes inside a while

    Input:
    inputs: The inputs of the operation
    node: The actual node being evaluated
    path: The being run in the while
    condwhile: The node that has the invariant of the while
    firstwhile: The node that ends the while (if is not a nested while, it is the same than condwhile)

    Output:
    whilemutables[:len(whilemutables)-1:]: A string of the variables that change inside the while, the format is Ex: xx,yy
    mutables: Every variable that changes inside an while
    '''
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
    '''
    Check if the generated predicate can hold true

    Input:
    predicate: The predicate
    message: A message to appear to the user
    inputs: The inputs of the operation

    Output:
    ans: The answer if the predicate is false or true
    entry: A possible entry to the predicate be true (if exists)
    '''
    entry = ""
    ans, variables = callprob.evaluate(predicate, message, inputs)
    for variable in variables:
              entry += variable+" "
    return ans, entry
