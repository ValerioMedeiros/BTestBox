import sys
import os
import codecs
import subprocess
import string

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
    rcode, output, errors = executeSubWithReturn('"/Users/Diego Oliveira/Documents/ProB/probcli.exe"'+" -p MAXINT 2147483647 -p MININT -2147483648 -eval "+'"'+stringexpression+'"', message, True)  # Simple call (Exampe 4)

    if (rcode==0): #evaluate the return code
        if "TRUE/1" in str(output):
            stringoutput = str(output)
            stringoutput = stringoutput.replace("\\"," ")
            aux = list()
            count = 0
            for entry in entries:
                aux.append(" "+entry+" = ")
                inputs.append(aux[count])
                positions.append(stringoutput.find(aux[count]))
                count+=1
            positions.sort()
            count = 0
            for position in positions:
                j = position + len(aux[count])
                count += 1
                while(j < len(stringoutput)):
                    if(stringoutput[j] == " " or stringoutput[j] == '&'):
                        end.append(j)
                        break
                    j += 1
            for i in range(len(positions)):
                variables.append(str(output)[positions[i]:end[i]:])
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
