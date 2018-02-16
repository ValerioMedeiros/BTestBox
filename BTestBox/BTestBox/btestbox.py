from xml.dom import minidom
import coverageprocess
import sys
import HTMLgen
import argparse
import os

if True:
    for arg in sys.argv:
        print(arg + " ", )
    print("\n" + ("-" * 80))

parser = argparse.ArgumentParser(add_help=False)

progdescription = "BTestBox is awesome"

parser = argparse.ArgumentParser(parents=[parser], description=progdescription)

parser.add_argument('target_language',
                    help='The language to translate')

parser.add_argument('translator_profile',
                    help='The translator profile')

parser.add_argument('coverage',
                    help='Selects the coverage.')

parser.add_argument('atelier',
                    help='Directory of Atelier-B')

parser.add_argument('project_directory',
                    help='Directory of the project')

parser.add_argument('copy_directory',
                    help='Target directory name to do tests')

# parser.add_argument('settings',
#                    help='project settings file')

parser.add_argument('b_module',
                    help='Name of the B module (implementation)')

parser.add_argument('compiler',
                    help='The compiler to compilate the translated file')

parser.add_argument('probcliPath',
                    help='ProB (probcli) path')

# parser.add_argument('-mch', '--machines', action='store_true',
#                    help='use the machines to calculate operation calls')

parser.add_argument('-v', '--verbose', action='store_true',
                    help='Outputs some information while running')

args = parser.parse_args()

if (args.verbose):
    print("BTestBox configuration")
    print("- AtelierB directory: " + args.atelier)
    print("- Bpd project directory : " + args.project_directory)
    print("- Copy directory: " + args.copy_directory)
    print("- ProB (probcli) directory: " + args.probcliPath)
    print("- Translation Language: " + args.target_language)
    print("- Translation Profile: " + args.translator_profile)
    print("- Compiler: " + args.compiler)
    # print("- B project settings file: " + args.settings)
    print("- B module: " + args.b_module)
    print("- Coverage: " + args.coverage)


def getImportedMachine(imp, importedMch, seesMch, includedMch, directory, mch=[]):
    #Function responsible of getting the bxml files of each imported/seen/extended/included machine.
    #It starts with actual file being read and the lists responsible for saving the machines.
    for childnode in imp.getElementsByTagName("Machine")[0].childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == 'Abstraction':
                for mchchildnodes in mch.firstChild.childNodes:
                    if mchchildnodes.nodeType != mchchildnodes.TEXT_NODE:
                        if mchchildnodes.tagName == "Includes":
                            importedMchTree = mchchildnodes.getElementsByTagName(
                                "Name")  # Getting all names of imported machines
                            for name in importedMchTree:
                                includedMch.append(minidom.parse(directory + os.sep + name.firstChild.data + ".bxml"))
            if childnode.tagName == "Imports":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    importedMch.append(minidom.parse(
                        directory + os.sep + name.firstChild.data + ".bxml"))  # Getting the imported machine
                    getImportedMachine(minidom.parse(directory + os.sep + name.firstChild.data + ".bxml"), importedMch,
                                       seesMch, includedMch,
                                       directory)  # Getting the imported machines imported by the imported machine
            if childnode.tagName == "Extends":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    importedMch.append(minidom.parse(
                        directory + os.sep + name.firstChild.data + ".bxml"))  # Getting the imported machine
                    getImportedMachine(minidom.parse(directory + os.sep + name.firstChild.data + ".bxml"), importedMch,
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
                            directory + os.sep + name.firstChild.data + ".bxml"))  # Getting the imported machine
                        getImportedMachine(minidom.parse(directory + os.sep + name.firstChild.data + ".bxml"),
                                           importedMch, seesMch, includedMch,
                                           directory)  # Getting the imported machines imported by the imported machine
            if childnode.tagName == "Includes":
                importedMchTree = childnode.getElementsByTagName("Name")  # Getting all names of imported machines
                for name in importedMchTree:
                    includedMch.append(minidom.parse(directory + os.sep + name.firstChild.data + ".bxml"))
                    importedMch.append(minidom.parse(
                        directory + os.sep + name.firstChild.data + ".bxml"))  # Getting the imported machine
                    getImportedMachine(minidom.parse(directory + os.sep + name.firstChild.data + ".bxml"), importedMch,
                                       seesMch, includedMch, directory)


impName = args.b_module
directory = args.project_directory
for i in reversed(range(len(directory))):
    if (directory[i] == os.sep or directory[i] == '/'):
        position = i
        break
copy_directory = directory[:position:] + os.sep + args.copy_directory
proBPath = args.probcliPath
coverage = args.coverage
atelierBDirectory = args.atelier
bdpdirectory = directory + '\\bdp'

refinementMch = list()
imp = minidom.parse(bdpdirectory + os.sep + impName + ".bxml")
mch = imp.getElementsByTagName("Abstraction")[0]  # Getting the Machine name
mch = minidom.parse(bdpdirectory + os.sep + mch.firstChild.data + ".bxml")  # Getting the machine
while mch.firstChild.getAttribute("type") == "refinement":
    refinementMch.append(mch)
    mch = mch.getElementsByTagName("Abstraction")[0]
    mch = minidom.parse(bdpdirectory + os.sep + mch.firstChild.data + ".bxml")
mchName = mch.firstChild.getAttribute("name")
importedMch = list()
seesMch = list()
includedMch = list()
getImportedMachine(imp, importedMch, seesMch, includedMch, bdpdirectory + os.sep, mch)
for ref in refinementMch:
    getImportedMachine(ref, importedMch, seesMch, includedMch, bdpdirectory + os.sep, mch)
noOperations = True

for childnode in imp.firstChild.childNodes:
    if childnode.nodeType != childnode.TEXT_NODE:
        if childnode.tagName == "Operations":
            noOperations = False
            operationsimp = childnode  # Surfing until Operations
            operationsmch = mch.getElementsByTagName("Operations")[0]  # Surfing until Operations in the machine
            if coverage == "Statement Coverage":
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
                                                                                                              refinementMch,
                                                                                                                args.target_language,
                                                                                                                args.translator_profile,
                                                                                                                args.compiler)
            elif coverage == "Branch Coverage":
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
                                                                                                                refinementMch,
                                                                                                                args.target_language,
                                                                                                                args.translator_profile,
                                                                                                                args.compiler)
            elif coverage == "Path Coverage":
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
                                                                                                              refinementMch,
                                                                                                                args.target_language,
                                                                                                                args.translator_profile,
                                                                                                                args.compiler)
            # elif coverage == "line":
            #    entries, outs, operationNames, nonCovered = coverageprocess.DoLineCoverage(imp, mch, importedMch,
            #                                                                               seesMch, includedMch,
            #                                                                               operationsmch, operationsimp,
            #                                                                               impName, directory,
            #                                                                               atelierBDirectory,
            #                                                                               copy_directory, proBPath)
            elif coverage == "Clause Coverage":
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
                                                                                                                refinementMch,
                                                                                                                args.target_language,
                                                                                                                args.translator_profile,
                                                                                                                args.compiler)
            elif coverage == "Combinatorial Coverage":
                entries, outs, operationNames, nonCovered, coveredPercentage = coverageprocess.DoCombinatorialCoverage(imp,
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
                                                                                                                refinementMch,
                                                                                                                args.target_language,
                                                                                                                args.translator_profile,
                                                                                                                args.compiler)
            else:
                print('No valid coverage chosen')
                break
            HTMLgen.createHTML(directory, coverage.replace(' Coverage', ''), nonCovered, copy_directory, impName, mchName, operationNames,
                               entries, outs, coveredPercentage, importedMch, seesMch)
if noOperations:
    HTMLgen.createHTMLnoOperations(coverage.replace(' Coverage', ''), copy_directory, impName)