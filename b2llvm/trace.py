import math
from b2llvm.strutils import *


class Tracer(object):
    '''
    Class offering traceability support
    '''
    def __init__(self, activate,comment=";;"):
        '''
        Constructor.

        Inputs:
        activate: a flag setting traceability generation.
        '''
        self._tiers = [0]
        self._active = activate
        self._text = bytearray()
        self._comment=comment

    def _spacing(self):
        """Whitespace string the width of the current index"""
        global SP
        return " ".join([nb_digits(i)*SP for i in self._tiers])

    def _numbering(self):
        """String corresponding to the current index."""
        return ".".join([str(i) for i in self._tiers])

    def outu(self, msg):
        """Outputs a non-numbered one-line traceability message"""
        global NL
        if self._active:
            self._text.extend(bytearray(self._comment+SP+self._spacing()+SP+msg+NL))

    def out(self, msg):
        """Outputs a numbered one-line traceability message."""
        global NL
        if self._active:
            last = self._tiers.pop()
            self._tiers.append(last+1)
            self._text.extend(bytearray(self._comment+self._numbering()+SP+msg+NL))

    def extend(self, msg):
        self._text.extend(msg)

    def tab(self):
        """Adds a tier to the traceability index."""
        if self._active:
            self._tiers.append(0)

    def untab(self):
        """Removes a tier from the traceability index."""
        if self._active:
            self._tiers.pop()

    def text(self):
        return str(self._text)

def nb_digits(number):
    """Yields the number of digits in given non-negative integer."""
    if number == 0:
        return 1
    else:
        return int(math.floor(math.log(number, 10))+1)

