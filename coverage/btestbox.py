from xml.dom import minidom
import coverageprocess
import sys
import HTMLgen
import argparse

if True:
    for arg in sys.argv:
        print (arg+" ",)
    print("\n"+("-"*80))

parser = argparse.ArgumentParser(add_help=False)

progdescription = "BTestBox is awesome"

parser = argparse.ArgumentParser(parents = [parser], description = progdescription)

parser.add_argument('b_module',
                    help='name of the B module (implementation)')

parser.add_argument('project_directory',
                    help = 'project Directory')

parser.add_argument('copy_directory',
                    help = 'target directory to paste the copy of the files')

parser.add_argument('atelierBdirectory',
                    help='Atelier-B pog Directory')

#parser.add_argument('settings',
#                    help='project settings file')

parser.add_argument('coverage',
                    help='selects the coverage.')

parser.add_argument('probcliFilePath',
                    help='ProB (probcli) path')

parser.add_argument('-o', '--output', action='store_true',
                    help='output file')

#parser.add_argument('-mch', '--machines', action='store_true',
#                    help='use the machines to calculate operation calls')

parser.add_argument('-v', '--verbose', action='store_true',
                    help= 'outputs some information while running')


args = parser.parse_args()

if (args.verbose):
    print("BTestBox configuration")
    print("- AtelierB directory: " + args.atelierBdirectory)
    print("- Project directory: " + args.project_directory)
    print("- Copy directory: " + args.copy_directory)
    print("- ProB (probcli) directory: " + args.probcliFilePath)
    #print("- B project settings file: " + args.settings)
    print("- B module: " + args.b_module)
    print("- Chosen coverage: " + args.coverage)

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

impName = args.b_module
directory = args.project_directory
for i in reversed(range(len(directory))):
    if(directory[i] == '\\' or directory[i] == '/' or directory[i] == '"\"'):
        position = i
        break
copy_directory = directory[:position:]+'\\'+args.copy_directory
proBPath = '"'+args.probcliFilePath+'"'
coverage = args.coverage
atelierBDirectory = args.atelierBdirectory[:len(args.atelierBdirectory)-8:]
bdpdirectory = directory+'\\bdp'

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
getImportedMachine(imp, importedMch, seesMch, includedMch, bdpdirectory + '\\', mch)
for ref in refinementMch:
    getImportedMachine(ref, importedMch, seesMch, includedMch, bdpdirectory + '\\', mch)
noOperations = True

for childnode in imp.firstChild.childNodes:
    if childnode.nodeType != childnode.TEXT_NODE:
        if childnode.tagName == "Operations":
            noOperations = False
            operationsimp = childnode  # Surfing until Operations
            operationsmch = mch.getElementsByTagName("Operations")[0]  # Surfing until Operations in the machine
            if coverage == "code":
                entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoCodeCoverage(imp, mch,
                                                                                                              importedMch,
                                                                                                              seesMch,
                                                                                                              includedMch,
                                                                                                              operationsmch,
                                                                                                              operationsimp,
                                                                                                              impName,
                                                                                                              directory,
                                                                                                              atelierBDirectory,
                                                                                                              copy_directory,
                                                                                                              proBPath,
                                                                                                              refinementMch)
            elif coverage == "branch":
                entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoBranchCoverage(imp,
                                                                                                                mch,
                                                                                                                importedMch,
                                                                                                                seesMch,
                                                                                                                includedMch,
                                                                                                                operationsmch,
                                                                                                                operationsimp,
                                                                                                                impName,
                                                                                                                directory,
                                                                                                                atelierBDirectory,
                                                                                                                copy_directory,
                                                                                                                proBPath,
                                                                                                                refinementMch)
            elif coverage == "path":
                entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoPathCoverage(imp, mch,
                                                                                                              importedMch,
                                                                                                              seesMch,
                                                                                                              includedMch,
                                                                                                              operationsmch,
                                                                                                              operationsimp,
                                                                                                              impName,
                                                                                                              directory,
                                                                                                              atelierBDirectory,
                                                                                                              copy_directory,
                                                                                                              proBPath,
                                                                                                                refinementMch)
            # elif coverage == "line":
            #    entries, outs, operationNames, nonCovered = coverageprocess.DoLineCoverage(imp, mch, importedMch,
            #                                                                               seesMch, includedMch,
            #                                                                               operationsmch, operationsimp,
            #                                                                               impName, directory,
            #                                                                               atelierBDirectory,
            #                                                                               copy_directory, proBPath)
            elif coverage == "clause":
                entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoClauseCoverage(imp,
                                                                                                                mch,
                                                                                                                importedMch,
                                                                                                                seesMch,
                                                                                                                includedMch,
                                                                                                                operationsmch,
                                                                                                                operationsimp,
                                                                                                                impName,
                                                                                                                directory,
                                                                                                                atelierBDirectory,
                                                                                                                copy_directory,
                                                                                                                proBPath,
                                                                                                                refinementMch)
            else:
                print('No valid coverage chosen')
                break
            HTMLgen.createHTML(directory, coverage, nonCovered, copy_directory, impName, mchName, operationNames,
                               entries, outs, coveredPercentage, importedMch)
if noOperations:
    report = open(copy_directory + '\\report_' + coverage + '_' + impName + '.txt', 'w')
    report.write('Test Completed!! The machine has no operations\n')
    report.close()