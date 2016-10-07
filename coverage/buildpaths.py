import graphgen
from xml.dom import minidom

paths = dict() #Initialisation of the dict of paths
branchesPath = dict() #Initialisation of the dict of branches paths
branchesStatus = dict() #Initialisation of the dict of the status of each branch, used in branch coverage
nodeStatus = dict() #Initialisation of the dict of the status of each node, used in code coverage

def find_all_paths_cycle(graph, start, end, path=[]):
    """Finding all paths inside a while"""
    path = path + [start]
    if start == end:
        return [path]
    if not (start in graph):
        return []
    paths = []
    for node in graph[start]:
        if node not in path:
            newpaths = find_all_paths(graph, node, end, path)
            for newpath in newpaths:
                paths.append(newpath)
    return paths

def find_all_paths(graph, start, end, path=[]):
    """Finding all paths of the operation"""
    path = path + [start]
    if start == end:
        return [path]
    if not start in graph:
        return []
    paths = []
    for node in graph[start]:
        if node not in path:
            newpaths = find_all_paths(graph, node, end, path)
            for newpath in newpaths:
                paths.append(newpath)
        else:
             newpath = find_all_paths_cycle(graph, node, end, path)
             paths.append(newpath[0])
    return paths

def makepaths(graph):
    """Finding all paths of a operation"""
    pt = find_all_paths(graph, str(len(graph)), '1') #Find all paths from a graph to a point to other
    for p in range(len(pt)):
        paths[p+1] = pt[p]
        paths[p+1] = list(reversed(paths[p+1]))
        idetifyWhileEnd(paths[p+1])

def makebranches(paths):
    """Finding all branches paths and setting every branch to False (Not covered), used only in Branch Coverage"""
    for key in paths:
        br = []
        for i in range(len(paths[key]) - 1):
            br.append(str(paths[key][i]) + "-" + str(paths[key][i+1]))
        branchesPath[key] = br
        for branches in branchesPath[key]:
            branchesStatus[branches] = False

def makenodes(graph):
    """Setting every node to False (not visited/covered), used in Code Coverage"""
    for node in graph:
        nodeStatus[node] = False

def idetifyWhileEnd(path):
    countlist = list()
    for i in range(len(path)):
        if path[i] not in countlist:
            countlist.append(path[i])
        else:
            if "ENDWHILE" not in graphgen.nodeinva[str(path[i-1])]:
                graphgen.nodeinva[str(path[i-1])] += " ENDWHILE"
    

def clearGraphs():
    """Cleaning all dicts to start another coverage"""
    paths.clear()
    branchesPath.clear()
    branchesStatus.clear()
    nodeStatus.clear()

#Uncomment the next lines to test    
"""Finding all paths"""
"""
impName = "whilenested_i"
imp = minidom.parse(impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(mch.firstChild.data+".bxml") #Getting the machine
operationsimp = imp.getElementsByTagName("Operations")[0] #Surfing until Operations
operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine   

for operationImp in operationsimp.childNodes:
        if operationImp.nodeType != operationImp.TEXT_NODE:
            operationMch = operationsmch.firstChild.nextSibling #Jumping a TEXT_NODE
            while operationMch.getAttribute("name") != operationImp.getAttribute("name"): #Surfing to the machine operation equal the imp operation
                operationMch = operationMch.nextSibling.nextSibling #Jumping a TEXT_NODE
            graphgen.mapOperations(operationImp, operationMch)
            makepaths(graphgen.nodemap)
            makebranches(paths)
            for key in sorted(graphgen.nodemap.keys()):
                print(key, graphgen.nodemap[key], graphgen.nodetype[key], graphgen.nodedata[key], graphgen.nodecond[key], graphgen.nodeinva[key])
            for key in sorted(paths.keys()):
                print(key, paths[key])
"""
