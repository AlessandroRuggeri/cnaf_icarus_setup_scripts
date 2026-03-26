#!/bin/bash

ICARUS_HOME=/opt/exp_software/icarus/users/alrugger

/cvmfs/oasis.opensciencegrid.org/mis/apptainer/current/bin/apptainer exec \
--pid --ipc -B /etc/grid-security,/cvmfs,/storage,/data,/opt,/tmp \
--home ~/:${ICARUS_HOME} \
--cleanenv --env ICARUS_HOME=${ICARUS_HOME} \
--pwd ${ICARUS_HOME} /cvmfs/singularity.opensciencegrid.org/fermilab/fnal-dev-sl7:latest \