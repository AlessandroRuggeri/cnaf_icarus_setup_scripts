#!/bin/bash

ICARUS_HOME=/storage/gpfs_data/icarus/local/users/alrugger
ICARUS_SCRIPTS_DIR=${ICARUS_HOME}/cnaf_icarus_setup_scripts

/cvmfs/oasis.opensciencegrid.org/mis/apptainer/current/bin/apptainer exec \
  --pid --ipc -B /etc/grid-security,/etc/resolv.conf,/cvmfs,/storage,/data,/opt,/tmp \
  --home ~/:${ICARUS_HOME} \
  --cleanenv \
  --env-file ${ICARUS_SCRIPTS_DIR}/container_env.env \
  --pwd ${ICARUS_HOME} \
  /cvmfs/singularity.opensciencegrid.org/fermilab/fnal-dev-sl7:latest \
  /bin/bash