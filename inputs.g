// genesis - inputs2.g - Modified functions used in the Popup menu
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007


//=======================================================================
// makeinputs - the main function to set up injection and synaptic inputs
//=======================================================================

function makeinputs
 
   // Default values of parameters - (global variables defined in Cable.g)
    
    float syndelay	=  0	// msec
    float synwidth =  1000  //1000// choose width and interval to give a single spike
    float syninterval	= 100000
      
    create neutral /input

       //==================================================
       // spike for synaptic input - only a single spike 
       //==================================================
       // pulse to gate spike train
    create pulsegen /input/synpulse
    create spikegen /input/synpulse/spike
    setspikes {syndelay} {synwidth} {syninterval}
// setfield /input/synpulse width1 0.001 delay1 0.02 baselevel 0.0 \
//        level1 1.0 trig_mode 0 width2 0.0 delay2 1 output 1 
    setfield /input/synpulse/spike abs_refract 0.01 output_amp 1 thresh 0.5
    addmsg /input/synpulse /input/synpulse/spike INPUT output
     
       // Lastly, make connection to chemically activated dendrite channel
       // using a SPIKE message
//    set_chan_params {gsyn} {tsyn} {Vsyn}
       
  
   
    // initially, make both injection and synaptic input to the soma

end// makeinputs



//=======================================================
//    functions used in the change synaptic input menu
//=======================================================

function syn_toggle// toggles synaptic input ON/OFF

    if ({getfield /output/synapse_menu/syntoggle state} == 1)
        // ON
        setfield /input/synpulse level1 1.0
        echo "Synaptic Input ON!"
    else
        // OFF
        setfield /input/synpulse level1 0.0
        echo " Synaptic Input OFF!"
    end
end



function set_chan_params( comp_no, gsyn, tsyn, Vsyn )
   int comp_no =  ({getfield /output/synapse_menu/comp_no value})
   str gsyn, tsyn, Vsyn
   
/*  if ({exists /cell/solve})
      delete /cell/solve
  end
*/

   if ((comp_no) <= 0)
      setfield /cell/soma/Ex_chan Ek {Vsyn} 
      setfield /cell/soma/Ex_chan tau1 {tsyn} tau2 {tsyn}
      setfield /cell/soma/Ex_chan gmax {gsyn}
      echo "Soma Ex_chan has changed!"
   else
      setfield /cell/dend[{comp_no}]/Ex_chan Ek {Vsyn}
      setfield /cell/dend[{comp_no}]/Ex_chan tau1 {tsyn} tau2 {tsyn}
      setfield /cell/dend[{comp_no}]/Ex_chan gmax {gsyn}
      echo "dend["{comp_no}"] Ex_chan has changed!"
   end
end


// links channel which computes channel current (channelC2) with compartment
function link_channel2(channel, compartment)
    addmsg {channel} {compartment} CHANNEL Gk Ek
    addmsg {compartment} {channel} VOLTAGE Vm
end


function add_syn_input
   // compartment # for input - #0 = Soma
   int comp_no
   int NCableSects = 492

   comp_no = ({getfield /output/synapse_menu/comp_no value})
   if ((comp_no) > ({NCableSects}))
      echo "There are only "{NCableSects}" cable compartments!"
      return
   end

/*   if ({exists /cell/solve})
       delete /cell/solve
   end
*/
   if ((comp_no) <= 0)   // then input to soma
      
      addmsg /input/synpulse/spike /cell/soma/Ex_chan SPIKE
      setfield /cell/soma/Ex_chan synapse[0].weight 1 synapse[0].delay 0
//      link_channel2 /cell/soma/Ex_chan /cell/soma
      echo "Synaptic input is to the soma"
   else
      addmsg /input/synpulse/spike /cell/dend[{comp_no}]/Ex_chan SPIKE
      setfield /cell/dend[{comp_no}]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
//      link_channel2 /cell/dend[{comp_no}]/Ex_chan /cell/dend[{comp_no }]
      echo "Synaptic input is to dendrite compartment number " {getfield /output/synapse_menu/comp_no value}
   end
      
end




function set_inputs// set parameters for synaptic input from dialog boxes
   float syndelay	=  0	// msec
   float synwidth = 1000// choose width and interval to give a single spike
   float syninterval	= 100000
   int comp_no
   comp_no = ({getfield /output/synapse_menu/comp_no value})
   str dialog = "/output/synapse_menu"

   set_chan_params {comp_no} {getfield {dialog}/gsyn value}  \
        {getfield {dialog}/tsyn value} {getfield {dialog}/vsyn value}
    // after so many changes, we need to reset everything
   reset
  
   echo "Maximum conductance = "{getfield {dialog}/gsyn value}
   echo "Time constant for conductance = "{getfield {dialog}/tsyn value}
   echo "Channel equilibrium potential = "{getfield {dialog}/vsyn value}
end



function remove_synaptic_input 
  int i, n, nmsg
  int NCableSects
  NCableSects = 492
  
 
/*  if ({exists /cell/solve})
      delete /cell/solve
  end
*/

  for (i = 0; i < {NCableSects}; i = i + 1)
     if ( i <= 0 )
      nmsg = {getmsg /cell/soma/Ex_chan -incoming -count}
       for (n = 0; n < nmsg; n = n + 1)
        if ({getmsg /cell/soma/Ex_chan -in -type {n}} == "SPIKE" )
           echo deleting message {n}
           deletemsg /cell/soma/Ex_chan  {n} -incoming
           break         
        end
       end
     else  
      nmsg = {getmsg /cell/dend[{i}]/Ex_chan -incoming -count}
      for (n = 0; n < nmsg; n = n + 1)
       if ({getmsg /cell/dend[{i}]/Ex_chan -in -type {n}} == "SPIKE")
          echo deleting message {n}
          deletemsg /cell/dend[{i}]/Ex_chan  {n} -incoming
          break    
       end      // if
      end     // for n
     end
  end  // for i
  
	if ({exists /LDS/draw/xcell2})
		delete /LDS/draw/xcell2
		
	else 
		echo "/LDS/draw/xcell2 doesn't exist!"
	end

	if ({exists /LDS/draw/xcell3})
		delete /LDS/draw/xcell3
		delete /LDS/draw/xcell4
		delete /LDS/draw/xcell5
		delete /LDS/draw/xcell6
		delete /LDS/draw/xcell7
	else 
		echo "/LDS/draw/xcell3 doesn't exist!"
	end

	if ({exists /LDS/draw/xcell8})
		delete /LDS/draw/xcell8
		delete /LDS/draw/xcell9
		delete /LDS/draw/xcell10
		delete /LDS/draw/xcell11
		delete /LDS/draw/xcell12
	else 
		echo "/LDS/draw/xcell8 doesn't exist!"
	end

	if ({exists /LDS/draw/xcell13})
		delete /LDS/draw/xcell13
		delete /LDS/draw/xcell14
		delete /LDS/draw/xcell15
		delete /LDS/draw/xcell16
		delete /LDS/draw/xcell17
		delete /LDS/draw/xcell18
		delete /LDS/draw/xcell19
		delete /LDS/draw/xcell20
		delete /LDS/draw/xcell21
		delete /LDS/draw/xcell22
		delete /LDS/draw/xcell23
	else
		echo "/LDS/draw/xcell13 dosen't exist!"
	end

	if ({exists /LDS/draw/xcell33})
		delete /LDS/draw/xcell33
		delete /LDS/draw/xcell34
		delete /LDS/draw/xcell35
		delete /LDS/draw/xcell36
		delete /LDS/draw/xcell37
		delete /LDS/draw/xcell38
		delete /LDS/draw/xcell39
		delete /LDS/draw/xcell40
		delete /LDS/draw/xcell41
		delete /LDS/draw/xcell42
		delete /LDS/draw/xcell43
		delete /LDS/draw/xcell44
		delete /LDS/draw/xcell45
		delete /LDS/draw/xcell46
		delete /LDS/draw/xcell47
		delete /LDS/draw/xcell48
		delete /LDS/draw/xcell49
		delete /LDS/draw/xcell50
		delete /LDS/draw/xcell51
		delete /LDS/draw/xcell52
	else
		echo "/LDS/draw/xcell33 dosen't exist!"
	end
  
  echo "Removing all synaptic inputs!"
end  

//=======================================================
//    functions used in the change synaptic input menu
//=======================================================


 
function setspikes(delay, width, interval)

    str pulser = "/input/synpulse"
    str spiker = "/input/synpulse/spike"
    float delay, width, interval, width2
    setfield {pulser} width1 {width} delay1 {delay} baselevel 0.0  \
        trig_mode 0 delay2 100000
    // free run mode with very long delay for 2nd pulse (non-repetitive)
    // level1 is set by the syn_toggle function 
    setfield {spiker} abs_refract {interval} output_amp 1 thresh 0.5
end


function set_input_timing

   str dialog = "/output/synapse_menu"
//   setinjection {getfield {dialog}/delay value}  \
//       {getfield {dialog}/width value}
     setspikes  {getfield {dialog}/delay value}  \
       {getfield {dialog}/width value}  \
       {getfield {dialog}/interval value}

   // set spike amplitudes to 1.0/dt
    echo "Synaptic input delay = "{getfield {dialog}/delay value}
    echo "Synaptic input width = "{getfield {dialog}/width value}
    echo "Synaptic input interval = "{getfield {dialog}/interval value}
end




//EOF
