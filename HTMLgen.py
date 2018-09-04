import createBTestSet
import os
import time

def createHTML(directory, coverage, nonCovered, copy_directory, impName, mchName, operationNames, entries, outs,
               coveredPercentage, importedMch, seesMch, times, tempoTotal):
    start_time = time.time()
    HTMLText(coverage, nonCovered, copy_directory, impName, operationNames, entries, outs)
    HTMLlib(directory, mchName, impName, copy_directory, importedMch, seesMch, coverage)
    genHTMLDoc(impName, coverage, directory, copy_directory, operationNames, nonCovered, coveredPercentage)
    times[0].append(time.time() - start_time)
    tempoTotal =  time.time() - tempoTotal
    createTimeFile(times, copy_directory, coverage, impName, operationNames, tempoTotal)

def createTimeFile(times, copy_directory, coverage, impName, operationNames, tempo_total):
    total_avaliacao = 0
    txtDoc = open(copy_directory + os.sep + 'times_' + coverage.upper() + '_' + impName + '.txt', 'w')
    text = 'Tempos de seções do BTestBox para a implementação ' + impName + '\n\n'
    text += 'O tempo total para a execução do BTestBox para a implementação ' + impName + ' foi de ' + str(tempo_total) +  ' segundos \n\n'
    for i in range(len(operationNames)):
        text += 'Tempos para a operação ' + operationNames[i] + ' segundos\n'
        text += 'Tempo de criação do grafo : ' + str(times[i + 1][0]) + ' segundos\n'
        text += 'Tempo de criação dos guias : ' + str(times[i + 1][1]) + ' segundos\n'
        text += 'Tempo de geração dos predicados : ' + str(times[i + 1][2]) + ' segundos\n'
        text += 'Tempo de avaliação dos predicados : ' + str(times[i + 1][3]) + ' segundos\n\n'
        total_avaliacao += times[i + 1][3]

    text += 'Tempo para a geração dos arquivos de teste : ' + str(times[0][0]) + ' segundos\n'
    text += 'Tempo para a compilação e execução : ' + str(times[0][1]) + ' segundos\n'
    text += 'Tempo para a geração do reporte : ' + str(times[0][2]) + ' segundos\n'
    text += 'A etapa de avaliação dos predicados foi responsável por ' + str(total_avaliacao/tempo_total*100) + '% do tempo da execução do BTestBox para essa implementação'
    txtDoc.write(text)
    txtDoc.close()

def createHTMLnoOperations(coverage, copy_directory, impName):
    HTMLDoc = open(copy_directory + os.sep + 'report_' + coverage.upper() + '_' + impName + '.html', 'w')
    text = '<!DOCTYPE html>\n'
    text += '<html>\n'
    text += '<head>\n'
    text += '<title>Test Summary for ' + coverage + ' coverage</title>\n'
    text += '</head>\n'
    text += '<body>\n'
    text += '<table>\n'
    text += '<tr>\n'
    text += '<th>Testing ' + coverage + ' coverage for operations in the implementation ' + impName + '</th>\n'
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
    text += '<tr bgcolor="#ffff00">\n'
    text += '<td><b><center>No operation to test</center></b></td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '<td>\n'
    text += '<table width="100%">\n'
    text += '<tr bgcolor="#ffff00">\n'
    text += '<td><b><center>-</center></b></td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td><center>No library for this test!</center></td>'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</body>\n'
    text += '</html>\n'
    HTMLDoc.write(text)
    HTMLDoc.close()


def genHTMLDoc(impName, coverage, directory, copy_directory, operationNames, nonCovered, coveredPercentage):
    HTMLDoc = open(copy_directory + os.sep + 'report_' + coverage.upper() + '_' + impName + '.html', 'w')
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
        text += '<td><b><center><a href="file:///'+directory.replace(" ", "%20")+os.sep+impName+'.imp">'+operationNames[i]+'</a></center></b></td>\n'
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
                                                                            "%20") + os.sep + 'reportText_' + coverage + '_' + impName + '.html">' + \
                str(round(coveredPercentage[i], 2)) + '%</a></center></b></td>\n'
        text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td><center><a href="file:///'+copy_directory.replace(" ", "%20")+os.sep+ coverage.upper() + '_' +impName+'FilesLib.html">If you ' \
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


def HTMLlib(directory, mchName, impName, copy_directory, importedMch, seesMch, coverage):
    HTMLDoc = open(copy_directory + os.sep+ coverage.upper() + '_' +impName + 'FilesLib.html', 'w')
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
    text += addImportedFiles(directory, seesMch, directory, "original")
    text += '</table>\n'
    text += '</td>\n'
    text += '<td>\n'
    text += '<table>\n'
    text += addPrincipalFiles(copy_directory, mchName, impName, "test")
    text += addImportedFiles(copy_directory, importedMch, directory, "test")
    text += addImportedFiles(copy_directory, seesMch, directory, "test")
    text += addPrincipalFiles(copy_directory, mchName, impName, "test", "TestSet_"+coverage.upper()+"_")
    text += addPrincipalFiles(copy_directory, mchName, impName, "test", "runTest_"+coverage.upper()+"_")
    text += '</table>\n'
    text += '</td>\n'
    text += '<td>\n'
    text += '<table>\n'
    text += addPrincipalFiles(copy_directory+ os.sep +'lang' + os.sep+ 'c', mchName, impName, "translated")
    text += addImportedFiles(copy_directory+ os.sep +'lang' + os.sep+ 'c', importedMch, directory, "translated")
    text += addImportedFiles(copy_directory+ os.sep +'lang' + os.sep+ 'c', seesMch, directory, "translated")
    text += addPrincipalFiles(copy_directory +  os.sep +'lang' + os.sep+ 'c', mchName, impName, "translated", "TestSet_"+coverage.upper()+"_")
    text += addPrincipalFiles(copy_directory +  os.sep +'lang' + os.sep+ 'c', mchName, impName, "translated", "runTest_"+coverage.upper()+"_")
    text += '<tr>\n'
    text += '<td><a href="file:///' + copy_directory.replace(" ",
                                                             "%20") +  os.sep +'lang' + os.sep+ 'c'+ os.sep + 'main_runTest_'+\
            coverage.upper()+'_'+impName+'.c">main.c</a></td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '</td>\n'
    text += '</tr>\n'
    text += '</table>\n'
    text += '<p>*Your original files.<br>'
    text += '**The test files in language B. (Get and Set operations are added)<br>'
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
        text += '<td><a href="file:///'+directory.replace(" ", "%20")+os.sep+importedMchName+mchEnd+'">'+importedMchName+mchEnd+'</a></td>\n'
        text += '</tr>\n'
        impBXML = createBTestSet.getImpWithImportedMch(mch, impDir)
        importedImpName = impBXML.firstChild.getAttribute('name')
        text += '<tr>\n'
        text += '<td><a href="file:///' + directory.replace(" ",
                                                            "%20") + os.sep + importedImpName +impEnd+ '">' + importedImpName+impEnd + '</a></td>\n'
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
                                                      "%20")+os.sep+extraName+mchName+mchEnd+'">'+extraName+mchName+mchEnd+'</a></td>\n'
    text += '</tr>\n'
    text += '<tr>\n'
    text += '<td><a href="file:///'+directory.replace(" ",
                                                      "%20")+os.sep+extraName+impName+impEnd+'">'+extraName+impName+impEnd+'</a></td>\n'
    text += '</tr>\n'
    return text


def HTMLText(coverage, nonCovered, copy_directory, impName, operationNames, entries, outs):
    if len(nonCovered.keys()) == 0:
        report = open(copy_directory + os.sep + 'reportText_' + coverage.upper() + '_' + impName + '.html', 'w')
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
                text += 'Input(s): '
                for j in range(len(entries[key][i])):
                    text += entries[key][i][j] + ' '
                text += '<br>\n'
                text += 'Output(s): '
                for j in range(len(outs[key][i])):
                    text += outs[key][i][j] + ' '
                text += '<br>\n'
                NumberOfTests += 1
                text += '<br>'
            text += '</p>'
        text += '</body>\n'
        text += '</html>\n'
        report.write(text)
        report.close()
    else:
        report = open(copy_directory + os.sep + 'reportText_' + coverage.upper() + '_' + impName + '.html', 'w')
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
                text += 'Input(s): '
                for j in range(len(entries[key][i])):
                    text += entries[key][i][j] + ' '
                text += '<br>\n'
                text += 'Output(s): '
                for j in range(len(outs[key][i])):
                    text += outs[key][i][j] + ' '
                text += '<br>\n'
                NumberOfTests += 1
            if key in nonCovered:
                text += '<p ' + textColor + '>The operation ' + operationNames[
                    int(key) - 1] + ' did not reach ' + coverage + ' coverage</p>\n'
                if coverage == 'Branch':
                    text += '<p ' + textColor + '>It cannot pass through the branch(es):<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += 'from instruction ' + nonCovered[key][i][0] + ' to the instruction ' + \
                                nonCovered[key][i][1] + '<br>\n'
                    text += '</p>\n'
                elif coverage == 'Clause':
                    text += '<p ' + textColor + '>It not fulfill clause coverage for the predicate(s):<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += nonCovered[key][i] + '<br>\n'
                    text += '</p>\n'
                elif coverage == "Path":
                    text += '<p ' + textColor + '>Is impossible to pass through the path(s):<br>\n<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += str(i+1)+'° path impossible to cover:<br>\n'
                        for j in range(len(nonCovered[key][i][1])):
                            text += nonCovered[key][i][1][j]+'<br>\n'
                        if i < max(range(len(nonCovered[key]))):
                            text += '<br>\n'
                    text += '</p>\n'
                elif coverage == "Statement":
                    text += '<p ' + textColor + '>It is impossible to achieve the code:<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += nonCovered[key][i] + '<br>\n'
                    text += '</p>\n'
                elif coverage == 'Combinatorial':
                    text += '<p ' + textColor + '>It does not fulfill combinatorial for the predicate(s):<br>\n'
                    for i in range(len(nonCovered[key])):
                        text += nonCovered[key][i] + '<br>\n'
                    text += '</p>\n'
        text += '</body>\n'
        text += '</html>\n'
        report.write(text)
        report.close()