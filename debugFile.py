from xml.dom import minidom
import coverageprocess
import HTMLgen


def getImportedMachine(imp, importedMch, seesMch, includedMch, directory, mch=[]):
    for childnode in imp.getElementsByTagName("Machine")[0].childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == 'Abstraction':
                for mchchildnodes in mch.firstChild.childNodes:
                    if mchchildnodes.nodeType != mchchildnodes.TEXT_NODE:
                        if mchchildnodes.tagName == "Includes":
                            importedMchTree = mchchildnodes.getElementsByTagName(
                                "Name")  # Getting all names of imported machines
                            for name in importedMchTree:
                                alreadyInTheList = False
                                for mch in includedMch:
                                    if mch.firstChild.getAttribute('name') == name.firstChild.data:
                                        alreadyInTheList = True
                                if not alreadyInTheList:
                                    includedMch.append(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"))
            if childnode.tagName == "Imports":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    alreadyInTheList = False
                    for mch in importedMch:
                        if mch.firstChild.getAttribute('name') == name.firstChild.data:
                            alreadyInTheList = True
                    if not alreadyInTheList:
                        importedMch.append(minidom.parse(
                            directory + "\\" + name.firstChild.data + ".bxml"))  # Getting the imported machine
                        getImportedMachine(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"), importedMch,
                                           seesMch, includedMch,
                                           directory)  # Getting the imported machines imported by the imported machine
            if childnode.tagName == "Extends":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    alreadyInTheList = False
                    for mch in importedMch:
                        if mch.firstChild.getAttribute('name') == name.firstChild.data:
                            alreadyInTheList = True
                    if not alreadyInTheList:
                        importedMch.append(minidom.parse(
                            directory + "\\" + name.firstChild.data + ".bxml"))  # Getting the imported machine
                        getImportedMachine(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"), importedMch,
                                           seesMch, includedMch,
                                           directory)  # Getting the imported machines imported by the imported machine
            if childnode.tagName == "Sees":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    alreadyInTheList = False
                    for mch in seesMch:
                        if mch.firstChild.getAttribute('name') == name.firstChild.data:
                            alreadyInTheList = True
                    if not alreadyInTheList:
                        seesMch.append(minidom.parse(
                            directory + "\\" + name.firstChild.data + ".bxml"))  # Getting the imported machine
                        getImportedMachine(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"),
                                           importedMch, seesMch, includedMch,
                                           directory)  # Getting the imported machines imported by the imported machine
            if childnode.tagName == "Includes":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    alreadyInTheList = False
                    for mch in importedMch:
                        if mch.firstChild.getAttribute('name') == name.firstChild.data:
                            alreadyInTheList = True
                    if not alreadyInTheList:
                        includedMch.append(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"))
                        importedMch.append(minidom.parse(
                                    directory + "\\" + name.firstChild.data + ".bxml"))  # Getting the imported machine
                        getImportedMachine(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"), importedMch,
                                       seesMch, includedMch, directory)


'''
impName = "external_events_queue_manager_i"
directory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\departs'
bdpdirectory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\departs\\bdp'
atelierBDirectory = 'C:\\Program Files (x86)\\atelierb\\bbin\\win32'
copy_directory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\departs_Test'
proBPath = '"C:\ProB\\probcli.exe"'
'''

impName = "nested_while_if_i"
directory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\DoubleStatements_TestSet'
bdpdirectory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\DoubleStatements_TestSet\\bdp'
atelierBDirectory = 'C:\\Program Files (x86)\\atelierb'
copy_directory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\DoubleStatements_Test'
proBPath = '"C:\ProB\\probcli.exe"'

refinementMch = list()
imp = minidom.parse(bdpdirectory + '\\' + impName + ".bxml")
mch = imp.getElementsByTagName("Abstraction")[0]  # Getting the Machine name
mch = minidom.parse(bdpdirectory + '\\' + mch.firstChild.data + ".bxml")  # Getting the machine
while mch.firstChild.getAttribute("type") == "refinement":
    refinementMch.append(mch)
    mch = mch.getElementsByTagName("Abstraction")[0]
    mch = minidom.parse(bdpdirectory + '\\' + mch.firstChild.data + ".bxml")
mchName = mch.firstChild.getAttribute("name")
importedMch = list()
seesMch = list()
includedMch = list()
# cov = ["Branch"]
# cov = ["Clause"]
# cov = ["Code", "Branch", "Path"]
cov = ["Clause", "Code", "Branch", "Path"]
getImportedMachine(imp, importedMch, seesMch, includedMch, bdpdirectory + '\\', mch)
for ref in refinementMch:
    getImportedMachine(ref, importedMch, seesMch, includedMch, bdpdirectory + '\\', mch)
noOperations = True
for coverage in cov:
    for childnode in imp.firstChild.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == "Operations":
                noOperations = False
                operationsimp = childnode  # Surfing until Operations
                operationsmch = mch.getElementsByTagName("Operations")[0]  # Surfing until Operations in the machine
                if coverage == "Code":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoCodeCoverage(imp, mch, importedMch,
                                                                                                                  seesMch, includedMch,
                                                                                                                  operationsmch, operationsimp,
                                                                                                                  impName, directory,
                                                                                                                  atelierBDirectory,
                                                                                                                  copy_directory, proBPath,
                                                                                                                  refinementMch, "C", "C9X", "gcc")
                elif coverage == "Branch":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoBranchCoverage(imp, mch, importedMch,
                                                                                                 seesMch, includedMch,
                                                                                                 operationsmch,
                                                                                                 operationsimp, impName,
                                                                                                 directory,
                                                                                                 atelierBDirectory,
                                                                                                 copy_directory, proBPath,
                                                                                                 refinementMch, "C", "C9X", "gcc")
                elif coverage == "Path":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoPathCoverage(imp, mch, importedMch,
                                                                                               seesMch, includedMch,
                                                                                               operationsmch, operationsimp,
                                                                                               impName, directory,
                                                                                               atelierBDirectory,
                                                                                               copy_directory, proBPath,
                                                                                                 refinementMch, "C", "C9X", "gcc")
                # elif coverage == "line":
                #    entries, outs, operationNames, nonCovered = coverageprocess.DoLineCoverage(imp, mch, importedMch,
                #                                                                               seesMch, includedMch,
                #                                                                               operationsmch, operationsimp,
                #                                                                               impName, directory,
                #                                                                               atelierBDirectory,
                #                                                                               copy_directory, proBPath,
                #                                                                               refinementMch)
                elif coverage == "Clause":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoClauseCoverage(imp, mch, importedMch,
                                                                                                 seesMch, includedMch,
                                                                                                 operationsmch,
                                                                                                 operationsimp, impName,
                                                                                                 directory,
                                                                                                 atelierBDirectory,
                                                                                                 copy_directory, proBPath,
                                                                                                 refinementMch, "C", "C9X", "gcc")
                else:
                    print('No valid coverage chosen')
                    break
                HTMLgen.createHTML(directory, coverage, nonCovered, copy_directory, impName, mchName, operationNames, entries, outs,
                                   coveredPercentage, importedMch, seesMch)
    if noOperations:
        HTMLgen.createHTMLnoOperations(coverage.replace(' Coverage', ''), copy_directory, impName)