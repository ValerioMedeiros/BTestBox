#!/usr/bin/python2.7
import os
import sys
import getpass
import urllib

etool = '''<externalTool category="component"   name="BTest" label="&amp;BTest"   shortcut="Ctrl+J"  >
<toolParameter name="editor" type="tool" configure="yes"
default="'''+sys.executable+'''"/>
    <command>${editor}</command>
    <param>CurrentPath.py</param>
    '''

def installExtension(path,probcli_path):
    global etool
    etoolend = '''
    <param>${projectBdp}</param>
	<param>${extensionsDir}</param>
	<param>${componentName}</param>
</externalTool>'''

    res= etool + '<param>'+probcli_path+'</param>'
    #res= res + '    <param>-m</param>    <param>all</param>'
    res = res.replace("CurrentPath.py", os.path.realpath(__file__).replace("configAtelierB","graphic")) + etoolend
    f = open(path+os.sep+'btestbox.etool','w')
    f.write(res)
    f.close()
    
    path_libs = os.path.realpath(__file__).replace("configAtelierB.py","libs")
    if not os.path.exists(path_libs):
        os.makedirs(path_libs)
    print("Downloading the CuTest.h (MIT License)")
    urllib.urlretrieve("https://raw.githubusercontent.com/mity/cutest/master/include/cutest.h", filename=path_libs+os.sep+"cutest.h")
    print("BTestKit was installed")

def question(msg,opt,optconc):
    global etool
    ans = raw_input(msg)
    valid=False
    for i in range(len(opt)):
        if ans in opt[i]:
            etool= etool + optconc[i]
            valid=True
            break
    if not(valid):
        etool= etool + optconc[0]
        print("Invalid option and the used option was:"+opt[0])




try:
    path = raw_input("Please, type the path of Atelier B extensions, (for example  '/Applications/AtelierB.app/AB/extensions'):")
    path_prob = raw_input("Please, type the path of ProB, (for example  '/Users/"+getpass.getuser()+"/Applications/ProB/probcli.sh'):")
    installExtension(path,path_prob)
    exit()
except NameError:
    path = input("Please, type the path of Atelier B extensions, (for example  '/Applications/AtelierB.app/AB/extensions'):")
    path_prob = input("Please, type the path of ProB, (for example  '/Users/"+getpass.getuser()+"/Applications/ProB/probcli.sh'):")
    installExtension(path,path_prob)
    exit()
