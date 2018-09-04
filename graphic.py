try:
    # python 3.x
    from tkinter import *
except ImportError:
    # python 2.x
    from Tkinter import *

import argparse
import subprocess
import os
import btestbox
import re

if True:
    for arg in sys.argv:
        print(arg + " ", )
    print("\n" + ("-" * 80))

parser = argparse.ArgumentParser(add_help=False)

progdescription = "BTestBox Interface"

parser = argparse.ArgumentParser(parents=[parser], description=progdescription)

parser.add_argument('ProB_directory',
                    help='Directory of the proB')

parser.add_argument('project_directory',
                    help='Directory of the project')

parser.add_argument('atelier',
                    help='Directory of Atelier-B')

parser.add_argument('b_module',
                    help='Name of the B module (implementation)')

args = parser.parse_args()


def executeSubWithReturn(cmd, n="" , out=True):
    # Function to execute BTestBox
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    print("Happens while running")
    output, errors = p.communicate()
    if out:
        if p.returncode==0:
            print("BTestBox executed successfully ("+n+")")
            print(output)

        else:
            print("BTestBox - error reported in "+n+" and the return code is "+str(p.returncode))
            print(output)
            print(errors)

    return p.returncode, output, errors

def center(toplevel):
    # Function to center the interface on the screen
    toplevel.update_idletasks()
    w = toplevel.winfo_screenwidth()
    h = toplevel.winfo_screenheight()
    size = tuple(int(_) for _ in toplevel.geometry().split('+')[0].split('x'))
    x = w / 2 - size[0] / 2
    y = h / 2 - size[1] / 2

    toplevel.geometry()

    toplevel.geometry("%dx%d+%d+%d" % (size + (x, y)))

class Griding:
    def __init__(self, raiz):
        self.raiz = raiz

        self.raiz.title('BTestBox')

        # Optional Arguments
        Label(self.raiz, text='Optional Arguments:').grid(row=2, column=1, sticky=W, pady=3)
        self.currentOptionalArgument = StringVar()
        self.optionalArgument = Entry(self.raiz, textvariable=self.currentOptionalArgument, width=10)
        self.optionalArgument.grid(row=2, column=2, sticky=E + W, pady=3)

        # Check Button -> All Operations
        self.checkButtonValue = IntVar()
        self.checkButton = Checkbutton(self.raiz, text="All operations", variable=self.checkButtonValue, onvalue="RGB", offvalue="L")
        self.checkButton.select()
        self.checkButton.grid(row=3, column=2, padx=2, pady=3)
        self.checkButton.config(state=DISABLED)

        # Ok Button
        self.ok = Button(self.raiz, width=8, command=self.okButtonClicked, text='OK')
        self.ok.grid(row=10, column=1, padx=2, pady=3)
        self.ok.config(state=DISABLED)

        def checkOkButton(*args):
            if self.currentCriteria.get() != 'Criteria' and self.currentLanguage.get() != 'Language' and self.currentTestProjectName.get() != ''\
                    and self.probcliPath.get() != '' and self.chosenCompiler.get() != '':
                if self.currentLanguage.get() == 'C' and self.currentProfile.get() != 'Profile':
                    self.ok.config(state=ACTIVE)
                elif self.currentLanguage.get() != 'C' and self.profile['state'].lower() == 'DISABLED'.lower():
                    self.ok.config(state=ACTIVE)
                else:
                    self.ok.config(state=DISABLED)

        # Close Button
        self.close = Button(self.raiz, width=8, command=self.closeButtonClicked, text='Cancel')
        self.close.grid(row=10, column=2, padx=2, pady=3)

        # Test Project Name
        Label(self.raiz, text='Test Project Name:').grid(row=1, column=1, sticky=W, pady=3)
        self.currentTestProjectName = StringVar()
        self.nome = Entry(self.raiz, textvariable=self.currentTestProjectName, width=10)
        self.nome.grid(row=1, column=2, sticky=E + W, pady=3)
        self.nome.focus_force()
        self.currentTestProjectName.trace('w', callback=checkOkButton)

        # Coverage Criteria Box
        self.criteriaOptions = ['Statement', 'Path', 'Branch']
        self.currentCriteria = StringVar(self.raiz)
        self.currentCriteria.set('Criteria')
        self.criteriaMenu = OptionMenu(self.raiz, self.currentCriteria, *self.criteriaOptions)
        self.criteriaMenu.grid(row=3, column=1, padx=2, pady=3)
        self.currentCriteria.trace('w', callback=checkOkButton)

        # Translator Box
        self.translatorsOptions = ['C', 'ADA', 'LLVM']
        self.currentLanguage = StringVar(self.raiz)
        self.currentLanguage.set('Language')
        self.translationMenu = OptionMenu(self.raiz, self.currentLanguage, *self.translatorsOptions)
        self.translationMenu.grid(row=6, column=1, padx=2, pady=3)

        def languageChanged(*args):
            if self.currentLanguage.get() == 'C':
                self.profile.config(state=ACTIVE)
                self.profileOptions = ['C9X', 'PROJECT', 'LIGHT', '01', 'PIC']
                self.currentProfile.set('C9X')
                checkOkButton()
            else:
                self.currentProfile.set('Profile')
                self.profile.config(state=DISABLED)
                checkOkButton()

        self.currentLanguage.trace('w', callback=languageChanged)

        # Translator Profile Options
        self.profileOptions = ['C9X', 'PROJECT', 'LIGHT', '01', 'PIC']
        self.currentProfile = StringVar(self.raiz)
        self.currentProfile.set('Profile')
        self.profile = OptionMenu(self.raiz, self.currentProfile, *self.profileOptions)
        self.profile.grid(row=6, column=2, padx=2, pady=3)
        self.profile.config(state=DISABLED)

        self.currentProfile.trace('w', callback=checkOkButton)


        # Probcli path
        Label(self.raiz, text='Probcli (ProB) Path:').grid(row=9, column=1, sticky=W, pady=3)
        self.probcliPath = StringVar(value=args.ProB_directory)
        self.probcliPathFrame = Entry(self.raiz, textvariable=self.probcliPath, width=10)
        self.probcliPathFrame.grid(row=9, column=2, sticky=E + W, pady=3)
        self.probcliPathFrame.focus_force()
        self.probcliPath.trace('w', callback=checkOkButton)

        # Compiler path
        Label(self.raiz, text='Compiler:').grid(row=8, column=1, sticky=W, pady=3)
        self.chosenCompiler = StringVar()
        self.chosenCompilerFrame = Entry(self.raiz, textvariable=self.chosenCompiler, width=10)
        self.chosenCompilerFrame.grid(row=8, column=2, sticky=E + W, pady=3)
        self.chosenCompilerFrame.focus_force()
        self.chosenCompiler.trace('w', callback=checkOkButton)

        # self.novo = Button(self.raiz, width=8, command=self.fechar, text='Advanced')
        #
        # self.novo.grid(row=5, column=1, padx=2, pady=3)

        # self.msg = Label(self.raiz, text='A code coverage tool for B Method')
        #
        # self.msg.grid(row=9, column=1, columnspan=2)
        #
        # self.listbox = Listbox(self.raiz, selectmode=MULTIPLE)
        #
        # self.listbox.insert(END, "All operations")

        # for item in ["Op1", "Op2", "Op3", "Op4"]:
        #     self.listbox.insert(END, item)
        #
        #     self.listbox.grid(row=10, column=1, columnspan=2)

    def okButtonClicked(self):
        # print(args.b_module, args.atelier, args.project_directory)
        # print(str(self.currentCriteria.get()), str(self.currentLanguage.get()), str(self.currentProfile.get()), self.nome.get())
        # print(args.atelier + os.sep + 'bbin' + os.sep + "win32" + os.sep + 'btestbox.exe')
        # print('\"' + args.atelier + os.sep + 'bbin' + os.sep + "win32" + os.sep + 'BTestBox.exe' +
        #                                              '\" \"' + self.currentLanguage.get() +
        #                                              '\" \"' + self.currentProfile.get() +
        #                                              '\" \"' + self.currentCriteria.get() + ' Coverage' +
        #                                              '\" \"' + args.atelier +
        #                                              '\" \"' + args.project_directory +
        #                                              '\" \"' + self.nome.get() +
        #                                              '\" \"' + args.b_module +
        #                                              '\" \"' + self.chosenCompiler.get() +
        #                                              '\" \"' + self.probcliPath.get() + '\"')
        # os.system('\"' + args.atelier + os.sep + 'bbin' + os.sep + "win32" + os.sep + 'BTestBox.exe' +
        #                                              '\" \"' + self.currentLanguage.get() +
        #                                              '\" \"' + self.currentProfile.get() +
        #                                              '\" \"' + self.currentCriteria.get() + ' Coverage' +
        #                                              '\" \"' + args.atelier +
        #                                              '\" \"' + args.project_directory +
        #                                              '\" \"' + self.nome.get() +
        #                                              '\" \"' + args.b_module +
        #                                              '\" \"' + self.chosenCompiler.get() +
        #                                              '\" \"' + self.probcliPath.get() + '\"')

        # directory = atelierB_directory

        atelier_directory = args.atelier

        '''
        directory = args.atelier
        position = 0
        for i in reversed(range(len(directory))):
            if (directory[i] == os.sep or directory[i] == '/'):
                position = i
                break
        atelier_directory = directory[:position:]
        '''

        MAXINT = 5000
        if self.currentOptionalArgument.get() != "":
            wordList = re.sub("[^\w]", " ", self.currentOptionalArgument.get()).split()
            wordList = [x for x in wordList if not (x[0] == '-' and x[1:].isdigit())]
            next = False
            for word in wordList:
                if next == True:
                    MAXINT = int(word)
                    next = False
                if word == "MAXINT":
                    next = True


        print(atelier_directory)

        project_directory = args.project_directory

        '''
        directory = args.project_directory
        for i in reversed(range(len(directory))):
            if (directory[i] == os.sep or directory[i] == '/'):
                position = i
                break
        project_directory = directory[:position:]
        '''

        #atelier, project_directory, copy_directory, probcliPath, target_language, translator_profile, compiler, b_module, coverage, MAXINT
        '''
        btestbox.BTestBoxExecution('\"' + atelier_directory +  '\"',
                                   '\"' + project_directory +  '\"',
                                   '\"' + self.nome.get() + '\"',
                                   '\"' + self.probcliPath.get() + '\"',
                                   '\"' + self.currentLanguage.get() +  '\"',
                                   '\"' + self.currentProfile.get() +  '\"',
                                   '\"' + self.chosenCompiler.get() + '\"',
                                   '\"' + args.b_module + '\"',
                                   '\"' + self.currentCriteria.get() + ' Coverage' +  '\"',
                                   MAXINT)
        '''

        btestbox.BTestBoxExecution(atelier_directory,
                                   project_directory,
                                   self.nome.get(),
                                   self.probcliPath.get(),
                                   self.currentLanguage.get(),
                                   self.currentProfile.get(),
                                   self.chosenCompiler.get(),
                                   args.b_module,
                                   self.currentCriteria.get() + ' Coverage',
                                   MAXINT)

        msg = "Test Finished"
        NORM_FONT = ("Verdana", 10)
        popup = Tk()
        popup.wm_title("!")
        label = Label(popup, text=msg, font=NORM_FONT)
        label.pack(side="top", fill="x")
        B1 = Button(popup, text="Ok", command=popup.destroy)
        B1.pack()
        popup.mainloop()

    def closeButtonClicked(self):
        self.raiz.destroy()

inst1 = Tk()

Griding(inst1)

center(inst1)

inst1.mainloop()

