import createBTestSet


def createHTML(directory, coverage, nonCovered, copy_directory, impName, mchName, operationNames, entries, outs,
               coveredPercentage, importedMch):
    HTMLText(coverage, nonCovered, copy_directory, impName, operationNames, entries, outs)
    HTMLlib(directory, mchName, impName, copy_directory, importedMch, coverage)
    genHTMLDoc(impName, coverage, copy_directory, operationNames, nonCovered, coveredPercentage)


def genHTMLDoc(impName, coverage, copy_directory, operationNames, nonCovered, coveredPercentage):
    HTMLDoc = open(copy_directory + '\\report_' + coverage.upper() + '_' + impName + '.html', 'w')
    text = '<!DOCTYPE html>\n'
    text += '<html>\n'
    text += '<head>\n'
    text += '<title>Test Summary for ' + coverage + ' coverage</title>\n'
    text += '</head>\n'
    text += '<body>\n'
    text += '<table>\n'
    text += '<tr>\n'
    text += '<th>Testing '+coverage+' coverage for operations in the implementation '+impName+'</th>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td>\n'
    text += '<table border="1" width="100%">\n'
    text += '<tr>\n'
    text += '<th>Tested Operations</th>\n'
    text += '<th>Test Results</th>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td>\n'
    text += '<table width="100%">\n'
    for i in range(len(operationNames)):
        if i + 1 in nonCovered:
            text += '<tr bgcolor="#ff3333">\n'
        else:
            text += '<tr bgcolor="#00FF00">\n'
        text += '<td><b><center><a href="file:///'+copy_directory.replace(" ", "%20")+'\\'+impName+'.imp">'+operationNames[i]+'</a></center></b></td>\n'
        text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '<td>\n'
    text += '<table width="100%">\n'
    for i in range(len(operationNames)):
        if i + 1 in nonCovered:
            text += '<tr bgcolor="#ff3333">\n'
        else:
            text += '<tr bgcolor="#00FF00">\n'
        text += '<td><b><center><a href="file:///' + copy_directory.replace(" ",
                                                                            "%20") + '\\reportText_' + coverage + '_' + impName + '.html">' + \
                str(round(coveredPercentage[i], 2)) + '%</a></center></b></td>\n'
        text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td><center><a href="file:///'+copy_directory.replace(" ", "%20")+'\\'+ coverage.upper() + '_' +impName+'FilesLib.html">If you ' \
                                                                                            'are looking for the ' \
                                                                                            'files library, ' \
                                                                                            'click ' \
                                                                                            'here!</a></center></td>'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</body>\n'
    text += '</html>\n'
    HTMLDoc.write(text)
    HTMLDoc.close()


def HTMLlib(directory, mchName, impName, copy_directory, importedMch, coverage):
    HTMLDoc = open(copy_directory + '\\'+ coverage.upper() + '_' +impName + 'FilesLib.html', 'w')
    text = '<!DOCTYPE html>\n'
    text += '<html>\n'
    text += '<head>\n'
    text += '<title>Test Summary for ' + coverage + ' coverage</title>\n'
    text += '</head>\n'
    text += '<body>\n'
    text += '<table border="1">\n'
    text += '<tr>\n'
    text += '<th>Original Files*</th>\n'
    text += '<th>Test Files**</th>\n'
    text += '<th>Translated Test Files***</th>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td>\n'
    text += '<table>\n'
    text += addPrincipalFiles(directory, mchName, impName, "original")
    text += addImportedFiles(directory, importedMch, directory, "original")
    text += '</table>\n'
    text += '</td>\n'
    text += '<td>\n'
    text += '<table>\n'
    text += addPrincipalFiles(copy_directory, mchName, impName, "test")
    text += addImportedFiles(copy_directory, importedMch, directory, "test")
    text += addPrincipalFiles(copy_directory, mchName, impName, "test", "TestSet_"+coverage.upper()+"_")
    text += addPrincipalFiles(copy_directory, mchName, impName, "test", "runTest_"+coverage.upper()+"_")
    text += '</table>\n'
    text += '</td>\n'
    text += '<td>\n'
    text += '<table>\n'
    text += addPrincipalFiles(copy_directory+'\\lang\\c', mchName, impName, "translated")
    text += addImportedFiles(copy_directory+'\\lang\\c', importedMch, directory, "translated")
    text += addPrincipalFiles(copy_directory + '\\lang\\c', mchName, impName, "translated", "TestSet_"+coverage.upper()+"_")
    text += addPrincipalFiles(copy_directory + '\\lang\\c', mchName, impName, "translated", "runTest_"+coverage.upper()+"_")
    text += '<tr>\n'
    text += '<td><a href="file:///' + copy_directory.replace(" ",
                                                             "%20") + '\\lang\\c\\main_runTest.c">main.c</a></td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '<p>*Your original files.<br>'
    text += '**The test files in language B. (Gets and Sets operations are added)<br>'
    text += '***The test files generated by the target translator.</p>'
    text += '</body>\n'
    text += '</html>\n'
    HTMLDoc.write(text)
    HTMLDoc.close()


def addImportedFiles(directory, importedMch, impDir, fileOption):
    text = ""
    if fileOption == "translated":
        mchEnd = '.h'
        impEnd = '.c'
    elif fileOption == "test" or fileOption == "original":
        mchEnd = '.mch'
        impEnd = '.imp'
    for mch in importedMch:
        importedMchName = mch.firstChild.getAttribute('name')
        text += '<tr>\n'
        text += '<td><a href="file:///'+directory.replace(" ", "%20")+'\\'+importedMchName+mchEnd+'">'+importedMchName+mchEnd+'</a></td>\n'
        text += '</tr>\n'
        impBXML = createBTestSet.getImpWithImportedMch(mch, impDir)
        importedImpName = impBXML.firstChild.getAttribute('name')
        text += '<tr>\n'
        text += '<td><a href="file:///' + directory.replace(" ",
                                                            "%20") + '\\' + importedImpName +impEnd+ '">' + importedImpName+impEnd + '</a></td>\n'
        text += '</tr>\n'
    return text


def addPrincipalFiles(directory, mchName, impName, fileOption, extraName = ""):
    if fileOption == "translated":
        mchEnd = '.h'
        impEnd = '.c'
    elif fileOption == "test" or fileOption == "original":
        mchEnd = '.mch'
        impEnd = '.imp'
    text = '<tr>\n'
    text += '<td><a href="file:///'+directory.replace(" ",
                                                      "%20")+'\\'+extraName+mchName+mchEnd+'">'+extraName+mchName+mchEnd+'</a></td>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td><a href="file:///'+directory.replace(" ",
                                                      "%20")+'\\'+extraName+impName+impEnd+'">'+extraName+impName+impEnd+'</a></td>\n'
    text += '</tr>\n'
    return text


def HTMLText(coverage, nonCovered, copy_directory, impName, operationNames, entries, outs):
    if len(nonCovered.keys()) == 0:
        report = open(copy_directory + '\\reportText_' + coverage.upper() + '_' + impName + '.html', 'w')
        text = '<!DOCTYPE html>\n'
        text += '<html>\n'
        text += '<head>\n'
        text += '<title>Test Summary for ' + coverage.upper() + ' coverage</title>\n'
        text += '</head>\n'
        text += '<body>\n'
        text = '<p style="color:green">Test Completed!!!!</p>\n'
        text += '<p style="color:green">The implementation ' + impName + ' achieved ' + coverage + ' coverage!!!</p>\n\n'
        for key in entries.keys():
            text += '<p>'
            text += '-' * 240
            text += '</p>'
            NumberOfTests = 1
            text += '<p style="color:green">Tests for the Operation ' + operationNames[int(key) - 1] + '<br>\n\n'
            for i in range(len(entries[key])):
                text += 'Test ' + str(NumberOfTests) + ':<br>\n'
                text += 'Input(s): ' + entries[key][i] + '<br>\n'
                text += 'Output(s): ' + outs[key][i] + '<br>\n\n'
                NumberOfTests += 1
                text += '<br>'
            text += '</p>'
        text += '</body>\n'
        text += '</html>\n'
        report.write(text)
        report.close()
    else:
        report = open(copy_directory + '\\reportText_' + coverage.upper() + '_' + impName + '.html', 'w')
        text = '<!DOCTYPE html>\n'
        text += '<html>\n'
        text += '<head>\n'
        text += '<title>Test Summary for ' + coverage + ' coverage</title>\n'
        text += '</head>\n'
        text += '<body>\n'
        text += '<p style="color:red">Test Failed!!</p>\n'
        for key in entries.keys():
            text += '<p>'
            text += '-' * 240
            text += '</p>'
            if key in nonCovered:
                textColor = 'style="color:red"'
            else:
                textColor = 'style="color:green"'
            NumberOfTests = 1
            text += '<p ' + textColor + '>Tests for the Operation ' + operationNames[int(key) - 1] + '</p>\n\n'
            for i in range(len(entries[key])):
                text += '<p ' + textColor + '>Test ' + str(NumberOfTests) + ':<br>\n'
                text += 'Input(s): ' + entries[key][i] + '<br>\n'
                text += 'Output(s): ' + outs[key][i] + '</p>\n\n'
                NumberOfTests += 1
            if key in nonCovered:
                text += '<p ' + textColor + '>The operation ' + operationNames[
                    int(key) - 1] + ' did not reach ' + coverage + ' coverage</p>\n'
                if coverage == 'branch':
                    text += '<p ' + textColor + '>It cannot pass through the branch(es):<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += 'from instruction ' + nonCovered[key][i][0] + ' to the instruction ' + \
                                nonCovered[key][i][1] + '<br>\n'
                    text += '</p>\n'
                elif coverage == 'clause':
                    text += '<p ' + textColor + '>It not fulfill clause coverage for the predicate(s):<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += nonCovered[key][i] + '<br>\n'
                    text += '</p>\n'
                elif coverage == "path":
                    text += '<p ' + textColor + '>Is impossible to pass through the path(s):<br>\n<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += str(i+1)+'° path impossible to cover:<br>\n'
                        for j in range(len(nonCovered[key][i][1])):
                            text += nonCovered[key][i][1][j]+'<br>\n'
                        if i < max(range(len(nonCovered[key]))):
                            text += '<br>\n'
                    text += '</p>\n'
        text += '</body>\n'
        text += '</html>\n'
        report.write(text)
        report.close()