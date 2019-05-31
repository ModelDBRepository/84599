// genesis - xtools.g - Functions used in the control panel
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007
   


//====================================================================
// advances the simulation by the amount of time given in the dialog
//====================================================================


function stepbutton(widget)
    str widget
    echo step  {getfield {widget} value} msec.
    step {getfield {widget} value} -time
end


function clockbutton(widget)
    str widget
    echo "dt = " {getfield {widget} value} msec.
    setclock 0 {getfield {widget} value} 
end


//===========================
// make hsolve /cell/solve
//===========================




function delete_hsolve
    pushe /
    delete /cell/solve
    reset
    echo "/cell/solve are deleted!"
    pope
end


//============================
// choose integration method 
//============================


/*function integ_method(widget)
    str widget
    echo "Integration Method is " {getfield {widget} value}.
    setmethod {getfield {widget} value} 
end*/



//EOF
