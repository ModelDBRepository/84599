//genesis - TEST.g - GENESIS Version 2.1
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007


/*=======================================================================
  A sample script to create a multicompartment model containing channels
  taken from LDS_tab_chen.g  SI units are used.
  =======================================================================*/

include LDSdefs.g
include control.g
include xtools.g
include outputs.g
include inputs.g
include popup.g
include setcolors.g
include xgraph.g
include xcell.g
include option.g



float tmax = 100           // simulation time in msec, usually 200 msec  
float dt = 0.01         // simulation timestep in msec
setclock  0  {dt}          // set the simulation clock


function make_hsolve
    pushe /
    if ({exists /cell/solve})
        echo "/cell/solve  already exists!" 	
    else
        create hsolve /cell/solve  
        setfield /cell/solve path /cell/soma[TYPE=compartment],/cell/dend[][TYPE=compartment]
        setfield /cell/solve chanmode 4  comptmode 1
    
        call /cell/solve SETUP
        reset
        pope
        echo "create /cell/solve"
    end
end


//=================================
//          Main Script
//=================================
readcell LDS_active.p  /cell



setfield /cell/soma initVm -60     //milliVolts


makeinputs

setclock 1 0.5

// make the control panel
load_menus
setfield /output/control/stepsize value 0.01    // modified original


XCellCreate

XGraphCreate


change_soma

change_dend

setclock 2 0.5
setclock 3 0.01


check

make_hsolve

colorize

reset 


 
//EOF 




