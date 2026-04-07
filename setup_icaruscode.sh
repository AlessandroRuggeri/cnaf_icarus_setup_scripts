#!/bin/bash

export ICARUS_OPT=/opt/exp_software/icarus/users/alrugger
export ICARUS_LOCAL=/storage/gpfs_data/icarus/local/users/alrugger
export SCRIPTS_DIR=/storage/gpfs_data/icarus/local/users/alrugger/cnaf_icarus_scripts


ICODE_VS="v10_20_03"
ICODE_QUAL="e26:prof"

source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
setup icaruscode ${ICODE_VS} -q ${ICODE_QUAL}