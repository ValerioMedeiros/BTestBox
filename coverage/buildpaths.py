import graphgen

paths = dict() #Initialisation of the dict of paths
branchesPath = dict() #Initialisation of the dict of branches paths
branchesStatus = dict() #Initialisation of the dict of the status of each branch

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

def makebranches(paths):
    """Finding all branches paths and setting every branch to False (Not covered)"""
    for key in paths:
        br = []
        for i in range(len(paths[key]) - 1):
            br.append(str(paths[key][i]) + "-" + str(paths[key][i+1]))
        branchesPath[key] = br
        for branches in branchesPath[key]:
            branchesStatus[branches] = False

"""Finding all paths"""
#makepaths(graphgen.nodemap) #Uncomment this line if want to test
"""Finding all branches paths and setting every branch to False (Not covered)"""
#makebranches(paths) #Uncomment this line if want to test


