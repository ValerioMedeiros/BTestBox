import os
import shutil
import re
import instgen

def createTest(inputs, output, impBXML, mchBXML, importedMch, seesMch, includedMch, operationsNames):
    directory = '/Users/Diego Oliveira/Documents/BTestBox/coverage/Test'
    mch = impBXML.getElementsByTagName('Abstraction')[0]
    controlList = makeCopyFile(impBXML.firstChild.getAttribute('name'), mch.firstChild.data, mchBXML, impBXML, includedMch, seesMch, importedMch, directory)
    for machineBXML in importedMch:
        importedImpBXML = getImpWithImportedMch(machineBXML)
        controlList = makeCopyFile(importedImpBXML.firstChild.getAttribute('name'), machineBXML.firstChild.getAttribute('name'),
                                   machineBXML, importedImpBXML, includedMch, seesMch, importedMch, directory, controlList)
    controlListSEES = list()
    for machineBXML in seesMch:
        seesImpBXML = getImpWithImportedMch(machineBXML)
        variablesSEES = makeCopyFile(seesImpBXML.firstChild.getAttribute('name'), machineBXML.firstChild.getAttribute('name'),
                                   machineBXML, seesImpBXML, includedMch, seesMch, importedMch, directory, [])
        controlListSEES.append(variablesSEES)
    inputsOrder, outputsOrder = getOrder(impBXML, operationsNames)
    createTestFile(mch.firstChild.data, inputs, output, seesMch, operationsNames, directory, inputsOrder, outputsOrder, controlList, controlListSEES)

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
                                
def makeCopyFile(impNameFile, mchNameFile, mchBXML, impBXML, includedMch, seesMch, importedMch, directory, controlList = []):
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
        operationsposition = re.search(r'\bOPERATIONS\b', old).end()
        variablesAndConstraints, typeOfVariablesAndConstraints = getVariablesAndConstraints(impBXML)
        getOperation, setOperation, controlList = createFunctions(variablesAndConstraints, mch, typeOfVariablesAndConstraints, impBXML, 'mch', mchNameFile, controlList)
        nameposition = re.search(r'\bMACHINE\b', old).end()
        while old[nameposition+1] == ' ':
            nameposition += 1
        if re.search(r'\bINCLUDES\b', old) != None:
            includeposition = re.search(r'\bINCLUDES\b', old).end()
            while old[includeposition+1] == ' ':
                includeposition += 1
            promotesposition = includeposition + 1
            while old[promotesposition+1] != ' ':
                promotesposition += 1
        if re.search(r'\bPROMOTES\b', old) != None:
            promotesposition = re.search(r'\bPROMOTES\b', old).end()
            while old[promotesposition+1] == ' ':
                promotesposition += 1
        if re.search(r'\bSEES\b', old) != None:
            seesposition = re.search(r'\bSEES\b', old).end()
            while old[seesposition+1] == ' ':
                seesposition += 1
        if re.search(r'\bINCLUDES\b', old) != None: #The operation has includes
            if re.search(r'\bSEES\b', old) != None: #The operation has includes and sees
                if re.search(r'\bPROMOTES\b', old) != None: #The operation has includes, sees and promotes
                    if promotesposition < includesposition:
                        if promotesposition < seesposition:
                            None
                        else:
                            None
                    else:
                        if promotesposition < seesposition:
                            None
                        else:
                            None
                else: #The operation has includes and sees but don't has promotes
                    if seesposition < includeposition:
                        beforeOperations = 'copy'+old[seesposition+1:includeposition+1:]+'copy'+old[includeposition+1:promotesposition]+'\n\n'
                        aux = includeposition
                        importposition = seesposition
                        seesposition = aux
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                        if promotedOperations != "":
                            beforeOperations += 'PROMOTES\n '+promotedOperations+'\n\n'
                    else:
                        beforeOperations = 'copy'+old[includeposition+1:promotesposition:]+'\n\n'
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
                        if promotedOperations != "":
                            beforeOperations += 'PROMOTES\n '+promotedOperations
                        beforeOperations += old[promotesposition:seesposition+1]+'copy'
                    mch.write(old[:nameposition+1:]+'copy'+old[nameposition+1:includeposition+1]+beforeOperations+
                             old[seesposition+1:operationsposition+1:]+getOperation+setOperation+old[operationsposition+1::])
            else: #The operation has includes but don't has sees
                None#STILL WORK TO DO HERE
        else: #The operation dont has includes
            if re.search(r'\bSEES\b', old) != None: #The operation don't has includes but has sees
                mch.write(old[:nameposition+1:]+'copy'+old[nameposition+1:seesposition+1:]+'copy'+
                      old[seesposition+1:operationsposition+1:]+getOperation+setOperation+old[operationsposition+1::])
            else: #The operation don't has includes or sees
                mch.write(old[:nameposition+1:]+'copy'+old[nameposition+1:operationsposition+1:] + getOperation + setOperation + old[operationsposition+1::])
        mch.close()
    with open(directory+'/copy'+impNameFile+'.imp', 'r+') as imp:
        old = imp.read()
        imp.seek(0)
        startSEES = 0
        startIMPORTS = 0
        startOPERATIONS = 0
        startPROMOTES = 0
        implementationclause, startIMPLEMENTATION, endIMPLEMENTATION = getPhrase('IMPLEMENTATION', old, impBXML, '')
        alreadycopied = list()
        refinesclause, startREFINES, endREFINES = getPhrase('REFINES', old, impBXML, '')
        if re.search(r'\bIMPORTS\b', old) != None:
            importsclause, startIMPORTS, endIMPORTS = getPhrase('IMPORTS', old, impBXML, 'Imports',importedMch)
        if re.search(r'\bSEES\b', old) != None:
            seesclause, startSEES, endSEES = getPhrase('SEES', old, impBXML, 'Sees', seesMch)
        if re.search(r'\bPROMOTES\b', old) != None:
            promotesclause, startPROMOTES, endPROMOTES = getPhrase('PROMOTES', old, impBXML, '')
        variablesAndConstraints, typeOfVariablesAndConstraints = getVariablesAndConstraints(impBXML)
        getOperation, setOperation, controlList = createFunctions(variablesAndConstraints, imp, typeOfVariablesAndConstraints, impBXML, 'imp', mchNameFile, controlList)
        if re.search(r'\bOPERATIONS\b', old) != None:
            operationclause, startOPERATIONS, endOPERATIONS = getPhrase('OPERATIONS', old, impBXML, '')
        finalIMP = implementationclause+'\n\n'+refinesclause+'\n\n'
        for i in range(startIMPLEMENTATION, endIMPLEMENTATION):
            alreadycopied.append(i)
        for i in range(startREFINES, endREFINES):
            alreadycopied.append(i)
        if re.search(r'\bIMPORTS\b', old) != None:
            for i in range(startIMPORTS, endIMPORTS):
                alreadycopied.append(i)
            finalIMP += importsclause+'\n\n'
        if re.search(r'\bSEES\b', old) != None:
            for i in range(startSEES, endSEES):
                alreadycopied.append(i)
            finalIMP += seesclause+'\n\n'
        if re.search(r'\bPROMOTES\b', old) != None:
            promotesOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
            arranje = [startIMPLEMENTATION, startREFINES, startSEES, startOPERATIONS]
            inserted = False
            copypos = re.search(r'\bPROMOTES\b', old).end()
            while old[copypos+1] == ' ':
                copypos += 1
            for startvalue in sorted(arranje):
                if startPROMOTES < startvalue and inserted == False:
                    inserted = True
                    finalIMP += old[startPROMOTES:copypos+1:]+promotesOperations+', '+old[copypos+1:startvalue:]
                    for i in range(startPROMOTES, startvalue):
                        alreadycopied.append(i)
                    endPROMOTES = startvalue - 1
                elif startvalue == max(arranje) and inserted == False:
                    finalIMP += old[startPROMOTES:copypos+1:]+promotesOperations+', '+old[copypos+1::]
                    for i in range(startPROMOTES, len(old)):
                        alreadycopied.append(i)
        if re.search(r'\bOPERATIONS\b', old) != None:
            copypos = re.search(r'\bOPERATIONS\b', old).end()
            arranje = [startIMPLEMENTATION, startREFINES, startSEES, startPROMOTES]
            while old[copypos + 1] == ' ':
                copypos += 1
            inserted = False
            for startvalue in sorted(arranje):
                if startOPERATIONS < startvalue and inserted == False:
                    inserted == True
                    finalIMP += old[startoperations:copypos+1]+getOperation+setOperation+old[copypos+1:startvalue:]
                    for i in range(startOPERATIONS, startvalue):
                        alreadycopied.append(i)
                elif startvalue == max(arranje) and inserted == False:
                    finalIMP += old[startOPERATIONS:copypos+1:]+getOperation+setOperation+old[copypos+1::]
                    for i in range(startPROMOTES, len(old)):
                        alreadycopied.append(i)
        elif getOperation != "":
            finalIMP += 'OPERATIONS\n    '+setOperation+getOperation
        for i in range(len(old)):
            if i not in alreadycopied:
                if len(old)-1 in alreadycopied:
                    endRef = re.search(r'\bREFINES\b', finalImp).end()
                    while endRef + 1 == ' ':
                        endRef += 1
                    endRef += 1
                    while endRef + 1 != ' ':
                        endRef += 1
                    leftover = ""
                    for i in range(len(old)):
                        if i not in alreadycopied:
                            leftover += old[i]
                            alreadycopied.append(i)
                    finalIMP = finalImp[:endRef:]+leftover+finalImp[endRef::]
                else:
                    finalIMP += old[i]
                    alreadycopied.append(i)
        imp.write(finalIMP)
        imp.close()
    return controlList

def getPhrase(word, text, BXML, maintag, aux = []):
    start = re.search(r'\b%s\b' % word, text).start()
    copypos = re.search(r'\b%s\b' % word, text).end()
    while text[copypos+1] == ' ':
        copypos+=1
    end = copypos + 1
    while text[end+1] != ' ':
        end += 1
    if word == 'IMPORTS' or word == 'SEES' or word == 'INCLUDES':
        phrase = text[start:copypos+1:]
        for childnode in BXML.firstChild.childNodes:
            if childnode.nodeType != childnode.TEXT_NODE:
                tag = childnode.tagName
                if tag == maintag:
                    allRef = childnode.getElementsByTagName('Name')
                    for j in range(len(allRef)):
                        for i in range(len(aux)):
                            if aux[i].firstChild.getAttribute('name') == allRef[j].firstChild.data:
                                phrase += 'copy'+aux[i].firstChild.getAttribute('name')
                                end += len(aux[i].firstChild.getAttribute('name'))
                        if j != max(range(len(aux))):
                                phrase += ', '
    if word == 'IMPLEMENTATION' or word == 'REFINES' or word == 'MACHINE':
        phrase = text[start:copypos+1:]+'copy'+text[copypos+1:end:]
    if word == 'PROMOTES':
        phrase = text[start::]
        end = len(text)-1
    if word == 'OPERATIONS':
        phrase = text[start::]
        end = len(text)-1
    return phrase, start, end

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
                                        #GET THE VARIABLES OPERATIONS AND THE PROMOTED OPERATIONS THAT ARE GET AND SET
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

def createFunctions(var, myfile, typeOfVariablesAndConstraints, BXML, tipo, name, controlList):
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
    return getOperation, setOperation, controlList

def createTestFile(mchName, inputs, outputs, seesMch, operationsNames, directory, inputsOrder, outputsOrder, controlList, controlListSEES):
    machine = 'MACHINE\n    TestSet_'+mchName+'\n\n'
    machine += 'OPERATIONS\n'
    for operation in sorted(inputs.keys()):
        for i in range(len(inputs[operation])):
            machine += 'verdict <-- TEST_'+str(i)+'_'+operationsNames[operation-1]+' =\n'
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
                implementation += '        SetVariablesForTest'+mchName+'('
                count = 0
                for var in controlList:
                    for j in range(len(varInput)):
                        if str(var) == str(varInput[j]):
                            implementation += str(varOutput[j])
                    count += 1
                    if len(controlList) != count:
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
                    implementation += '            aux'+str(j+1+max(range(len(outputsOrder[operation - 1])))+1)+' <-- OperationForTestGet'+controlList[j]+mchName+';\n'
                    countsaver = j+1
                else:
                    implementation += '            aux'+str(j+1)+' <-- OperationForTestGet'+controlList[j]+mchName+';\n'
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
                for k in range(len(outputVarName)):
                    if str(controlList[j]) == str(outputVarName[k]):
                        implementation += str(outputVarValue[k])
                if j != max(range(len(controlList))):
                    implementation += ' & '
            countsaver = startcount
            for j in range(len(seesMch)):
                if controlListSEES[j] != []:
                    implementation += ' & '
                for k in range(len(controlListSEES[j])):
                    implementation += 'aux'+str(countsaver+k+j+1)+' = '
                    for w in range(len(outputVarName)):
                        if str(controlListSEES[j][k]) == str(outputVarName[w]):
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

##        if re.search(r'\bIMPORTS\b', old) != None:
##            if re.search(r'\bSEES\b', old) != None:
##                if re.search(r'\bPROMOTES\b', old) != None:
##                    if promotesposition < seesposition:
##                        if promotesposition < importposition:
##                            if seesposition < importposition:
##                                promotedOperation = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
##                                if promotedOperations != "":
##                                    beforeOperations = (promotedOperations+', '+old[promotesposition+1:seesposition+1:]+'copy'
##                                                        +old[seesposition+1:importposition+1:]+'copy'+old[importposition+1:operationsposition+1]+'\n\n')
##                                else:
##                                    beforeOperations = (old[promotesposition+1:seesposition+1:]+'copy'+old[seesposition+1:importposition+1:]
##                                                        +'copy'+old[importposition+1:operationsposition+1]+'\n\n')
##                            else:
##                                promotedOperation = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
##                                aux = seesposition
##                                seesposition = importposition
##                                importposition = aux
##                                if promotedOperations != "":
##                                    beforeOperations = (promotedOperations+', '+old[promotesposition+1:seesposition+1:]+'copy'
##                                                        +old[seesposition+1:importposition+1:]+'copy'+old[importposition+1:operationsposition+1]+'\n\n')
##                                else:
##                                    beforeOperations = (old[promotesposition+1:seesposition+1:]+'copy'+old[seesposition+1:importposition+1:]
##                                                        +'copy'+old[importposition+1:operationsposition+1]+'\n\n')
##                            imp.write(old[:nameposition+1:]+'copy'+old[namesposition+1:refinesposition+1:]+'copy'+
##                                      old[refinesposition+1:promotesposition+1:]+beforeOperations+setOperation+getOperation+old[operationsposition+1::])
##                        else:
##                            if seesposition < importposition:
##                                promotedOperation = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
##                                if promotedOperations != "":
##                                    beforeOperations = old[
##                                else:
##                                    beforeOperations = (old[promotesposition+1:seesposition+1:]+'copy'+old[seesposition+1:importposition+1:]
##                                                        +'copy'+old[importposition+1:operationsposition+1]+'\n\n')
##                            else:
##                    else:
##                        if promotesposition < importposition:
##                            if seesposition < importposition:
##                            else:
##                        else:
##                            if seesposition < importposition:
##                            else:
##                else:
##                    if seesposition < importposition:
##                        beforeOperations = 'copy'+old[seesposition+1:importposition+1:]+'copy'+old[importposition+1:promotesposition]+'\n\n'
##                        aux = importposition
##                        importposition = seesposition
##                        seesposition = aux
##                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
##                        if promotedOperations != "":
##                            beforeOperations += 'PROMOTES\n '+promotedOperations+'\n\n'
##                    else:
##                        beforeOperations = 'copy'+old[importposition+1:promotesposition:]+'\n\n'
##                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch)
##                        if promotedOperations != "":
##                            beforeOperations += 'PROMOTES\n '+promotedOperations
##                        beforeOperations += old[promotesposition:seesposition+1]+'copy'
##                    imp.write(old[:nameposition+1:]+'copy'+old[nameposition+1:refinesposition+1:]+'copy'+
##                              old[refinesposition+1:importposition+1:]+beforeOperations+old[promotesposition+1:operationsposition+1:]+
##                              getOperation + setOperation + old[operationsposition+1::])
##            else:
##                imp.write(old[:nameposition+1:]+'copy'+old[nameposition+1:refinesposition+1:]+'copy'+
##                          old[refinesposition+1:importposition+1:]+'copy'+old[importposition+1:operationsposition+1:]+
##                          getOperation + setOperation + old[operationsposition+1::])
##        else:
##            if re.search(r'\bSEES\b', old) != None:
##                imp.write(old[:nameposition+1:]+'copy'+old[nameposition+1:refinesposition+1:]+'copy'+
##                          old[refinesposition+1:seesposition+1:]+'copy'+old[seesposition+1:operationsposition+1:]+
##                          getOperation + setOperation + old[operationsposition+1::])
##            else:
##                imp.write(old[:nameposition+1:]+'copy'+old[nameposition+1:refinesposition+1:]+'copy'+
##                          old[refinesposition+1:operationsposition+1:]+ getOperation + setOperation + old[operationsposition+1::])
