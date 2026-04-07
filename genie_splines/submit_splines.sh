#!/bin/bash

# check command line arguments:
PROD_NAME="${1:?Production path}"

# set the tune for the splines
TUNE="GDNu20_01a_00_000"
# set the list of target pdgs
TGT_PDG_LST="1000020040,1000040090,1000050110,1000060120,\
1000070140,1000080160,1000090190,1000110230,1000120240,1000130270,\
1000140280,1000150310,1000160320,1000170350,1000170360,1000170370,\
1000180400,1000190390,1000200400,1000220480,1000230510,1000240520,\
1000250550,1000260540,1000260560,1000260570,1000260580,1000280580,\
1000280590,1000280600,1000290630,1000290640,1000290650,1000300640,\
1000300650,1000350800,1000360840,1000410930,1000420960,1000441010,\
1000501190,1000541310,1000561370,1000641580,1000741830,1000741840,\
1000791970,1000822070"

ICARUS_SCRIPTS_DIR=/storage/gpfs_data/icarus/local/users/alrugger/cnaf_icarus_scripts
GENIE_FORK_DIR=/opt/exp_software/icarus/users/alrugger/dev_areas/GENIE_Fork

# source the GENIE setup script
source ${GENIE_FORK_DIR}/setup_genie.sh

# Create a directory for the spline and copy the DarkNeutrino config. file
SPLINE_DIR=/storage/gpfs_data/icarus/local/users/alrugger/DarkNeutrino_splines/${TUNE}_${PROD_NAME}
mkdir ${SPLINE_DIR}
cp ${GENIE_FORK_DIR}/Generator/config/CommonDark.xml ${SPLINE_DIR}

SPLINE_FILE=${SPLINE_DIR}/${TUNE}_${PROD_NAME}.xml
# run gmkspl for DARKNEUTRINO
${GENIE_FORK_DIR}/Generator/bin/gmkspl  -d -p  12,-12,14,-14 \
        -t $(echo ${TGT_PDG_LST}) \
        -n  5000 \
        -e 50 \
        --message-thresholds ${GENIE_FORK_DIR}/Generator/config/Messenger_whisper.xml \
        --tune ${TUNE} \
        -o ${SPLINE_FILE} &> ${SPLINE_DIR}/log_${TUNE}_${PROD_NAME}.log


# convert the spline file to ROOT for checking
MAX_E=50
ROOT_SPLINE_FILE=${SPLINE_DIR}/${TUNE}_${PROD_NAME}.root

${GENIE_FORK_DIR}/Generator/bin/gspl2root   -f ${SPLINE_FILE} \
            -o ${ROOT_SPLINE_FILE} \
            --tune ${TUNE} \
            --message-thresholds ${GENIE_FORK_DIR}/Generator/config/Messenger_whisper.xml \
            -e ${MAX_E} \
            -t $(echo ${TGT_PDG_LST}) \
            -p -12,12,-14,14 &> ${SPLINE_DIR}/spline_to_ROOT.log