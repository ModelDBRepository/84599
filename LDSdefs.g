// genesis - LDSdefs.g  - 
// This file was developed by
//       Akira Takashima and Ryou Hikosaka.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007
  
// create compartments and channels

include compartment.g
include LDS_tab_chan.g



/* Assign some constants to override those used in LDS_tab_chan.g */
EREST_ACT = -60       // resting membrane potential (milivolts)

float EK = -70  // -0.070


//EREST_ACT = -60

EK = -70


// create a library element
 
create neutral /library
disable /library
pushe /library   //Make these elements in the library

make_cylind_compartment        /* makes "compartment" */

  
// Create prototype LDS channels "K_tab_chan",  "Kfast_tab_chan" and "D_tab_chan"

make_K_tab_chan
make_Kfast_tab_chan
make_D_tab_chan
make_Ex_chan
make_Inh_chan

pope    // Return to the previous working element
  

//EOF




