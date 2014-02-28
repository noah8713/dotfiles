#!/bin/bash
set -x
find ./ -name "*.py" | grep -v ".venv" >cscope.files
pycscope -i cscope.files
