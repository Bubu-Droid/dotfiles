#!/bin/python3

import pyperclip as pc

import strparse as sp

text = pc.paste()

text = sp.demacro(text)
text = sp.remove_soft_newlines(text)
text = sp.toAOPS(text)

pc.copy(text)
