import os
import shutil
import re
import instgen


def createTest(inputs, output, impBXML, mchBXML, importedMch, seesMch, includedMch, operationsNames, directory,
               copy_directory, coverage, variablesList, variablesTypeList):
    mch = impBXML.getElementsByTagName('Abstraction')[0]
    controlList, controlListNames = makeCopyFile(impBXML.firstChild.getAttribute('name'), mch.firstChild.data, mchBXML,
                                                 impBXML, includedMch, directory, copy_directory, variablesList,
                                                 variablesTypeList)
    for machineBXML in importedMch:
        importedImpBXML = getImpWithImportedMch(machineBXML, directory)
        controlList, controlListNames = makeCopyFile(importedImpBXML.firstChild.getAttribute('name'),
                                                     machineBXML.firstChild.getAttribute('name'),
                                                     machineBXML, importedImpBXML, includedMch,
                                                     directory, copy_directory, variablesList,
                                                     variablesTypeList, controlList, controlListNames)
    controlListSEES = list()
    for machineBXML in seesMch:
        seesImpBXML = getImpWithImportedMch(machineBXML, directory)
        variablesSEES, variablesMchNamesSEES = makeCopyFile(seesImpBXML.firstChild.getAttribute('name'),
                                                            machineBXML.firstChild.getAttribute('name'),
                                                            machineBXML, seesImpBXML, includedMch,
                                                            directory, copy_directory, variablesList,
                                                            variablesTypeList, [], [])
        controlListSEES.append(variablesSEES)
    inputsOrder, outputsOrder = getOrder(impBXML, operationsNames)
    createTestFile(mch.firstChild.data, impBXML.firstChild.getAttribute('name'), impBXML, mchBXML, inputs, output,
                   seesMch, importedMch, operationsNames, directory, copy_directory, inputsOrder, outputsOrder,
                   controlList, controlListNames, controlListSEES, coverage, variablesList, variablesTypeList)
    createTestInB(mch.firstChild.data, impBXML.firstChild.getAttribute('name'), copy_directory, operationsNames, inputs, coverage)


def getImpWithImportedMch(importedMch, directory):
    # THIS FUNCTIONS IS REPEATED IN THE COVERAGE.PY AND THERE IS ONE VERY SIMILAR IN SOLVEROC.PY
    # THE ONE FOR THE SOLVEROC IS DIFFERENT BECAUSE NEED TO CHECK THE OPERATION
    for file in os.listdir(directory + os.sep +'bdp'):
        if file.endswith(".bxml"):
            bxmlfile = instgen.minidom.parse(directory + os.sep +'bdp' + os.sep + file)
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


def makeCopyFile(impNameFile, mchNameFile, mchBXML, impBXML, includedMch, directory,
                 copy_directory, variablesList, variablesTypeList, controlList=[], controlListNames=[]):
    if not os.path.isdir(copy_directory):
        os.mkdir(copy_directory)
    copiedImp = open(copy_directory + '/' + impNameFile + '.imp', 'w')
    copiedMch = open(copy_directory + '/' + mchNameFile + '.mch', 'w')
    print(str(directory + '/' + mchNameFile + '.mch'))
    print(str(copy_directory + '/' + mchNameFile + '.mch'))
    shutil.copyfile(str(directory + '/' + mchNameFile + '.mch'), str(copy_directory + '/' + mchNameFile + '.mch'))
    shutil.copyfile(str(directory + '/' + impNameFile + '.imp'), str(copy_directory + '/' + impNameFile + '.imp'))
    copiedImp.close()
    copiedMch.close()
    with open(copy_directory + '/' + mchNameFile + '.mch', 'r+') as mch:
        old = mch.read()
        mch.seek(0)
        variablesAndConstraints, typeOfVariablesAndConstraints, scapegoat = getVariablesAndConstraints(impBXML)
        mchVariablesAndConstraints, mchTypeOfVariablesAndConstraints, scapegoat = getVariablesAndConstraints(mchBXML)
        for i in range(len(mchVariablesAndConstraints)):
            if not mchVariablesAndConstraints[i] in variablesAndConstraints:
                variablesAndConstraints.append(mchVariablesAndConstraints[i])
                typeOfVariablesAndConstraints.append(mchTypeOfVariablesAndConstraints[i])
        getOperation, setOperation, controlList, controlListNames = createFunctions(variablesAndConstraints,
                                                                                    typeOfVariablesAndConstraints,
                                                                                    impBXML, mchBXML, 'mch', mchNameFile,
                                                                                    controlList, controlListNames,
                                                                                    variablesList, variablesTypeList)
        if getOperation != "":
            text = 'MACHINE\n    ' + mchBXML.firstChild.getAttribute('name')
            if mchBXML.getElementsByTagName('Parameters') != []:
                parametersnode = mchBXML.getElementsByTagName('Parameters')[0]
                text += instgen.transformBXML(parametersnode)
            text += '\n\n'
            for clauses in mchBXML.firstChild.childNodes:
                if clauses.nodeType != clauses.TEXT_NODE:
                    # print(clauses.tagName)
                    if clauses.tagName == 'Imports':
                        text += instgen.transformBXML(clauses)
                        if impBXML.getElementsByTagName('Promotes') == []:
                            promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch, directory)
                            if promotedOperations != "":
                                text += '\n\nPROMOTES\n'
                                text += '    ' + promotedOperations
                        text += '\n\n'
                    if clauses.tagName == 'Sees':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Promotes':
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch, directory)
                        text += instgen.transformBXML(clauses)
                        text += ', ' + promotedOperations + '\n\n'
                    if clauses.tagName == 'Concrete_Variables' or clauses.tagName == 'Abstract_Variables':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Concrete_Constants' or clauses.tagName == 'Abstract_Constants':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Abstraction':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Invariant':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Initialisation':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Sets':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Assertions':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Properties':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Constraints':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Values':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Includes':
                        text += instgen.transformBXML(clauses)
                        if impBXML.getElementsByTagName('Promotes') == []:
                            promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch, directory)
                            if promotedOperations != "":
                                text += '\n\nPROMOTES\n'
                                text += '    ' + promotedOperations
                        text += '\n\n'
                    if clauses.tagName == 'Operations':
                        text += 'OPERATIONS\n'
                        text += getOperation + setOperation
                        operationsposition = re.search(r'\bOPERATIONS\b', old).end()
                        if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                            tag = clauses.nextSibling.nextSibling.tagName.upper()
                            endoperations = re.search(r'\b%s\b' % tag, old).start()
                        else:
                            endoperations = len(old)
                        text += old[operationsposition + 1:endoperations:]
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
    with open(copy_directory + '/' + impNameFile + '.imp', 'r+') as imp:
        old = imp.read()
        imp.seek(0)
        variablesAndConstraints, typeOfVariablesAndConstraints, scapegoat = getVariablesAndConstraints(impBXML)
        mchVariablesAndConstraints, mchTypeOfVariablesAndConstraints, constraintsList = getVariablesAndConstraints(mchBXML)
        for i in range(len(mchVariablesAndConstraints)):
            if not mchVariablesAndConstraints[i] in variablesAndConstraints:
                variablesAndConstraints.append(mchVariablesAndConstraints[i])
                typeOfVariablesAndConstraints.append(mchTypeOfVariablesAndConstraints[i])
        getOperation, setOperation, controlList, controlListNames = createFunctions(variablesAndConstraints,
                                                                                    typeOfVariablesAndConstraints,
                                                                                    impBXML, mchBXML, 'imp', mchNameFile,
                                                                                    controlList, controlListNames,
                                                                                    variablesList, variablesTypeList)
        if getOperation != "":
            text = 'IMPLEMENTATION\n    ' + impBXML.firstChild.getAttribute('name')
            if impBXML.getElementsByTagName('Parameters') != []:
                parametersnode = impBXML.getElementsByTagName('Parameters')[0]
                text += instgen.transformBXML(parametersnode)
            text += '\n\n'
            createVariables = False
            if impBXML.getElementsByTagName("Concrete_Variables") == [] and constraintsList != []:
                createVariables = True
            for clauses in impBXML.firstChild.childNodes:
                if clauses.nodeType != clauses.TEXT_NODE:
                    if clauses.tagName == 'Imports':
                        text += instgen.transformBXML(clauses)
                        if impBXML.getElementsByTagName('Promotes') == []:
                            promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch, directory)
                            if promotedOperations != "":
                                text += '\n\nPROMOTES\n'
                                text += '    ' + promotedOperations
                        text += '\n\n'
                    if clauses.tagName == 'Sees':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Promotes':
                        promotedOperations = accessIncludedMchAndGetItDependents(mchBXML, includedMch, directory)
                        text += instgen.transformBXML(clauses)
                        text += ', ' + promotedOperations + '\n\n'
                    if clauses.tagName == 'Concrete_Variables' or clauses.tagName == 'Abstract_Variables':
                        text += instgen.transformBXML(clauses)
                        for constraint in constraintsList:
                            text += " & "+constraint
                        text += '\n\n'
                    if clauses.tagName == 'Concrete_Constants' or clauses.tagName == 'Abstract_Constants':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Abstraction':
                        text += instgen.transformBXML(clauses) + '\n\n'
                        if createVariables:
                            text += 'CONCRETE_VARIABLES\n    '
                            for j in range(len(constraintsList)):
                                for k in range(len(constraintsList[j])):
                                    if constraintsList[j][k] == ":":
                                        textToAdd = 'CONSTRAINTVAR_'+constraintsList[j][:k-1:]
                                text += textToAdd
                                if j != max(range(len(constraintsList))):
                                    text += ', '
                                    text += ' //Variable created to test\n'  # TODO: WRITE A BETTER COMMENT
                                else:
                                    text += ' //Variable created to test\n'
                            text += '\n\nINVARIANT\n    '
                            for j in range(len(constraintsList)):
                                text += 'CONSTRAINTVAR_'+constraintsList[j]
                                if j != max(range(len(constraintsList))):
                                    text += ' & '
                            text += '\n\n'
                    if clauses.tagName == 'Invariant':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Initialisation':
                        text += instgen.transformBXML(clauses)
                        for constraint in constraintsList:
                            for k in range(len(constraint)):
                                if constraint[k] == ":":
                                    textToAdd = constraint[:k-1:]
                            text += "; CONSTRAINTVAR_"+textToAdd+" := "+'0'  # TODO: GET THE RIGHT TYPE, ACTUALLY IS NAT
                        text += '\n\n'
                    if clauses.tagName == 'Values':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Sets':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Assertions':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Properties':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Constraints':
                        text += instgen.transformBXML(clauses) + '\n\n'
                    if clauses.tagName == 'Operations':
                        text += 'OPERATIONS\n'
                        text += getOperation + setOperation
                        operationsposition = re.search(r'\bOPERATIONS\b', old).end()
                        if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                            tag = clauses.nextSibling.nextSibling.tagName.upper()
                            endoperations = re.search(r'\b%s\b' % tag, old).start()
                        else:
                            endoperations = len(old)
                        text += old[operationsposition + 1:endoperations:]
                    if clauses.tagName == 'Local_Operations':
                        operationsposition = re.search(r'\bLOCAL_OPERATIONS\b', old).start()
                        if clauses.nextSibling.nextSibling.tagName != 'TypeInfos':
                            tag = clauses.nextSibling.nextSibling.tagName.upper()
                            endoperations = re.search(r'\b%s\b' % tag, old).start()
                        else:
                            endoperations = len(old)
                        text += old[operationsposition:endoperations:]
            if constraintsList != []:
                for constraint in constraintsList:
                    for j in range(len(constraint)):
                        if constraint[j] == ":":
                            constraintVar = constraint[:j-1:]
                    operationsposition = re.search(r'\bOPERATIONS\b', text).end()
                    text = text[:operationsposition:] +\
                           re.sub(r'\b%s\b' % constraintVar, "CONSTRAINTVAR_"+constraintVar, text[operationsposition::])
            imp.write(text)
        imp.close()
    return controlList, controlListNames


def accessIncludedMchAndGetItDependents(mchBXML, includedMch, directory):
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
                                        includedImp = getImpWithImportedMch(included, directory)
                                        var, vartype, scapegoat = getVariablesAndConstraints(includedImp)
                                        for i in range(len(var)):
                                            variablesOperation += 'OperationForTestGet' + var[
                                                i] + included.firstChild.getAttribute('name')
                                            if i != max(range(len(var))):
                                                variablesOperation += ', '
                                        if len(var) != 0:
                                            variablesOperation += ', SetVariablesForTest' + child.firstChild.data
    return variablesOperation


def getVariablesAndConstraints(BXML):
    variablesAndConstraints = list()
    constraintsTypeList = []
    typeOfVariablesAndConstraints = list()
    for childnode in BXML.firstChild.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            tag = childnode.tagName
            if tag == "Concrete_Variables":
                allId = childnode.getElementsByTagName('Id')
                for Id in allId:
                    variablesAndConstraints.append(Id.getAttribute('value'))
                    typref = Id.getAttribute('typref')
                    for childnodeTypeRef in BXML.firstChild.childNodes:
                        if childnodeTypeRef.nodeType != childnodeTypeRef.TEXT_NODE:
                            tag = childnodeTypeRef.tagName
                            if tag == 'TypeInfos':
                                for typeinfo in childnodeTypeRef.childNodes:
                                    if typeinfo.nodeType != typeinfo.TEXT_NODE:
                                        if typeinfo.getAttribute('id') == typref:
                                            if instgen.selfcaller(typeinfo.firstChild.nextSibling) == "INTEGER":
                                                typeOfVariablesAndConstraints.append("INT")
                                            elif instgen.selfcaller(typeinfo.firstChild.nextSibling) == "NATURAL":
                                                typeOfVariablesAndConstraints.append("NAT")
                                            else:
                                                typeOfVariablesAndConstraints.append(
                                                    instgen.selfcaller(typeinfo.firstChild.nextSibling))
            if tag == "Constraints":
                allExpComparison = childnode.getElementsByTagName('Exp_Comparison')
                for expComparison in allExpComparison:
                    if expComparison.firstChild.nextSibling.tagName == "Attr":
                        count = 3
                    else:
                        count = 1
                    variablesAndConstraints.append('CONSTRAINTVAR_'+
                                                   expComparison.childNodes.item(count).getAttribute('value'))
                    constraintsTypeList.append(instgen.selfcaller(expComparison))
                    typref = expComparison.childNodes.item(count).getAttribute('typref')
                    for childnodeTypeRef in BXML.firstChild.childNodes:
                        if childnodeTypeRef.nodeType != childnodeTypeRef.TEXT_NODE:
                            tag = childnodeTypeRef.tagName
                            if tag == 'TypeInfos':
                                for typeinfo in childnodeTypeRef.childNodes:
                                    if typeinfo.nodeType != typeinfo.TEXT_NODE:
                                        if typeinfo.getAttribute('id') == typref:
                                            typeOfVariablesAndConstraints.append(
                                                instgen.selfcaller(typeinfo.firstChild.nextSibling))
    return variablesAndConstraints, typeOfVariablesAndConstraints, constraintsTypeList


def createFunctions(var, typeOfVariablesAndConstraints, BXML, mchBXML, tipo, name, controlList, controlListNames,
                    variablesList, variablesTypeList):
    setOperation = ""
    getOperation = ""
    nonArrayVariables = list()
    arrayVariables = list()
    for i in range(len(var)):
        for j in range(len(variablesList[1])):
            if variablesList[1][j] == var[i]:
                if variablesTypeList[1][j][0] == 'Array':
                    arrayVariables.append(var[i])
                else:
                    nonArrayVariables.append(var[i])
    if tipo == 'mch' and var != []:
        for i in range(len(var)):
            for j in range(len(variablesList[1])):
                if variablesList[1][j] == var[i]:
                    if variablesTypeList[1][j][0] == 'Array':
                        tipos = variablesTypeList[1][j][2].getElementsByTagName('Id')
                        getOperation += '    Get' + var[i] + 'ForTest <-- OperationForTestGet' + var[i] + name + '(nn) = \n'
                        getOperation += '    PRE nn : '
                        getOperation += tipos[0].getAttribute('value')+'\n'
                        getOperation += '    THEN\n'
                        getOperation += '        ANY aux WHERE aux : '+tipos[1].getAttribute('value')+' THEN Get' + var[i] + 'ForTest := aux END\n'
                        getOperation += '    END;\n\n'
                    else:
                        getOperation += '    Get' + var[i] + 'ForTest <-- OperationForTestGet' + var[i] + name + ' = \n'
                        getOperation += '        ANY aux WHERE aux : ' + typeOfVariablesAndConstraints[i] + ' THEN Get'\
                                        + var[i] + 'ForTest := aux END;\n\n'
        if nonArrayVariables != []:
            setOperation += '    SetVariablesForTest' + name + '('
            for i in range(len(nonArrayVariables)):
                setOperation += 'nn' + str(i + 1)
                if i != max(range(len(nonArrayVariables))):
                    setOperation += ', '
            if setOperation[len(setOperation)-1] == ',':
                setOperation = setOperation[-1]
            setOperation += ') = \n'
            setOperation += '    PRE '
            for i in range(len(nonArrayVariables)):
                alreadyInControlList = False
                if name in controlListNames:
                   for position in range(len(controlListNames)):
                       if controlListNames[position] == name:
                           if controlList[position] == nonArrayVariables[i]:
                               alreadyInControlList = True
                if not alreadyInControlList:
                    controlList.append(nonArrayVariables[i])
                    controlListNames.append(name)
                itIsOkay = False
                for childnode in BXML.firstChild.childNodes:
                    if childnode.nodeType != childnode.TEXT_NODE:
                        if childnode.tagName == 'Invariant':
                            allExpComparison = childnode.getElementsByTagName('Exp_Comparison')
                            for expComparison in allExpComparison:
                                if expComparison.getAttribute('op') == ':':
                                    if expComparison.childNodes.item(3).getAttribute('value') == nonArrayVariables[i]:
                                        itIsOkay = True
                                        precondition = instgen.selfcaller(expComparison)
                                        setOperation += re.sub(r'\b%s\b' % nonArrayVariables[i], 'nn' + str(i + 1), precondition)
                            if not itIsOkay:
                                itIsOkay = True
                                for j in range(len(var)):
                                    if var[j] == nonArrayVariables[i]:
                                        setOperation += 'nn' + str(i + 1) + ' : ' + typeOfVariablesAndConstraints[j]
                if not itIsOkay:
                    for childnode in mchBXML.firstChild.childNodes:
                        if childnode.nodeType != childnode.TEXT_NODE:
                            if childnode.tagName == 'Invariant':
                                allExpComparison = childnode.getElementsByTagName('Exp_Comparison')
                                for expComparison in allExpComparison:
                                    if expComparison.getAttribute('op') == ':':
                                        if expComparison.firstChild.nextSibling.tagName == "Attr":
                                            count = 5
                                        else:
                                            count = 3
                                        if expComparison.childNodes.item(count).getAttribute('value') == nonArrayVariables[i]:
                                            itIsOkay = True
                                            precondition = instgen.selfcaller(expComparison)
                                            setOperation += re.sub(r'\b%s\b' % nonArrayVariables[i], 'nn' + str(i + 1), precondition)
                                if not itIsOkay:
                                    itIsOkay = True
                                    for j in range(len(var)):
                                        if var[j] == nonArrayVariables[i]:
                                            setOperation += 'nn' + str(i + 1) + ' : ' + typeOfVariablesAndConstraints[j]
                            if childnode.tagName == 'Constraints':
                                allExpComparison = childnode.getElementsByTagName('Exp_Comparison')
                                for expComparison in allExpComparison:
                                    if expComparison.getAttribute('op') == ':':
                                        if expComparison.firstChild.nextSibling.tagName == "Attr":
                                            count = 3
                                        else:
                                            count = 1
                                        if 'CONSTRAINTVAR_'+expComparison.childNodes.item(count).getAttribute('value') == nonArrayVariables[i]:
                                            itIsOkay = True
                                            precondition = instgen.selfcaller(expComparison)
                                            setOperation += re.sub(r'\b%s\b' % expComparison.childNodes.item(count).getAttribute('value'), 'nn' + str(i + 1), precondition)
                if i != max(range(len(nonArrayVariables))):
                    setOperation += ' & '
                else:
                    setOperation += '\n'
            setOperation += '    THEN\n'
            setOperation += '        skip\n'
            setOperation += '    END;\n\n'
        if arrayVariables != []:
            for i in range(len(arrayVariables)):
                for j in range(len(variablesList[1])):
                    if variablesList[1][j] == arrayVariables[i]:
                        tipos = variablesTypeList[1][j][2].getElementsByTagName('Id')
                setOperation += '    SetVariable_'+arrayVariables[i]+'_ForTest' + name + '(nn1, nn2) =\n'
                setOperation += '    PRE nn1 : '+tipos[0].getAttribute('value')+' & nn2 : ' \
                                                                                ''+tipos[1].getAttribute('value')+'\n'
                setOperation += '    THEN\n'
                setOperation += '        skip\n'
                setOperation += '    END;\n\n'
                alreadyInControlList = False
                if name in controlListNames:
                    for position in range(len(controlListNames)):
                        if controlListNames[position] == name:
                            if controlList[position] == arrayVariables[i]:
                                alreadyInControlList = True
                if not alreadyInControlList:
                    controlList.append(arrayVariables[i])
                    controlListNames.append(name)
    if tipo == 'imp' and var != []:
        if nonArrayVariables != []:
            for i in range(len(nonArrayVariables)):
                getOperation += '    Get' + nonArrayVariables[i] + 'ForTest <-- OperationForTestGet' + nonArrayVariables[i] + name + ' = \n'
                getOperation += '        Get' + nonArrayVariables[i] + 'ForTest := ' + nonArrayVariables[i] + ';\n\n'
            setOperation += '    SetVariablesForTest' + name + '('
            for i in range(len(nonArrayVariables)):
                setOperation += 'nn' + str(i + 1)
                if i != max(range(len(nonArrayVariables))):
                    setOperation += ', '
            setOperation += ') = \n'
            setOperation += '    BEGIN\n'
            for i in range(len(nonArrayVariables)):
                setOperation += '        ' + nonArrayVariables[i] + ' := nn' + str(i + 1)
                if i != max(range(len(nonArrayVariables))):
                    setOperation += ';'
                setOperation += '\n'
            setOperation += '    END;\n\n'
        if arrayVariables != []:
            for i in range(len(arrayVariables)):
                getOperation += '    Get' + arrayVariables[i] + 'ForTest <-- OperationForTestGet' + arrayVariables[i] + name + '(nn) = \n'
                getOperation += '        Get' + arrayVariables[i] + 'ForTest := ' + arrayVariables[i] + '(nn);\n\n'
            for i in range(len(arrayVariables)):
                setOperation += '    SetVariable_'+arrayVariables[i]+'_ForTest'+name+'(nn1, nn2) =\n'
                setOperation += '    BEGIN\n'
                setOperation += '        '+arrayVariables[i]+'(nn1) := nn2\n'
                setOperation += '    END;\n\n'
    return getOperation, setOperation, controlList, controlListNames


def createTestFile(mchName, impName, impBXML, mchBXML, inputs, outputs, seesMch, importedMch, operationsNames,
                   directory, copy_directory, inputsOrder, outputsOrder, controlList, controlListNames, controlListSEES,
                   coverage, variablesList, variablesTypeList):
    nonArrayVariables = list()
    arrayVariables = list()
    for i in range(len(controlList)):
        for j in range(len(variablesList[1])):
            if variablesList[1][j] == controlList[i]:
                if variablesTypeList[1][j][0] == 'Array':
                    arrayVariables.append(controlList[i])
                else:
                    nonArrayVariables.append(controlList[i])
    for i in range(len(controlListSEES)):
        for j in range(len(controlListSEES[i])):
            for k in range(len(variablesList[1])):
                if variablesList[1][k] == controlListSEES[i][j]:
                    if variablesTypeList[1][k][0] == 'Array':
                        arrayVariables.append(controlListSEES[i][j])
                    else:
                        nonArrayVariables.append(controlListSEES[i][j])
    machine = 'MACHINE\n    TestSet_' + coverage.upper() + "_" + mchName + '\n\n'
    machine += 'OPERATIONS\n'
    for operation in sorted(inputs.keys()):
        if len(inputs[operation]) == 0:
            machine += '    verdict <-- TEST_0_' + operationsNames[operation - 1] + ' =\n'
            machine += '        ANY kk WHERE kk : BOOL THEN verdict := kk END'
            if operation != max(sorted(inputs.keys())):
                machine += ';\n\n'
            else:
                machine += '\n'
        for i in range(len(inputs[operation])):
            machine += '    verdict <-- TEST_' + str(i) + '_' + operationsNames[operation - 1] + ' =\n'
            machine += '        ANY kk WHERE kk : BOOL THEN verdict := kk END'
            if i == max(range(len(inputs[operation]))):
                if operation != max(sorted(inputs.keys())):
                    machine += ';\n\n'
                else:
                    machine += '\n'
            else:
                    machine += ';\n\n'
    machine += 'END'
    implementation = 'IMPLEMENTATION\n    TestSet_' + coverage.upper() + "_" + impName +'\n\n'
    implementation += 'REFINES\n    TestSet_' + coverage.upper() + "_" + mchName + '\n\n'
    implementation += 'IMPORTS\n    ' + mchName
    if mchBXML.getElementsByTagName('Parameters') != []:
        implementation += '('
        parametersId = mchBXML.getElementsByTagName('Parameters')[0].getElementsByTagName('Id')
        for j in range(len(parametersId)):
            implementation += '0'  # TODO: HERE SHOULD LOOK THE TYPE OF THE PARAMETER
            if j != max(range(len(parametersId))):
                implementation += ', '
        implementation += ')'
    for mch in seesMch:
        implementation += ', '
        implementation += mch.firstChild.getAttribute('name')
    implementation += '\n\n'
    implementation += 'OPERATIONS\n'
    for operation in sorted(inputs.keys()):
        if len(inputs[operation]) == 0:
            i = 0
            implementation += '    verdict <-- TEST_0_' + operationsNames[operation - 1] + ' =\n'
            implementation += '    BEGIN\n'
            implementation += '        verdict := TRUE\n'
            implementation += '    END'
            if operation == max(inputs.keys()):
                implementation += '\n'
            else:
                implementation += ';\n\n'
        else:
            print(inputs)
            for i in range(len(inputs[operation])):
                implementation += '    verdict <-- TEST_' + str(i) + '_' + operationsNames[operation - 1] + ' =\n'
                implementation += '    BEGIN\n'
                varInput = []
                varOutput = []
                outputVarName = []
                outputVarValue = []
                for inputOption in inputs[operation][i]:
                    wordList = re.sub("[^\w]", " ", inputOption).split()
                    varInput.append(wordList[0])
                    varOutput.append(wordList[1])
                for outputOption in outputs[operation][i]:
                    variable = outputOption[:re.search(r"([a-zA-Z0-9\_]+) =", outputOption).end()-2:]
                    if variable in variablesList[1]:
                        for j in range(len(variablesList[1])):
                            if variablesList[1][j] == variable:
                                if variablesTypeList[1][j][0] == 'Array':
                                    matches = re.finditer(r"\|\-\>([a-zA-Z0-9\_]+)\)[\,\}]", outputOption)
                                    for matchNum, match in enumerate(matches):
                                        outputVarName.append(variable)
                                        outputVarValue.append(match.group(1))
                                else:
                                    wordListOut = re.sub("[^\w]", " ", outputOption).split()
                                    outputVarName.append(wordListOut[0])
                                    outputVarValue.append(wordListOut[1])
                countAuxQuantity = len(outputsOrder[operation - 1])
                if controlList != []:
                    # For the machine/implementation
                    variablesForTest = ""
                    for clause in mchBXML.firstChild.childNodes:
                        if clause.nodeType != clause.TEXT_NODE:
                            if clause.tagName == 'Variables' or clause.tagName == 'Concrete_Variables':
                                allVariables = clause.getElementsByTagName('Id')
                                count = 0
                                for variable in allVariables:
                                    alreadyWriteVariable = list()
                                    for j in range(len(variablesList[operation])):
                                        if variable.getAttribute('value') == str(variablesList[operation][j]):
                                            if variable.getAttribute('value') not in alreadyWriteVariable:
                                                for variablesInTheListPosition in range(len(varInput)):
                                                    if str(varInput[variablesInTheListPosition]) == str(
                                                            variablesList[operation][j]):
                                                        variablesForTest += varOutput[variablesInTheListPosition]
                                                alreadyWriteVariable.append(variable.getAttribute('value'))
                                                count += 1
                                                countAuxQuantity += 1
                                                if allVariables.length > count:
                                                    variablesForTest += ', '
                    for clause in impBXML.firstChild.childNodes:
                        if clause.nodeType != clause.TEXT_NODE:
                            if (clause.tagName == 'Variables' or clause.tagName == 'Concrete_Variables'
                                or clause.tagName == 'Parameters'):
                                variablesForTest = ""
                                allVariables = clause.getElementsByTagName('Id')
                                if nonArrayVariables != []:
                                    for variable in allVariables:
                                        alreadyWriteVariable = list()
                                        for j in range(len(variablesList[operation])):
                                            if variable.getAttribute('value') == str(variablesList[operation][j]):
                                                if variable.getAttribute('value') not in alreadyWriteVariable:
                                                    if variable.getAttribute('value') in nonArrayVariables:
                                                        if variablesForTest != "":
                                                            variablesForTest += ', '
                                                        for variablesInTheListPosition in range(len(varInput)):
                                                            if str(varInput[variablesInTheListPosition]) == str(variablesList[operation][j]):
                                                                variablesForTest += varOutput[variablesInTheListPosition]
                                                        alreadyWriteVariable.append(variable.getAttribute('value'))
                                                        countAuxQuantity += 1
                                    if variablesForTest != "":
                                        implementation += '        SetVariablesForTest' + mchName + '('
                                        implementation += variablesForTest
                                        implementation += ');\n'
                                if arrayVariables != []:
                                        for variable in allVariables:
                                            alreadyWriteVariable = list()
                                            for j in range(len(variablesList[operation])):
                                                if variable.getAttribute('value') == str(variablesList[operation][j]):
                                                    if variable.getAttribute('value') not in alreadyWriteVariable:
                                                        if variable.getAttribute('value') in arrayVariables:
                                                            addtocount, text = createArraySet(variable.getAttribute('value'),
                                                                                              inputs[operation][i], mchName)
                                                            if text != "":
                                                                countAuxQuantity += addtocount
                                                                implementation += text
                            if clause.tagName == 'Imports' or clause.tagName == 'Extends':
                                allImportedMachines = clause.getElementsByTagName('Name')
                                for importedmachine in importedMch:
                                    for machineimported in allImportedMachines:
                                        if importedmachine.firstChild.getAttribute(
                                                'name') == machineimported.firstChild.data:
                                            importedmachineimp = getImpWithImportedMch(importedmachine, directory)
                                            for importedmachineclauses in importedmachineimp.firstChild.childNodes:
                                                if importedmachineclauses.nodeType != importedmachineclauses.TEXT_NODE:
                                                    if importedmachineclauses.tagName == 'Variables' or importedmachineclauses.tagName == 'Concrete_Variables':
                                                        if nonArrayVariables != []:
                                                            variablesForTest = ""
                                                            allVariables = importedmachineclauses.getElementsByTagName('Id')
                                                            count = 0
                                                            for variable in allVariables:
                                                                alreadyWriteVariable = list()
                                                                for j in range(len(variablesList[operation])):
                                                                    if variable.getAttribute('value') == str(variablesList[operation][j]):
                                                                        count += 1
                                                                        if variable.getAttribute(
                                                                                'value') not in alreadyWriteVariable:
                                                                            if variable.getAttribute(
                                                                                    'value') in nonArrayVariables:
                                                                                for variablesInTheListPosition in range(
                                                                                        len(varInput)):
                                                                                    if str(varInput[
                                                                                               variablesInTheListPosition]) == str(
                                                                                            variablesList[operation][
                                                                                                j]):
                                                                                        variablesForTest += varOutput[
                                                                                            variablesInTheListPosition]
                                                                                alreadyWriteVariable.append(
                                                                                    variable.getAttribute('value'))
                                                                                countAuxQuantity += 1
                                                                                if allVariables.length > count:
                                                                                    variablesForTest += ', '
                                                            if variablesForTest != "":
                                                                implementation += '        SetVariablesForTest' + machineimported.firstChild.data + '('
                                                                implementation += variablesForTest
                                                                implementation += ');\n'
                                                        if arrayVariables != []:
                                                            allVariables = importedmachineclauses.getElementsByTagName(
                                                                'Id')
                                                            for variable in allVariables:
                                                                alreadyWriteVariable = list()
                                                                for j in range(len(varInput)):
                                                                    if variable.getAttribute('value') == str(
                                                                            varInput[j]):
                                                                        if variable.getAttribute(
                                                                                'value') not in alreadyWriteVariable:
                                                                            if variable.getAttribute(
                                                                                    'value') in arrayVariables:
                                                                                number, text = createArraySet(variable.getAttribute('value'), variablesList[operation][i], machineimported.firstChild.data)
                                                                                if text != "":
                                                                                    countAuxQuantity += number
                                                                                    implementation += text
                for j in range(len(seesMch)):
                    if controlListSEES[j] != []:
                        variablesForTest = ""
                        count = 0
                        for var in controlListSEES[j]:
                            if str(var) in nonArrayVariables:
                                for k in range(len(variablesList[operation])):
                                    if str(var) == str(variablesList[operation][k]):
                                        variablesForTest += str(outputVarValue[k])
                                count += 1
                                countAuxQuantity += 1
                                if len(controlListSEES[j]) != count:
                                    variablesForTest += ', '
                            if str(var) in arrayVariables:
                                for k in range(len(variablesList[operation])):
                                    if str(var) == str(variablesList[operation][k]):
                                        number, text = createArraySet(str(var), variablesList[operation][i], seesMch[j].firstChild.getAttribute('name'))
                                        if text != "":
                                            implementation += text
                                            countAuxQuantity += number
                        if variablesForTest != "":
                            implementation += '        SetVariablesForTest' + seesMch[j].firstChild.getAttribute('name')+'('
                            implementation += variablesForTest
                            implementation += ');\n'
                    for clause in seesMch[j].childNodes:
                        if clause.nodeType != clause.TEXT_NODE:
                            if clause.tagName == 'Includes' or clause.tagName == 'Extends' or clause.tagName == 'Imports':
                                allImportedMachines = clause.getElementsByTagName('Name')
                                for importedmachine in importedMch:
                                    for machineimported in allImportedMachines:
                                        if importedmachine.firstChild.getAttribute(
                                                'name') == machineimported.firstChild.data:
                                            importedmachineimp = getImpWithImportedMch(importedmachine, directory)
                                            for importedmachineclauses in importedmachineimp.firstChild.childNodes:
                                                if importedmachineclauses.nodeType != importedmachineclauses.TEXT_NODE:
                                                    if importedmachineclauses.tagName == 'Variables' or importedmachineclauses.tagName == 'Concrete_Variables':
                                                        if nonArrayVariables != []:
                                                            variablesForTest = ""
                                                            allVariables = importedmachineclauses.getElementsByTagName('Id')
                                                            count = 0
                                                            for variable in allVariables:
                                                                alreadyWriteVariable = list()
                                                                for j in range(len(varInput)):
                                                                    if variable.getAttribute('value') == str(varInput[j]):
                                                                        if variable.getAttribute(
                                                                                'value') not in alreadyWriteVariable:
                                                                            if variable.getAttribute('value') in nonArrayVariables:
                                                                                for variablesInTheListPosition in range(
                                                                                        len(varInput)):
                                                                                    if str(varInput[
                                                                                               variablesInTheListPosition]) == str(
                                                                                            variablesList[operation][
                                                                                                j]):
                                                                                        variablesForTest += varOutput[
                                                                                            variablesInTheListPosition]
                                                                                alreadyWriteVariable.append(
                                                                                    variable.getAttribute('value'))
                                                                                count += 1
                                                                                countAuxQuantity += 1
                                                                                if allVariables.length > count:
                                                                                    variablesForTest += ', '
                                                            if variablesForTest != "":
                                                                implementation += '        SetVariablesForTest' + machineimported.firstChild.data + '('
                                                                implementation += variablesForTest
                                                                implementation += ');\n'
                                                        if arrayVariables != []:
                                                            allVariables = importedmachineclauses.getElementsByTagName(
                                                                'Id')
                                                            text = ""
                                                            for variable in allVariables:
                                                                alreadyWriteVariable = list()
                                                                for j in range(len(varInput)):
                                                                    if variable.getAttribute('value') == str(
                                                                            varInput[j]):
                                                                        if variable.getAttribute(
                                                                                'value') not in alreadyWriteVariable:
                                                                            if variable.getAttribute(
                                                                                    'value') in nonArrayVariables:
                                                                                number, text = createArraySet(variable.getAttribute('value'), inputs[operation][i], machineimported.firstChild.data)
                                                                                if text != "":
                                                                                    implementation += text
                                                                                    countAuxQuantity += number
                implementation += '        VAR '
                for j in range(countAuxQuantity):
                    implementation += 'aux' + str(j + 1)
                    if j != max(range(countAuxQuantity)):
                        implementation += ', '
                implementation += ' IN\n'
                if outputsOrder[operation - 1] != []:  # Operations WITH output
                    implementation += '            '
                    for j in range(len(outputsOrder[operation - 1])):
                        implementation += 'aux' + str(j + 1)
                        if j != max(range(len(outputsOrder[operation - 1]))):
                            implementation += ', '
                    implementation += ' <-- ' + operationsNames[operation - 1]
                    if inputsOrder[operation - 1] != []:  # Operation WITH output and inputs
                        implementation += '('
                        for j in range(len(inputsOrder[operation - 1])):
                            for k in range(len(varInput)):
                                if str(inputsOrder[operation - 1][j]) == str(varInput[k]):
                                    implementation += str(varOutput[k])
                            if j != max(range(len(inputsOrder[operation - 1]))):
                                implementation += ', '
                        implementation += ')'
                    implementation += ';\n'
                else:  # Operation WITHOUT output
                    implementation += '            ' + operationsNames[operation - 1]
                    if inputsOrder[operation - 1] != []:  # Operations WITHOUT output and WITH inputs
                        implementation += '('
                        for j in range(len(inputsOrder[operation - 1])):
                            for k in range(len(varInput)):
                                if str(inputsOrder[operation - 1][j]) == str(varInput[k]):
                                    implementation += str(varOutput[k])
                            if j != max(range(len(inputsOrder[operation - 1]))):
                                implementation += ', '
                        implementation += ')'
                    implementation += ';\n'
                countsaver = 0
                for j in range(len(controlList)):  # Gets
                    if outputsOrder[operation - 1] != []:
                        if controlList[j] in nonArrayVariables:
                            implementation += '            aux' + str(
                                j + 1 + max(range(len(outputsOrder[operation - 1]))) + 1) + ' <-- OperationForTestGet' + \
                                              controlList[j] + controlListNames[j] + ';\n'
                            countsaver = j + 1
                        if controlList[j] in arrayVariables:
                            number, text = createArrayGet(controlList[j], inputs[operation][i], controlListNames[j],
                                                          (j + 1 + max(range(len(outputsOrder[operation - 1]))) + 1))
                            countsaver = number - (max(range(len(outputsOrder[operation - 1]))) + 1)
                            implementation += text
                    else:
                        if controlList[j] in nonArrayVariables:
                            implementation += '            aux' + str(j + 1) + ' <-- OperationForTestGet' + controlList[j] + \
                                              controlListNames[j] + ';\n'
                            countsaver = j + 1
                        if controlList[j] in arrayVariables:
                            number, text = createArrayGet(controlList[j], inputs[operation][i], controlListNames[j],
                                                          (j + 1))
                            countsaver = number
                            implementation += text
                startcount = countsaver
                for j in range(len(seesMch)):
                    seesName = seesMch[j].firstChild.getAttribute('name')
                    for k in range(len(controlListSEES[j])):
                        implementation += '            aux' + str(k + j + countsaver + 1) + ' <-- OperationForTestGet' + \
                                          controlListSEES[j][k] + seesName + ';\n'
                    countsaver = k + countsaver + 1 + j
                implementation += '            IF '  # Start of the IF
                if outputsOrder[operation - 1] != []:
                    for j in range(len(outputsOrder[operation - 1])):
                        implementation += 'aux' + str(j + 1) + ' = '
                        for k in range(len(outputVarName)):
                            if str(outputsOrder[operation - 1][j]) == str(outputVarName[k]):
                                implementation += str(outputVarValue[k])
                        if j != max(range(len(outputsOrder[operation - 1]))):
                            implementation += ' & '
                countArray = 0
                for j in range(len(controlList)):
                    for k in range(len(variablesList[1])):
                        if variablesList[1][k] == controlList[j]:
                            if variablesTypeList[1][k][0] == "Array":
                                arrayLength = outputVarName.count(str(controlList[j]).replace("CONSTRAINTVAR_", ""))
                                timesAdded = 0
                                for w in range(len(outputVarName)):
                                    if str(controlList[j]).replace("CONSTRAINTVAR_", "") == str(outputVarName[k]):
                                        if j == 0 and outputsOrder[operation - 1] != []:
                                            implementation += ' & '
                                        if outputsOrder[operation - 1] != []:
                                            implementation += 'aux' + str(
                                                j + 1 + max(range(len(outputsOrder[operation - 1]))) + 1 + countArray) + ' = '
                                        else:
                                            implementation += 'aux' + str(j + 1 + countArray) + ' = ' + str(outputVarValue[w])
                                        countArray += 1
                                        timesAdded += 1
                                        if timesAdded != arrayLength:
                                            implementation += ' & '
                            else:
                                if j == 0 and outputsOrder[operation - 1] != []:
                                    implementation += ' & '
                                if outputsOrder[operation - 1] != []:
                                    implementation += 'aux' + str(j + 1 + max(range(len(outputsOrder[operation - 1]))) + 1 + countArray) + ' = '
                                else:
                                    implementation += 'aux' + str(j + 1 + countArray) + ' = '
                                alreadyWriteVariables = []
                                for k in range(len(outputVarName)):
                                    if str(controlList[j]).replace("CONSTRAINTVAR_", "") == str(outputVarName[k]):
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
                        implementation += 'aux' + str(countsaver + k + j + 1 + countArray) + ' = '
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
    testimplementation = open(copy_directory + '/' + 'TestSet_' + coverage.upper() + "_" + impName + '.imp', 'w')
    testimplementation.write(implementation)
    testimplementation.close()
    testmachine = open(copy_directory + '/' + 'TestSet_' + coverage.upper() + "_" + mchName + '.mch', 'w')
    testmachine.write(machine)
    testmachine.close()


def checkTheLastCharacter(implementation, char):
    text = implementation
    if implementation[len(implementation)-1] == char:
        text = implementation[-1]
    return text


def createArrayGet(variableName, inputsOfTheTest, mchName, globalCount):
    text = ""
    count = globalCount
    for i in range(len(inputsOfTheTest)):
        inputVariable = re.search(r"([\S]+) =", inputsOfTheTest[i]).end()
        inputVariable = inputsOfTheTest[i][:inputVariable - 2:]
        if inputVariable == variableName:
            matches = re.finditer(r"([0-9a-zA-Z_.]+)\|\-\>([0-9a-zA-Z_.]+)", inputsOfTheTest[i])
            for matchNum, match in enumerate(matches):
                text += '            aux'+str(count)+' <-- OperationForTestGet'+variableName+mchName+'('+\
                        match.group(1)+');\n'
                count += 1
    return count, text

def createArraySet(variableName, inputsOfTheTest, mchName):
    text = ""
    count = 0
    for i in range(len(inputsOfTheTest)):
        inputVariable = re.search(r"([\S]+) =", inputsOfTheTest[i]).end()
        inputVariable = inputsOfTheTest[i][:inputVariable-2:]
        if inputVariable == variableName:
            matches = re.finditer(r"([0-9a-zA-Z_.]+)\|\-\>([0-9a-zA-Z_.]+)", inputsOfTheTest[i])
            for matchNum, match in enumerate(matches):
                text += '        SetVariable_'+variableName+'_ForTest'+mchName+'('\
                        +match.group(1)+','+match.group(2)+');\n'
                count += 1
    return count, text


def createTestInB(mchName, impName, copy_directory, operationsNames, inputs, coverage):
    machine = 'MACHINE\n    runTest_' + coverage.upper() + "_" + mchName + '\n\n'
    machine += 'OPERATIONS\n'
    machine += '    verdict <-- testAll =\n'
    machine += '        ANY kk WHERE kk : BOOL THEN verdict := kk END\n'
    machine += 'END'
    implementation = 'IMPLEMENTATION\n    runTest_' + coverage.upper() + "_" + impName + '\n\n'
    implementation += 'REFINES\n    runTest_' + coverage.upper() + "_" + mchName + '\n\n'
    implementation += 'IMPORTS\n    TestSet_' + coverage.upper() + "_" + mchName + '\n\n'
    implementation += 'LOCAL_OPERATIONS\n'
    for i in range(len(operationsNames)):
        implementation += '    verdict <-- test' + operationsNames[i] + ' =\n'
        implementation += '        ANY kk WHERE kk : BOOL THEN verdict := kk END'
        if i < len(operationsNames) - 1:
            implementation += ';\n\n'
    implementation += '\n\n'
    implementation += 'OPERATIONS\n'
    for i in range(len(operationsNames)):
        implementation += '    verdict <-- test' + operationsNames[i] + ' =\n'
        implementation += '    BEGIN\n'
        if len(inputs[i+1]) != 0:
            implementation += '        VAR '
            for j in range(len(inputs[i + 1])):
                implementation += 'v' + str(j)
                if j < len(inputs[i + 1]) - 1:
                    implementation += ', '
            implementation += ' IN\n'
            for j in range(len(inputs[i + 1])):
                implementation += '            v' + str(j) + ' <-- TEST_' + str(j) + '_' + operationsNames[i] + ';\n'
            implementation += '            IF '
            for j in range(len(inputs[i + 1])):
                implementation += 'v' + str(j) + ' = TRUE '
                if j < len(inputs[i + 1]) - 1:
                    implementation += '& '
            implementation += 'THEN\n'
            implementation += '                verdict := TRUE\n'
            implementation += '            ELSE\n'
            implementation += '                verdict := FALSE\n'
            implementation += '            END\n'
            implementation += '        END\n'
            implementation += '    END;\n\n'
        else:
            implementation += '        verdict <-- TEST_0_' + operationsNames[i] + '\n'
            implementation += '    END;\n\n'
    implementation += '    verdict <-- testAll =\n'
    implementation += '    BEGIN\n'
    implementation += '        VAR '
    for i in range(len(operationsNames)):
        implementation += 'v' + str(i)
        if i < len(operationsNames) - 1:
            implementation += ', '
    implementation += ' IN\n'
    for i in range(len(operationsNames)):
        implementation += '            v' + str(i) + ' <-- test' + operationsNames[i] + ';\n'
    implementation += '            IF '
    for i in range(len(operationsNames)):
        implementation += 'v' + str(i) + ' = TRUE '
        if i < len(operationsNames) - 1:
            implementation += '& '
    implementation += 'THEN\n'
    implementation += '                verdict := TRUE\n'
    implementation += '            ELSE\n'
    implementation += '                verdict := FALSE\n'
    implementation += '            END\n'
    implementation += '        END\n'
    implementation += '    END\n'
    implementation += 'END'
    testmachine = open(copy_directory + '/' + 'runTest_' + coverage.upper() + "_" + mchName + '.mch', 'w')
    testmachine.write(machine)
    testmachine.close()
    testimplementation = open(copy_directory + '/' + 'runTest_' + coverage.upper() + "_" + impName + '.imp', 'w')
    testimplementation.write(implementation)
    testimplementation.close()
