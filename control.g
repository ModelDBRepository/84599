// genesis - control.g -  Functions to make control panel for LDS cell
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007
 
float tmax = 100        // msec
float dt = 0.01        // msec 
float injwidth  =  160  // msec
float injdelay  =   20.0
float injcurrent       = -1.0e-3  // microA (-1.0 nA)
float RM = 33.0   // kiloOhm*cm¡°2
float CM = 1.0    // microFarad/cm¡°2
float RA = 0.06   // kiloOhm*cm

include xtools.g
include outputs.g
include popup.g
include inputs.g

    // =================================================
    //                MAIN CONTROL PANEL
    // =================================================

function make_control_menu 
    create xform /output/control [10, 0, 250, 200] -nplabel
    pushe /output/control
    create xlabel label -hgeom 30 -bg cyan -label "MAIN CONTROL PANEL"
    create xbutton RESET -ygeom 0:label -wgeom 33%    -script reset
    create xbutton STOP  -xgeom 0:RESET -ygeom 0:label -wgeom 33% \
         -script stop   
    create xbutton QUIT -xgeom 0:STOP -ygeom 0:label -wgeom 34%\ 
        -script "xshow /output/quit_menu"
    create xdialog step -title "STEP (msec)" -script  \
        "stepbutton <widget>" -value {tmax}
    create xdialog stepsize -title "dt (msec)" -script "clockbutton <widget>"         -value {dt} 
    create xbutton synapse  -title "Change Synaptic Inputs" -script \ 
        "xshow /output/synapse_menu" 
    pope
end




// =======================================================
//  The two main functions, loadgraphs and load_menus
//  set up the forms used for graphs and control buttons
// =======================================================



function load_menus
    make_control_menu
    make_quit_menu
    make_synapse_menu
    xshow /output/control
end

//EOF







































