import createBTestSet
import subprocess
import os
import platform

def runTest(impBXML, importedMch, seesMch, coverage, directory, aterlierBDir, copy_directory, cov, translator,
            translatorProfile, compiler, fail = False):
    Files = makeTranslation(impBXML, importedMch, seesMch, directory, aterlierBDir, copy_directory, cov, translator,
                             translatorProfile)
    createFileToRunTest(impBXML, translator, coverage, copy_directory, Files, cov, fail)
    compileFiles(Files, copy_directory, cov, impBXML, compiler)
    if platform.system()=="Windows":
        if translator == "C":
            subprocess.call(copy_directory+ os.sep +'lang'+ os.sep +'c'+ os.sep +'runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')
                            +'.exe')

def makeTranslation(impBXML, importedMch, seesMch, directory, aterlierBDir, copy_directory, cov, translator,
                    translatorProfile):
    if not os.path.isdir(copy_directory + os.sep + "lang"):
        os.mkdir(copy_directory + os.sep + "lang")
    if not os.path.isdir(copy_directory + os.sep + "lang" + os.sep + "c"):
        os.mkdir(copy_directory + os.sep + "lang" + os.sep + "c")
    if translator == "C":
        cFiles = list()
        if platform.system() == "Windows":
            args = [aterlierBDir+ os.sep +'bbin'+ os.sep +'win32'+ os.sep +'b2c.exe']
            args.append("-p")
            args.append(translatorProfile)
            args.append("-C")
        elif platform.system() == "Linux":
            print("Not implemented")
        elif platform.system() == "Darwin":
            print("Not implemented")
        args.append(copy_directory+ os.sep +"lang"+ os.sep +"c")
        args.append("-I")
        args.append(copy_directory)
        args.append(copy_directory+ os.sep +"TestSet_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+".imp")
        cFiles.append("TestSet_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c')
        print(args)
        subprocess.call(args)
        args.pop()
        args.append(copy_directory+ os.sep +"runTest_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+".imp")
        cFiles.append("runTest_"+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c')
        subprocess.call(args)
        args.pop()
        args.append(copy_directory+ os.sep +impBXML.firstChild.getAttribute('name')+".imp")
        cFiles.append(impBXML.firstChild.getAttribute('name')+'.c')
        subprocess.call(args)
        args.pop()
        for mch in importedMch:
            impMch = createBTestSet.getImpWithImportedMch(mch, directory)
            args.append(copy_directory+ os.sep +impMch.firstChild.getAttribute('name')+".imp")
            cFiles.append(impMch.firstChild.getAttribute('name')+'.c')
            subprocess.call(args)
            args.pop()
        for mch in seesMch:
            impMch = createBTestSet.getImpWithImportedMch(mch, directory)
            args.append(copy_directory+ os.sep +impMch.firstChild.getAttribute('name')+".imp")
            cFiles.append(impMch.firstChild.getAttribute('name')+'.c')
            subprocess.call(args)
            args.pop()
        return cFiles
    if translator == "LLVM":
        print("Not implemented")
    if translator == "ADA":
        print("Not implemented")

def createFileToRunTest(impBXML, translator, coverage, copy_directory, cFiles, cov, fail):
    mchName = impBXML.getElementsByTagName('Abstraction')[0].firstChild.data
    if translator == "C":
        runFile = open(copy_directory+ os.sep +'lang'+ os.sep +'c'+ os.sep +'main_runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.c', 'w')
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
                     +' is well performed but did NOT achieved '+coverage+'");\n'
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
    
def compileFiles(Files, copy_directory, cov, impBXML, compiler):
    if compiler == "gcc":
        args = [compiler]
        args.append('-o')
        args.append(copy_directory+ os.sep +'lang'+ os.sep +'c'+ os.sep +'runTest_'+cov.upper()+'_'+impBXML.firstChild.getAttribute('name')+'.exe')
        for cfile in Files:
            args.append(copy_directory+ os.sep +'lang'+ os.sep +'c'+ os.sep +cfile)
        #args.append('-fprofile-arcs')
        #args.append('-ftest-coverage')
        subprocess.call(args)
