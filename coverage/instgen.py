from xml.dom import minidom
'''
minidom: Module responsible to read a xml file in a tree.


This file generates every needed instrunction, depends of the imp tree.
'''


def make_operation(node):
    """Build all the operation in a string"""
    text = "\n"
    for i in range(node.childNodes.length): #Return every child of the node (could be better)
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE: #Exclude every node that is a TEXT_NODE
            text += "Operation : " + node.childNodes.item(i).getAttribute("name") + " " + make_inputs(node.childNodes.item(i).getElementsByTagName("Input_Parameters")[0]) + "\n"
            text += make_inst(node.childNodes.item(i)) + "\n" #Call to make every instruction in the child, the child of Operations are the Operation.
            text += "EndOperation\n"
            text += "\n"
    return text

def make_assig(node):
    """Build an assignement in a string"""
    text = ""
    if node.childNodes.item(1).tagName == "Attr":
        text += make_inst(node.childNodes.item(3)) #Variables Child
        text += " := "
        text += make_inst(node.childNodes.item(5)) #Values Child
    else:
        text += make_inst(node.childNodes.item(1)) #Variables Child
        text += " := "
        text += make_inst(node.childNodes.item(3)) #Values Child
    return text

def make_inputs(node):
    """Build the inputs"""
    text = "("
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            text += make_id(childnode)
            if childnode != node.lastChild.previousSibling:
                text += ", "
            else:
                text += ")"
    return text

def make_binaryexp(node):
    """Build a binary exp in a string"""
    text = ""
    if node.childNodes.item(1).tagName == "Attr":
        if node.childNodes.item(3).tagName == "Binary_Exp":
            text = "("
        text += callmake(node, node.childNodes.item(3).tagName) #First operand of a binary evaluation
        if node.childNodes.item(3).tagName == "Binary_Exp":
            text += ")"
        if node.getAttribute("op") == "(":
            text += node.getAttribute("op") 
        else:
            text += " " + node.getAttribute("op") + " " 
        text += selfcaller(node.childNodes.item(5)) #Second operand of a binary evaluation
        if node.getAttribute("op") == '(': #If it is a '(', then we need to close with ')'
            text += ')'
    else:
        if node.childNodes.item(1).tagName == "Binary_Exp":
            text = "("
        text += callmake(node, node.childNodes.item(1).tagName) #First operand of a binary evaluation
        if node.childNodes.item(1).tagName == "Binary_Exp":
            text += ")"
        if node.getAttribute("op") == "(":
            text += node.getAttribute("op") 
        else:
            text += " " + node.getAttribute("op") + " " 
        text += selfcaller(node.childNodes.item(3)) #Second operand of a binary evaluation
        if node.getAttribute("op") == '(': #If it is a '(', then we need to close with ')'
            text += ')'
    return text

def make_variables(node):
    """Build all variables in a string"""
    text = make_inst(node) #Build the variables instruction
    return text

def make_id(node):
    """Build an ID in a string"""
    text = node.getAttribute("value") #Get the value inside the ID
    return text 

def make_values(node):
    """Build all values in a string"""
    text = make_inst(node)  #Build the values instruction
    return text    

def make_var_in(node):
    """Build a VAR_IN in a string"""
    text = callmake(node, node.childNodes.item(5).tagName) #Call the Body Child of a VAR_IN
    return text

def make_nary_sub(node):
    """Build a Nary_Sub in a string"""
    #Initialisation
    text = ""
    count = 0
    countmax = 0
    #Process
    for i in range(node.childNodes.length):
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE:
            countmax += 1 #To know how many instructions exist (could be better)
    for i in range(node.childNodes.length): 
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE:
            text += selfcaller(node.childNodes.item(i)) #This call is diferent because we already are inside the Child
            count += 1
            if count != countmax : #The last instruction don't get a ";"
                text += node.getAttribute("op")
                text += "\n"
    return text

def selfcaller(node):
    """Adjust made to call the instructions inside a nary_sub properly"""
    #Surfing the tree and making it insturction
    tag = node.tagName
    text = ""
    if tag == "Assignement_Sub":
        text += make_assig(node)
    elif tag == "If_Sub":
        text += make_if_sub(node)
    elif tag == "While":
        text += make_while(node)
    elif tag == "VAR_IN":
        text += make_var_in(node)
    elif tag == "Id" or tag == "Boolean_Literal" or tag == "Integer_Literal":
        text += make_id(node)
    elif tag == "Binary_Exp":
        text += make_binaryexp(node)
    elif tag == "Operation_Call":
        text += make_operationcall(node)
    elif tag == "Exp_Comparison":
        text += make_expcomparison(node)
    elif tag == "Nary_Pred":
        text += make_narypred(node)
    elif tag == "Quantified_Pred":
        text += make_quantifiedpred(node)
    elif tag == "Binary_Pred":
        text += make_binarypred(node)
    elif tag == "Invariant":
        text += make_invariant(node)
    elif tag == "Unary_Exp":
        text += make_unaryexp(node)
    elif tag == "Unary_Pred":
        text += make_unarypred(node)
    elif tag == "Nary_Exp":
        text += make_naryexp(node)
    elif tag == "Precondition":
        text += make_precondition(node)
    elif tag == "Condition":
        text += make_inst(node)
    elif tag == "Quantified_Exp":
        text += make_quantifiedexp(node)
    elif tag == "Valuation":
        text += make_valuation(node)
    elif tag == "Set":
        text += make_set(node)
    elif tag == "Properties":
        text += make_properties(node)
    return text

def make_properties(node, inLine = False):
    if inLine:
        text = node.tagName.upper()+'\n'
    else:
        text = ""
    if node.childNodes.item(1).tagName == 'Attr':
        text += selfcaller(node.childNodes.item(3))
    else:
        text += selfcaller(node.childNodes.item(1))
    return text

def make_set(node):
    '''Build an set into a string'''
    text = ""
    text += selfcaller(node.childNodes.item(1))
    text += " = {"
    count = 1
    for childnode in node.childNodes.item(3).childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            text += make_id(childnode)
            count += 2
            if count < node.childNodes.item(3).childNodes.length:
                text += ", "
    text += "}"
    return text

def make_valuation(node):
    '''Build an Valuation into a string'''
    text = ""
    if node.childNodes.item(1).tagName == 'Attr':
        text += node.getAttribute('ident')
        text += " = "
        text += selfcaller(node.childNodes.item(3))
    else:
        text += node.getAttribute('ident')
        text += " = "
        text += selfcaller(node.childNodes.item(1))
    return text

def make_if_sub(node):
    """Build an If in a string"""
    text = "IF ("
    #IF condition
    text += make_inst(node.childNodes.item(3)) #Make the Condition node
    text += ") THEN\n"
    #Then
    text += make_inst(node.childNodes.item(5)) #Make the Then node
    #Else
    if node.lastChild.previousSibling.tagName == "Else": #Check if exist ELSE
        text += "\nELSE \n"
        text += make_inst(node.childNodes.item(7)) #Make the ELSE
    text += "\nENDIF"
    return text

def make_expcomparison(node):
    """Build a comparison evaluation in a string"""
    text = ""
    if node.childNodes.item(1).tagName == "Attr":
        text += callmake(node, node.childNodes.item(3).tagName) #Make the first operand
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(5)) #Make the second operand
    else:
        text += callmake(node, node.childNodes.item(1).tagName) #Make the first operand
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(3)) #Make the second operand
    return text

def make_while(node):
    """Build a while in a string"""
    text = "WHILE ("
    #While Condition
    text += make_inst(node.childNodes.item(3)) #Make the Condition node
    text += ") DO\n"
    #While Body
    text += callmake(node, node.childNodes.item(5).tagName) #Make the while body
    #While Invariant
    text += "\nINVARIANT "
    text += callmake(node, node.childNodes.item(7).tagName)
    text += "\nENDWHILE"
    return text

def make_operationcall(node):
    """Build a operation call in a string"""
    text = ""
    count = 0
    text += callmake(node, node.childNodes.item(3).tagName) #Make the operation
    text += "("
    for i in range(node.childNodes.item(5).childNodes.length):
        count += 1
        if node.childNodes.item(5).childNodes.item(i).nodeType != node.childNodes.item(5).childNodes.item(i).TEXT_NODE:
            text += selfcaller(node.childNodes.item(5).childNodes.item(i))
            if count != node.childNodes.item(5).childNodes.length - 1:
                text += ", "
    text += ")"
    if node.childNodes.item(7).nodeType != node.childNodes.item(7).TEXT_NODE:
        output = "("
        count = 0
        for outputchild in node.childNodes.item(7).childNodes:
            count += 1
            if outputchild.nodeType != outputchild.TEXT_NODE:
                output += selfcaller(outputchild)
                if count != node.childNodes.item(7).childNodes.length - 1:
                    output += ", "
        output += ")"
        text = output+" <-- "+text
    return text

def make_outputParameters(node):
    text = ""
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            text += make_id(childnode)
        if childnode != node.lastChild.previousSibling:
            text += " "
    return text
            

def make_binarypred(node):
    """Build a Binary Predicate in a string"""
    text = "("
    if node.childNodes.item(1).tagName == "Attr":
        text += callmake(node, node.childNodes.item(3).tagName) #First operand of a binary predicate
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(5)) #Second operand of a binary predicate
    else:
        text += callmake(node, node.childNodes.item(1).tagName) #First operand of a binary predicate
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(3)) #Second operand of a binary predicate
    text += ")"
    return text

def make_narypred(node):
    """Build a Nary_pred in a string"""
    text = "("
    count = 1 #Position of childnodes non TEXT_NODE are always 1 + 2 * (n - 1), where n is the number of the child non TEXT_NODE
    while(count < node.childNodes.length):
        text += selfcaller(node.childNodes.item(count)) #Making operands
        count += 2 #Position of childnodes non TEXT_NODE are always 1 + 2 * (n - 1), where n is the number of the child non TEXT_NODE
        if count < node.childNodes.length:
            text += " " + node.getAttribute("op") + " "
    text += ")"
    return text

def make_precondition(node):
    """Build a Precondition in a string"""
    text = ""
    text += callmake(node, node.childNodes.item(1).tagName)
    text +=""
    return text

def make_invariant(node, inLine = False):
    """Build the INVARIANT in a string"""
    if inLine:
        text = node.tagName.upper()+"\n"
    else:
        text = ""
    text += make_inst(node)
    return text

def make_quantifiedexp(node):
    '''Build a quantified exp'''
    text = node.getAttribute('type')+'('
    count = 1
    if node.childNodes.item(1).tagName == "Attr":
        for childnode in node.childNodes.item(3).childNodes: #Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(3).childNodes.length:
                    text += ", "
        text += ").("
        text += make_inst(node.childNodes.item(5)) #Pred
        text += " | "
        text += make_inst(node.childNodes.item(7)) #Body
        text += ")"
    else:
        for childnode in node.childNodes.item(1).childNodes: #Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(1).childNodes.length:
                    text += ", "
        text += ").("
        text += make_inst(node.childNodes.item(3)) #Pred
        text += " | "
        text += make_inst(node.childNodes.item(5)) #Body
        text += ")"
    return text
        
def make_quantifiedpred(node):
    """Build a quantified predicate"""
    text = node.getAttribute('type')+'('
    count = 1
    if node.childNodes.item(1).tagName == "Attr":
        for childnode in node.childNodes.item(3).childNodes: #Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(3).childNodes.length:
                    text += ", "
        text += ")."
        text += make_inst(node.childNodes.item(5)) #Body
    else:
        for childnode in node.childNodes.item(1).childNodes: #Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(1).childNodes.length:
                    text += ", "
        text += ")."
        text += make_inst(node.childNodes.item(3)) #Body
    return text

def make_unaryexp(node):
    """Build a Unary_Exp in a string"""
    text = ""+node.getAttribute("op")+"("
    if node.childNodes.item(1).tagName == "Attr":
        text += selfcaller(node.childNodes.item(3)) #Instruction
    else:
        text += selfcaller(node.childNodes.item(1)) #Instruction
    text += ")"
    return text

def make_unarypred(node):
    """Build a Unary_Pred in a string"""
    text = ""+node.getAttribute("op")+"("
    if node.childNodes.item(1).tagName == "Attr":
        text += selfcaller(node.childNodes.item(3)) #Instruction
    else:
        text += selfcaller(node.childNodes.item(1)) #Instruction
    text += ")"
    return text

def make_naryexp(node):
    """Build a Nary_exp in a string"""
    text = node.getAttribute("op")
    if node.childNodes.item(1).tagName == "Attr":
        count = 3 #Position of childnodes non TEXT_NODE and Attr are always 3 + 2 * (n - 1), where n is the number of the child non TEXT_NODE
        while(count < node.childNodes.length):
            text += selfcaller(node.childNodes.item(count)) #Making operands
            count += 2 #Position of childnodes non TEXT_NODE are always 1 + 2 * (n - 1), where n is the number of the child non TEXT_NODE
            if count < node.childNodes.length:
                text += ","
    else:
        count = 1 #Position of childnodes non TEXT_NODE is always 1 + 2 * (n - 1), where n is the number of the child non TEXT_NODE
        while(count < node.childNodes.length):
            text += selfcaller(node.childNodes.item(count)) #Making operands
            count += 2 #Position of childnodes non TEXT_NODE is always 1 + 2 * (n - 1), where n is the number of the child non TEXT_NODE
            if count < node.childNodes.length:
                text += ","
    if node.getAttribute("op") == '{':
        text += "}"
    return text  

def callmake(node, tag):
    """Surfing the tree and building everychild"""
    text = ""
    childnode = node.getElementsByTagName(tag)[0]
    if tag == "Body" or tag == "Condition":
        text += make_inst(childnode)
    elif tag == "Assignement_Sub":
        text += make_assig(childnode)
    elif tag == "Variables" or tag == "Name":
        text += make_variables(childnode)
    elif tag == "Id" or tag == "Boolean_Literal" or tag == "Integer_Literal":
        text += make_id(childnode)
    elif tag == "Values":
        text += make_values(childnode)
    elif tag == "Binary_Exp":
        text += make_binaryexp(childnode)
    elif tag == "VAR_IN":
        text += make_var_in(childnode)
    elif tag == "Nary_Sub":
        text += make_nary_sub(childnode)
    elif tag == "If_Sub":
        text += make_if_sub(childnode)
    elif tag == "Exp_Comparison":
        text += make_expcomparison(childnode)
    elif tag == "While":
        text += make_while(childnode)
    elif tag == "Operation_Call":
        text += make_operationcall(childnode)
    elif tag == "Skip":
        text += "Skip"
    elif tag == "Nary_Pred":
        text += make_narypred(childnode)
    elif tag == "Binary_Pred":
        text += make_binarypred(childnode)
    elif tag == "Precondition":
        text += make_precondition(childnode)
    elif tag == "Quantified_Pred":
        text += make_quantifiedpred(childnode)
    elif tag == "Invariant":
        text += make_invariant(childnode)
    elif tag == "Unary_Exp":
        text += make_unaryexp(childnode)
    elif tag == "Unary_Pred":
        text += make_unarypred(childnode)
    elif tag == "Quantified_Exp":
        text += make_quantifiedexp(childnode)
    elif tag == "Nary_Exp":
        text += make_naryexp(childnode)
    elif tag == "Valuation":
        text += make_valuation(node)
    elif tag == "Properties":
        text += make_properties(childnode)
    return text

def make_inst(node):
    """Surfing the tree and building everychild"""
    text = ""
    for i in range(node.childNodes.length):
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE:
            tag = node.childNodes.item(i).tagName
            text += callmake(node, tag)
    return text

def make_parameters(node):
    text = node.tagName.upper()+'\n    '
    allId = node.getElementsByTagName('Id')
    count = 0
    for Id in allId:
        text += Id.getAttribute('value')
        count += 1
        if count < allId.length:
            text += ', '
    return text

def make_othermachines(node):
    text = node.tagName.upper()+'\n    '
    allNames = node.getElementsByTagName('Name')
    count = 0
    for name in allNames:
        text += 'copy'+name.firstChild.data
        count += 1
        if count < allNames.length:
            text += ', '
    return text

def make_promotes(node):
    text = node.tagName.upper()+'\n    '
    allNames = node.getElementsByTagName('Promoted_Operation')
    count = 0
    thereIsAttr = False
    if allNames[0].firstChild.nextSibling.tagName == 'Attr':
        thereIsAttr = True
    for name in allNames:
        if thereIsAttr:
            text += name.firstChild.nextSibling.nextSibling.data
        else:
            text += name.firstChild.data
        count += 1
        if count < allNames.length:
            text += ', '
    return text

def make_variables_text(node):
    text = node.tagName.upper()+'\n    '
    allId = node.getElementsByTagName('Id')
    count = 0
    for Id in allId:
        text += Id.getAttribute('value')
        count += 1
        if count < allId.length:
            text += ', '
    return text

def make_abstraction(node):
    text = 'REFINES\n    '
    text += 'copy'+node.firstChild.data
    return text

def make_sets(node):
    text = 'SETS\n    '
    allSet = node.getElementsByTagName('Set')
    count = 0
    for Set in allSet:
        text += make_set(node)
        count += 1
        if count < allSet.length:
            text += ', '
    return text

def make_constraints(node):
    text = node.tagName.upper()+'\n    '
    if node.childNodes.item(1).tagName == 'Attr':
        count = 3
    else:
        count = 1
    for childnode in node.childNodes:
        if childnode.nodeType != childnode.TEXT_NODE:
            if childnode.tagName != 'Attr':
                text += selfcaller(childnode)
                count += 2
                if count < node.childNodes.length:
                    text += ', '           
    return text

def make_values(node):
    text = node.tagName.upper()+'\n    '
    allId = node.getElementsByTagName('Valuation')
    count = 0
    for Id in allId:
        text += selfcaller(Id)
        count += 1
        if count < allId.length:
            text += ', '
    return text
    
def transformBXML(node):
    text = ''
    tag = node.tagName
    if tag == "Properties":
        text += make_properties(node, True)
    elif tag == 'Parameters':
        text += make_parameters
    elif tag == 'Sees' or tag == 'Includes' or tag == 'Imports' or tag == 'Extends':
        text += make_othermachines(node)
    elif tag == 'Promotes':
        text += make_promotes(node)
    elif tag == 'Concrete_Variables' or tag == 'Abstract_Variables':
        text += make_variables_text(node)
    elif tag == 'Concrete_Constants' or tag == 'Abstract_Constants':
        text += make_variables_text(node)
    elif tag == 'Abstraction':
        text += make_abstraction(node)
    elif tag == 'Invariant':
        text += make_invariant(node, True)
    elif tag == 'Initialisation':
        text += make_invariant(node, True)
    elif tag == 'Sets':
        text += make_sets(node)
    elif tag == 'Assertions':
        text += make_invariant(node, True)
    elif tag == 'Constraints':
        text += make_constraints(node)
    elif tag == 'Values':
        text += make_values(node)
    return text

"""
If you want to test there is a sample, you will need to pass to the parse a bxml file of an implementation.
"""
"""
doc = minidom.parse("While_i.bxml")

operations = doc.getElementsByTagName("Operations")[0]

text = make_operation(operations)
print(text)
"""
