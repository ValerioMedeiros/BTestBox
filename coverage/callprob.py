import os
import subprocess
import re

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

def evaluate(stringexpression, message, entries, proBPath, copy_directory): #Use this function to evaluate
    variables = list()
    positions = list()
    end = list()
    if len(stringexpression) > 10:
        if not os.path.isdir(copy_directory):
            os.mkdir(copy_directory)
        predicateFile = open(copy_directory + '/predicateFile.eval', 'w')
        predicateFile.write(stringexpression)
        predicateFile.close()
        rcode, output, errors = executeSubWithReturn(proBPath + " -p MAXINT 50000 -p MININT -50000 -p SYMBOLIC TRUE -p "
                                                                "EXPAND_FORALL_UPTO 0 -eval_file " + '"' + copy_directory + '/predicateFile.eval"',
                                                     message, True)
        os.remove(copy_directory + "/predicateFile.eval")
    else:
        rcode, output, errors = executeSubWithReturn(proBPath+" -p MAXINT 50000 -p MININT -50000 -p SYMBOLIC TRUE -p "
                                                              "EXPAND_FORALL_UPTO 0 -eval "+'"'+stringexpression+'"',
                                                     message, True)
    if (rcode==0): #evaluate the return code
        if "TRUE/1" in str(output):
            stringoutput = str(output)
            stringoutput = stringoutput.replace("\\"," ")
            solutionposition = stringoutput.find("Solution:")
            stringoutput = stringoutput[solutionposition::]
            lenvar = list()
            print(stringexpression)
            for entry in entries:
                print(entry)
                aux = (entry+" = ")
                positions.append(re.search(r'\b%s\b' % aux, stringoutput).start())
                lenvar.append(len(aux))
            for i in range(len(positions)):
                endstring = positions[i] + lenvar[i]
                while(endstring < len(stringoutput)):
                    if(stringoutput[endstring] == " " or stringoutput[endstring] == '&'):
                        end.append(endstring)
                        break
                    endstring += 1
            for i in range(len(positions)):
                variables.append(stringoutput[positions[i]:end[i]:])
            print(errors)
            return True, variables
        elif "FALSE/1" in str(output):
            return False, []
        else:
            return False, []
    else:
        print("Error calling the ProB evaluating the follow expression:")
        print(stringexpression)
        print(errors)
        return 0, []
