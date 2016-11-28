import createBTestSet
import subprocess
import os

def runTest(impBXML, mchBXML, importedMch, seesMch, testOperationNames, coverage):
    directory = '\\Users\\Diego Oliveira\\Documents\\BTestBox\\coverage\\Test\\lang\\c'
    cFiles = makeTranslation(impBXML, importedMch, seesMch)
    createFileToRunTest(impBXML, testOperationNames, coverage, directory)
    compileFiles(cFiles, directory)
    subprocess.call(directory+'\\runTest.exe')

def makeTranslation(impBXML, importedMch, seesMch):
    cFiles = list()
    args = ["/Users/Diego Oliveira/AtelierB/installatelierb/bbin/win32/b2c.exe"]
    args.append("-p")
    args.append("C9X")
    args.append("-r")
    args.append("/Users/Diego Oliveira/Documents/binstall_projects/GeneratedTests/bpd/AtelierB")
    args.append("-C")
    if not os.path.isdir("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/lang"):
        os.mkdir("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/lang")
    if not os.path.isdir("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/lang/c"):
        os.mkdir("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/lang/c")
    args.append("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/lang/c")
    args.append("-I")
    args.append("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test")
    args.append("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/TestSet_"+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("TestSet_"+impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    args.append("/Users/Diego Oliveira/Documents/BTestBox/coverage/Test/copy"+impBXML.firstChild.getAttribute('name')+".imp")
    cFiles.append("copy"+impBXML.firstChild.getAttribute('name')+'.c')
    subprocess.call(args)
    args.pop()
    """ FALTA ADICIONAR OS IMPORTS
    for mch in importedMch:
        impMch = createBTestSet.getImpWithImportedMch(mch)
    """
    return cFiles
        
def createFileToRunTest(impBXML, testOperationNames, coverage, directory):
    mchName = impBXML.getElementsByTagName('Abstraction')[0].firstChild.data
    runFile = open(directory+'\\runTest.c', 'w')
    ctext = '#include <stdio.h>\n#include <stdlib.h>\n\n'
    ctext += '#include '
    ctext += '"TestSet_'+mchName+'.h"'
    ctext += '\n\n'
    ctext += 'int main(int argc, char **argv)\n{\n'
    ctext += '    int aux;\n'
    ctext += '    bool '
    for i in range(len(testOperationNames)):
        ctext += 'result'+str(i)
        if i < len(testOperationNames)-1:
            ctext += ', '
    ctext += ';\n'
    for i in range(len(testOperationNames)):
        ctext += '    TestSet_'+mchName+'__'+testOperationNames[i]+'(&result'+str(i)+');\n'
    ctext += '    if ('
    for i in range(len(testOperationNames)):
        ctext += 'result'+str(i)+' == true'
        if i < len(testOperationNames)-1:
            ctext += ' && '
    ctext += '){\n'
    ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')+' achieved '+coverage+'");\n'
    ctext += '    }\n'
    ctext += '    else{\n'
    ctext += '        printf("The translation of the implementation '+impBXML.firstChild.getAttribute('name')+' NOT achieved '+coverage+'");\n'
    ctext += '    }\n'
    ctext += '    printf("\\nPress enter to quit");\n'
    ctext += '    scanf("%d", &aux);\n'
    ctext += '    return 0;\n'
    ctext += '}'
    runFile.write(ctext)
    runFile.close()

def compileFiles(cFiles, directory):
    args = ['gcc']
    args.append('-o')
    args.append(directory+'\\runTest.exe')
    for cfile in cFiles:
        args.append(directory+'\\'+cfile)
    args.append(directory+'\\runTest.c')
    subprocess.call(args)
