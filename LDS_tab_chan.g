//genesis 2.1 - LDS_tab_chan.g
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007 

/* FILE INFORMATION
** tabchannel implementation of LDS cell dendrititic voltage-dependent
** channels, according to :
** A.Takashima and M.Takahata(2000), 
**
** This file depends on functions and constants defined in library.g
*/

// CONSTANTS
float EREST_ACT = -60 /* LDS cell resting potl in mV */
float EK = -70
float Eex = 0.0
float Einh = -70
float SOMA_A = 1e-4		/* Square centimeters */
float Ek                         // milliVolts
float tau1 = 1.0 
float tau2 = 1.0                // msec
float gmax = 3.0e-6                      // milliSimens (1/kiloohms)

int EXPONENTIAL =   1
int SIGMOID     =   2
int LINOID      =   3


//========================================================================
//                       Delayed-rectifier K CHANNEL 
//========================================================================

function make_K_tab_chan
	if ({exists K_tab_chan})
		returnZpower               = 0

	end
	
	create		tabchannel	K_tab_chan

    	setfield K_tab_chan \
		Ek 		{EK} \				// mV
		Gbar		{360.0*SOMA_A} \		// mS
		Xpower		4 \
		Ypower		0 
               
                                                                  
                setupalpha K_tab_chan X 0.46 0 1 28 -11  \
                    0.003 0 0 0 15 -range -100 50 

		         		
end

//========================================================================


//========================================================================
//                       transient outward CHANNEL 
//========================================================================


function make_Kfast_tab_chan
	if ({exists Kfast_tab_chan})
		return
	end
	
	create		tabchannel	Kfast_tab_chan
    	setfield Kfast_tab_chan \
		Ek 		{EK} \				// mV
		Gbar		{360.0*SOMA_A} \		// mS
		Xpower		4 \
		Ypower		1 
                 

        setupalpha Kfast_tab_chan X 2.438 0 1 33 -6 \
            0.062 0 0 0 21  -range -100 50
         
        setupalpha Kfast_tab_chan Y 0.121 0 0 0 19 \
            2.6 0 1 0 -12 -range -100 50
 
end

//========================================================================


//========================================================================
//                       D-current like outward CHANNEL 
//========================================================================


function make_D_tab_chan
	if ({exists D_tab_chan})
		return
	end
	
	create		tabchannel	D_tab_chan
    	setfield D_tab_chan \
		Ek 		{EK} \				// mV
		Gbar		{360.0*SOMA_A} \		// mS
		Xpower		1  \
		Ypower		1  
                 
 
        setupalpha D_tab_chan X 0.49 0 1 31 -5 \
            0.02 0 0 0 41  -range -100 50 

        setupalpha D_tab_chan Y 0.00003 0 0 0 10 \
            0.011 0 1 17 -11  -range -100 50
		 
end

//========================================================================




//========================================================================
//                      Excitatory  Synaptic Channel 
//========================================================================

function make_Ex_chan
    if ({exists Ex_chan})
		return
    end

    create     synchan               Ex_chan
    setfield  Ex_chan  \
              Ek              {Eex}   \
              tau1            {tau1} \
              tau2            {tau2} \
              gmax            {gmax}
end


//========================================================================



//========================================================================
//                      Inhibitory  Synaptic Channel 
//========================================================================

function make_Inh_chan
    if ({exists Inh_chan})
		return
    end

    create     synchan               Inh_chan
    setfield  Inh_chan  \
              Ek              {Einh}   \
              tau1            {tau1} \
              tau2            {tau2} \
              gmax            {gmax}
end


//========================================================================


//EOF
