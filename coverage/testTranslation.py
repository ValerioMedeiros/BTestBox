import createBTestSet
import subprocess
import os


def runTest(impBXML, importedMch, seesMch, coverage, directory, aterlierBDir, copy_directory, cov, fail = False):
    cFiles = makeTranslation(impBXML, importedMch, seesMch, directory, aterlierBDir, copy_directory, cov)
    createFileToRunTest(impBXML, coverage, copy_directory, cFiles, cov, fail)
    compileFiles(cFiles, copy_directory, cov, impBXML)
    subprocess.call(copy_directory+'\\lang\\c\\runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.exe')

def makeTranslation(impBXML, importedMch, seesMch, directory, aterlierBDir, copy_directory, cov):
    cFiles = list()
    args = [aterlierBDir+'\\b2c.exe']
    args.append("-p")
    args.append("C9X")
    args.append("-C")
    if not os.path.isdir(copy_directory+"\\lang"):
        os.mkdir(copy_directory+"\\lang")
    if not os.path.isdir(copy_directory+"\\lang\\c"):
        os.mkdir(copy_directory+"\\lang\\c")
    args.append(copy_directory+"\\lang\\c")
    args.append("-I")
    args.append(copy_directory)
    args.append(copy_directory+"\\TestSet_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("TestSet_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c')
    print(args)
    subprocess.call(args)
    args.pop()
    args.append(copy_directory+"\\runTest_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("runTest_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    args.append(copy_directory+"\\"+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append(impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    for mch in importedMch:
        impMch = createBTestSet.getImpWithImportedMch(mch, directory)
        args.append(copy_directory+"\\"+impMch.firstChild.getAttribute('name')+".imp")
        cFiles.append(impMch.firstChild.getAttribute('name')+'.c')
        subprocess.call(args)
        args.pop()
    for mch in seesMch:
        impMch = createBTestSet.getImpWithImportedMch(mch, directory)
        args.append(copy_directory+"\\"+impMch.firstChild.getAttribute('name')+".imp")
        cFiles.append(impMch.firstChild.getAttribute('name')+'.c')
        subprocess.call(args)
        args.pop()
    return cFiles

def createFileToRunTest(impBXML, coverage, copy_directory, cFiles, cov, fail):
    mchName = impBXML.getElementsByTagName('Abstraction')[0].firstChild.data
    runFile = open(copy_directory+'\\lang\\c\\main_runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c', 'w')
    ctext = '#include <stdio.h>\n#include <stdlib.h>\n\n'
    ctext += '#include '
    ctext += '"runTest_'+cov.upper()+'_'+mchName+'.h"'
    ctext += '\n\n'
    ctext += 'int main(int argc, char **argv)\n{\n'
    #ctext += '    int aux;\n'
    ctext += '    bool result;\n'
    ctext += '    runTest_'+cov.upper()+'_'+mchName+'__testAll(&result);\n'
    ctext += '    if (result == true){\n'
    if not fail:
        ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')\
                 +' is well performed and achieved'+coverage+'");\n'
    else:
        ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')\
                 +'is well performed but did NOT achieved '+coverage+'");\n'
    ctext += '    }\n'
    ctext += '    else{\n'
    ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')+' is NOT well performed");    \n'
    ctext += '    }\n'
    #ctext += '    printf("\\nPress enter to quit");\n'
    #ctext += '    scanf("%d", &aux);\n'
    ctext += '    return 0;\n'
    ctext += '}'
    runFile.write(ctext)
    cFiles.append('main_runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c')
    runFile.close()
    
def compileFiles(cFiles, copy_directory, cov, impBXML):
    args = ['gcc']
    args.append('-o')
    args.append(copy_directory+'\\lang\\c\\runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.exe')
    for cfile in cFiles:
        args.append(copy_directory+'\\lang\\c\\'+cfile)
    #args.append('-fprofile-arcs')
    #args.append('-ftest-coverage')
    subprocess.call(args)
