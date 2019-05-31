//genesis - compartment.g
//                                                                   
//   This file was developed by De Schutter and Beeman
//   and modified by     
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007


/* FUNCTIONS TO MAKE DEFAULT LIBRARY COMPARTMENTS */



function make_cylind_compartment
        // These default compartment parameters can be overridden by readcell
	float RM = 3.3333      // specific membrane resistance  (kiloohms cm^2)
	float CM = 1.0     // specific membrane capacitance (microfarads/cm^2)
	float RA = 0.03          // specific axial resistance (ohms m)
	float EREST_ACT = -70 // resting membrane potential (volts)
	float	len = 100.0e-4  // centimeter
	float	dia = 2.0e-4    // centimeter
	float PI = 3.14159
	float surface = len * dia * PI

	if (!{exists compartment})
		create	compartment compartment
	end
	setfield compartment \
		Cm		{CM * surface} \		// microF
		Ra		{4.0*RA*len / (dia*dia*PI)} \	// kiloohm
		Em  	{EREST_ACT} \			// milliV
		Rm		{RM / surface} \ 		// kiloohm
                dia             {dia} \
		len		{len} \	
		inject		0.0
end

function make_cylind_symcompartment
        // These default compartment parameters can be overridden by readcell
	float RM = 3.3333      // specific membrane resistance (kiloohms cm^2)
	float CM = 1.0      // specific membrane capacitance (microfarads/cm^2)
	float RA = 0.03        // specific axial resistance (kiloohms cm)
	float EREST_ACT = -70 // resting membrane potential (millivolts)
	float	len = 100.0e-4  // centimeter
	float	dia = 2.0e-4    // centimeter
	float PI = 3.14159
	float surface = len * dia * PI

	if (!{exists symcompartment})
		create	symcompartment symcompartment
	end
	setfield symcompartment \
		Cm		{CM * surface} \		// microF
		Ra		{4.0*RA*len / (dia*dia*PI)} \	// kiloohm
		Em  	{EREST_ACT} \			// milliV
		Rm		{RM / surface} \ 		// kiloohm
                dia             {dia} \
		len		{len} \	
		inject		0.0

end

//
/* These functions are included for compatibility with older neurokit
   versions, one does not need to call them anymore though! */

function make_sphere_compartment
        // These default compartment parameters can be overridden by readcell
	float RM = 3.3333     // specific membrane resistance (kiloohms cm^2)
	float CM = 1.0     // specific membrane capacitance (microfarads/cm^2)
	float RA = 0.03          // specific axial resistance (ohms m)
	float EREST_ACT = -70 // resting membrane potential (volts)
	float	dia = 20.0e-4
	float PI = 3.14159
	float surface = dia * dia * PI

	if (!{exists compartment_sphere})
		create	compartment compartment_sphere
	end
	setfield compartment_sphere \
		Cm		{CM * surface} \	// microF
		Ra		{8.0*RA / (dia*PI)} \	// kiloohm
		Em  	        {EREST_ACT} \			// milliV
		Rm		{RM / surface} \ 		// kiloohm
                dia             {dia} \
		len		0.0 \	
		inject		0.0
end

function make_sphere_symcompartment
        // These default compartment parameters can be overridden by readcell
	float RM = 3.3333      // specific membrane resistance (ohms m^2)
	float CM = 1.0     // specific membrane capacitance (microfarads/cm^2)
	float RA = 0.03          // specific axial resistance (ohms m)
	float EREST_ACT = -0.07 // resting membrane potential (volts)
	float	dia = 20.0e-4
	float PI = 3.14159
	float surface = dia * dia * PI

	if (!{exists symcompartment_sphere})
		create	symcompartment symcompartment_sphere
	end
	setfield symcompartment_sphere \
		Cm		{CM * surface} \		// microF
		Ra		{8.0*RA / (dia*PI)} \	// kiloohm
		Em  	        {EREST_ACT} \			// milliV
		Rm		{RM / surface} \ 		// kiloohm
                dia             {dia} \
		len		0.0   \	
		inject		0.0
end

