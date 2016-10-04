import sys
import os
import codecs
import subprocess
import argparser

def executeSub(cmd, n="", out=True):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, steder=subprocess.PIPE, shell = True)
    output, errors = p.communicate()
    if out:
        if p.returncode == 0:
            print("Prob executed sucessfully ("+n+")")
            print(output)

        else:
            print("Prob - error reported in "+n+" and the return code is "+str(p.returncode))
            print(output)
            print(errors)

    return p.returncode
