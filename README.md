## Setting up the environment
Working on the ICARUS `SL7` container. 
0) Open it on `Apptainer` with:
```bash
source $ICARUS_HOME/cnaf_icarus_setup_scripts/setupIcarusAL9.sh
```
1) From within the container run the `setup_icaruscode.sh` script
```bash
$ source $ICARUS_HOME/cnaf_icarus_setup_scripts/setupIcarusAL9.sh
```
This will source the standard `setup_icarus.sh` script and setup a specific version and qualifier of icaruscode (`v10_20_03` with `e26:prof`).

### This corresponds to:
0) Open it on `Apptainer` with:
```bash
source $ICARUS_HOME/cnaf_icarus_setup_scripts/setupIcarusAL9.sh
```
1) From within the container source the icarus setup script 
```bash
source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
```
#### Actually setting up icaruscode
Now, the list of icaruscode versions can be found in: `/cvmfs/icarus.opensciencegrid.org/products/icarus/icaruscode/`.  And digging inside one should be able to find the available qualifier:
```bash
Apptainer> ls /cvmfs/icarus.opensciencegrid.org/products/icarus/icaruscode/v10_20_03/
README.md              
include/               
job/                   
scripts/               
slf7.x86_64.e26.debug/ # e26:prof is the qualifier
slf7.x86_64.e26.prof/  
source/                
test/                  
wire-cell-cfg/
```
**So, the selected version of icaruscode can be set up with:** 
```bash
setup icaruscode v10_20_03 -q e26:prof # version and qualifier with -q