// genesis - option.g -  Additional functions for synaptic inputs
// This file was developed by
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007




function make_94inputs


	remove_synaptic_input
	

	reset
	

	//#1
	setfield /cell/dend[33]/Ex_chan Ek 0
	setfield /cell/dend[33]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[33]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[33]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsoloverfield /cell/solve /cell/dend[33] red
      //setfield /cell/dend[33]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	
	//#2
	setfield /cell/dend[32]/Ex_chan Ek 0
	setfield /cell/dend[32]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[32]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[32]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsoloverfield /cell/solve /cell/dend[32] red
      //setfield /cell/dend[32]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	
	//#3
	setfield /cell/dend[31]/Ex_chan Ek 0
	setfield /cell/dend[31]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[31]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[31]/Ex_chan SPIKE
      //setfield /cell/dend[31]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	

	//#4
	setfield /cell/dend[30]/Ex_chan Ek 0
	setfield /cell/dend[30]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[30]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[30]/Ex_chan SPIKE
      //setfield /cell/dend[30]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	

	//#5
	setfield /cell/dend[29]/Ex_chan Ek 0
	setfield /cell/dend[29]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[29]/Ex_chan gmax 20e-6

	addmsg /input/synpulse/spike /cell/dend[29]/Ex_chan SPIKE
      //setfield /cell/dend[29]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	

	//#6
	setfield /cell/dend[43]/Ex_chan Ek 0
	setfield /cell/dend[43]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[43]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[43]/Ex_chan SPIKE
      //setfield /cell/dend[43]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#7
	setfield /cell/dend[42]/Ex_chan Ek 0
	setfield /cell/dend[42]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[42]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[42]/Ex_chan SPIKE
      //setfield /cell/dend[42]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#8
	setfield /cell/dend[41]/Ex_chan Ek 0
	setfield /cell/dend[41]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[41]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[41]/Ex_chan SPIKE
	//setfield /cell/dend[41]/Ex_chan synapse[0].weight 1 synapse[0].delay 0



	//#9
	setfield /cell/dend[40]/Ex_chan Ek 0
	setfield /cell/dend[40]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[40]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[40]/Ex_chan SPIKE
      //setfield /cell/dend[40]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#10
	setfield /cell/dend[39]/Ex_chan Ek 0
	setfield /cell/dend[39]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[39]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[39]/Ex_chan SPIKE
      //setfield /cell/dend[39]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#11
	setfield /cell/dend[71]/Ex_chan Ek 0
	setfield /cell/dend[71]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[71]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[71]/Ex_chan SPIKE
      //setfield /cell/dend[71]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#12
	setfield /cell/dend[70]/Ex_chan Ek 0
	setfield /cell/dend[70]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[70]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[70]/Ex_chan SPIKE
      //setfield /cell/dend[70]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#13
	setfield /cell/dend[69]/Ex_chan Ek 0
	setfield /cell/dend[69]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[69]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[69]/Ex_chan SPIKE
      //setfield /cell/dend[69]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#14
	setfield /cell/dend[68]/Ex_chan Ek 0
	setfield /cell/dend[68]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[68]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[68]/Ex_chan SPIKE
      //setfield /cell/dend[68]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#15
	setfield /cell/dend[67]/Ex_chan Ek 0
	setfield /cell/dend[67]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[67]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[67]/Ex_chan SPIKE
      //setfield /cell/dend[67]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#16	
	setfield /cell/dend[66]/Ex_chan Ek 0
	setfield /cell/dend[66]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[66]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[66]/Ex_chan SPIKE
      //setfield /cell/dend[66]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#17
	setfield /cell/dend[77]/Ex_chan Ek 0
	setfield /cell/dend[77]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[77]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[77]/Ex_chan SPIKE
      //setfield /cell/dend[77]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#18
	setfield /cell/dend[76]/Ex_chan Ek 0
	setfield /cell/dend[76]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[76]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[76]/Ex_chan SPIKE
      //setfield /cell/dend[76]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#19
	setfield /cell/dend[75]/Ex_chan Ek 0
	setfield /cell/dend[75]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[75]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[75]/Ex_chan SPIKE
      //setfield /cell/dend[75]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#20
	setfield /cell/dend[74]/Ex_chan Ek 0
	setfield /cell/dend[74]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[74]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[74]/Ex_chan SPIKE
      //setfield /cell/dend[74]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#21
	setfield /cell/dend[73]/Ex_chan Ek 0
	setfield /cell/dend[73]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[73]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[73]/Ex_chan SPIKE
      //setfield /cell/dend[73]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#22
	setfield /cell/dend[60]/Ex_chan Ek 0
	setfield /cell/dend[60]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[60]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[60]/Ex_chan SPIKE
      //setfield /cell/dend[60]/Ex_chan synapse[0].weight 1 synapse[0].delay 0



	//#23
	setfield /cell/dend[59]/Ex_chan Ek 0
	setfield /cell/dend[59]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[59]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[59]/Ex_chan SPIKE
      //setfield /cell/dend[59]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#24
	setfield /cell/dend[58]/Ex_chan Ek 0
	setfield /cell/dend[58]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[58]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[58]/Ex_chan SPIKE
      //setfield /cell/dend[58]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#25
	setfield /cell/dend[57]/Ex_chan Ek 0
	setfield /cell/dend[57]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[57]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[57]/Ex_chan SPIKE
      //setfield /cell/dend[57]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#26
	setfield /cell/dend[56]/Ex_chan Ek 0
	setfield /cell/dend[56]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[56]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[56]/Ex_chan SPIKE
      //setfield /cell/dend[56]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#27
	setfield /cell/dend[310]/Ex_chan Ek 0
	setfield /cell/dend[310]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[310]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[310]/Ex_chan SPIKE
      //setfield /cell/dend[310]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#28
	setfield /cell/dend[309]/Ex_chan Ek 0
	setfield /cell/dend[309]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[309]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[309]/Ex_chan SPIKE
      //setfield /cell/dend[309]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#29
	setfield /cell/dend[308]/Ex_chan Ek 0
	setfield /cell/dend[308]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[308]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[308]/Ex_chan SPIKE
      //setfield /cell/dend[308]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#30
	setfield /cell/dend[307]/Ex_chan Ek 0
	setfield /cell/dend[307]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[307]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[307]/Ex_chan SPIKE
      //setfield /cell/dend[307]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#31
	setfield /cell/dend[306]/Ex_chan Ek 0
	setfield /cell/dend[306]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[306]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[306]/Ex_chan SPIKE
      //setfield /cell/dend[306]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#32
	setfield /cell/dend[328]/Ex_chan Ek 0
	setfield /cell/dend[328]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[328]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[328]/Ex_chan SPIKE
      //setfield /cell/dend[328]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#33
	setfield /cell/dend[327]/Ex_chan Ek 0
	setfield /cell/dend[327]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[327]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[327]/Ex_chan SPIKE
      //setfield /cell/dend[327]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#34
	setfield /cell/dend[326]/Ex_chan Ek 0
	setfield /cell/dend[326]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[326]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[326]/Ex_chan SPIKE
      //setfield /cell/dend[326]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#35
	setfield /cell/dend[325]/Ex_chan Ek 0
	setfield /cell/dend[325]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[325]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[325]/Ex_chan SPIKE
      //setfield /cell/dend[325]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#36
	setfield /cell/dend[324]/Ex_chan Ek 0
	setfield /cell/dend[324]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[324]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[324]/Ex_chan SPIKE
      //setfield /cell/dend[324]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#37
	setfield /cell/dend[334]/Ex_chan Ek 0
	setfield /cell/dend[334]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[334]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[334]/Ex_chan SPIKE
      //setfield /cell/dend[334]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#38
	setfield /cell/dend[333]/Ex_chan Ek 0
	setfield /cell/dend[333]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[333]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[333]/Ex_chan SPIKE
      //setfield /cell/dend[333]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#39	
	setfield /cell/dend[332]/Ex_chan Ek 0
	setfield /cell/dend[332]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[332]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[332]/Ex_chan SPIKE
      //setfield /cell/dend[332]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#40
	setfield /cell/dend[331]/Ex_chan Ek 0
	setfield /cell/dend[331]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[331]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[331]/Ex_chan SPIKE
      //setfield /cell/dend[331]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#41
	setfield /cell/dend[330]/Ex_chan Ek 0
	setfield /cell/dend[330]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[330]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[330]/Ex_chan SPIKE
      //setfield /cell/dend[330]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#42
	setfield /cell/dend[320]/Ex_chan Ek 0
	setfield /cell/dend[320]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[320]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[320]/Ex_chan SPIKE
      //setfield /cell/dend[320]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#43
	setfield /cell/dend[319]/Ex_chan Ek 0
	setfield /cell/dend[319]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[319]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[319]/Ex_chan SPIKE
      //setfield /cell/dend[319]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#44
	setfield /cell/dend[318]/Ex_chan Ek 0
	setfield /cell/dend[318]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[318]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[318]/Ex_chan SPIKE
      //setfield /cell/dend[318]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#45
	setfield /cell/dend[317]/Ex_chan Ek 0
	setfield /cell/dend[317]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[317]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[317]/Ex_chan SPIKE
      //setfield /cell/dend[317]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#46
	setfield /cell/dend[316]/Ex_chan Ek 0
	setfield /cell/dend[316]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[316]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[316]/Ex_chan SPIKE
      //setfield /cell/dend[316]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#47
	setfield /cell/dend[292]/Ex_chan Ek 0
	setfield /cell/dend[292]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[292]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[292]/Ex_chan SPIKE
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#48
	setfield /cell/dend[291]/Ex_chan Ek 0
	setfield /cell/dend[291]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[291]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[291]/Ex_chan SPIKE
      //setfield /cell/dend[291]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#49
	setfield /cell/dend[290]/Ex_chan Ek 0
	setfield /cell/dend[290]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[290]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[290]/Ex_chan SPIKE
	//setfield /cell/dend[290]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
    

	//#50
	setfield /cell/dend[289]/Ex_chan Ek 0
	setfield /cell/dend[289]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[289]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[289]/Ex_chan SPIKE
	//setfield /cell/dend[289]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#51
	setfield /cell/dend[288]/Ex_chan Ek 0
	setfield /cell/dend[288]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[288]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[288]/Ex_chan SPIKE
      //setfield /cell/dend[288]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#52
	setfield /cell/dend[297]/Ex_chan Ek 0
	setfield /cell/dend[297]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[297]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[297]/Ex_chan SPIKE
      //setfield /cell/dend[297]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	
	//#53
	setfield /cell/dend[296]/Ex_chan Ek 0
	setfield /cell/dend[296]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[296]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[296]/Ex_chan SPIKE
      //setfield /cell/dend[296]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#54
	setfield /cell/dend[295]/Ex_chan Ek 0
	setfield /cell/dend[295]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[295]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[295]/Ex_chan SPIKE
      //setfield /cell/dend[295]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#55
	setfield /cell/dend[294]/Ex_chan Ek 0
	setfield /cell/dend[294]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[294]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[294]/Ex_chan SPIKE
      //setfield /cell/dend[294]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#56
	setfield /cell/dend[293]/Ex_chan Ek 0
	setfield /cell/dend[293]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[293]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[293]/Ex_chan SPIKE
      //setfield /cell/dend[293]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#57
	setfield /cell/dend[275]/Ex_chan Ek 0
	setfield /cell/dend[275]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[275]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[275]/Ex_chan SPIKE
      //setfield /cell/dend[275]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#58
	setfield /cell/dend[274]/Ex_chan Ek 0
	setfield /cell/dend[274]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[274]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[274]/Ex_chan SPIKE
      //setfield /cell/dend[274]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#59
	setfield /cell/dend[273]/Ex_chan Ek 0
	setfield /cell/dend[273]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[273]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[273]/Ex_chan SPIKE
      //setfield /cell/dend[273]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#60
	setfield /cell/dend[272]/Ex_chan Ek 0
	setfield /cell/dend[272]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[272]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[272]/Ex_chan SPIKE
      //setfield /cell/dend[272]/Ex_chan synapse[0].weight 1 synapse[0].delay 0

	//#61
	setfield /cell/dend[271]/Ex_chan Ek 0
	setfield /cell/dend[271]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[271]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[271]/Ex_chan SPIKE
      //setfield /cell/dend[271]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#62
	setfield /cell/dend[253]/Ex_chan Ek 0
	setfield /cell/dend[253]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[253]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[253]/Ex_chan SPIKE
      //setfield /cell/dend[253]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#63
	setfield /cell/dend[252]/Ex_chan Ek 0
	setfield /cell/dend[252]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[252]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[252]/Ex_chan SPIKE
      //setfield /cell/dend[252]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#64
	setfield /cell/dend[251]/Ex_chan Ek 0
	setfield /cell/dend[251]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[251]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[251]/Ex_chan SPIKE
      //setfield /cell/dend[251]/Ex_chan synapse[0].weight 1 synapse[0].delay 0



	//#65
	setfield /cell/dend[250]/Ex_chan Ek 0
	setfield /cell/dend[250]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[250]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[250]/Ex_chan SPIKE
      //setfield /cell/dend[250]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#66
	setfield /cell/dend[249]/Ex_chan Ek 0
	setfield /cell/dend[249]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[249]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[249]/Ex_chan SPIKE
      //setfield /cell/dend[249]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#67
	setfield /cell/dend[245]/Ex_chan Ek 0
	setfield /cell/dend[245]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[245]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[245]/Ex_chan SPIKE
      //setfield /cell/dend[245]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#68
	setfield /cell/dend[244]/Ex_chan Ek 0
	setfield /cell/dend[244]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[244]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[244]/Ex_chan SPIKE
      //setfield /cell/dend[244]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#69	
	setfield /cell/dend[243]/Ex_chan Ek 0
	setfield /cell/dend[243]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[243]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[243]/Ex_chan SPIKE
      //setfield /cell/dend[243]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#70
	setfield /cell/dend[242]/Ex_chan Ek 0
	setfield /cell/dend[242]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[242]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[242]/Ex_chan SPIKE
      //setfield /cell/dend[242]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#71
	setfield /cell/dend[241]/Ex_chan Ek 0
	setfield /cell/dend[241]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[241]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[241]/Ex_chan SPIKE
      //setfield /cell/dend[241]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#72
	setfield /cell/dend[236]/Ex_chan Ek 0
	setfield /cell/dend[236]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[236]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[236]/Ex_chan SPIKE
      //setfield /cell/dend[236]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#73
	setfield /cell/dend[235]/Ex_chan Ek 0
	setfield /cell/dend[235]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[235]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[235]/Ex_chan SPIKE
      //setfield /cell/dend[235]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#74
	setfield /cell/dend[234]/Ex_chan Ek 0
	setfield /cell/dend[234]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[234]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[234]/Ex_chan SPIKE
      //setfield /cell/dend[234]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#75
	setfield /cell/dend[233]/Ex_chan Ek 0
	setfield /cell/dend[233]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[233]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[233]/Ex_chan SPIKE
      //setfield /cell/dend[233]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#76
	setfield /cell/dend[114]/Ex_chan Ek 0
	setfield /cell/dend[114]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[114]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[114]/Ex_chan SPIKE
      //setfield /cell/dend[114]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#77
	setfield /cell/dend[113]/Ex_chan Ek 0
	setfield /cell/dend[113]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[113]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[113]/Ex_chan SPIKE
      //setfield /cell/dend[114]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#78
	setfield /cell/dend[112]/Ex_chan Ek 0
	setfield /cell/dend[112]/Ex_chan tau1 1 tau2 1

	setfield /cell/dend[112]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[112]/Ex_chan SPIKE
      //setfield /cell/dend[112]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#79
	setfield /cell/dend[111]/Ex_chan Ek 0
	setfield /cell/dend[111]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[111]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[111]/Ex_chan SPIKE
      //setfield /cell/dend[111]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#80
	setfield /cell/dend[158]/Ex_chan Ek 0
	setfield /cell/dend[158]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[158]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[158]/Ex_chan SPIKE
      //setfield /cell/dend[158]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#81
	setfield /cell/dend[157]/Ex_chan Ek 0
	setfield /cell/dend[157]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[157]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[157]/Ex_chan SPIKE
      //setfield /cell/dend[157]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#82	
	setfield /cell/dend[156]/Ex_chan Ek 0
	setfield /cell/dend[156]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[156]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[156]/Ex_chan SPIKE
      //setfield /cell/dend[156]/Ex_chan synapse[0].weight 1 synapse[0].delay 0, indicated as red compartment on the figure


	//#83
	setfield /cell/dend[155]/Ex_chan Ek 0
	setfield /cell/dend[155]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[155]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[155]/Ex_chan SPIKE
      //setfield /cell/dend[155]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#84
	setfield /cell/dend[154]/Ex_chan Ek 0
	setfield /cell/dend[154]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[154]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[154]/Ex_chan SPIKE
      //setfield /cell/dend[154]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#85
	setfield /cell/dend[153]/Ex_chan Ek 0
	setfield /cell/dend[153]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[153]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[153]/Ex_chan SPIKE
      //setfield /cell/dend[153]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#86
	setfield /cell/dend[152]/Ex_chan Ek 0
	setfield /cell/dend[152]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[152]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[152]/Ex_chan SPIKE
      //setfield /cell/dend[152]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#87
	setfield /cell/dend[151]/Ex_chan Ek 0
	setfield /cell/dend[151]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[151]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[151]/Ex_chan SPIKE
      //setfield /cell/dend[151]/Ex_chan synapse[0].weight 1 synapse[0].delay 0



	//#88
	setfield /cell/dend[177]/Ex_chan Ek 0
	setfield /cell/dend[177]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[177]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[177]/Ex_chan SPIKE
      //setfield /cell/dend[177]/Ex_chan synapse[0].weight 1 synapse[0].delay 10


	//#89
	setfield /cell/dend[176]/Ex_chan Ek 0
	setfield /cell/dend[176]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[176]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[176]/Ex_chan SPIKE
      //setfield /cell/dend[176]/Ex_chan synapse[0].weight 1 synapse[0].delay 0



	//#90
	setfield /cell/dend[175]/Ex_chan Ek 0
	setfield /cell/dend[175]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[175]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[175]/Ex_chan SPIKE
      //setfield /cell/dend[175]/Ex_chan synapse[0].weight 1 synapse[0].delay 0



	//#91
	setfield /cell/dend[174]/Ex_chan Ek 0
	setfield /cell/dend[174]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[174]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[174]/Ex_chan SPIKE
      //setfield /cell/dend[174]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#92
	setfield /cell/dend[173]/Ex_chan Ek 0
	setfield /cell/dend[173]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[173]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[173]/Ex_chan SPIKE
      //setfield /cell/dend[173]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#93
	setfield /cell/dend[144]/Ex_chan Ek 0
	setfield /cell/dend[144]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[144]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[144]/Ex_chan SPIKE
      //setfield /cell/dend[144]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//#94
	setfield /cell/dend[139]/Ex_chan Ek 0
	setfield /cell/dend[139]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[139]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[139]/Ex_chan SPIKE
      //setfield /cell/dend[139]/Ex_chan synapse[0].weight 1 synapse[0].delay 0


	//create xcell /LDS/draw/xcell23 -path /cell/soma[TYPE=compartment] -colmin -80 -colmax 200 -diarange -10
	create xcell /LDS/draw/xcell33 -path /cell/dend[28-33][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell34 -path /cell/dend[38-43][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell35 -path /cell/dend[65-71][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell36 -path /cell/dend[72-77][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell37 -path /cell/dend[55-60][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell38 -path /cell/dend[305-310][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell39 -path /cell/dend[323-328][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell40 -path /cell/dend[329-334][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell41 -path /cell/dend[315-320][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell42 -path /cell/dend[287-292][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1    
	create xcell /LDS/draw/xcell43 -path /cell/dend[292-297][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell44 -path /cell/dend[270-275][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell45 -path /cell/dend[248-253][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell46 -path /cell/dend[240-245][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell47 -path /cell/dend[232-236][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell48 -path /cell/dend[110-114][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell49 -path /cell/dend[150-158][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell50 -path /cell/dend[172-177][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell51 -path /cell/dend[142-144][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell52 -path /cell/dend[137-139][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1

   	reset

	setspikes  10 10 10

	echo "Synaptic inputs are set to 94 dendritic compartments, indicated as red compartments on the figure"

	setfield /output/synapse_menu/syntoggle state 1
	setfield /input/synpulse level1 1.0
	echo "Synaptic Input ON!"
end

	

	
function make_21inputs


	remove_synaptic_input
	

	reset

	
	//#1
	setfield /cell/dend[33]/Ex_chan Ek 0
	setfield /cell/dend[33]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[33]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[33]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[33]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[33] Vm}

	//#2
	setfield /cell/dend[43]/Ex_chan Ek 0
	setfield /cell/dend[43]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[43]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[43]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[43]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[43] Vm}

	//#3
	setfield /cell/dend[71]/Ex_chan Ek 0
	setfield /cell/dend[71]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[71]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[71]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[71]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[71] Vm}

	//#4
	setfield /cell/dend[77]/Ex_chan Ek 0
	setfield /cell/dend[77]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[77]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[77]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[77]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[77] Vm}

	//#5
	setfield /cell/dend[60]/Ex_chan Ek 0
	setfield /cell/dend[60]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[60]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[60]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[60]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[60] Vm}


	//#6
	setfield /cell/dend[310]/Ex_chan Ek 0
	setfield /cell/dend[310]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[310]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[310]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[310]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[310] Vm}


	//#7
	setfield /cell/dend[328]/Ex_chan Ek 0
	setfield /cell/dend[328]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[328]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[328]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[328]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[328] Vm}

	
	//#8
	setfield /cell/dend[334]/Ex_chan Ek 0
	setfield /cell/dend[334]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[334]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[334]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[334]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[334] Vm}

	
	//#9
	setfield /cell/dend[320]/Ex_chan Ek 0
	setfield /cell/dend[320]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[320]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[320]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[320]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[320] Vm}


	//#10
	setfield /cell/dend[292]/Ex_chan Ek 0
	setfield /cell/dend[292]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[292]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[292]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}

	
	//#11
	setfield /cell/dend[297]/Ex_chan Ek 0
	setfield /cell/dend[297]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[297]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[297]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}


	//#12
	setfield /cell/dend[275]/Ex_chan Ek 0
	setfield /cell/dend[275]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[275]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[275]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}

	
	//#13
	setfield /cell/dend[253]/Ex_chan Ek 0
	setfield /cell/dend[253]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[253]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[253]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}

    	
	//#14
	setfield /cell/dend[245]/Ex_chan Ek 0
	setfield /cell/dend[245]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[245]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[245]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}
	

	//#15
	setfield /cell/dend[236]/Ex_chan Ek 0
	setfield /cell/dend[236]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[236]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[236]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}


	//#16
	setfield /cell/dend[114]/Ex_chan Ek 0
	setfield /cell/dend[114]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[114]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[114]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}

	
	//#17
	setfield /cell/dend[158]/Ex_chan Ek 0
	setfield /cell/dend[158]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[158]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[158]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm


	//#18
	setfield /cell/dend[154]/Ex_chan Ek 0
	setfield /cell/dend[154]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[154]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[154]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm

	
	//#19
	setfield /cell/dend[177]/Ex_chan Ek 0
	setfield /cell/dend[177]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[177]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[177]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm

	
	//#20
	setfield /cell/dend[144]/Ex_chan Ek 0
	setfield /cell/dend[144]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[144]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[144]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm


	//#21
	setfield /cell/dend[139]/Ex_chan Ek 0
	setfield /cell/dend[139]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[139]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[139]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm


	
	create xcell /LDS/draw/xcell3 -path /cell/dend[32-33][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell4 -path /cell/dend[42-43][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell5 -path /cell/dend[70-71][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell6 -path /cell/dend[76-77][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell7 -path /cell/dend[59-60][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell8 -path /cell/dend[309-310][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell9 -path /cell/dend[327-328][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell10 -path /cell/dend[333-334][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell11 -path /cell/dend[319-320][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell12 -path /cell/dend[291-292][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell13 -path /cell/dend[296-297][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell14 -path /cell/dend[274-275][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell15 -path /cell/dend[252-253][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell16 -path /cell/dend[244-245][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell17 -path /cell/dend[235-236][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell18 -path /cell/dend[113-114][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell19 -path /cell/dend[157-158][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell20 -path /cell/dend[153-154][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell21 -path /cell/dend[176-177][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell22 -path /cell/dend[143-144][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1
	create xcell /LDS/draw/xcell23 -path /cell/dend[138-139][TYPE=compartment] -colmin -100 -colmax 50 -diarange -1

   	reset

	setspikes  10 10 10

	echo "Synaptic inputs are set to 21 dendritic compartments, indicated as red compartments on the figure"

	setfield /output/synapse_menu/syntoggle state 1
	setfield /input/synpulse level1 1.0
	echo "Synaptic Input ON!"
end


function make_10inputs
	
	remove_synaptic_input
	

	reset
	
	//#1
	setfield /cell/dend[33]/Ex_chan Ek 0
	setfield /cell/dend[33]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[33]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[33]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[33]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[33] Vm}

	//#2
	setfield /cell/dend[43]/Ex_chan Ek 0
	setfield /cell/dend[43]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[43]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[43]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[43]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[43] Vm}

	//#3
	setfield /cell/dend[71]/Ex_chan Ek 0
	setfield /cell/dend[71]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[71]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[71]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[71]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[71] Vm}

	//#4
	setfield /cell/dend[77]/Ex_chan Ek 0
	setfield /cell/dend[77]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[77]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[77]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[77]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[77] Vm}

	//#5
	setfield /cell/dend[60]/Ex_chan Ek 0
	setfield /cell/dend[60]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[60]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[60]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[60]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[60] Vm}


	//#6
	setfield /cell/dend[310]/Ex_chan Ek 0
	setfield /cell/dend[310]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[310]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[310]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[310]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[310] Vm}


	//#7
	setfield /cell/dend[328]/Ex_chan Ek 0
	setfield /cell/dend[328]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[328]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[328]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[328]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[328] Vm}

	
	//#8
	setfield /cell/dend[334]/Ex_chan Ek 0
	setfield /cell/dend[334]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[334]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[334]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[334]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[334] Vm}

	
	//#9
	setfield /cell/dend[320]/Ex_chan Ek 0
	setfield /cell/dend[320]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[320]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[320]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[320]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[320] Vm}


	//#10
	setfield /cell/dend[292]/Ex_chan Ek 0
	setfield /cell/dend[292]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[292]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[292]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[292]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[292] Vm}



    	
	
	create xcell /LDS/draw/xcell3 -path /cell/dend[32-33][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell4 -path /cell/dend[42-43][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell5 -path /cell/dend[70-71][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell6 -path /cell/dend[76-77][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell7 -path /cell/dend[59-60][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell8 -path /cell/dend[309-310][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell9 -path /cell/dend[327-328][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell10 -path /cell/dend[333-334][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell11 -path /cell/dend[319-320][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell12 -path /cell/dend[291-292][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10


   	reset

	setspikes  10 10 10

	echo "Synaptic inputs are set to 10 dendritic compartments, indicated as red compartments on the figure"

	setfield /output/synapse_menu/syntoggle state 1
	setfield /input/synpulse level1 1.0
	echo "Synaptic Input ON!"
end




function make_5inputs


	remove_synaptic_input
	

	reset


	
	//#1
	setfield /cell/dend[33]/Ex_chan Ek 0
	setfield /cell/dend[33]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[33]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[33]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[33]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[33] Vm}

	//#2
	setfield /cell/dend[43]/Ex_chan Ek 0
	setfield /cell/dend[43]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[43]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[43]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[43]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[43] Vm}

	//#3
	setfield /cell/dend[71]/Ex_chan Ek 0
	setfield /cell/dend[71]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[71]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[71]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[71]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[71] Vm}

	//#4
	setfield /cell/dend[77]/Ex_chan Ek 0
	setfield /cell/dend[77]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[77]/Ex_chan gmax 20E-6
	addmsg /input/synpulse/spike /cell/dend[77]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[77]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[77] Vm}

	//#5
	setfield /cell/dend[60]/Ex_chan Ek 0
	setfield /cell/dend[60]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[60]/Ex_chan gmax 20e-6
	addmsg /input/synpulse/spike /cell/dend[60]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[60]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[60] Vm}


	


    	
	
	create xcell /LDS/draw/xcell3 -path /cell/dend[32-33][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell4 -path /cell/dend[42-43][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell5 -path /cell/dend[70-71][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell6 -path /cell/dend[76-77][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	create xcell /LDS/draw/xcell7 -path /cell/dend[59-60][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	
   	reset

	setspikes  10 10 10

	echo "Synaptic inputs are set to 5 dendritic compartments, indicated as red compartments on the figure"

	setfield /output/synapse_menu/syntoggle state 1
	setfield /input/synpulse level1 1.0
	echo "Synaptic Input ON!"
end


function make_1input
	

	remove_synaptic_input
	

	reset


	
	//#1
	setfield /cell/dend[60]/Ex_chan Ek 0
	setfield /cell/dend[60]/Ex_chan tau1 1 tau2 1
	setfield /cell/dend[60]/Ex_chan gmax 45e-6
	addmsg /input/synpulse/spike /cell/dend[60]/Ex_chan SPIKE
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR *red
      //setfield /cell/dend[60]/Ex_chan synapse[0].weight 1 synapse[0].delay 0
	//addmsg /cell/solve /LDS/draw/xcell1 COLOR {findsolvefield /cell/solve /cell/dend[60] Vm}


	


    	
	
	
	create xcell /LDS/draw/xcell2 -path /cell/dend[59-60][TYPE=compartment] -colmin -100 -colmax 50 -diarange -10
	
   	reset

	setspikes  10 10 10

	echo "Synaptic inputs are set to 1 dendritic compartment, indicated as a red compartment on the figure"

	setfield /output/synapse_menu/syntoggle state 1
	setfield /input/synpulse level1 1.0
	echo "Synaptic Input ON!"
end









//EOF














































	















	








