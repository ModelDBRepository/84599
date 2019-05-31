// genesis - outputs.g -
// Functions used for data save and changing cell parameter

// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007


//================================================
//   functions used in the change cell parameter
//================================================

function change_dend

    float diameter 
    float length  
    float Rm, Cm, Ra
    float dia_mag 
    float length_mag
    
    pushe /cell

    int NumComp = 492   
    int i
    

    for( i = 1; i <= {NumComp}; i = i+1 )
        dia_mag = 1.27 //{getfield /output/cell_menu/diameter value}
        length_mag = 1 //{getfield /output/cell_menu/length value}
        diameter = {dia_mag}*{getfield /cell/dend[{i}] dia}
        length = {length_mag}*{getfield /cell/dend[{i}] len}
        Rm = {getfield /cell/dend[{i}] Rm}
        Cm = {getfield /cell/dend[{i}] Cm}
        Ra = {getfield /cell/dend[{i}] Ra}

        setfield /cell/dend[{i}] dia {diameter} len {length}


        Rm = {Rm}/({dia_mag}*{length_mag}) 
        Cm = {Cm}*{dia_mag}*{length_mag}
//        Ra = {Ra}*{length_mag}/({dia_mag}*{dia_mag})
        
        setfield /cell/dend[{i}]  Rm {Rm} Cm {Cm} Ra {Ra} 
    end
    echo "All dendrite area were changed!" 
    pope
end   



function shrink_comp

    float diameter 
    float length  
    float Rm, Cm, Ra
    float dia_mag 
    float length_mag
    
    pushe /cell
    
    dia_mag = {getfield /output/cell_menu/diameter value}
    length_mag = {getfield /output/cell_menu/length value}
    diameter = {dia_mag}*{getfield /cell/soma dia}
    length = {length_mag}*{getfield /cell/soma len}
    Rm = {getfield /cell/soma Rm}
    Cm = {getfield /cell/soma Cm}
    Ra = {getfield /cell/soma Ra}

    setfield /cell/soma dia {diameter} len {length}   
                                              
    Rm = {Rm}/({dia_mag}*{length_mag}) 
    Cm = {Cm}*{dia_mag}*{length_mag}   
    Ra = {Ra}*{length_mag}/({dia_mag}*{dia_mag})
 
    setfield /cell/soma Rm {Rm} Cm {Cm} Ra {Ra}



    int NumComp = 492   
    int i
    

    for( i = 1; i <= {NumComp}; i = i+1 )
        dia_mag = {getfield /output/cell_menu/diameter value}
        length_mag = {getfield /output/cell_menu/length value}
        diameter = {dia_mag}*{getfield /cell/dend[{i}] dia}
        length = {length_mag}*{getfield /cell/dend[{i}] len}
        Rm = {getfield /cell/dend[{i}] Rm}
        Cm = {getfield /cell/dend[{i}] Cm}
        Ra = {getfield /cell/dend[{i}] Ra}

        setfield /cell/dend[{i}] dia {diameter} len {length}


        Rm = {Rm}/({dia_mag}*{length_mag}) 
        Cm = {Cm}*{dia_mag}*{length_mag}   
        Ra = {Ra}*{length_mag}/({dia_mag}*{dia_mag})
        
        setfield /cell/dend[{i}]  Rm {Rm} Cm {Cm} Ra {Ra} 
    end
    echo "Shrinkage is compensated!" 
    pope
end   



function change_soma

    float diameter 
    float length  
    float Rm, Cm, Ra
    float dia_mag
    float length_mag
    pushe /cell
    
    dia_mag = 5 
    length_mag = 1 
    diameter = {dia_mag}*{getfield /cell/soma dia}
    length = {length_mag}*{getfield /cell/soma len}
    Rm = {getfield /cell/soma Rm}
    Cm = {getfield /cell/soma Cm}
    Ra = {getfield /cell/soma Ra}

    setfield /cell/soma dia {diameter} len {length}   
                                              
    Rm = {Rm}/({dia_mag}*{length_mag}) 
    Cm = {Cm}*{dia_mag}*{length_mag}   
//    Ra = {Ra}*{length_mag}/({dia_mag}*{dia_mag})
 
    setfield /cell/soma Rm {Rm} Cm {Cm} Ra {Ra}
    echo "Soma area was changed!"
end


 
//============================================
//   functions used in the add/remove menu
//============================================

function add_cable_plot
  // cable section to plot (numbered from 1)
  int section
  section = ({getfield /output/plot_menu/add value})
  if ({exists /cell/dend[{section-1}]/logtable})
     echo "Plot already exists!"
     return
  end
  if ((section) < 1)
     echo "In our notation, the first cable compartment is #1."
     return
  end

/*  if ((section) = 0)
    pushe /output/somagraphs
    
    
    addmsg /cell/soma/K_tab_chan somaGm_grf PLOT Gk \
        *"soma_"  *blue
    
    addmsg /cell/soma/Kfast_tab_chan somaGm_grf PLOT  Gk \
        *"soma"  *red  
   
    addmsg /cell/soma/D_tab_chan somaGm_grf PLOT  Gk \
        *"soma"  *green   
    pope
    reset
  end        */
     
  if ((section) > 493)
    echo "There are only "493" dendrite compartments!"
  else
    pushe /output/somagraphs
    addmsg /cell/dend[{section}] somaVm_grf PLOT Vm  \
        *"cable_"{section} *blue
    
    addmsg /cell/dend[{section}]/K_tab_chan somaGm_grf PLOT Gk \
        *"cable_"{section}  *blue
    
    addmsg /cell/dend[{section}]/Kfast_tab_chan somaGm_grf PLOT  Gk \
        *"cable_"{section}  *red  
   
    addmsg /cell/dend[{section}]/D_tab_chan somaGm_grf PLOT  Gk \
        *"cable_"{section}  *green   
    pope
    echo "Vm and Gm  plots added for dend compartment #"{section}
    // needed to initialize the table
    reset
  end
end


function remove_cable_plots
  int i, n, nmsg
  int NCableSects
  NCableSects = 492
  for (i = 1; i < {NCableSects}; i = i + 1)
     nmsg = {getmsg /cell/dend[{i}] -outgoing -count}
      for (n = 0; n < nmsg; n = n + 1)
       if ({getmsg /cell/dend[{i}] -outgoing -destination {n}} == "/output/somagraphs/somaVm_grf")
echo deleting message {n}
       deletemsg /cell/dend[{i}]/K_tab_chan 1  -outgoing
       deletemsg /cell/dend[{i}]/Kfast_tab_chan 1  -outgoing
       deletemsg /cell/dend[{i}]/D_tab_chan 1  -outgoing 
       deletemsg /cell/dend[{i}]  {n} -outgoing // should be"PLOT Vm"                  message
        
       break       // bail out of "for" loop - we found the message
       
      end      // if
     end     // for n
     
    
  end  // for i

  setfield /output/plot_menu/add value 0

  reset

  echo "Plotting of Vm for cable compartments disabled."
end



//EOF
