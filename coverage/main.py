import buildpaths
import graphgen
import coverage
import instgen
from xml.dom import minidom

"""Careful while reading this algorithm, operation and operations are different things"""

#Initialisation
impName = "whilenested_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine    

def DoBranchCoverage():
    #Initialisation
    print("Checking if the implementation "+impName+" is Branch Covered\n")
    allcovered = True
    #Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            operationname = operationImp.getAttribute("name")
            print("Checking if the operation "+operationname+" is Branch Covered")
            inputs = getInputs(operationImp)
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            graphgen.mapOperations(operationImp, operationMch)
            buildpaths.makepaths(graphgen.nodemap) #Building paths
            buildpaths.makebranches(buildpaths.paths) #Building branches
            covered = coverage.BranchCoverage(buildpaths.branchesPath, buildpaths.branchesStatus, buildpaths.paths, inputs, operationname)
            if covered == True:
                print("The operation "+operationname+" is covered by Branch Coverage\n")
            else:
                for branch in buildpaths.branchesStatus: #Printing where it failed to reach
                    if buildpaths.branchesStatus[branch] == False:
                        for i in range(len(branch)):
                            if branch[i] == '-':
                                node1 = branch[0:i:]
                                node2 = branch[i+1:len(branch):]
                        print("There is no way to reach the instruction "+graphgen.nodedata[node2]+" passing through the instruction "+graphgen.nodedata[node1])
                print("The operation "+operationname+" is NOT covered by Branch Coverage\n")
                allcovered = False
            graphgen.clearGraphs()
            buildpaths.clearGraphs()
    if allcovered == True:
        print("All operations of "+impName+" are covered by Branch Coverage!\n")
    else:
        print(impName+" is NOT covered by Branch Coverage.\n")

def DoPathCoverage():
    #Initialisation
    allcovered = True
    print("Checking if the implementation "+impName+" is Path Covered\n")
    #Process
    for operationImp in operationsimp.childNodes:
        if allcovered == True:
            if operationImp.nodeType != operationImp.TEXT_NODE:
                inputs = getInputs(operationImp)
                operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
                while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                    operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
                operationname = operationImp.getAttribute("name")
                graphgen.mapOperations(operationImp, operationMch)
                buildpaths.makepaths(graphgen.nodemap) #Building paths
                covered = coverage.PathCoverage(buildpaths.paths, inputs, operationname)
                if covered == True:
                    print("The operation: "+operationname+" is covered by Path Coverage\n")
                else:
                    print("The operation: "+operationname+" is NOT covered by Path Coverage\n")
                    allcovered = False
            graphgen.clearGraphs()
            buildpaths.clearGraphs()
        else:
            if operationImp.nodeType != operationImp.TEXT_NODE:
                operationname = operationImp.getAttribute("name")
                print("One operation could NOT be covered, skipping trying to cover "+operationname+"\n")
    if allcovered == True:
        print("All operations of "+impName+" are covered by Path Coverage!\n")
    else:
        print(impName+" is NOT covered by Path Coverage.\n")

def DoCodeCoverage():
    #Initialisation
    allcovered = True
    print("Checking if the implementation "+impName+" is Code Covered\n")
    #Process
    for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            operationname = operationImp.getAttribute("name")
            print("Checking if the operation "+operationname+" is Code Covered")
            inputs = getInputs(operationImp)
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            graphgen.mapOperations(operationImp, operationMch)
            buildpaths.makepaths(graphgen.nodemap) #Building paths
            buildpaths.makenodes(graphgen.nodemap) #Building node, setting them to False (uncovered).
            covered = coverage.CodeCoverage(buildpaths.paths, inputs, operationname, buildpaths.nodeStatus)
            if covered == True:
                print("The operation "+operationname+" is covered by Code Coverage\n")
            else:
                for node in buildpaths.nodeStatus: #Priting where it failed to reach
                    if buildpaths.nodeStatus[node] == False:
                        print("There is no way to reach the instruction "+graphgen.nodedata[node])
                print("The operation "+operationname+" is NOT covered by Code Coverage\n")
                allcovered = False
            graphgen.clearGraphs()
            buildpaths.clearGraphs()
    if allcovered == True:
        print("All operations of "+impName+" are covered by Code Coverage!\n")
    else:
        print(impName+" is NOT covered by Code Coverage.\n")

def getInputs(operationImp):
    inputs = instgen.make_inputs(operationImp.getElementsByTagName("Input_Parameters")[0])
    inputs = inputs.replace(" ", "") #Eliminating blank spaces
    entries = list()
    commas = list()
    if len(inputs) == 0:
        None
    else:
        for i in range(len(inputs)-1):
            if inputs[i] == ',':
                commas.append(i)
        if len(commas) == 0:
            return inputs
        else:
            for i in range(len(commas)):
                if i == 0:
                    entries.append(inputs[1:commas[0]:])
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[0]+1:commas[i+1]:])
                else:
                    if i == max(range(len(commas))):
                        entries.append(inputs[commas[i]+1:len(inputs)-1:])
                    else:
                        entries.append(inputs[commas[i]+1:commas[i+1]:])
            return entries
    
        
DoPathCoverage()
