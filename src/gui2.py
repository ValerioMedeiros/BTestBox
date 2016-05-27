'''
Created on May 26, 2016

@author: valerio
'''
from Tkinter import *
import tkMessageBox

global lparam, top, Lb1,E1,w,variable

def center(toplevel):
    toplevel.update_idletasks()
    w = toplevel.winfo_screenwidth()
    h = toplevel.winfo_screenheight()
    size = tuple(int(_) for _ in toplevel.geometry().split('+')[0].split('x'))
    x = w/2 - size[0]/2
    y = h/2 - size[1]/2
    toplevel.geometry("%dx%d+%d+%d" % (size + (x, y)))
    toplevel.call('wm', 'attributes', '.', '-topmost', '1')


def callBTest():
    global lparam,top
    #tkMessageBox.showinfo( "BTesBox - Results", "Script tests was generated with successful.")
    lparam["defined"] = True 
    #print(map(int,Lb1.curselection()))
    lparam["languages"] = map(int,Lb1.curselection())
    #print(E1.get())
    lparam["heuristic"] = E1.get()
    #print(w.get())
    lparam["max_cases"] = w.get() 
    #print(variable.get())
    lparam["criteria"] = variable.get()
    top.destroy()
      

def draw_gui(parameters_tests):
    global lparam, top,Lb1,E1,w,variable
    lparam = parameters_tests
    top = Tk()
    
    top.title("BTestBox")
    L1 = Label(top, text="Maximun case tests:")
    L1.pack()
    w = Spinbox( from_=0, to=1000000)
    w.insert(0,"500")
    w.pack()
    
    
    L0 = Label( text="Language of test script:")
    L0.pack( )
    Lb1 = Listbox(top,selectmode=EXTENDED)
    Lb1.insert(1, "LLVM")
    Lb1.insert(2, "C++ - Unsupported yet")
    Lb1.insert(3, "JAVA - Unsupported yet")
    Lb1.pack()
    
    L2 = Label( text="Heuristic test strategy:")
    L2.pack( )
    E1 = Entry( bd =5 )
    E1.insert(0,"Random")
    E1.pack()
    
    L3 = Label( text="Code coverage criteria:")
    L3.pack( )
    variable = StringVar(top)
    variable.set("None")
    opt = OptionMenu(top, variable, "None", "CCC", "CCA","MCDC")
    opt.pack()
    
    B = Button(top, text ="Generate", command = callBTest)
    B.pack(side=BOTTOM)
    
    center(top)
    
    mainloop()





