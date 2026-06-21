#!/usr/bin/env bash

rm -rf buildtmp/
latexmk -pdf main.tex

rm -rf buildtmp/
latexmk -pdf bw_main.tex
