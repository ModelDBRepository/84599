//setcolors.g 

// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 28 Nov. 2006




function colorize
    setfield /##[ISA=xlabel] fg white bg blue3
    setfield /##[ISA=xbutton] offbg rosybrown1 onbg rosybrown1
    setfield /##[ISA=xtoggle] onfg red offbg cadetblue1 onbg cadetblue1
    setfield /##[ISA=xdialog] bg palegoldenrod
    setfield /##[ISA=xgraph] bg ivory
end

/*----------------------------------------------------------------------*/

//EOF