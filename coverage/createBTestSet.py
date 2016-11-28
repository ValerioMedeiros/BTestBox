import os
import shutil
import re
import instgen
from xml.dom import minidom

def createTest(inputs, output, impBXML, mchBXML, importedMch, seesMch, includedMch, operationsNames):
    directory = '/Users/Diego Oliveira/Documents/BTestBox/coverage/Test'
    mch = impBXML.getElementsByTagName('Abstraction')[0]
    controlList, controlListNames = makeCopyFile(impBXML.firstChild.getAttribute('name'), mch.firstChild.data, mchBXML, impBXML, includedMch, seesMch, importedMch, directory)
    for machineBXML in importedMch:
        importedImpBXML = getImpWithImportedMch(machineBXML)
        controlList, controlListNames = makeCopyFile(importedImpBXML.firstChild.getAttribute('name'), machineBXML.firstChild.getAttribute('name'),
                                   machineBXML, importedImpBXML, includedMch, seesMch, importedMch, directory, controlList, controlListNames)
    controlListSEES = list()
    for machineBXML in seesMch:
        seesImpBXML = getImpWithImportedMch(machineBXML)
        variablesSEES, variablesMchNamesSEES = makeCopyFile(seesImpBXML.firstChild.getAttribute('name'), machineBXML.firstChild.getAttribute('name'),
                                   machineBXML, seesImpBXML, includedMch, seesMch, importedMch, directory, [], [])
        controlListSEES.append(variablesSEES)
    inputsOrder, outputsOrder = getOrder(impBXML, operationsNames)
    testOperationNames = createTestFile(mch.firstChild.data, impBXML, inputs, output, seesMch, importedMch, operationsNames,
                                        directory, inputsOrder, outputsOrder, controlList, controlListNames, controlListSEES)
    return testOperationNames

def getImpWithImportedMch(importedMch): #THIS FUNCTIONS IS REPEATED IN THE COVERAGE.PY AND THERE IS ONE VERY SIMILAR IN SOLVEROC.PY
                                        #THE ONE FOR THE SOLVEROC IS DIFFERENT BECAUSE NEED TO CHECK THE OPERATION
    for file in os.listdir('/Users/Diego Oliveira/Documents/BTestBox/coverage/'):
        if file.endswith(".bxml"):
            bxmlfile = instgen.minidom.parse(file)
            root = bxmlfile.firstChild
            if root.getAttribute('type') == 'implementation':
                abstraction = root.getElementsByTagName('Abstraction')[0]
                if abstraction.firstChild.data == importedMch.firstChild.getAttribute('name'):
                    return bxmlfile
    return None

def getOrder(impBXML, operationsNames):
    inputOrderForOperation = []
    outputOrderForOperation = []
    for operation in operationsNames:
        allOperationClause = impBXML.getElementsByTagName('Operation')
        for operationClause in allOperationClause:
            if operationClause.getAttribute('name') == operation:
                inputOrder = []
                outputOrder = []
                for child in operationClause.childNodes:
                    if child.nodeType != child.TEXT_NODE:
                        if child.tagName == 'Input_Parameters':
                            allId = child.getElementsByTagName('Id')
                            for Id in allId:
                                inputOrder.append(Id.getAttribute('value'))
                        if child.tagName == 'Output_Parameters':
                            allId = child.getElementsByTagName('Id')
                            for Id in allId:
                                outputOrder.append(Id.getAttribute('value'))
                inputOrderForOperation.append(inputOrder)
                outputOrderForOperation.append(outputOrder)
    return inputOrderForOperation, outputOrderForOperation
                                
def makeCopyFile(impNameFile, mchNameFile, mchBXML, impBXML, includedMch, seesMch, importedMch, directory, controlList = [], controlListNames = []):
    if not os.path.isdir(directory):
        os.mkdir(directory)
    copiedImp = open(directory+'/copy'+impNameFile+'.imp', 'w')
    copiedMch = open(directory+'/copy'+mchNameFile+'.mch', 'w')
    shutil.copyfile(str(mchNameFile+'.mch'), str(directory+'/copy'+mchNameFile+'.mch'))
    shutil.copyfile(str(impNameFile+'.imp'), str(directory+'/copy'+impNameFile+'.imp'))
    copiedImp.close()
    copiedMch.close()
    with open(directory+'/copy'+mchNameFile+'.mch', 'r+') as mch:
        old = mch.read()
        mch.seek(0)
        variablesAndConstraints, typeOfVariablesAndConstraints = getVariablesAndConstraints(impBXML)
        getOperation, setOperation, controlList, controlListNames = createFunctions(variablesAndConstraints, typeOfVariablesAndConstraints, impBXML, 'mch', mchNameFile, controlList, controlListNames)
        text = 'MACHINE\n    copy'+mchBXML.firstChild.getAttribute('name')
        if mchBXML.getElementsByTagName('Parameters') != []:
            parametersnode = mchBXML.getElementsByTagName('Parameters')[0]
            text += instgen.transformBXML(parametersnode)
        text += '\n\n'
        for clauses in mchBXML.firstChild.childNodes:
            if clauses.nodeType != clauses.TEXT_NODE:
                if clauses.tagName == 'Imports':
                    text += instgen.transformBXML(clauses)
                    if impBXML.getElementsByTagName('Promotes') == []:
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                        text += '\n\nPROMOTES\n'
                        text += '    '+promotedOperations
                    text +='\n\n'
                if clauses.tagName == 'Sees':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Promotes':
                    promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                    text += instgen.transformBXML(clauses)
                    text += ', '+promotedOperations+'\n\n'
                if clauses.tagName == 'Concrete_Variables' or clauses.tagName == 'Abstract_Variables':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Concrete_Constants' or clauses.tagName == 'Abstract_Constants':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Abstraction':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Invariant':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Initialisation':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Sets':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Assertions':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Properties':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Constraints':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Values':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Includes':
                    text += instgen.transformBXML(clauses)
                    if impBXML.getElementsByTagName('Promotes') == []:
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                        text += '\n\nPROMOTES\n'
                        text += '    '+promotedOperations
                    text += '\n\n'
                if clauses.tagName == 'Operations':
                    text += 'OPERATIONS\n'
                    text += getOperation+setOperation
                    operationsposition = re.search(r'\bOPERATIONS\b', old).end()
                    if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                        tag = clauses.nextSibling.nextSibling.tagName.upper()
                        endoperations = re.search(r'\b%s\b' % tag, old).start()
                    else:
                        endoperations = len(old)
                    text += old[operationsposition+1:endoperations:]
                if clauses.tagName == 'Local_Operations':
                    operationsposition = re.search(r'\bLOCAL_OPERATIONS\b', old).start()
                    if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                        tag = clauses.nextSibling.nextSibling.tagName.upper()
                        endoperations = re.search(r'\b%s\b' % tag, old).start()
                    else:
                        endoperations = len(old)
                    text += old[operationsposition:endoperations:]
        mch.write(text)
        mch.close()
    with open(directory+'/copy'+impNameFile+'.imp', 'r+') as imp:
        old = imp.read()
        imp.seek(0)
        variablesAndConstraints, typeOfVariablesAndConstraints = getVariablesAndConstraints(impBXML)
        getOperation, setOperation, controlList, controlListNames = createFunctions(variablesAndConstraints, typeOfVariablesAndConstraints, impBXML, 'imp', mchNameFile, controlList, controlListNames)
        text = 'IMPLEMENTATION\n    copy'+impBXML.firstChild.getAttribute('name')
        if impBXML.getElementsByTagName('Parameters') != []:
            parametersnode = impBXML.getElementsByTagName('Parameters')[0]
            text += instgen.transformBXML(parametersnode)
        text += '\n\n'
        for clauses in impBXML.firstChild.childNodes:
            if clauses.nodeType != clauses.TEXT_NODE:
                if clauses.tagName == 'Imports':
                    text += instgen.transformBXML(clauses)
                    if impBXML.getElementsByTagName('Promotes') == []:
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                        text += '\n\nPROMOTES\n'
                        text += '    '+promotedOperations
                    text +='\n\n'
                if clauses.tagName == 'Sees':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Promotes':
                    promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                    text += instgen.transformBXML(clauses)
                    text += ', '+promotedOperations+'\n\n'
                if clauses.tagName == 'Concrete_Variables' or clauses.tagName == 'Abstract_Variables':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Concrete_Constants' or clauses.tagName == 'Abstract_Constants':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Abstraction':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Invariant':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Initialisation':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Values':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Sets':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Assertions':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Properties':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Constraints':
                    text += instgen.transformBXML(clauses)+'\n\n'
                if clauses.tagName == 'Operations':
                    text += 'OPERATIONS\n'
                    text += getOperation+setOperation
                    operationsposition = re.search(r'\bOPERATIONS\b', old).end()
                    if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                        tag = clauses.nextSibling.nextSibling.tagName.upper()
                        endoperations = re.search(r'\b%s\b' % tag, old).start()
                    else:
                        endoperations = len(old)
                    text += old[operationsposition+1:endoperations:]
                if clauses.tagName == 'Local_Operations':
                    operationsposition = re.search(r'\bLOCAL_OPERATIONS\b', old).start()
                    if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                        tag = clauses.nextSibling.nextSibling.tagName.upper()
                        endoperations = re.search(r'\b%s\b' % tag, old).start()
                    else:
                        endoperations = len(old)
                    text += old[operationsposition:endoperations:]
        imp.write(text)
        imp.close()
    return controlList, controlListNames

def accessIncludedMchAndGetItDependents(mchBXML, includedMch):
    variablesOperation = ""
    for clause in mchBXML.firstChild.childNodes:
        if clause.nodeType != clause.TEXT_NODE:
            if clause.tagName == 'Includes':
                allRefmch = clause.getElementsByTagName('Referenced_Machine')
                for refmch in allRefmch:
                    for child in refmch.childNodes:
                        if child.nodeType != child.TEXT_NODE:
                            if child.tagName == 'Name':
                                for included in includedMch:
                                    if child.firstChild.data == included.firstChild.getAttribute('name'):
                                        var, vartype = getVariablesAndConstraints(included)
                                        for i in range(len(var)):
                                            variablesOperation += 'OperationForTestGet'+var[i]+'IMP'+included.firstChild.getAttribute('name')
                                            if i != max(range(len(var))):
                                                variablesOperation += ', '
                                        if len(var) != 0:
                                            variablesOperation += ', SetVariablesForTest'+child.firstChild.data
    return variablesOperation
        
def getVariablesAndConstraints(BXML):
    variablesAndConstraints = list()
    typeOfVariablesAndConstraints = list()
    for childnode in BXML.firstChild.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            tag = childnode.tagName
            if tag == "Abstract_Variables" or tag == "Concrete_Variables" or tag == "Variables" or tag == "Constraints":
                allId = childnode.getElementsByTagName('Id')
                for Id in allId:
                    variablesAndConstraints.append(Id.getAttribute('value'))
                    typref = Id.getAttribute('typref')
                    for childnode in BXML.firstChild.childNodes:
                        if childnode.nodeType != childnode.TEXT_NODE:
                            tag = childnode.tagName
                            if tag == 'TypeInfos':
                                for typeinfo in childnode.childNodes:
                                    if typeinfo.nodeType != typeinfo.TEXT_NODE:
                                        if typeinfo.getAttribute('id') == typref:
                                            typeOfVariablesAndConstraints.append(instgen.selfcaller(typeinfo.firstChild.nextSibling))
    return variablesAndConstraints, typeOfVariablesAndConstraints

def createFunctions(var, typeOfVariablesAndConstraints, BXML, tipo, name, controlList, controlListNames):
    setOperation = ""
    getOperation = ""
    if tipo == 'mch' and var != []:
        for i in range(len(var)):
            getOperation += '    Get'+var[i]+'ForTest <-- OperationForTestGet'+var[i]+name+' = \n'
            getOperation += '        ANY aux WHERE aux : '+typeOfVariablesAndConstraints[i]+' THEN Get'+var[i]+'ForTest := aux END;\n\n'
        setOperation += '    SetVariablesForTest'+name+'('
        for i in range(len(var)):
            setOperation += 'nn'+str(i+1)
            if i != max(range(len(var))):
                setOperation += ', '
        setOperation += ') = \n'
        setOperation += '    PRE '
        for i in range(len(var)):
            controlList.append(var[i])
            controlListNames.append(name)
            itIsOkay = False
            for childnode in BXML.firstChild.childNodes:
                if childnode.nodeType != childnode.TEXT_NODE:
                    if childnode.tagName == 'Invariant':
                        allExpComparison = childnode.getElementsByTagName('Exp_Comparison')
                        for expComparison in allExpComparison:
                            if expComparison.getAttribute('op') == ':':
                                if expComparison.childNodes.item(3).getAttribute('value') == var[i]:
                                    itIsOkay = True
                                    precondition = instgen.selfcaller(expComparison)
                                    setOperation += re.sub(r'\b%s\b' % var[i], 'nn'+str(i+1), precondition)
                        if not itIsOkay:
                            setOperation += 'nn'+str(i+1)+' : '+typeOfVariablesAndConstraints[i]
            if i != max(range(len(var))):
                setOperation += ' & '
            else:
                setOperation += '\n'
        setOperation += '    THEN\n'
        setOperation += '        skip\n'
        setOperation += '    END;\n\n'
    if tipo == 'imp' and var != []:
        for i in range(len(var)):
            getOperation += '    Get'+var[i]+'ForTest <-- OperationForTestGet'+var[i]+name+' = \n'
            getOperation += '        Get'+var[i]+'ForTest := '+var[i]+';\n\n'
        setOperation += '    SetVariablesForTest'+name+'('
        for i in range(len(var)):
            setOperation += 'nn'+str(i+1)
            if i != max(range(len(var))):
                setOperation += ', '
        setOperation += ') = \n'
        setOperation += '    BEGIN\n'
        for i in range(len(var)):
            setOperation += '        '+var[i]+' := nn'+str(i+1)
            if i != max(range(len(var))):
                setOperation += ';'
            setOperation += '\n'
        setOperation += '    END;\n\n'
    return getOperation, setOperation, controlList, controlListNames

def createTestFile(mchName, impBXML, inputs, outputs, seesMch, importedMch, operationsNames, directory, inputsOrder, outputsOrder, controlList, controlListNames, controlListSEES):
    testOperationsNames = list()
    machine = 'MACHINE\n    TestSet_'+mchName+'\n\n'
    machine += 'OPERATIONS\n'
    for operation in sorted(inputs.keys()):
        for i in range(len(inputs[operation])):
            machine += 'verdict <-- TEST_'+str(i)+'_'+operationsNames[operation-1]+' =\n'
            testOperationsNames.append('TEST_'+str(i)+'_'+operationsNames[operation-1])
            machine += '    ANY kk WHERE kk : BOOL THEN verdict := kk END'
            if i != max(range(len(inputs[operation]))):
                machine += ';\n\n'
            else:
                if operation != max(sorted(inputs.keys())):
                    machine += ';\n\n'
                else:
                    machine += '\n'
    machine += 'END'
    implementation = 'IMPLEMENTATION\n    TestSet_'+mchName+'_i\n\n'
    implementation += 'REFINES\n    TestSet_'+mchName+'\n\n'
    implementation += 'IMPORTS\n    copy'+mchName
    for mch in seesMch:
        implementation += ', '
        implementation += 'copy'+mch.firstChild.getAttribute('name')
    implementation += '\n\n'
    implementation += 'OPERATIONS\n'
    for operation in sorted(inputs.keys()):
        for i in range(len(inputs[operation])):
            implementation += '    verdict <-- TEST_'+str(i)+'_'+operationsNames[operation-1]+' =\n'
            implementation += '    BEGIN\n'
            wordList = re.sub("[^\w]", " ",  inputs[operation][i]).split()
            varInput = []
            varOutput = []
            outputVarName = []
            outputVarValue = []
            for j in range(len(wordList)):
                if j % 2 == 0:
                    varInput.append(wordList[j])
                    varOutput.append(wordList[j + 1])
            wordListOut = re.sub("[^\w]", " ",  outputs[operation][i]).split()
            for j in range(len(wordListOut)):
                if j % 2 == 0:
                    outputVarName.append(wordListOut[j])
                    outputVarValue.append(wordListOut[j + 1])
            if controlList != []:
                #For the machine/implementation
                for clause in impBXML.firstChild.childNodes:
                    if clause.nodeType != clause.TEXT_NODE:
                        if clause.tagName == 'Variables' or clause.tagName == 'Concrete_Variables':
                            implementation += '        SetVariablesForTest'+mchName+'('
                            allVariables = clause.getElementsByTagName('Id')
                            count = 0
                            for variable in allVariables:
                                alreadyWriteVariable = list()
                                for j in range(len(varInput)):
                                    if variable.getAttribute('value') == str(varInput[j]):
                                        if variable.getAttribute('value') not in alreadyWriteVariable:
                                            implementation += str(varOutput[j])
                                            alreadyWriteVariable.append(variable.getAttribute('value'))
                                            count += 1
                                            if allVariables.length > count:
                                                implementation += ', '
                            implementation += ');\n'
                        if clause.tagName == 'Imports' or clause.tagName == 'Extends':
                            allImportedMachines = clause.getElementsByTagName('Name')
                            for importedmachine in importedMch:
                                for machineimported in allImportedMachines:
                                    if importedmachine.firstChild.getAttribute('name') == machineimported.firstChild.data:
                                        importedmachineimp = getImpWithImportedMch(importedmachine)
                                        for importedmachineclauses in importedmachineimp.firstChild.childNodes:
                                            if importedmachineclauses.nodeType != importedmachineclauses.TEXT_NODE:
                                                if importedmachineclauses.tagName == 'Variables' or importedmachineclauses.tagName == 'Concrete_Variables':
                                                    implementation += '        SetVariablesForTest'+machineimported.firstChild.data+'('
                                                    allVariables = importedmachineclauses.getElementsByTagName('Id')
                                                    count = 0
                                                    for variable in allVariables:
                                                        alreadyWriteVariable = list()
                                                        for j in range(len(varInput)):
                                                            if variable.getAttribute('value') == str(varInput[j]):
                                                                if variable.getAttribute('value') not in alreadyWriteVariable:
                                                                    implementation += str(varOutput[j])
                                                                    alreadyWriteVariable.append(variable.getAttribute('value'))
                                                                    count += 1
                                                                    if allVariables.length > count:
                                                                        implementation += ', '
                                                    implementation += ');\n'
            for j in range(len(seesMch)):
                if controlListSEES[j] != []:
                    implementation += '        SetVariablesForTest'+seesMch[j].firstChild.getAttribute('name')+'('
                    count = 0
                    for var in controlListSEES[j]:
                        for k in range(len(varInput)):
                            if str(var) == str(varInput[k]):
                                implementation += str(varOutput[k])
                        count += 1
                        if len(controlListSEES[j]) != count:
                            implementation += ', '
                    implementation += ');\n'
                for clause in seesMch[j].childNodes:
                    if clause.nodeType != clause.TEXT_NODE:
                        if clause.tagName == 'Includes' or clause.tagName == 'Extends' or clause.tagName == 'Imports':
                            allImportedMachines = clause.getElementsByTagName('Name')
                            for importedmachine in importedMch:
                                for machineimported in allImportedMachines:
                                    if importedmachine.firstChild.getAttribute('name') == machineimported.firstChild.data:
                                        importedmachineimp = getImpWithImportedMch(importedmachine)
                                        for importedmachineclauses in importedmachineimp.firstChild.childNodes:
                                            if importedmachineclauses.nodeType != importedmachineclauses.TEXT_NODE:
                                                if importedmachineclauses.tagName == 'Variables' or importedmachineclauses.tagName == 'Concrete_Variables':
                                                    implementation += '        SetVariablesForTest'+machineimported.firstChild.data+'('
                                                    allVariables = importedmachineclauses.getElementsByTagName('Id')
                                                    count = 0
                                                    for variable in allVariables:
                                                        alreadyWriteVariable = list()
                                                        for j in range(len(varInput)):
                                                            if variable.getAttribute('value') == str(varInput[j]):
                                                                if variable.getAttribute('value') not in alreadyWriteVariable:
                                                                    implementation += str(varOutput[j])
                                                                    alreadyWriteVariable.append(variable.getAttribute('value'))
                                                                    count += 1
                                                                    if allVariables.length > count:
                                                                        implementation += ', '
                                                    implementation += ');\n'
            implementation += '        VAR '
            for j in range(len(outputVarName)):
                implementation += 'aux'+str(j+1)
                if j != max(range(len(outputVarName))):
                    implementation += ', '
            implementation += ' IN\n'
            count = 0
            if outputsOrder[operation - 1] != []: #Operations WITH output
                implementation += '            '
                for j in range(len(outputsOrder[operation - 1])):
                    implementation += 'aux'+str(j+1)
                    if j != max(range(len(outputsOrder[operation - 1]))):
                        implementation += ', '
                implementation += ' <-- '+operationsNames[operation-1]
                if inputsOrder[operation - 1] != []: #Operation WITH output and inputs
                    implementation +='('
                    for j in range(len(inputsOrder[operation-1])):
                        for k in range(len(varInput)):
                            if str(inputsOrder[operation-1][j]) == str(varInput[k]):
                                implementation += str(varOutput[k])
                        if j != max(range(len(inputsOrder[operation-1]))):
                            implementation += ', '
                    implementation += ')'
                implementation += ';\n'              
            else: #Operation WITHOUT output
                implementation += '            '+operationsNames[operation - 1]
                if inputsOrder[operation - 1] != []: #Operations WITHOUT output and WITH inputs
                    implementation += '('
                    for j in range(len(inputsOrder[operation-1])):
                        for k in range(len(varInput)):
                            if str(inputsOrder[operation-1][j]) == str(varInput[k]):
                                implementation += str(varOutput[k])
                        if j != max(range(len(inputsOrder[operation-1]))):
                            implementation += ', '
                    implementation += ')'
                implementation += ';\n'
            for j in range(len(controlList)): #Gets
                if outputsOrder[operation - 1] != []:
                    implementation += '            aux'+str(j+1+max(range(len(outputsOrder[operation - 1])))+1)+' <-- OperationForTestGet'+controlList[j]+controlListNames[j]+';\n'
                    countsaver = j+1
                else:
                    implementation += '            aux'+str(j+1)+' <-- OperationForTestGet'+controlList[j]+controlListNames[j]+';\n'
                    countsaver = j+1
            startcount = countsaver
            for j in range(len(seesMch)):
                seesName = seesMch[j].firstChild.getAttribute('name')
                for k in range(len(controlListSEES[j])):
                    implementation += '            aux'+str(k+j+countsaver+1)+' <-- OperationForTestGet'+controlListSEES[j][k]+seesName+';\n'
                countsaver = k + countsaver + 1 + j
            implementation += '            IF ' #Start of the IF
            if outputsOrder[operation - 1] != []:
                for j in range(len(outputsOrder[operation - 1])):
                    implementation += 'aux'+str(j+1)+' = '
                    for k in range(len(outputVarName)):
                        if str(outputsOrder[operation-1][j]) == str(outputVarName[k]):
                            implementation += str(outputVarValue[k])
                    if j != max(range(len(outputsOrder[operation - 1]))):
                        implementation += ' & '
            for j in range(len(controlList)):
                if j == 0 and outputsOrder[operation - 1] != []:
                    implementation += ' & '
                if outputsOrder[operation - 1] != []:
                    implementation += 'aux'+str(j+1+max(range(len(outputsOrder[operation - 1])))+1)+' = '
                else:
                    implementation += 'aux'+str(j+1)+' = '
                alreadyWriteVariables = []
                for k in range(len(outputVarName)):
                    if str(controlList[j]) == str(outputVarName[k]):
                        if str(controlList[j]) not in alreadyWriteVariables:
                            implementation += str(outputVarValue[k])
                            alreadyWriteVariables.append(str(controlList[j]))
                if j != max(range(len(controlList))):
                    implementation += ' & '
            countsaver = startcount
            for j in range(len(seesMch)):
                if controlListSEES[j] != []:
                    implementation += ' & '
                alreadyWriteVariables = []
                for k in range(len(controlListSEES[j])):
                    implementation += 'aux'+str(countsaver+k+j+1)+' = '
                    for w in range(len(outputVarName)):
                        if str(controlListSEES[j][k]) == str(outputVarName[w]):
                            if str(controlListSEES[j][k]) not in alreadyWriteVariables:
                                alreadyWriteVariables.append(str(controlListSEES[j][k]))
                                implementation += str(outputVarValue[w])
                    if k != max(range(len(controlListSEES[j]))):
                        implementation += ' & '
            implementation += ' THEN\n'
            implementation += '                verdict := TRUE\n'
            implementation += '            ELSE\n'
            implementation += '                verdict := FALSE\n'
            implementation += '            END\n'
            implementation += '        END\n'
            implementation += '    END'
            if operation != max(sorted(inputs.keys())):
                implementation += ';\n\n'
            else:
                if i != max(range(len(inputs[operation]))):
                    implementation += ';\n\n'
                else:
                    implementation += '\n'
    implementation += 'END'
    testimplementation = open(directory+'/'+'TestSet_'+mchName+'_i.imp', 'w')
    testimplementation.write(implementation)
    testimplementation.close()
    testmachine = open(directory+'/'+'TestSet_'+mchName+'.mch', 'w')
    testmachine.write(machine)
    testmachine.close()
    return testOperationsNames
    
