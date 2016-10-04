'''
Created on Oct 4, 2016

@author: valerio
'''
import utils

#utils.executeSub("/Users/valerio/Myprograms/ProB/probcli", "Chamada", True)  # Simple call (Exampe 1)


#utils.executeSub("/Users/valerio/Myprograms/ProB/probcli /Users/valerio/Documents/Repository/BTestBox/coverage/guptaex_i.imp -eval \"1=1\"", "Chamada", True)  # Simple call (Exampe 2)


#utils.executeSub("/Users/valerio/Myprograms/ProB/probcli /Users/valerio/Documents/Repository/BTestBox/coverage/guptaex_i.imp -eval \"1=0\"", "Chamada", True)  # Simple call (Exampe 3)

#utils.executeSub("/Users/valerio/Myprograms/ProB/probcli  -eval \"1=0\"", "Chamada", True)  # Simple call (Exampe 4)

#
"""
The follow example is used in java to evaluate (with ProB) a B expression in file.  

    Process proc = rt.exec(this.getExecutablePath() + " "
                    + parameters.replace("\n", " ") + " --eval_rule_file "
                    + tmpFileName);


"""


def evaluate(stringexpression):
    rcode, output, errors = utils.executeSubWithReturn("/Users/valerio/Myprograms/ProB/probcli  -eval \""+stringexpression+"\"", "Chamada", True)  # Simple call (Exampe 4)
    
    if (rcode==0): #evaluate the return code
        if "TRUE" in output:
            return True
        elif "FALSE" in output:
            return False
    else:
        print("Error calling the ProB evaluating the follow expression:")
        print(stringexpression)
        return 0
    
    
    
# Full example 1 
print( evaluate("1=0")) 
    
# Full example 2    
print( evaluate("1=1 & 2=0"))


# Full example 3   
print( evaluate("1=1 & a=0 => a <100"))

# Full example 3   
print( evaluate("1=1 asdaasd asd s"))

