// genesis - popup.g - Functions to make Popup menu
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007


// ==========================================
//   Functions used for popup parameter menus
// ==========================================

// variables used for injection current
float injwidth  =  160  // msec
float injdelay  =    0.0
float injcurrent       = -1.0e-3  // microA (-1.0 nA)

// variables used for synaptic inputs

float syndelay = 0
float gsyn = 1e-6  // milliSiemen
float tsyn = 1     // millisecond
float Vsyn = 0     // mV



//==========================================
// Popup Menu for Quit the simulation
//==========================================
 
function make_quit_menu 
    create xform /output/quit_menu [730, 75, 220, 120]   -nolabel
    pushe /output/quit_menu
    create xlabel quit_label -title "Really quit?" -bg 
    create xbutton YES -script quit 
    create xbutton NO -script "xhide /output/quit_menu"
    pope
end



//================================================================
// Popup Menu for timing, value and location of injection current
//================================================================

function make_inject_menu// Dialog boxes for injection current and timing
    create xform /output/inject_menu [10,410,300,215] -nolabel
    pushe /output/inject_menu
    // in inputs.g
//    create xtoggle injtoggle -title "" -script inj_toggle
//    setfield injtoggle offlabel "Current Injection OFF"
//    setfield injtoggle onlabel "Current Injection ON" state 1
    // initialize
//    inj_toggle
    create xbutton DISMISS  -script "xhide /output/inject_menu"
    create xdialog inject -title "Current (microA)" -value {injcurrent}  \
        -script "set_injection"
    create xdialog delay -title "Delay (msec)" -value {injdelay}  \
        -script "set_injection"
    create xdialog width -title "Width (msec)" -value {injwidth}  \
        -script "set_injection"
    create xlabel numbering -title "Compartment Name"
    create xdialog comp_no -title "Inject Compartment:" -value 0  \
        -script "add_injection"
    pope
end



 
//==========================================
// Popup Menu for Change Synaptic Channel
//==========================================

function make_synapse_menu
    create xform /output/synapse_menu [0, 250, 275, 345] -title                     "Synaptic Input" 
    pushe /output/synapse_menu
    create xbutton DISMISS -script "xhide /output/synapse_menu"
    create xtoggle syntoggle -title "" -script syn_toggle
    setfield syntoggle offlabel "Synaptic Input OFF"
    // initially  OFF
    setfield syntoggle onlabel "Synaptic Input ON" state 0
    // initialize
    create xlabel synaptic_inputs -title "Synaptic inputs"
    create xlabel info1 -title "Synaptic input sites are"
    create xlabel info2 -title "indicated as red compartment(s)"
    create xbutton single_input -script "make_1input"
    create xbutton 5_inputs -script "make_5inputs"
    create xbutton 10_inputs -script "make_10inputs"
    create xbutton 21_inputs -script "make_21inputs" 
    create xbutton 94_inputs -script "make_94inputs"
    create xbutton remove -title "Remove All Synaptic Inputs" -script \
         "remove_synaptic_input"  
    pope
end




// EOF
