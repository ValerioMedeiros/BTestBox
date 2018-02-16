from xml.dom import minidom

"""
minidom: Module responsible to read a xml file in a tree.
This file generates every needed instruction, depends of the imp tree.
"""


def make_operation(node):
    """Build all the operation in a string"""
    text = "\n"
    for i in range(node.childNodes.length):  # Return every child of the node (could be better)
        if node.childNodes.item(i).nodeType != node.childNodes.item(
                i).TEXT_NODE:  # Exclude every node that is a TEXT_NODE
            text += "Operation : " + node.childNodes.item(i).getAttribute("name") + " " + make_inputs(
                node.childNodes.item(i).getElementsByTagName("Input_Parameters")[0]) + "\n"
            text += make_inst(node.childNodes.item(
                i)) + "\n"  # Call to make every instruction in the child, the child of Operations are the Operation.
            text += "EndOperation\n"
            text += "\n"
    return text


def make_assig(node):
    """Build an assignement in a string"""
    text = ""
    if node.childNodes.item(1).tagName == "Attr":
        text += make_inst(node.childNodes.item(3))  # Variables Child
        text += " := "
        text += make_inst(node.childNodes.item(5))  # Values Child
    else:
        text += make_inst(node.childNodes.item(1))  # Variables Child
        text += " := "
        text += make_inst(node.childNodes.item(3))  # Values Child
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


def make_binaryexp(node, needParathensis):
    """Build a binary exp in a string"""
    text = ""
    if needParathensis or node.getAttribute('op') == ";":
        text += "("
    if node.childNodes.item(1).tagName == "Attr":
        iterator = 3
    else:
        iterator = 1
    text += callmake(node, node.childNodes.item(iterator).tagName)  # First operand of a binary evaluation
    text += node.getAttribute("op")
    text += selfcaller(node.childNodes.item(iterator+2))  # Second operand of a binary evaluation
    if node.getAttribute('op') == "(":
        text += ')'
    if needParathensis or node.getAttribute('op') == ";":
        text += ")"
    return text


def make_variables(node):
    """Build all variables in a string"""
    text = make_inst(node)  # Build the variables instruction
    return text


def make_id(node):
    """Build an ID in a string"""
    text = str(node.getAttribute("value"))  # Get the value inside the ID
    return text


def make_values(node):
    """Build all values in a string"""
    text = make_inst(node)  # Build the values instruction
    return text


def make_var_in(node):
    """Build a VAR_IN in a string"""
    text = callmake(node, node.childNodes.item(5).tagName)  # Call the Body Child of a VAR_IN
    return text


def make_nary_sub(node):
    """Build a Nary_Sub in a string"""
    # Initialisation
    text = ""
    count = 0
    countmax = 0
    # Process
    for i in range(node.childNodes.length):
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE:
            countmax += 1  # To know how many instructions exist (could be better)
    for i in range(node.childNodes.length):
        if node.childNodes.item(i).nodeType != node.childNodes.item(i).TEXT_NODE:
            text += selfcaller(node.childNodes.item(i))  # This call is diferent because we already are inside the Child
            count += 1
            if count != countmax:  # The last instruction don't get a ";"
                text += node.getAttribute("op")
                text += "\n"
    return text


def selfcaller(node):
    """Adjust made to call the instructions inside a nary_sub properly"""
    # Surfing the tree and making it instruction
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
        if node.parentNode.tagName == 'Values' or node.parentNode.tagName == 'Valuation':
            text += make_binaryexp(node, False)
        else:
            text += make_binaryexp(node, True)
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
    elif tag == "Quantified_Set":
        text += make_quantified_set(node)
    elif tag == "EmptySet":
        text += '{}'
    elif tag == "Boolean_Exp":
        text += make_booleanexp(node)
    return text


def make_booleanexp(node):
    #Build the Bool_Exp tag in a string.
    text = "bool("
    if node.firstChild.nextSibling.tagName == "Attr":
        text += selfcaller(node.childNodes.item(3))
    else:
        text += selfcaller(node.childNodes.item(1))
    text += ')'
    return text


def make_properties(node, inLine=False):
    #Build the properties clause in a string.
    #inLine is true when printing the copy file
    if inLine:
        text = node.tagName.upper() + '\n'
    else:
        text = ""
    if node.childNodes.item(1).tagName == 'Attr':
        text += selfcaller(node.childNodes.item(3))
    else:
        text += selfcaller(node.childNodes.item(1))
    return text


def make_set(node):
    """Build an set into a string"""
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
    """Build an Valuation into a string"""
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
    # IF condition
    text += make_inst(node.childNodes.item(3))  # Make the Condition node
    text += ") THEN\n"
    # Then
    text += make_inst(node.childNodes.item(5))  # Make the Then node
    # Else
    if node.lastChild.previousSibling.tagName == "Else":  # Check if exist ELSE
        text += "\nELSE \n"
        text += make_inst(node.childNodes.item(7))  # Make the ELSE
    text += "\nENDIF"
    return text


def make_expcomparison(node):
    """Build a comparison evaluation in a string"""
    text = ""
    if node.childNodes.item(1).tagName == "Attr":
        text += callmake(node, node.childNodes.item(3).tagName)  # Make the first operand
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(5))  # Make the second operand
    else:
        text += callmake(node, node.childNodes.item(1).tagName)  # Make the first operand
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(3))  # Make the second operand
    return text


def make_while(node):
    """Build a while in a string"""
    text = "WHILE ("
    # While Condition
    text += make_inst(node.childNodes.item(3))  # Make the Condition node
    text += ") DO\n"
    # While Body
    text += callmake(node, node.childNodes.item(5).tagName)  # Make the while body
    # While Invariant
    text += "\nINVARIANT "
    text += callmake(node, node.childNodes.item(7).tagName)
    text += "\nENDWHILE"
    return text


def make_operationcall(node):
    """Build a operation call in a string"""
    text = ""
    count = 0
    if node.firstChild.nextSibling.tagName == "Attr":
        j = 3
    else:
        j = 1
    text += callmake(node, node.childNodes.item(j).tagName)  # Make the operation
    for childNode in node.childNodes:
        if childNode.nodeType != childNode.TEXT_NODE:
            if childNode.tagName == "Output_Parameters":
                output = "("
                count = 0
                for outputchild in childNode.childNodes:
                    count += 1
                    if outputchild.nodeType != outputchild.TEXT_NODE:
                        output += selfcaller(outputchild)
                        if count != outputchild.childNodes.length - 1:
                            output += ", "
                output += ")"
                text = output + " <-- " + text
            if childNode.tagName == "Input_Parameters":
                count = 0
                text += "("
                for inputchild in childNode.childNodes:
                    count += 1
                    if inputchild.nodeType != inputchild.TEXT_NODE:
                        text += selfcaller(inputchild)
                        if count != node.childNodes.length - 1:
                            text += ", "
                text += ")"
    return text


def make_outputParameters(node):
    # Build the Output Parameters in a string.
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
        text += callmake(node, node.childNodes.item(3).tagName)  # First operand of a binary predicate
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(5))  # Second operand of a binary predicate
    else:
        text += callmake(node, node.childNodes.item(1).tagName)  # First operand of a binary predicate
        text += " " + node.getAttribute("op") + " "
        text += selfcaller(node.childNodes.item(3))  # Second operand of a binary predicate
    text += ")"
    return text


def make_narypred(node):
    """Build a Nary_pred in a string"""
    text = "("
    count = 1  # Position of childnodes non TEXT_NODE are always 1 + 2 * (n - 1), where n is the number of the child
    # non TEXT_NODE
    while count < node.childNodes.length:
        text += selfcaller(node.childNodes.item(count))  # Making operands
        count += 2  # Position of childnodes non TEXT_NODE are always 1 + 2 * (n - 1), where n is the number of the
        # child non TEXT_NODE
        if count < node.childNodes.length:
            text += " " + node.getAttribute("op") + " "
    text += ")"
    return text


def make_precondition(node):
    """Build a Precondition in a string"""
    text = ""
    text += callmake(node, node.childNodes.item(1).tagName)
    text += ""
    return text


def make_invariant(node, inLine=False):
    """Build the INVARIANT in a string"""
    if inLine:
        text = node.tagName.upper() + "\n    "
    else:
        text = ""
    text += make_inst(node)
    return text


def make_quantifiedexp(node):
    """Build a quantified exp"""
    text = node.getAttribute('type') + '('
    count = 1
    if node.childNodes.item(1).tagName == "Attr":
        for childnode in node.childNodes.item(3).childNodes:  # Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(3).childNodes.length:
                    text += ", "
        text += ").("
        text += make_inst(node.childNodes.item(5))  # Pred
        text += " | "
        text += make_inst(node.childNodes.item(7))  # Body
        text += ")"
    else:
        for childnode in node.childNodes.item(1).childNodes:  # Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(1).childNodes.length:
                    text += ", "
        text += ").("
        text += make_inst(node.childNodes.item(3))  # Pred
        text += " | "
        text += make_inst(node.childNodes.item(5))  # Body
        text += ")"
    return text


def make_quantifiedpred(node):
    """Build a quantified predicate"""
    text = node.getAttribute('type') + '('
    count = 1
    if node.childNodes.item(1).tagName == "Attr":
        for childnode in node.childNodes.item(3).childNodes:  # Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(3).childNodes.length:
                    text += ", "
        text += ")."
        text += make_inst(node.childNodes.item(5))  # Body
    else:
        for childnode in node.childNodes.item(1).childNodes:  # Variables Node
            if childnode.nodeType != childnode.TEXT_NODE:
                text += make_id(childnode)
                count += 2
                if count < node.childNodes.item(1).childNodes.length:
                    text += ", "
        text += ")."
        text += make_inst(node.childNodes.item(3))  # Body
    return text


def make_unaryexp(node):
    """Build a Unary_Exp in a string"""
    if node.getAttribute('op') != "~":
        text = "" + node.getAttribute("op") + "("
    else:
        text = ""
    if node.childNodes.item(1).tagName == "Attr":
        text += selfcaller(node.childNodes.item(3))  # Instruction
    else:
        text += selfcaller(node.childNodes.item(1))  # Instruction
    if node.getAttribute('op') == "~":
        text += "~"
    else:
        text += ")"
    return text


def make_unarypred(node):
    """Build a Unary_Pred in a string"""
    text = "" + node.getAttribute("op") + "("
    if node.childNodes.item(1).tagName == "Attr":
        text += selfcaller(node.childNodes.item(3))  # Instruction
    else:
        text += selfcaller(node.childNodes.item(1))  # Instruction
    text += ")"
    return text


def make_quantified_set(node):
    # Build the Quantified Sets in a string.
    text = '{'
    if node.firstChild.nextSibling.tagName == "Attr":
        for childNode in node.childNodes.item(3).childNodes:
            if childNode.nodeType != childNode.TEXT_NODE:
                if childNode.tagName != "Attr":
                    text += selfcaller(childNode)
                    if childNode != node.childNodes.item(3).lastChild.previousSibling:
                        text += ", "
        text += " | "
        text += selfcaller(node.childNodes.item(5).firstChild.nextSibling)
    else:
        for childNode in node.childNodes.item(1).childNodes:
            if childNode.nodeType != childNode.TEXT_NODE:
                if childNode.tagName != "Attr":
                    text += selfcaller(childNode)
                    if childNode != node.childNodes.item(1).lastChild.previousSibling:
                        text += ", "
        text += " | "
        text += selfcaller(node.childNodes.item(3).firstChild.nextSibling)
    text += '}'
    return text

def make_naryexp(node):
    """Build a Nary_exp in a string"""
    text = node.getAttribute("op")
    if node.childNodes.item(1).tagName == "Attr":
        count = 3  # Position of childnodes non TEXT_NODE and Attr are always 3 + 2 * (n - 1), where n is the number
        # of the child non TEXT_NODE
        while count < node.childNodes.length:
            text += selfcaller(node.childNodes.item(count))  # Making operands
            count += 2  # Position of childnodes non TEXT_NODE are always 1 + 2 * (n - 1), where n is the number of
            # the child non TEXT_NODE
            if count < node.childNodes.length:
                text += ", "
    else:
        count = 1  # Position of childnodes non TEXT_NODE is always 1 + 2 * (n - 1), where n is the number of the
        # child non TEXT_NODE
        while count < node.childNodes.length:
            text += selfcaller(node.childNodes.item(count))  # Making operands
            count += 2  # Position of childnodes non TEXT_NODE is always 1 + 2 * (n - 1), where n is the number of
            # the child non TEXT_NODE
            if count < node.childNodes.length:
                text += ", "
    if node.getAttribute("op") == '{':
        text += "}"
    elif node.getAttribute("op") == '[':
        text += "]"
    elif node.getAttribute("op") == '(':
        text += ")"
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
        if node.tagName == 'Values' or node.tagName == 'Valuation':
            text += make_binaryexp(childnode, False)
        else:
            text += make_binaryexp(childnode, True)
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
        text += "skip"
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
    elif tag == "Quantified_Set":
        text += make_quantified_set(childnode)
    elif tag == "EmptySet":
        text += '{}'
    elif tag == "Boolean_Exp":
        text += make_booleanexp(node)
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
    # Build the CONSTRAINTS in a string.
    text = '('
    allId = node.getElementsByTagName('Id')
    count = 0
    for Id in allId:
        text += Id.getAttribute('value')
        count += 1
        if count < allId.length:
            text += ', '
    text += ")"
    return text


def make_othermachines(node):
    # Build the SEES/INCLUDES/EXTENDS/IMPORTS clause in a string.
    text = node.tagName.upper() + '\n    '
    allNames = node.getElementsByTagName('Name')
    count = 0
    for name in allNames:
        text += name.firstChild.data
        count += 1
        if count < allNames.length:
            text += ', '
    return text


def make_promotes(node):
    # Build the PROMOTES clause in a string.
    text = node.tagName.upper() + '\n    '
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
    # Build the VARIABLES clause in a string.
    text = node.tagName.upper() + '\n    '
    allId = node.getElementsByTagName('Id')
    count = 0
    for Id in allId:
        text += Id.getAttribute('value')
        count += 1
        if count < allId.length:
            text += ', '
    return text


def make_abstraction(node):
    # Build the REFINES clause in a string.
    text = 'REFINES\n    '
    text += node.firstChild.data
    return text


def make_sets(node):
    # Build the SETS clause in a string.
    text = 'SETS\n    '
    allSet = node.getElementsByTagName('Set')
    count = 0
    for _ in allSet:
        text += make_set(node)
        count += 1
        if count < allSet.length:
            text += ', '
    return text


def make_constraints(node):
    # Build the CONSTRAINTS clause in a string.
    text = node.tagName.upper() + '\n    '
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


def make_valuation_text(node):
    # Build the VALUES clause in a string.
    text = node.tagName.upper() + '\n    '
    allId = node.getElementsByTagName('Valuation')
    count = 0
    for Id in allId:
        text += selfcaller(Id)
        count += 1
        if count < allId.length:
            text += ', '
    return text


def transformBXML(node):
    # Takes the BXML and transform in a valid B machine
    text = ''
    tag = node.tagName
    if tag == "Properties":
        text += make_properties(node, True)
    elif tag == 'Parameters':
        text += make_parameters(node)
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
        text += make_valuation_text(node)
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
