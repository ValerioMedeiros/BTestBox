import createBTestSet
import subprocess
import os

def runTest(impBXML, mchBXML, importedMch, seesMch, coverage, directory, aterlierBDir):
    cFiles = makeTranslation(impBXML, importedMch, seesMch, directory, aterlierBDir)
    createFileToRunTest(impBXML, coverage, directory, cFiles)
    compileFiles(cFiles, directory)
    subprocess.call(directory+'\\lang\\c\\runTest.exe')

def makeTranslation(impBXML, importedMch, seesMch, directory, aterlierBDir):
    cFiles = list()
    args = [aterlierBDir+'\\b2c.exe']
    args.append("-p")
    args.append("C9X")
    args.append("-r")
    args.append("/Users/Diego Oliveira/Documents/binstall_projects/GeneratedTests/bpd/AtelierB")
    args.append("-C")
    if not os.path.isdir(directory+"\\lang"):
        os.mkdir(directory+"\\lang")
    if not os.path.isdir(directory+"\\lang\\c"):
        os.mkdir(directory+"\\lang\\c")
    args.append(directory+"\\lang\\c")
    args.append("-I")
    args.append(directory)
    args.append(directory+"\\TestSet_"+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("TestSet_"+impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    args.append(directory+"\\runTest_"+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("runTest_"+impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    args.append(directory+"\\copy"+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("copy"+impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    for mch in importedMch:
        impMch = createBTestSet.getImpWithImportedMch(mch)
        args.append(directory+"\\copy"+impMch.firstChild.getAttribute('name')+".imp")
        cFiles.append("copy"+impMch.firstChild.getAttribute('name')+'.c')
        subprocess.call(args)
        args.pop()
    for mch in seesMch:
        impMch = createBTestSet.getImpWithImportedMch(mch)
        args.append(directory+"\\copy"+impMch.firstChild.getAttribute('name')+".imp")
        cFiles.append("copy"+impMch.firstChild.getAttribute('name')+'.c')
        subprocess.call(args)
        args.pop()
    return cFiles

def createFileToRunTest(impBXML, coverage, directory, cFiles):
    mchName = impBXML.getElementsByTagName('Abstraction')[0].firstChild.data
    runFile = open(directory+'\\lang\\c\\main_runTest.c', 'w')
    ctext = '#include <stdio.h>\n#include <stdlib.h>\n\n'
    ctext += '#include '
    ctext += '"runTest_'+mchName+'.h"'
    ctext += '\n\n'
    ctext += 'int main(int argc, char **argv)\n{\n'
    #ctext += '    int aux;\n'
    ctext += '    bool result;\n'
    ctext += '    runTest_'+mchName+'__testAll(&result);\n'
    ctext += '    if (result == true){\n'
    ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')+' achieved '+coverage+'");\n'
    ctext += '    }\n'
    ctext += '    else{\n'
    ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')+' NOT achieved '+coverage+'");\n'
    ctext += '    }\n'
    #ctext += '    printf("\\nPress enter to quit");\n'
    #ctext += '    scanf("%d", &aux);\n'
    ctext += '    return 0;\n'
    ctext += '}'
    runFile.write(ctext)
    cFiles.append('main_runTest.c')
    runFile.close()
    
def compileFiles(cFiles, directory):
    args = ['gcc']
    args.append('-o')
    args.append(directory+'\\lang\\c\\runTest.exe')
    for cfile in cFiles:
        args.append(directory+'\\lang\\c\\'+cfile)
    #args.append('-fprofile-arcs')
    #args.append('-ftest-coverage')
    subprocess.call(args)
