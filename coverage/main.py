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
                                includedMch.append(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"))
            if childnode.tagName == "Imports":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    importedMch.append(minidom.parse(
                        directory + "\\" + name.firstChild.data + ".bxml"))  # Getting the imported machine
                    getImportedMachine(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"), importedMch,
                                       seesMch, includedMch,
                                       directory)  # Getting the imported machines imported by the imported machine
            if childnode.tagName == "Extends":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
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
                    includedMch.append(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"))
                    importedMch.append(minidom.parse(
                        directory + "\\" + name.firstChild.data + ".bxml"))  # Getting the imported machine
                    getImportedMachine(minidom.parse(directory + "\\" + name.firstChild.data + ".bxml"), importedMch,
                                       seesMch, includedMch, directory)


impName = "MchToExtend_i"
directory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\Clauses_TestSet'
bdpdirectory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\Clauses_TestSet\\bdp'
atelierBDirectory = 'C:\\Program Files (x86)\\atelierb\\bbin\\win32'
copy_directory = 'C:\\Users\\Diego Oliveira\\Documents\\projects\\Clauses_Tests'
proBPath = '"C:\ProB\\probcli.exe"'
imp = minidom.parse(bdpdirectory + '\\' + impName + ".bxml")
mch = imp.getElementsByTagName("Abstraction")[0]  # Getting the Machine name
mch = minidom.parse(bdpdirectory + '\\' + mch.firstChild.data + ".bxml")  # Getting the machine
while mch.firstChild.getAttribute("type") == "refinement":
    mch = mch.getElementsByTagName("Abstraction")[0]
    mch = minidom.parse(bdpdirectory + '\\' + mch.firstChild.data + ".bxml")
mchName = mch.firstChild.getAttribute("name")
importedMch = list()
seesMch = list()
includedMch = list()
#cov = ["clause", "code", "branch", "path"]
cov = ["code"]
getImportedMachine(imp, importedMch, seesMch, includedMch, bdpdirectory + '\\', mch)
noOperations = True
for coverage in cov:
    for childnode in imp.firstChild.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == "Operations":
                noOperations = False
                operationsimp = childnode  # Surfing until Operations
                operationsmch = mch.getElementsByTagName("Operations")[0]  # Surfing until Operations in the machine
                if coverage == "code":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoCodeCoverage(imp, mch, importedMch,
                                                                                               seesMch, includedMch,
                                                                                               operationsmch, operationsimp,
                                                                                               impName, directory,
                                                                                               atelierBDirectory,
                                                                                               copy_directory, proBPath)
                elif coverage == "branch":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoBranchCoverage(imp, mch, importedMch,
                                                                                                 seesMch, includedMch,
                                                                                                 operationsmch,
                                                                                                 operationsimp, impName,
                                                                                                 directory,
                                                                                                 atelierBDirectory,
                                                                                                 copy_directory, proBPath)
                elif coverage == "path":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoPathCoverage(imp, mch, importedMch,
                                                                                               seesMch, includedMch,
                                                                                               operationsmch, operationsimp,
                                                                                               impName, directory,
                                                                                               atelierBDirectory,
                                                                                               copy_directory, proBPath)
                # elif coverage == "line":
                #    entries, outs, operationNames, nonCovered = coverageprocess.DoLineCoverage(imp, mch, importedMch,
                #                                                                               seesMch, includedMch,
                #                                                                               operationsmch, operationsimp,
                #                                                                               impName, directory,
                #                                                                               atelierBDirectory,
                #                                                                               copy_directory, proBPath)
                elif coverage == "clause":
                    entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoClauseCoverage(imp, mch, importedMch,
                                                                                                 seesMch, includedMch,
                                                                                                 operationsmch,
                                                                                                 operationsimp, impName,
                                                                                                 directory,
                                                                                                 atelierBDirectory,
                                                                                                 copy_directory, proBPath)
                else:
                    print('No valid coverage chosen')
                    break
                HTMLgen.createHTML(directory, coverage, nonCovered, copy_directory, impName, mchName, operationNames, entries, outs,
                                   coveredPercentage, importedMch)
if noOperations:
    report = open(copy_directory + '\\report_' + coverage + '_' + impName + '.txt', 'w')
    report.write('Test Completed!! The machine has no operations\n')
    report.close()