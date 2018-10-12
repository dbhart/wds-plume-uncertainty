# wds-plume-uncertainty
Input files for graphics for "Quantifying hydraulic and water quality uncertainty to inform sampling of drinking water distribution systems." Hart, D. B., et al, 2018. [doi://10.1061/(ASCE)WR.1943-5452.0001005](https:dx.doi.org//10.1061/(ASCE)WR.1943-5452.0001005)

This repository contains the data used to create the graphics in the FigureData directory. It also contains a subset of the EPANET Inp files used for the simulation runs (complete set is over 8 GiB of input files, and even zipped can't fit here). The Inp files include the modified KL model (with diurnal demands from the N6 model) and N6 model with the stochastic pipe closures applied (the files called `*-base-EN2-*.tgz`). There is also a subset of 100 files for each model showing the stochastically applied demands (with other variables held constant). Again, this is a small subset due to the size of the files.

Description of files:
 
 \- FigureData
 
    \- Fig*.dat        comma separated values used for the specified figure
    
    \- Fig09-10\*      files containing data used to create Figures 11 and 12

 \- InpFiles
 
    \- KL-base-EN2-inpfifles.tgz    tarball containing EPANET KL inpfiles with the pipe closures applied
     
    \- N6-base-EN2-inpfifles.tgz    tarball containing EPANET N6 inpfiles with the pipe closures applied

    \- KL-demExamp-EN2-inpfifles.tgz   tarball containing 100 realizations of demand variation of 0.2 and 0.4 level
    
    \- N6-demExamp-EN2-inpfifles.tgz   tarball containing 100 realizations of demand variation of 0.2 and 0.4 level
    
    
