import graphgen

'''
graphgen: module responsible of generating the graphs
minidom: module responsible of making a tree from a xml file
'''


'''
In this file we build all branches and paths of a given operation.
Also we create dict for the status of the branches and the nodes, initially everythin is set to False (uncovered)

paths: A dict of all paths of a given graph/operation
branchesPath: Dict of all branches paths
branchesStatus: Dict of all branches status, initially everything is set to false
nodeStatus: Dict of all nodes status, initially everthing is set to false
'''

class Paths:
    def __init__(self):
        self.paths = dict() #Initialisation of the dict of paths
        self.partialPaths = dict()
        self.branchesPath = dict() #Initialisation of the dict of branches paths
        self.branchesStatus = dict() #Initialisation of the dict of the status of each branch, used in branch coverage
        self.nodeStatus = dict() #Initialisation of the dict of the status of each node, used in code coverage

    def find_all_paths_cycle(self, graph, start, end, path=[]):
        '''
        Function responsible to find every path inside a while of an operation

        Input:
        graph: The graph of the operation (nodemap)
        start: The start of the graph, as we do it backwards the start is the last node
        end: The end of the graph, as we do it backwards the end is the first node
        path: The path until here
        '''
        path = path + [start]
        if start == end:
            return [path]
        if not (start in graph):
            return []
        paths = []
        for node in graph[start]:
            if node not in path:
                newpaths = self.find_all_paths(graph, node, end, path)
                for newpath in newpaths:
                    paths.append(newpath)
            else:
                if paths == []:
                    newpaths = self.find_all_paths_cycle(graph, node, end, path)
                    for newpath in newpaths:
                        paths.append(newpath)
        return paths

    def find_all_paths(self, graph, start, end, path=[]):
        '''
        Function responsible to find every path inside an operation

        Input:
        graph: The graph of the operation (nodemap)
        start: The start of the graph, as we do it backwards the start is the last node
        end: The end of the graph, as we do it backwards the end is the first node
        path: The path until here
        '''
        path = path + [start]
        if start == end:
            return [path]
        if not start in graph:
            return []
        paths = []
        for node in graph[start]:
            if node not in path:
                newpaths = self.find_all_paths(graph, node, end, path)
                for newpath in newpaths:
                    paths.append(newpath)
            else:
                 newpath = self.find_all_paths_cycle(graph, node, end, path)
                 for i in range(len(newpath)):
                     paths.append(newpath[i])
        return paths

    def makepaths(self, graph):
        '''
        Function responsible to find every path inside an operation and add the path to paths dict.

        Input:
        graph: The graph of the operation (nodemap)
        '''
        pt = self.find_all_paths(graph.nodemap, str(len(graph.nodemap)), '1') #Find all paths from a graph from a point to other
        for p in range(len(pt)):
            self.paths[p+1] = pt[p]
            self.paths[p+1] = list(reversed(self.paths[p+1]))
            self.identifyWhileEnd(self.paths[p+1], graph)

    def makePartialPaths(self, graph, start):
        '''
        Function responsible to find every path inside an operation and add the path to paths dict.

        Input:
        graph: The graph of the operation (nodemap)
        '''
        pt = self.find_all_paths(graph, start, '1') #Find all paths from a graph from a point to the start
        already = len(self.partialPaths.keys())
        for p in range(len(pt)):
            self.partialPaths[p+1+already] = pt[p]
            self.partialPaths[p+1+already] = list(reversed(self.partialPaths[p+1+already]))

    def makepathsOperationCall(self, graph, finish):
        '''
        Function responsible to find every path inside an operation call.
        All paths are added  to path dict.

        Input:
        graph: The graph of the operation (nodemap)
        finish: For the total operation, the finish is the first node, for a operation call it is the first node after graph of the total operation.
        '''
        #Finding all paths of a operation
        pt = self.find_all_paths(graph, str(len(graph)), str(finish)) #Find all paths from a graph from a point to other
        pmax = (max(self.paths.keys()))
        #p = 0,1,2... *range of the dict paths*
        #pmax = max value of the dict paths
        for p in range(len(pt)):
            self.paths[pmax+p+1] = pt[p]
            self.paths[pmax+p+1] = list(reversed(self.paths[pmax+p+1]))
            self.identifyWhileEnd(self.paths[pmax+p+1])

    def makebranches(self, paths):
        '''
        Finding all branches paths and setting every branch to False (Not covered), used only in Branch Coverage

        Input:
        paths: paths dict
        '''
        for key in paths:
            br = []
            for i in range(len(paths[key]) - 1):
                br.append(str(paths[key][i]) + "-" + str(paths[key][i+1]))
            self.branchesPath[key] = br
            for branches in self.branchesPath[key]:
                self.branchesStatus[branches] = False

    def makenodes(self, graph):
        '''
        Setting every node to False (not visited/covered), used in Code Coverage

        Input:
        graph: The graph of the operation (nodemap)
        '''
        for node in graph:
            self.nodeStatus[node] = False

    def identifyWhileEnd(self, path, graph):
        '''
        Function responsible to identify the end of a while and add the nodeinva dict of this node to ENDWHILE

        Input:
        path: A path in the paths dicts
        '''
        countlist = list()
        for i in range(len(path)):
            if path[i] not in countlist:
                countlist.append(path[i])
            else:
                if "ENDWHILE" not in graph.nodecond[str(path[i-1])]:
                    graph.nodecond[str(path[i-1])] += " ENDWHILE"


    def clearGraphs(self):
        '''
        Cleaning all dicts to start another coverage
        '''
        self.paths.clear()
        self.branchesPath.clear()
        self.branchesStatus.clear()
        self.nodeStatus.clear()

#Uncomment the next lines to test    
"""Finding all paths"""
'''
impName = "nested_while_else_i"
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
            graphgen.mapOperations(operationImp, operationMch, [])
            makepaths(graphgen.nodemap)
            makebranches(paths)
for key in sorted(graphgen.nodemap.keys()):
    print(key, graphgen.nodemap[key], graphgen.nodetype[key], graphgen.nodedata[key], graphgen.nodecond[key], graphgen.nodeinva[key])
for key in sorted(paths.keys()):
    print(key, paths[key])
#for key in sorted(branchesPath.keys()):
#    print(key, branchesPath[key])
#print(branchesStatus)

'''
