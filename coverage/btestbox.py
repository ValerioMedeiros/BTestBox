from xml.dom import minidom
import coverageprocess
import os
import sys
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

def getImportedMachine(imp, importedMch, seesMch, includedMch, directory, mch = []):
    for childnode in imp.getElementsByTagName("Machine")[0].childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName == 'Abstraction':
                for mchchildnodes in mch.firstChild.childNodes:
                    if mchchildnodes.nodeType != mchchildnodes.TEXT_NODE:
                        if mchchildnodes.tagName == "Includes":
                            importedMchTree = mchchildnodes.getElementsByTagName("Name")#Getting all names of imported machines
                            for name in importedMchTree:
                                includedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"))
            if childnode.tagName == "Imports":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    importedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                    getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch) #Getting the imported machines imported by the imported machine
            if childnode.tagName == "Extends":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    importedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                    getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch) #Getting the imported machines imported by the imported machine
            if childnode.tagName == "Sees":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    alreadyInTheList = False
                    for mch in seesMch:
                        if mch.firstChild.getAttribute('name') == name.firstChild.data:
                            alreadyInTheList = True
                    if not alreadyInTheList:
                        seesMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                        getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch) #Getting the imported machines imported by the imported machine
            if childnode.tagName == "Includes":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    includedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"))
                    importedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                    getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch)

impName = args.b_module
directory = args.project_directory
for i in reversed(range(len(directory))):
    if(directory[i] == '\\' or directory[i] == '/' or directory[i] == '"\"'):
        position = i
        break
copy_directory = directory[:position:]+'\\'+args.copy_directory
proBPath = '"'+args.probcliFilePath+'"'
imp = minidom.parse(directory+"\\bdp\\"+impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(directory+"\\bdp\\"+mch.firstChild.data+".bxml") #Getting the machine
importedMch = list()
seesMch = list()
includedMch = list()
atelierBDirectory = args.atelierBdirectory[:len(args.atelierBdirectory)-8:]
getImportedMachine(imp, importedMch, seesMch, includedMch, directory+'\\bdp', mch)
noOperations = True
for childnode in imp.firstChild.childNodes:
    if childnode.nodeType != childnode.TEXT_NODE:
        if childnode.tagName == "Operations":
            noOperations = False
            operationsimp = childnode #Surfing until Operations
            operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine
            if args.coverage == "code":
                value = coverageprocess.DoCodeCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                       operationsmch, operationsimp, impName, directory,
                                                       atelierBDirectory, copy_directory, proBPath)
            elif args.coverage == "branch":
                value = coverageprocess.DoBranchCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                         operationsmch, operationsimp, impName, directory,
                                                         atelierBDirectory, copy_directory, proBPath)
            elif args.coverage == "path":
                value = coverageprocess.DoPathCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                       operationsmch, operationsimp, impName, directory,
                                                       atelierBDirectory, copy_directory, proBPath)
            elif args.coverage == "clause":
                value = coverageprocess.DoClauseCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                         operationsmch, operationsimp, impName, directory,
                                                         atelierBDirectory, copy_directory, proBPath)
            else:
                print('No valid coverage chosen')
                value = 1
            if value == 0:
                report = open(copy_directory+'\\report.txt', 'w')
                report.write('Test Completed!!!!!\n')
                report.close()
            else:
                report = open(copy_directory+'\\report.txt', 'w')
                report.write('Test Failed!!\n')
                report.close()
if noOperations:
    report = open(copy_directory+'\\report.txt', 'w')
    report.write('Test Failed!! The machine has no operations\n')
    report.close()
