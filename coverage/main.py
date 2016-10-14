import buildpaths
import graphgen
import coverage
import instgen
from xml.dom import minidom
'''
buildpaths: buildpaths is the module responsible to create the paths and the branches, it depends of the graphgen.
graphgen: graphgen is the module responsible to create every graph used in the coverage.
coverage: module with the resolution of each coverage.
instgen: module to generate the instructions.
minidom: module to read the bxml file in a tree.
'''

#Initialisation
'''
In the initialisation we get all the implementations of the imported machines, also we get the machine of the implementation being evaluated.
impName: Name of the implementation
imp: Variable with the parse of the implementation bxml
mch: Variable with the parse of the implementation bxml
importedImp: list of parses, with all implementation imported.
operationsimp: An node with all the operations of the implementation
operationsmch: An node with all the operations of the machine
'''
impName = "excallnested_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
importedImp = list()
importedall = False
while(importedall != True):
    for childnode in imp.getElementsByTagName("Machine")[0].childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == "Imports":
                importedMchTree = imp.getElementsByTagName("Imports")[0] #Getting all Imports branch
                importedMchTree = importedMchTree.getElementsByTagName("Referenced_Machine")[0] #Getting all referenced machine
                importedMchTree = importedMchTree.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    importedImp.append(minidom.parse(name.firstChild.data+"_i.bxml")) #Getting the imported implementation
                    #importImp = importedMch.getElementsByTagName("Abstraction")[0]  #Getting the implementation of the imported machine
                    #importedImp.append(minidom.parse(importImp.firstChild.data+".bxml"))
    importedall = True
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine    

def DoBranchCoverage():
    '''
    Function responsible of doing the Branch Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more branches could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    '''
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
            for key in buildpaths.paths: #Printing the paths (for control)
                    print(key, buildpaths.paths[key])
            covered = coverage.BranchCoverage(imp, buildpaths.branchesPath, buildpaths.branchesStatus, buildpaths.paths, inputs, operationname, importedImp)
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
    '''
    Function responsible of doing the Path Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more paths could not be covered.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    '''
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
                covered = coverage.PathCoverage(imp, buildpaths.paths, inputs, operationname, importedImp)
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
    '''
    Function responsible of doing the Path Coverage, it has no inputs or return.

    Variables:
    allcovered: When False, means that one or more nodes could not be visited.
    operationImp: One operation of all operations in the implementation
    operationname: The name of the operation
    inputs: The inputs of the operation
    operationMch: The machine version of the implementation operation
    '''
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
            for key in buildpaths.paths:
                    print(key, buildpaths.paths[key])
            covered = coverage.CodeCoverage(operationImp, buildpaths.paths, inputs, operationname, buildpaths.nodeStatus, importedImp)
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

def getInputs(operationImp): #NOW THAT I PASS THE OPERATIONIMP TO THE OTHER PROGRAMS, THIS CAN BE DONE AFTER.
    '''
    Function responsible for getting the Inputs for an operation
    Input:
    operationImp : The operation node in the implementation tree
    
    Output:
    entries: A list with all the inputs
    '''
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
            entries.append(inputs[1:len(inputs)-1:])
            return entries
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
    
        
DoBranchCoverage()
