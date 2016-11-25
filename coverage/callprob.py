import sys
import os
import codecs
import subprocess
import string
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

def evaluate(stringexpression, message, entries): #Use this function to evaluate
    variables = list()
    positions = list()
    inputs = list()
    end = list()
    rcode, output, errors = executeSubWithReturn('"/Users/Diego Oliveira/Documents/ProB/probcli.exe"'+" -p MAXINT 50000 -p MININT -50000 -p SYMBOLIC TRUE -p EXPAND_FORALL_UPTO 0 -eval "+'"'+stringexpression+'"', message, True)

    if (rcode==0): #evaluate the return code
        if "TRUE/1" in str(output):
            stringoutput = str(output)
            stringoutput = stringoutput.replace("\\"," ")
            solutionposition = stringoutput.find("Solution:")
            stringoutput = stringoutput[solutionposition::]
            aux = list()
            lenvar = list()
            for entry in entries:
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
