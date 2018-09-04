import os
import subprocess

directory = 'C:/Users/Diego Oliveira/Documents/projects/departs'
for file in os.listdir(directory):
    if file.endswith(".mch") or file.endswith(".imp"):
        args = []
        args.append('C:/Program Files (x86)/atelierb/bbin/win32/bxml.exe')
        args.append("-i")
        args.append("4")
        args.append("-O")
        args.append(directory+'/bpd')
        args.append(directory+'/'+file)
        print(args)
        p = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
        output, errors = p.communicate()
        if p.returncode == 0:
            print("Generated BXML")
            # print(output)
        else:
            print("Error number " + str(p.returncode))
            # print(output)
            print(errors)
