#!/usr/bin/python2.7
'''
Created on Feb 8, 2016
@author: valerio
'''
#requires http://easygui.sourceforge.net/
from easygui import *


def simplesBox(filename):
    msg = "Enter with test options ("+filename+")"
    title = "BTest"
    fieldNames = ["Number of cases","Run","Debug","Verbose"]
    #Default values
    fieldValues = ["10","True","True","True"]
    fieldValues = multenterbox(msg,title, fieldNames,fieldValues)
    
    
    #TODO: make sure that none of the fields was  
    while 1:
        if fieldValues == None: break
        errmsg = ""
        for i in range(len(fieldNames)):
          if fieldValues[i].strip() == "":
            errmsg = errmsg + ('"%s" is a required field.\n\n' % fieldNames[i])
        if errmsg == "": break # no problems found
        fieldValues = multenterbox(errmsg, title, fieldNames, fieldValues)
    print "Reply was:", fieldValues
    
    return fieldValues

 
