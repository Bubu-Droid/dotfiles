#!/bin/python3

import os
import re
import sys

ADVERTISEMENT_OLD = r"""/*
Converted from GeoGebra by User:Azjps using Evan's magic cleaner
https://github.com/vEnhance/dotfiles/blob/main/py-scripts/export-ggb-clean-asy.py
*/"""

ADVERTISEMENT_NEW = r"""/*
Converted from GeoGebra by User:Azjps using Evan's magic cleaner
https://github.com/vEnhance/dotfiles/blob/main/py-scripts/export-ggb-clean-asy.py
*/
/*
A few re-additions are done using bubu-asy.py.
This adds the dps, xmin, linewidth, fontsize and directions.
https://github.com/Bubu-Droid/dotfiles/blob/master/bubu-scripts/bubu-asy.py
*/"""

pen_xmin = r"""size(15cm);
pen dps = linewidth(0.7) + fontsize(10); defaultpen(dps);
real xmin = -5, xmax = 5, ymin = -5, ymax = 5;
"""

data = "".join(sys.stdin.readlines())

if ADVERTISEMENT_NEW in data:
    pass
else:
    data = data.replace(ADVERTISEMENT_OLD, ADVERTISEMENT_NEW)

data = data.replace(re.findall("size\\(.*\\);", data)[0], pen_xmin)
data = data.replace("linewidth(0.7)", "linewidth(0.5)")
data = data.replace("linewidth(0.8)", "linewidth(0.5)")
data = data.replace("linewidth(1.2)", "linewidth(0.75)")
data = data.replace("linewidth(2pt)", "linewidth(3pt)")
data = data.replace("fontsize(10)", "fontsize(13)")
data = data.replace("$$", "$")

dotlabs = re.findall("dot\\(.*dir\\(.*\\);", data)
newlabs = []

for i in dotlabs:
    newlabs.append(re.sub("dir\\(.*\\)\\)", "NW)", i))

for i in range(len(dotlabs)):
    data = data.replace(dotlabs[i], newlabs[i])

with open(f"{os.getcwd()}/images/diag.txt", "w") as fp:
    fp.write(data)
