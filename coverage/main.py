from xml.dom import minidom
import coverageprocess
import os
import sys

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
                    getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch, directory) #Getting the imported machines imported by the imported machine
            if childnode.tagName == "Extends":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    importedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                    getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch, directory) #Getting the imported machines imported by the imported machine
            if childnode.tagName == "Sees":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    alreadyInTheList = False
                    for mch in seesMch:
                        if mch.firstChild.getAttribute('name') == name.firstChild.data:
                            alreadyInTheList = True
                    if not alreadyInTheList:
                        seesMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                        getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch, directory) #Getting the imported machines imported by the imported machine
            if childnode.tagName == "Includes":
                importedMchTree = childnode.getElementsByTagName("Name")#Getting all names of imported machines
                for name in importedMchTree:
                    includedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"))
                    importedMch.append(minidom.parse(directory+"\\"+name.firstChild.data+".bxml")) #Getting the imported machine
                    getImportedMachine(minidom.parse(directory+"\\"+name.firstChild.data+".bxml"), importedMch, seesMch, includedMch, directory)

impName = "counter_i"
directory = '\\Users\\Diego Oliveira\\Documents\\B Projects\\btest'
atelierBDirectory = '\\Users\\Diego Oliveira\\AtelierB\\installatelierb\\bbin\\win32'
copy_directory = '\\Users\\Diego Oliveira\\Documents\\binstall_projects\\copytest'
proBPath = '"C:\\Users\\Diego Oliveira\\Documents\\ProB\\probcli.exe"'
imp = minidom.parse(directory+"\\bdp\\"+impName+".bxml")
mch = imp.getElementsByTagName("Abstraction")[0] #Getting the Machine name
mch = minidom.parse(directory+"\\bdp\\"+mch.firstChild.data+".bxml") #Getting the machine
importedMch = list()
seesMch = list()
includedMch = list()
coverage = "clause"
getImportedMachine(imp, importedMch, seesMch, includedMch, directory+'\\bdp', mch)
noOperations = True
for childnode in imp.firstChild.childNodes:
    if childnode.nodeType != childnode.TEXT_NODE:
        if childnode.tagName == "Operations":
            noOperations = False
            operationsimp = childnode #Surfing until Operations
            operationsmch = mch.getElementsByTagName("Operations")[0] #Surfing until Operations in the machine
            if coverage == "code":
                value = coverageprocess.DoCodeCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                       operationsmch, operationsimp, impName, directory,
                                                       atelierBDirectory, copy_directory, proBPath)
            elif coverage == "branch":
                value = coverageprocess.DoBranchCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                         operationsmch, operationsimp, impName, directory,
                                                         atelierBDirectory, copy_directory, proBPath)
            elif coverage == "path":
                value = coverageprocess.DoPathCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                       operationsmch, operationsimp, impName, directory,
                                                       atelierBDirectory, copy_directory, proBPath)
            elif coverage == "line":
                value = coverageprocess.DoLineCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                       operationsmch, operationsimp, impName, directory,
                                                       atelierBDirectory, copy_directory, proBPath)
            elif coverage == "clause":
                value = coverageprocess.DoClauseCoverage(imp, mch, importedMch, seesMch, includedMch,
                                                         operationsmch, operationsimp, impName, directory,
                                                         atelierBDirectory, copy_directory, proBPath)                
            else:
                print('No valid coverage chosen')
                value = 1
            if value == 0:
                report = open(directory+'\\report.txt', 'w')
                report.write('Test Completed!!!!!\n')
                report.close()
            else:
                report = open(directory+'\\report.txt', 'w')
                report.write('Test Failed!!\n')
                report.close()
if noOperations:
    report = open(directory+'\\report.txt', 'w')
    report.write('Test Failed!! The machine has no operations\n')
    report.close()
