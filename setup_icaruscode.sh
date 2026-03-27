#!/bin/bash

ICARUS_HOME=/opt/exp_software/icarus/users/alrugger

ICODE_VS="v10_20_03"
ICODE_QUAL="e26:prof"

source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
setup icaruscode ${ICODE_VS} -q ${ICODE_QUAL}