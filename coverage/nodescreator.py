def createUnaryNode(instNode, docXML):
    """
    Create and return an Unary_Pred node

    Input:
    instNode: The node of the instruction
    docXML: The XML document

    Return:
    unaryNode: An unary node with the instNode as child
    """
    unaryNode = docXML.createElement('Unary_Pred')
    unaryNode.setAttribute('op','not')
    unaryNode.appendChild(docXML.createTextNode('\n'))
    unaryNode.appendChild(docXML.createElement('Attr'))
    unaryNode.appendChild(docXML.createTextNode('\n'))
    unaryNode.appendChild(instNode)
    unaryNode.appendChild(docXML.createTextNode('\n'))
    return unaryNode


def createNaryPred(firstInst, secondInst, op, docXML):
    """
    Create and return a Nary_Pred node

    Input:
    firstInst: The first instruction in the Nary_Pred
    secondInst: The second instruction in the Nary_Pred
    docXML: The XML document
    op: The operation ( or( || ) & )

    Return:
    naryPredNode: A Nary_Pred node with the firstInst and secondInst as children
    """
    naryPredNode = docXML.createElement('Nary_Pred')
    naryPredNode.setAttribute('op', op)
    naryPredNode.appendChild(docXML.createTextNode('\n'))
    naryPredNode.appendChild(firstInst)
    naryPredNode.appendChild(docXML.createTextNode('\n'))
    naryPredNode.appendChild(secondInst)
    naryPredNode.appendChild(docXML.createTextNode('\n'))
    return naryPredNode


def createBinaryPred(firstChild, secondChild, docXML):
    """
    Create and return a Binary_Pred node

    Input:
    firstChild: The first instruction in the Binary_Pred
    secondChild: The second instruction in the Binary_Pred
    docXML: The XML document

    Return:
    binaryPredNode: A Binary_Pred node with the firstChild and secondChild as children
    """
    binaryPredNode = docXML.createElement('Binary_Pred')
    binaryPredNode.setAttribute('op', '=>')
    binaryPredNode.appendChild(docXML.createTextNode("\n"))
    binaryPredNode.appendChild(docXML.createElement('Attr'))
    binaryPredNode.appendChild(docXML.createTextNode("\n"))
    binaryPredNode.appendChild(firstChild)
    binaryPredNode.appendChild(docXML.createTextNode("\n"))
    binaryPredNode.appendChild(secondChild)
    binaryPredNode.appendChild(docXML.createTextNode("\n"))
    return binaryPredNode


def createExpComparison(firstChild, secondChild, op, docXML):
    """
    Create and return an Exp_Comparison node

    Input:
    firstChild: The first instruction in the Exp_Comparison
    secondChild: The second instruction in the Exp_Comparison
    docXML: The XML document

    Return:
    expNode: An Exp_Comparison node with the firstChild and secondChild as children
    """
    ExpNode = docXML.createElement('Exp_Comparison')
    ExpNode.setAttribute('op', op)
    ExpNode.appendChild(docXML.createTextNode("\n"))
    ExpNode.appendChild(docXML.createElement('Attr'))
    ExpNode.appendChild(docXML.createTextNode("\n"))
    ExpNode.appendChild(firstChild)
    ExpNode.appendChild(docXML.createTextNode("\n"))
    ExpNode.appendChild(secondChild)
    ExpNode.appendChild(docXML.createTextNode("\n"))
    return ExpNode


def createBinaryExp(firstChild, secondChild, op, docXML):
    """
    Create and return a Binary_Exp node

    Input:
    firstChild: The first instruction in the Binary_Exp
    secondChild: The second instruction in the Binary_Exp
    docXML: The XML document

    Return:
    expNode: A Binary_Exp node with the firstChild and secondChild as children
    """
    binaryExpNode = docXML.createElement('Binary_Exp')
    binaryExpNode.setAttribute('op', op)
    binaryExpNode.appendChild(docXML.createTextNode('\n'))
    binaryExpNode.appendChild(docXML.createElement('Attr'))
    binaryExpNode.appendChild(docXML.createTextNode('\n'))
    binaryExpNode.appendChild(firstChild)
    binaryExpNode.appendChild(docXML.createTextNode('\n'))
    binaryExpNode.appendChild(secondChild)
    binaryExpNode.appendChild(docXML.createTextNode('\n'))
    return binaryExpNode