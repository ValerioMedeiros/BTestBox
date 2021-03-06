import os
import subprocess
import re
import time

def executeSubWithReturn(cmd, n="" , out=True):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    output, errors = p.communicate()
    if out:
        if p.returncode==0:
            print("ProB executed successfully ("+n+")")
            #print(output)

        else:
            print("ProB - error reported in "+n+" and the return code is "+str(p.returncode))
            #print(output)
            print(errors)

    return p.returncode, output, errors

def evaluate(stringexpression, message, entries, proBPath, copy_directory, maxint): #Use this function to evaluate
    variables = list()
    start_avaliacao = time.time()
    if len(stringexpression) > 1000:
        if not os.path.isdir(copy_directory):
            os.mkdir(copy_directory)
        predicateFile = open(copy_directory + '/predicateFile.eval', 'w')
        predicateFile.write(stringexpression)
        predicateFile.close()
        rcode, output, errors = executeSubWithReturn(proBPath + " -disable_timeout -p MAXINT " + str(maxint) + " -p MININT -" + str(maxint) + " -p SYMBOLIC TRUE -p "
                                                                "EXPAND_FORALL_UPTO 0 -eval_file " + '"' + copy_directory + os.sep + 'predicateFile.eval"',
                                                     message, True)
        os.remove(copy_directory + "/predicateFile.eval")
    else:
        rcode, output, errors = executeSubWithReturn(proBPath+" -p MAXINT " + str(maxint) + " -p MININT -" + str(maxint) + " -p SYMBOLIC TRUE -p "
                                                              "EXPAND_FORALL_UPTO 0 -eval "+'"'+stringexpression+'"',
                                                     message, True)
    endavaliacao = time.time() - start_avaliacao
    if (rcode==0): #evaluate the return code
        if "TRUE/1" in str(output):
            stringoutput = str(output)
            stringoutput = stringoutput.replace(os.sep," ")
            solutionposition = stringoutput.find("Solution:")
            stringoutput = stringoutput[solutionposition::]
            matches = re.finditer(r"([a-zA-Z0-9_.]+) = (\S+)(?: &| r)", stringoutput)
            for matchNum, match in enumerate(matches):
                for entry in entries:
                    if entry == match.group(1):
                        variables.append(match.group(1)+' = '+match.group(2))
            print(errors)
            return True, variables, endavaliacao
        elif "FALSE/1" in str(output):
            return False, [], endavaliacao
        else:
            return False, [], endavaliacao
    else:
        print("Error calling the ProB evaluating the follow expression:")
        print(stringexpression)
        print(errors)
        return 0, [], endavaliacao
