'''
Created on Nov 4, 2016

@author: valerio
'''

from py4j.java_gateway import JavaGateway
from subprocess import call
import urllib
import sys, os.path,subprocess



filename = "prob2_tooling_template-master-all.jar"
url = "http://godev.ifrn.edu.br/valerio/test_PyProB_ERASE/prob2_tooling_template-master-all.jar"
# Download the file if it does not exist
if not os.path.isfile(filename):
    print(urllib.urlretrieve(url, filename)) 
    
#Call the server
#call(["java", "-jar","prob2_tooling_template-master-all.jar"])

print subprocess.Popen("echo Hello World", shell=True, stdout=subprocess.PIPE).stdout.read()
print subprocess.Popen("pwd", shell=True, stdout=subprocess.PIPE).stdout.read()
print subprocess.Popen("java  -jar prob2_tooling_template-master-all.jar", shell=True, stdout=subprocess.PIPE).stdout.read()
print (os.popen("java  -jar prob2_tooling_template-master-all.jar").read())


# Connect to server
gateway = JavaGateway()
prob_app = gateway.entry_point
print(gateway.addition(1,1))

gateway.openModule("/Users/valerio/Documents/Repository/PyProB/PyProB/prob2_tooling_template-master/bin/ACounter.mch")

print(gateway.getCurrenteValueVariable("ii"))

print(gateway.animate("inc",""))
print(gateway.getCurrenteValueVariable("ii"))

print(gateway.animate("add","value=1"))
print(gateway.getCurrenteValueVariable("ii"))


gateway.shutdown()
#try:
#    gateway.shut1()
#except Exception:
#    print ("Error - ok ")
#else:
#    print ('Erro- .ok ')



#gateway.shutdown()

