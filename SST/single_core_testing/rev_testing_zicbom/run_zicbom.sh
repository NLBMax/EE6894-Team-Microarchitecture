#!/bin/bash

#Build the test
# make clean && make

# Check that the exec was built...
if [ -x towers.exe ]; then
	sst --add-lib-path=../sst_risc_v/rev/build/src/ ./rev_zicbom.py
else
	echo "Test TEST_ZICBOM: zicbom.exe not Found - likely build failed"
	exit 1
fi
