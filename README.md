# BTestBox
 It is a tool to automatically test the translation of B in another language. BTestBox takes a target language and a B implementation as input and generate
 a test case to compare the execution of the translated B code and the B implementation. The tool uses ProB to animate the B implementation and get the expected states.


# Installation procedure
The installation of BTestBox in Atelier-B is similar in Windows,
Linux and OS X. It is performed the script file configAtelierB.py, 
which must be granted rights to execute and write in Atelier-B's directory.
This procedure installs configuration files for Atelier-B that contain descriptions
of the interface elements and their association with BTestBox options.
In the directory where BTestBox will be maintained, execute the following commands in a terminal to start installation:

```{r, engine='bash', count_lines}
$git clone https://github.com/ValerioMedeiros/BTestBox/
$cd BTestBox
$python2.7  configAtelierB.py
```
  * Requirements: 
    * Python 2.7 (https://www.python.org/downloads/)
    * ProB 1.6  (https://www3.hhu.de/stups/prob/index.php/Download)
    * B2LLVM (https://bitbucket.org/ddeharbe/b2llvm)

# Usage instructions

 * TODO: add more details
 
[![Video demonstration BTestBox](http://img.youtube.com/vi/a4G6pSLVKpk/0.jpg)](https://www.youtube.com/watch?v=a4G6pSLVKpk)


## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D


## Credits
Valério Medeiros Jr, Diego Azevedo

## License
Copyright (c) 2016 (BSD License).

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of the UFRN, IFRN nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
