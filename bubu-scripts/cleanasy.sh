#!/bin/bash

(python3 ~/bubu-scripts/export-ggb-clean-asy.py < ./images/diag.txt) | python3 ~/bubu-scripts/bubu-asy.py

echo "GGB to ASY has successfully been cleaned!"
