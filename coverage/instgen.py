from xml.dom import minidom

def make_operation(node):
    """Build all the operation in a string"""
    text = "\n"
    for i in range(node.childNodes.length): #Return every child of the node (could be better)
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE: #Exclude every node that is a TEXT_NODE
            text += "Operation : " + node.childNodes.item(i).getAttribute("name") + "\n"
            text += make_inst(node.childNodes.item(i)) + "\n" #Call to make every instruction in the child, the child of Operations are the Operation.
            text += "EndOperation\n"
            text += "\n"
    return text

def make_assig(node):
    """Build an assignement in a string"""
    text = ""
    text += make_inst(node.childNodes.item(3)) #Variables Child
    text += " := "
    text += make_inst(node.childNodes.item(5)) #Values Child
    return text

def make_binaryexp(node):
    """Build a binary exp in a string"""
    text = ""
    if node.childNodes.item(3).tagName == "Binary_Exp":
        text = "("
    text += callmake(node, node.childNodes.item(3).tagName) #First operand of a binary evaluation
    if node.childNodes.item(3).tagName == "Binary_Exp":
        text += ")"
    text += " " + node.getAttribute("op") + " " 
    text += selfcaller(node.childNodes.item(5)) #Second operand of a binary evaluation
    if node.getAttribute("op") == '(': #If it is a '(', then we need to close with ')'
        text += ' )'
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
    text += callmake(node, node.childNodes.item(3).tagName) #Make the first operand
    text += " " + node.getAttribute("op") + " "
    text += make_id(node.childNodes.item(5)) #Make the second operand
    return text

def make_while(node):
    """Build a while in a string"""
    text = "WHILE ("
    #While Condition
    text += make_inst(node.childNodes.item(3)) #Make the Condition node
    text += ") DO\n"
    #While Body
    text += callmake(node, node.childNodes.item(5).tagName) #Make the while body
    text += "\nENDWHILE"
    return text

def make_operationcall(node):
    """Build a operation call in a string"""
    text = ""
    count = 0
    text += callmake(node, node.childNodes.item(3).tagName) #Make the operation
    text += " ("
    for i in range(node.childNodes.item(5).childNodes.length): #Making the parameters of the call
        count += 1
        if node.childNodes.item(5).childNodes.item(i).nodeType != node.childNodes.item(5).childNodes.item(i).TEXT_NODE:
            text += selfcaller(node.childNodes.item(5).childNodes.item(i))
            if count != node.childNodes.item(5).childNodes.length - 1:
                text += ", "
    text += ")"
    return text

def make_binarypred(node):
    """Build a Binary Predicate in a string"""
    text = "("
    text += callmake(node, node.childNodes.item(3).tagName) #First operand of a binary predicate
    text += " " + node.getAttribute("op") + " " 
    text += selfcaller(node.childNodes.item(5)) #Second operand of a binary predicate
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

def callmake(node, tag):
    """Surfing the tree and building everychild"""
    text = ""
    childnode = node.getElementsByTagName(tag)[0]
    if tag == "Body":
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
    return text

def make_inst(node):
    """Surfing the tree and building everychild"""
    text = ""
    for i in range(node.childNodes.length):
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE:
            tag = node.childNodes.item(i).tagName
            text += callmake(node, tag)
    return text

"""
If you want to test there is a sample, you will need to pass to the parse a bxml file of an implementation.
"""

"""
doc = minidom.parse("ifwithtwo_i.bxml")

operations = doc.getElementsByTagName("Operations")[0]

text = make_operation(operations)
print(text)
"""