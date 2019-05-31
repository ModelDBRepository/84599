//genesis
//
// $Id: xcell.g 1.1.1.6.1.5.2.6.1.1.2.1.2.2.1.2 Thu, 04 Apr 2002 12:35:02 +0200 hugo $
//

//////////////////////////////////////////////////////////////////////////////
//'
//' LDS tutorial
//'
//' (C) 1998-2002 BBF-UIA
//'
//' see our site at http://www.bbf.uia.ac.be/ for more information regarding
//' the Purkinje cell and genesis simulation software.
//'
//'
//' functional ideas ... Erik De Schutter, erik@bbf.uia.ac.be
//' genesis coding ..... Hugo Cornelis, hugo@bbf.uia.ac.be
//'
//' general feedback ... Reinoud Maex, Erik De Schutter
//'
//////////////////////////////////////////////////////////////////////////////


// xcell.g : xcell functionality



//v bool to indicate first toggle for tabchannel has been created

int bButtonsCreated = 0

//v bool for communication between XCellAddElectrode and XCellCBAddPlot

int bXCellAddElectrodeResult = 0

//v basename for library file of all channels

str strXCLibrary = "XCLib"


///
/// SH:	XCellElectrodeName
///
/// PA:	path..:	path to the clicked compartment
///
/// RE:	name for electrode
///
/// DE:	Associate an electrode name with {path} for registered xcell parameters
///	The electrode name will have a fairly descriptive name (ie from the 
///	electrode name you can make out which field from which compartment is
///	recorded.
///

function XCellElectrodeName(path)

str path

	//- get the registered LDS output source

	str xcOutputSource = {getfield /LDS outputSource}

	//- get the registered LDS output value

	str xcOutputValue =  {getfield /LDS outputValue}

	//- get the registered LDS output flags

	int xcOutputFlags = 1 // {getfield /LDS outputFlags}

	//- get the electrode name

	str electrode = {XGraphPlotTitle \
				{path} \
				{xcOutputSource} \
				{xcOutputValue} \
				{xcOutputFlags}}

	//- return electrode name

	return {electrode}
end


///
/// SH:	XCellAddElectrode
///
/// PA:	path..:	path to the clicked compartment
///	name..:	name for electrode
///	color.:	color for the electrode
///
/// RE:	1 if successfull
///	0 if failed (the electrode already exists)
///
/// DE:	Associate an electrode with {path} for registered xcell parameters
///
/// Electrode prototype is /electrodes/draw/proto {xshape}
///
/// The electrode is created within 
///	/electrodes/draw/{name}.......:	always
///	/LDS/draw/{name}............:	when electrodes visible
///					in xcell display
///

function XCellAddElectrode(path,name,color)

str path
str name
int color

	//- set default result

	int bResult = 0

	//- give diagnostics

	echo "Adding electrode for "{name}

	//- copy the prototype electrode

	copy /electrodes/draw/proto /electrodes/draw/{name}

	//- set field for identification and color

	setfield ^ \
		ident "record" \
		pixcolor {color}

	//- set the translation of the electrode

	setfield ^ \
		tx {getfield {path} x} \
		ty {getfield {path} y} \
		tz {getfield {path} z}

	//- if the electrodes toggle is set

	if ( {getfield /LDS/electrodes state} )

		//- copy the electrode to the xcell window

		copy ^ /LDS/draw/{name}
	end

	//- set success

	bResult = 1

	//- set the result in a global

	bXCellAddElectrodeResult = {bResult}

	//- return result

	return {bResult}
end


///
/// SH:	XCellPrepareElectrodes
///
/// DE:	Prepare electrodes
///

function XCellPrepareElectrodes

	//- create a container

	create xform /electrodes

	//- disable the form

	disable ^

	//- create a draw

	create xdraw /electrodes/draw

	//- create an electrode prototype shape

	create xshape /electrodes/draw/proto \
		-linewidth 1 \
		-textmode nodraw \
		-pixcolor red \
		-coords [-20e-4,-40e-4,45e-4][0,0,0][-10e-4,-40e-4,50e-4][-15e-4,-40e-4,45e-4][-20e-4,-40e-4,75e-4][-30e-4,-40e-4,100e-4]

	//- add a field for identification

	addfield ^ \
		ident -description "Identification"

	//- set the field

	setfield ^ \
		ident "prototype"
end


///
/// SH:	XCellRemoveElectrode
///
/// PA:	path..:	path to the clicked compartment
///
/// DE:	Remove the electrode associated with {path}
///

function XCellRemoveElectrode(path)

str path

	//- get the registered LDS output source

	str xcOutputSource = {getfield /LDS outputSource}

	//- get the registered LDS output value

	str xcOutputValue = {getfield /LDS outputValue}

	//- get the registered LDS output flags

	int xcOutputFlags = {getfield /LDS outputFlags}

	//- get the electrode title

	str plotTitle = {XGraphPlotTitle \
				{path} \
				{xcOutputSource} \
				{xcOutputValue} \
				{xcOutputFlags}}

	//- if the electrode exists

	if ( {exists /electrodes/draw/{plotTitle}} )

		//- give diagnostics

		echo "Removing electrode "{plotTitle}

		//- remove the electrode

		delete /electrodes/draw/{plotTitle}

		//- if the electrodes toggle is set

		if ( {getfield /LDS/electrodes state} )

			//- delete the electrode from the xcell window

			delete /LDS/draw/{plotTitle}

			//- update the draw widget

			//xflushevents
			xupdate /LDS/draw

			//! to get around a bug that does not update 
			//! the deleted electrodes :
			//! hide and show the parent form

			xhide /LDS
			xshow /LDS
		end

	//- else

	else
		//- give diagnostics

		echo "No electrode named "{plotTitle}
	end
end


///
/// SH:	XCellRemoveElectrodes
///
/// DE:	Remove all electrodes
///

function XCellRemoveElectrodes

	//- give diagnostics

	echo "Removing all electrodes"

	//- loop over all registered electrode

	str electr

	foreach electr ( {el /electrodes/draw/#[][ident=record]} )

		//! because of a bug in the wildcard parsing
		//! we can stil get the prototype here.
		//! we must check this by name of the element

		//- if it is not the prototype

		if ( {getpath {electr} -tail} != "proto" )

			//- delete the electrode to the xcell window

			delete {electr}
		end
	end

	//- update the state of the electrodes

	callfunc XCellSetupElectrodes {getfield /LDS/electrodes state}
end


///
/// SH:	XCellSetupElectrodes
///
/// PA:	state.:	0 if electrodes should be invisible
///		1 if electrodes should be visible
///
/// DE:	Show/hide the electrodes
///

function XCellSetupElectrodes(state)

int state

	//- loop over all electrodes in the xcell window

	str electr

	foreach electr ( {el /LDS/draw/#[][ident=record]} )

		//- remove the electrode

		delete {electr}
	end

	//- if the electrodes should be visible

	if (state)

		//- give diagnostics

		echo "Showing electrodes"

		//- loop over all registered electrode

		foreach electr ( {el /electrodes/draw/#[][ident=record]} )

			//- get the tail of the name

			str tail = {getpath {electr} -tail}

			//! because of a bug in the wildcard parsing
			//! we can stil get the prototype here.
			//! we must check this by name of the element

			if ( {tail} != "proto" )

				//- copy the electrode to the xcell window

				copy {electr} /LDS/draw/{tail}
			end
		end

	//- else

	else

		//- give diagnostics

		echo "Hiding electrodes"
	end

	//- update the draw widget

	xflushevents
	xupdate /LDS/draw

	//! to get around a bug that does not update the deleted electrodes :
	//! hide and show the parent form
	//! for some reason it is not necessary here, but it is above 
	//! (removal of electrodes).

//	xhide /LDS
//	xshow /LDS
end


///
/// SH:	XCellSetupGraph
///
/// PA:	state.:	0 if graph should be invisible
///		1 if graph should be visible
///
/// DE:	Show/hide the graph
///

function XCellSetupGraph(state)

int state

	//- if the graph should be visible

	if (state)

		//- show the graph

		xshow /xgraphs

	//- else

	else
		//- hide the graph

		xhide /xgraphs
	end
end


///
/// SH:	XCellSwitchChanMode
///
/// PA:	state.:	0 for absolute chanmode (chanmode 4)
///		1 for normalized chanmode (chanmode 5)
///
/// DE:	Switch between normalized and absolute channel mode
///	Sets the solver in {cellpath}/solve in chanmode 4 or 5.
///	Sets the min/max color values for the xcell display
///	Notifies graph for new chanmode
///

/*function XCellSwitchChanMode(state)

int state

	//- if state is not zero

	if (state)

		//- switch to chanmode 5

		iChanMode = 5

		setfield {cellpath}/solve \
			chanmode {iChanMode}

	//- else

	else
		//- switch to chanmode 4

		iChanMode = 4

		setfield {cellpath}/solve \
			chanmode {iChanMode}
	end

	//- get name for boundary element

	str bound = {BoundElementName \
			{getfield /LDS outputSource} \
			{getfield /LDS outputValue} \
			{iChanMode}}

	//- set field for boundaries

	setfield /LDS \
		boundElement {bound}

	//- set new boundaries from element

	callfunc XCellSetBoundaries {bound}

	//- notify graph new chanmode

	XGraphSwitchChanMode {state}
end
*/

///
/// SH:	XCellDeleteMessages
///
/// DE:	Delete the messages from the xcell
///	If no messages are setup, none will be deleted and the function
///	will cleanly return.
///

function XCellDeleteMessages

	//- count the number of incoming messages

	int iCount = {getmsg /LDS/draw/xcell1 -incoming -count}

	//- if the count is not zero

	if (iCount)

		//- retreive the number of elements from the config

		int iElements = {getfield /config xCellElements}

		//- loop for the number of elements / messages

		int i

		for (i = 0; i < iElements; i = i + 1)

			//- delete the first message

			deletemsg /LDS/draw/xcell1 {0} -incoming
		end
	end
end


///
/// SH:	XCellSetupMessages
///
/// PA:	source:	message source in {cellpath}
///	value.:	message value within {source}
///
/// DE:	Setup the messages between the solver and xcell
///	The solver is assumed to be {cellpath}/solve .
///

function XCellSetupMessages(source,value)

str source
str value

	//- retreive the wildcard from the config file

	str wPath = "/cell/soma[TYPE=compartment],/cell/dend[][TYPE=compartment]"     //{getfield /config xCellPath}

	//- give diagnostics

	echo "Setting up messages to LDS for "{source}", "{value}

	str element
//
//	foreach element ( { el { wPath } } )

//		if ( {exists {element}/{source}} )

//			echo Exists : {element}/{source}

//		else

//			echo Non existent : {element}/{source}
//		end
//		break
//	end

	//- loop over all elements in the xcell object

	str element

	foreach element ( { el { wPath } } )

		//- if the source elements exists

		if ( {exists {element}/{source}} )

			//echo Exists : {element}/{source}

			//- find solve field and add the message

			addmsg /cell/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{element}/{source} \
					{value}}

		//- else the element does not exist

		else

			//echo Non existent : {element}/{source}

			//- add a dummy message

			addmsg /config /LDS/draw/xcell1 COLOR z
		end
	end

	//- set number of compartments in the xcell object

	setfield /LDS/draw/xcell1 \
		nfield {getfield /config xCellElements}

	//- give diagnostics

	echo "Messages to LDS ok."
end


///
/// SH:	XCellSetupCompMessages
///
/// PA:	source:	message source in {cellpath} (not used)
///	value.:	message value within {source}
///
/// DE:	Setup the messages between the solver and xcell for compartments
///	The solver is assumed to be {cellpath}/solve .
///

function XCellSetupCompMessages(source,value)

str source
str value 

	//- retreive the wildcard from the config file

	str wPath = "/cell/soma[TYPE=compartment],/cell/dend[][TYPE=compartment]"    //{getfield /config xCellPath}

	//- give diagnostics

	echo "Setting up messages to LDS for (compartments), "{value}

	//- loop over all elements in the xcell object

	str element

	foreach element ( { el { wPath } } )

		//- if the source elements exists

		if ( {exists {element}} )

			//echo Exists : {element}

			//- find solve field and add the message

			addmsg /cell/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					/cell/solve \
					{element} \
					{value}}

		//- else the element does not exist

		else

			//echo Non existent : {element}

			//- add a dummy message

			addmsg /config /LDS/draw/xcell1 COLOR z
		end
	end

	//- set number of compartments in the xcell object

	setfield /LDS/draw/xcell1  nfield  493
		  //{getfield /config xCellElements}

	//- give diagnostics

	echo "Messages to LDS ok."
end


///
/// SH:	XCellSetupExcIGEMessages
///
/// PA:	source:	message source in {cellpath}
///	value.:	message value within {source}
///
/// DE:	Setup the messages between the solver and xcell
///	The solver is assumed to be {cellpath}/solve .
///

/*function XCellSetupExcIGEMessages(source,value)

str source
str value

	//- retreive the wildcard from the config file

	str wPath = {getfield /config xCellPath}

	//- give diagnostics

	echo "Setting up messages to xcell for " \
		{source}", "{value}

	//- loop over all elements in the xcell object

	str element

	foreach element ( { el { wPath } } )

		//- get the spine that gives messages to the element

		str spine = {getmsg {element} -outgoing -destination 7}

		//- get tail of spine

		str spineTail = {getpath {spine} -tail}

		//- get head of spine for use with solver's flat space

		str spineHead = {getpath {spine} -head}

		//- if we are handling a spine

		if ( {strncmp {spineTail} "spine" 5} == 0 )

			//- default index is zero

			source = "head[0]/par"

			//- if an index is available

			if ( {strlen {spineTail}} != 5 )

				//- get index of synapse

				int synapseIndex \
					= {substring \
						{spineTail} \
						6 \
						{{strlen {spineTail}} - 1}}

				//- make source string with index

				source = "head[" @ {synapseIndex} @ "]/par"
			end

			//- find solve field and add the message

			addmsg {cellpath}/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{spineHead}{source} \
					{value}}

		//- else if we can find a climbing fiber input

		elif ( {exists {element}/climb } )

			//- find solve field and add the message

			addmsg {cellpath}/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{element}/climb \
					{value}}

		//- else the element does not exist

		else
			//- add a dummy message

			addmsg /config /LDS/draw/xcell1 COLOR z
		end
	end

	//- set number of compartments in the xcell object

	setfield /LDS/draw/xcell1 \
		nfield {getfield /config xCellElements}

	//- give diagnostics

	echo "Messages to LDS ok."
end
*/

///
/// SH:	XCellSetupInhIGEMessages
///
/// PA:	source:	message source in {cellpath}
///	value.:	message value within {source}
///
/// DE:	Setup the messages between the solver and xcell
///	The solver is assumed to be {cellpath}/solve .
///

/*function XCellSetupInhIGEMessages(source,value)

str source
str value

	//- retreive the wildcard from the config file

	str wPath = {getfield /config xCellPath}

	//- give diagnostics

	echo "Setting up messages to xcell for " \
		{source}", "{value}

	//- loop over all elements in the xcell object

	str element

	foreach element ( { el { wPath } } )

		//- if we are handling a stellate cell

		if ( {exists {element}/stell} )

			//- find solve field and add the message

			addmsg {cellpath}/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{element}/stell \
					{value}}

		//- else if we can find a stellate 1 cell

		elif ( {exists {element}/stell1 } )

			//- find solve field and add the message

			addmsg {cellpath}/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{element}/stell1 \
					{value}}

		//- else if we can find a basket cell

		elif ( {exists {element}/basket } )

			//- find solve field and add the message

			addmsg {cellpath}/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{element}/basket \
					{value}}

		//- else no inhibitory channel exists

		else
			//- add a dummy message

			addmsg /config /LDS/draw/xcell1 COLOR z
		end
	end

	//- set number of compartments in the xcell object

	setfield /LDS/draw/xcell1 \
		nfield {getfield /config xCellElements}

	//- give diagnostics

	echo "Messages to LDS ok."
end
*/

///
/// SH:	XCellSetupSpineVmMessages
///
/// PA:	source:	message source in {cellpath}
///	value.:	message value within {source}
///
/// DE:	Setup the messages between the solver and xcell
///	The solver is assumed to be {cellpath}/solve .
///

/*function XCellSetupSpineVmMessages(source,value)

str source
str value

	//- retreive the wildcard from the config file

	str wPath = {getfield /config xCellPath}

	//- give diagnostics

	echo "Setting up spine compartment messages to LDS for " \
		{source}", "{value}

	//- loop over all elements in the xcell object

	str element

	foreach element ( { el { wPath } } )

		//- get the spine that gives messages to the element

		str spine = {getmsg {element} -outgoing -destination 7}

		//- get tail of spine

		str spineTail = {getpath {spine} -tail}

		//- get head of spine for use with solver's flat space

		str spineHead = {getpath {spine} -head}

		//- if we are handling a spine

		if ( {strncmp {spineTail} "spine" 5} == 0 )

			//- default index is zero

			source = "head[0]"

			//- if an index is available

			if ( {strlen {spineTail}} != 5 )

				//- get index of synapse

				int synapseIndex \
					= {substring \
						{spineTail} \
						6 \
						{{strlen {spineTail}} - 1}}

				//- make source string with index

				source = "head[" @ {synapseIndex} @ "]"
			end

			//echo {spineHead}{source} {value}

			//- find solve field and add the message

			addmsg {cellpath}/solve /LDS/draw/xcell1 \
				COLOR {findsolvefield \
					{cellpath}/solve \
					{spineHead}{source} \
					{value}}

		//- else the element does not exist

		else
			//- add a dummy message

			addmsg /config /LDS/draw/xcell1 COLOR z
		end
	end

	//- set number of compartments in the xcell object

	setfield /LDS/draw/xcell1 \
		nfield {getfield /config xCellElements}

	//- give diagnostics

	echo "Messages to xcell ok."
end
*/

///
/// SH:	XCellSetupButtons
///
/// PA:	widget:	name of toggled widget
///	mode..:	output mode of xcell
///		1	comp. Vm
///		2	channel with IGE
///		3	excitatory channel with IGE
///		4	spine comp. Vm
///		5	nernst E
///		6	Calcium concen Ca
/// 		7	inhibitory channel with IGE
///
/// DE:	Display the buttons according to the output mode
///

/*function XCellSetupButtons(widget,mode)

str widget
int mode

	//echo setupbuttons : {widget} {mode}

	//- set the heading for the xcell form

	setfield /LDS/heading \
		title {getfield /LDS outputDescription}

	//- comp. Vm
	//- or spine comp. Vm
	//- or nernst E
	//- or Calcium concen Ca

	if (mode == 1 || mode == 4 || mode == 5 || mode == 6)

		//- hide I,G toggles

		xhide /LDS/Ik
		xhide /LDS/Gk

		//- show I,G labels

		xshow /LDS/noIk
		xshow /LDS/noGk

		//- show E label

		xhide /LDS/Ek
		xshow /LDS/noEk

	//- channel with IGE
	//- or excitatory channel with IGE
	//- or inhibitory channel with IGE

	elif (mode == 2 || mode == 3 || mode == 7)

		//- hide I,G labels

		xhide /LDS/noIk
		xhide /LDS/noGk

		//- show I,G toggles

		xshow /LDS/Ik
		xshow /LDS/Gk

		//- get widget tail

		str channel = {getpath {widget} -tail}

		//- for a calcium channel

		if ( {channel} == "CaP" || {channel} == "CaT")

			//- show Ek toggle

			xhide /LDS/noEk
			xshow /LDS/Ek

		//- else 

		else
			//- hide Ek toggle

			xshow /LDS/noEk
			xhide /LDS/Ek
		end

	//- else there is something wrong

	else
		//- give diagnostics

		echo "XCellSetupButtons : Wrong output mode for XCell"
	end

	//- loop over all toggle buttons in the xcell

	str toggle

	foreach toggle ( {el /LDS/#[][TYPE=xtoggle]} )

		//- isolate the tail

		str toggleTail = {getpath {toggle} -tail}

		//- if the toggle is not for graph, 
		//-	electrodes or abs/norm output

		if (toggleTail != "graph" \
			&& toggleTail != "electrodes" \
			&& toggleTail != "chanmode")

			//- unset the toggle

			setfield {toggle} \
				state 0
		end
	end

	//- set the toggle that has been pressed

	setfield {widget} \
		state 1

	//- set the toggle for the channel mode

//	setfield /LDS/{getfield /LDS channelMode} \
//		state 1

end
*/

///
/// SH:	XCellSetOutput
///
/// PA:	widget:	name of toggled widget
///
/// RE: output mode
///	1	comp. Vm
///	2	channel with IGE
///	3	excitatory channel with IGE
///	4	spine comp. Vm
///	5	nernst E
///	6	Calcium concen Ca
///	7	inhibitory channel with IGE
///
/// DE:	Setup messages for update of xcell, setup buttons, do a reset
///

/*function XCellSetOutput(widget)

str widget

	//- set the field for output

	setfield /LDS \
		output {widget}

	//- delete all messages from the xcell

	XCellDeleteMessages

	//- default we should not continue

	int bContinue = 0

	//v strings for construction of messages

	str msgSource
	str msgValue
	str msgDescription

	//= mode for setting up buttons
	//=
	//= 1	comp. Vm
	//= 2	channel with IGE
	//= 3	excitatory channel with IGE
	//= 4	spine comp. Vm
	//= 5	nernst E
	//= 6	Calcium concen Ca
	//= 7	inhibitory channel with IGE

	int flButtons = 0

	//- get the parameter attribute for the widget

	str parameters = {getfield {widget} parameters}

	//- if we are dealing with compartments

	if (parameters == "Vm")

		//- the description is compartmental voltage

		msgDescription = "Compartmental voltage"

		//- the source is empty

		msgSource = ""

		//- the value is Vm

		msgValue = "Vm"

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 1

	//- if we are dealing with spine compartments

	elif (parameters == "spineVm")

		//- the description is spiny voltage

		msgDescription = "Spiny voltage"

		//- the source is the head of the spine

		msgSource = "head"

		//- the value is Vm

		msgValue = "Vm"

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 4

	//- if we are dealing with nernst

	elif (parameters == "E")

		//- the description is Nernst

		msgDescription = "Nernst"

		//- the source is Ca_nernst

		msgSource = "Ca_nernst"

		//- the value is E

		msgValue = "E"

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 5

	//- if we are dealing with concentration

	elif (parameters == "Ca")

		//- the description is compartmental Ca conc.

		msgDescription = "Compartmental [Ca2+]"

		//- the source is Ca_pool

		msgSource = "Ca_pool"

		//- the value is Ca

		msgValue = "Ca" 

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 6

	//- if we are dealing with channels

	elif (parameters == "IGE")

		//- the description is the channel with registered mode

		msgDescription \
			= {getpath {widget} -tail} \
				@ " " \
				@ {getfield \
					/LDS/{getfield /LDS channelMode} \
					description}

		//- the source is slash + the widget tail

		msgSource = {getpath {widget} -tail}

		//- the value is registered in /LDS

		msgValue = {getfield /LDS channelMode}

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 2

	//- if we are dealing with exc channels

	elif (parameters == "excIGE")

		//- the description is the channel with registered mode

		msgDescription \
			= "Excitatory " \
				@ {getfield \
					/LDS/{getfield /LDS channelMode} \
					description}

		//- the source is not relevant

		msgSource = "excitatory"

		//- the value is registered in /LDS

		msgValue = {getfield /LDS channelMode}

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 3

	//- if we are dealing with inh channels

	elif (parameters == "inhIGE")

		//- the description is the channel with registered mode

		msgDescription \
			= "Inhibitory " \
				@ {getfield \
					/LDS/{getfield /LDS channelMode} \
					description}

		//- the source is not relevant

		msgSource = "inhibitory"

		//- the value is registered in /LDS

		msgValue = {getfield /LDS channelMode}

		//- remember to continue

		bContinue = 1

		//- set flags for buttons

		flButtons = 7

	//- else somebody messed up the code

	else
		//- give diagnostics

		echo "Somebody messed up the code"
		echo "XCell module bug"
	end

	//- if we should continue

	if (bContinue)

		//- if we are handling compartments

		if (flButtons == 1)

			//- setup messages for compartments

			XCellSetupCompMessages {msgSource} {msgValue}

		//- else if we are handling spine compartments

		elif (flButtons == 4)

			//- setup messages for spines

			XCellSetupSpineVmMessages {msgSource} {msgValue}

		//- else if we are handling exc channels

		elif (flButtons == 3)

			//- setup messages for those channels

			XCellSetupExcIGEMessages {msgSource} {msgValue}

		//- else if we are handling inh channels

		elif (flButtons == 7)

			//- setup messages for those channels

			XCellSetupInhIGEMessages {msgSource} {msgValue}

		//- else we are handling normal messages

		else
			//- setup messages

			XCellSetupMessages {msgSource} {msgValue}
		end
	end

	//- register output description

	setfield /LDS \
		outputDescription {msgDescription}

	//- set up buttons correctly

	XCellSetupButtons {widget} {flButtons}

	//- get name of boundary element

	str bound = " "  //{BoundElementName {msgSource} {msgValue} {iChanMode}}

	//- register the output parameters and boundary element

	setfield /LDS \
		outputSource {msgSource} \
		outputValue {msgValue} \
		outputFlags {flButtons} \
		outputDescription {msgDescription} \
		boundElement {bound}

	//- set boundaries for xcell

	callfunc XCellSetBoundaries {bound}

	//- reset the simulation

	reset

	//- notify graph of switched output units

	callfunc XGraphNextPlotMode {msgValue}

	//- return the output mode

	return {flButtons}
end
*/

///
/// SH:	XCellSetBoundaries
///
/// PA:	bound.:	boundary element
///
/// RE:	Success of operation
///
/// DE:	Set boundaries from the given element, update color widgets
///

function XCellSetBoundaries(bound)

str bound

	//v result var

	int bResult

	//- if the element with the boundaries exists

	if ( {exists {bound}} )

		//- give diagnostics

		echo "Setting xcell color boundaries from "{bound}

		//- set the fields for dimensions

		setfield /LDS/draw/xcell1 \
			colmin {getfield {bound} xcellmin} \
			colmax {getfield {bound} xcellmax}

		//- set config values in color widgets

		callfunc XCellShowConfigure

		//- set result : ok

		bResult = 1

	//- else

	else
		//- set result : failure

		bResult = 0
	end

	//- return result

	return {bResult}
end


///
/// SH:	XCellSetChannelMode
///
/// PA:	widget:	name of toggled widget
///
/// DE:	Set the channel mode
///

/*function XCellSetChannelMode(widget)

str widget

	//- isolate the tail of the toggled widget

	str widgetTail = {getpath {widget} -tail}

	//- set the channelmode field

	setfield /LDS \
		channelMode {widgetTail}

	//- update the output messages

	XCellSetOutput {getfield /LDS output}
end
*/

///
/// SH:	XCellCancelConfigure
///
/// DE:	Hide the configure window
///

function XCellCancelConfigure

	//- hide the configure window

	xhide /LDS/configure
end


///
/// SH:	XCellSetConfigure
///
/// DE:	Set xcell config as in the configuration window
///

function XCellSetConfigure

	//- set color min

	setfield /LDS/draw/xcell1 \
		colmin {getfield /LDS/colormin value}

	//- set color max

	setfield /LDS/draw/xcell1 \
		colmax {getfield /LDS/colormax value}
end


///
/// SH: XCellShowConfigure
///
/// DE:	Show configuration window for xcell
///

function XCellShowConfigure

	//- set color min value

	setfield /LDS/colormin \
		value {getfield /LDS/draw/xcell1 colmin}

	//- set color max value

	setfield /LDS/colormax \
		value {getfield /LDS/draw/xcell1 colmax}
/*
	//- pop up the configuration window

	xshow /LDS/configure
*/
end


///
/// SH:	XCellCreateToggle
///
/// PA:	name..:	name of widget to create
///
/// DE:	Create a channel toggle button in the xcell form.
///	The button is only created if it does not exist yet.
///

/*function XCellCreateToggle(name)

str name

	//- if the widget does not exist yet

	if ( ! {exists /LDS/{name}} )

		//- if there are already channels created

		if (bButtonsCreated)

			//- create a toggle button beneath previous

			create xtoggle /LDS/{name} \
				-xgeom 90% \
				-wgeom 10% \
				-script "XCellSetOutput <w>"

		//- else 

		else
			//- create toggle button at upper right

			create xtoggle /LDS/{name} \
				-xgeom 90% \
				-ygeom 5% \
				-wgeom 10% \
				-script "XCellSetOutput <w>"

			//- remember that buttons are created

			bButtonsCreated = 1
		end

		//- add field for parameters

		addfield ^ \
			parameters -description "parameters for messages"

		//- set the parameter field to channels

		setfield ^ \
			parameters "IGE"
	end
end
*/

///
/// SH:	XCellCreateChannelLibrary
///
/// DE:	Create library of Purkinje channels in /library
///

/*function XCellCreateChannelLibrary

	//v number of channels

	int iChannels = 0

	//- create neutral container

	create neutral /tmp

	//- loop over all purkinje channels found in the library

	str channel

	foreach channel ( {el /library/Purk_#/#[][TYPE=tabchannel]} )

		//- isolate the name of the channel

		str tail = {getpath {channel} -tail}

		//- if the element does not exist

		if ( ! {exists /tmp/{tail}} )

			//- create library element

			create neutral /tmp/{tail}

			//- increment number of channels

			iChannels = {iChannels + 1}
		end
	end

	//- open the library file

	openfile {strXCLibrary}".u" w

	//- loop over all create elements

	foreach channel ( {el /tmp/#[]} )

		//- write tail of channel to the lib file

		writefile {strXCLibrary}".u" {getpath {channel} -tail}

		//- delete the neutral element

		delete {channel}
	end

	//- close the lib file

	closefile {strXCLibrary}".u"

	//- sort the lib file

	sh "sort <"{strXCLibrary}".u >"{strXCLibrary}".s"

	//- open the library file

	openfile {strXCLibrary}".s" r

	//- loop over all channels

	int i

	for (i = 0; i < iChannels; i = i + 1)

		//- read a channel

		channel = {readfile {strXCLibrary}".s" -linemode}

		//- create a neutral element

		create neutral /tmp/{channel}
	end

	//- close the lib file

	closefile {strXCLibrary}".s"
end
*/

///
/// SH:	XCellCreateButtons
///
/// DE:	Create the xcell buttons and toggles.
///	Looks at the library to check which tabchannels are present
///

function XCellCreateButtons

	//- create toggle buttons per compartment

/*	create xtoggle /LDS/comp \
		-xgeom 70% \
		-ygeom 5% \
		-wgeom 20% \
		-title "Comp. Vm" \
		-script "XCellSetOutput <w>"
	addfield ^ \
		parameters -description "parameters for messages"
	setfield ^ \
		parameters "Vm"

	create xtoggle /LDS/Caconcen \
		-title "Comp. Ca" \
		-xgeom 70% \
		-wgeom 20% \
		-script "XCellSetOutput <w>"
	addfield ^ \
		parameters -description "parameters for messages"
	setfield ^ \
		parameters "Ca"

	create xtoggle /LDS/channelSpines \
		-xgeom 70% \
		-wgeom 20% \
		-title "Exc. chan." \
		-script "XCellSetOutput <w>"
	addfield ^ \
		parameters -description "parameters for messages"
	setfield ^ \
		parameters "excIGE"
	create xtoggle /LDS/channelSpinesInh \
		-xgeom 70% \
		-wgeom 20% \
		-title "Inh. chan." \
		-script "XCellSetOutput <w>"
	addfield ^ \
		parameters -description "parameters for messages"
	setfield ^ \
		parameters "inhIGE"
//	create xtoggle /LDS/compSpines \
//		-xgeom 70% \
//		-wgeom 20% \
//		-title "Spine comp." \
//		-script "XCellSetOutput <w>"
//	addfield ^ \
//		parameters -description "parameters for messages"
//	setfield ^ \
//		parameters "spineVm"
//	create xtoggle /LDS/nernst \
//		-xgeom 70% \
//		-wgeom 20% \
//		-script "XCellSetOutput <w>"
//	addfield ^ \
//		parameters -description "parameters for messages"
//	setfield ^ \
//		parameters "E"

	//- create a label as seperator

	create xlabel /LDS/sep1 \
		-xgeom 70% \
		-ygeom 3:last.bottom \
		-wgeom 20% \
		-title ""

	//- create toggle buttons for Ik,Gk,Ek

	create xtoggle /LDS/Ik \
		-xgeom 70% \
		-ygeom 1:sep1 \
		-wgeom 20% \
		-script "XCellSetChannelMode <w>"
	create xtoggle /LDS/Gk \
		-xgeom 70% \
		-wgeom 20% \
		-script "XCellSetChannelMode <w>"
	create xtoggle /LDS/Ek \
		-xgeom 70% \
		-wgeom 20% \
		-script "XCellSetChannelMode <w>"

	//- add descriptions

	addfield /LDS/Ik \
		description -description "Description of output"
	addfield /LDS/Gk \
		description -description "Description of output"
	addfield /LDS/Ek \
		description -description "Description of output"

	//- set descriptions

	setfield /LDS/Ik \
		description "current"
	setfield /LDS/Gk \
		description "conductance"
	setfield /LDS/Ek \
		description "reversal potential"

	create xlabel /LDS/noIk \
		-xgeom 70% \
		-ygeom 4:sep1 \
		-wgeom 20% \
		-title "No Ik"
	create xlabel /LDS/noGk \
		-xgeom 70% \
		-ygeom 3:last.bottom \
		-wgeom 20% \
		-title "No Gk"
	create xlabel /LDS/noEk \
		-xgeom 70% \
		-ygeom 3:last.bottom \
		-wgeom 20% \
		-title "No Ek"

	//- create a library of all channels

	XCellCreateChannelLibrary

	//- loop over all purkinje channels found in the library

	str channel

	foreach channel ( {el /tmp/#[]} )

		//- isolate the name of the channel

		str tail = {getpath {channel} -tail}

		//- create a toggle if necessary

		XCellCreateToggle {tail}
	end */


/*
	//- create a label as seperator

	create xlabel /LDS/sep2 \
		-xgeom 70% \
		-ygeom 3:Ek \
		-wgeom 20% \
		-title ""
*/
	//- create toggle to show graph

	create xtoggle /LDS/graph \
                -xgeom 70% \
		-ygeom 6:draw.bottom \
		-wgeom 30% */ \
		-title "" \
		-onlabel "Graph" \
		-offlabel "No Graph" \
		-script "XCellSetupGraph <v>"

	//- create toggle to show recording electrodes

	create xtoggle /LDS/electrodes \
              	-xgeom 70% \
		-ygeom  4:last.bottom \
		-wgeom 30%  \
		-title "" \
		-onlabel "Electrodes" \
		-offlabel "No Electrodes" \
		-script "XCellSetupElectrodes <v>"

	//- create label as seperator

/*	create xlabel /LDS/sep3 \
		-xgeom 70% \
		-ygeom 6:graph.top \
		-wgeom 30% \
		-title ""

	//- create toggle to change normalized / absolute output

	create xtoggle /LDS/chanmode \
		-xgeom 70% \
		-ygeom 6:last.top \
		-wgeom 30% \
		-title "" \
		-onlabel "Normalized" \
		-offlabel "Absolute" \
		-script "XCellSwitchChanMode <v>"

	//- create label with normalized / absolute description

	create xlabel /LDS/chanlabel \
		-xgeom 70% \
		-ygeom 6:chanmode.top \
		-wgeom 30% \
		-title "Output mode :"
*/
/*
	//- create a label as seperator

	create xbutton /LDS/config \
		-xgeom 70% \
		-wgeom 30% \
		-title "Configure" \
		-script "XCellShowConfigure"
*/
end


///
/// SH:	XCellCreateColorDialogs
///
/// DE:	Create the xcell color dialogs at the bottom
///

/*function XCellCreateColorDialogs

	//- create color min dialog

	create xdialog /LDS/colormax \
		-xgeom 0:parent.left \
		-ygeom 5:draw.bottom \
		-wgeom 70% \
                -value 20 \
		-title "Color maximum (red)  : " \
		-script "XCellSetConfigure"

	//- create color max dialog

	create xdialog /LDS/colormin \
		-xgeom 0:parent.left \
		-ygeom 0:last.bottom \
		-wgeom 70% \
                -value -80 \
		-title "Color minimum (blue) : " \
		-script "XCellSetConfigure"

end
*/

///
/// SH:	XCellCreateHeadings
///
/// DE:	Create the xcell headings for the draw and buttons
///

function XCellCreateHeadings

	//- create header label

	create xlabel /LDS/heading [0,0,100%,5%] \
		-title "LDS Morph"

	//- create buttons label

/*	create xlabel /LDS/outputs \
		-xgeom 0:last.right \
		-ygeom 0 \
		-wgeom 30% \
		-hgeom 5% \
		-title "Possible outputs"
*/
end


///
/// SH:	XCellCreateDraw
///
/// DE:	Create the xcell draw
///

function XCellCreateDraw

	//- create draw within form

	create xdraw /LDS/draw [0,5%,100%,75%] \
		-wx 1e-3 \
		-wy 1e-3 \
		-transform ortho3d \
		-bg white

	//- set dimensions for draw

	setfield /LDS/draw \
		xmin -5e-2 \
		xmax 3e-2 \
		ymin -3.1e-2 \
		ymax 4.5e-2

	//- set projection mode

	setfield /LDS/draw \
		transform z

	//- retreive the wildcard from the config file

//	str wPath = {getfield /config xCellPath}

	//- create cell display

	create xcell /LDS/draw/xcell1 \
	    -path /cell/soma[TYPE=compartment],/cell/dend[][TYPE=compartment] \
	        -colmin -80 /* -0.09 */ \
	        -colmax 200 /* 0.02 */ \
	        -diarange -10 

	//- set clock to use

	useclock /LDS/draw/xcell1 2
end


///
/// SH:	XCellReset
///
/// DE:	Set the default state for the xcell
///

/*function XCellReset

	//- default output is compartmental Vm

	setfield /LDS \
		output "/LDS/comp"

	//- default channel mode is conductance

	setfield /LDS \
		channelMode "Gk"

	//- if chanmode is 5

	if (iChanMode == 5)

		//- set widget to normalized output

		setfield /LDS/chanmode \
			state 1

	//- else

	else
		//- set widget to absolute output

		setfield /LDS/chanmode \
			state 0
	end

	//- default : graph is not visible

	setfield /LDS/graph \
		state 0

	//- default : electrodes are not visible

	setfield /LDS/electrodes \
		state 0

	//- update all output (buttons, colors)

	//! this just simulates a click on the comp. volt. button

	XCellSetOutput {getfield /LDS output}
end
*/

///
/// SH:	XCellCBAddPlot
///
/// PA:	path..:	path to the clicked compartment
///
/// DE:	Callback to add compartment to graph
///

function XCellCBAddPlot(path)

str path

	//echo "XCellCBAddPlot : "{path}

	//- allocate next color

	callfunc "XGraphNextColor"

	//! the field cNextColor should be considered private,
	//! but read the comments below to understand why I had to
	//! read it as if it is public.
	//!
	//! With this public read it becomes more difficult to decide if the
	//! graph should do a reset (and skipping back to the default color)
	//! Modularity with genesis scripts can be tough...

	//- get allocated color

	int color = {getfield /xgraphs/graph cNextColor}

	//! genesis callfunc cannot handle strings nor can it handle ints
	//! so the return value gets lost for the if statement

	//- get name of electrode

	str electrode = {XCellElectrodeName {path}}

	//- if the electrode exists

	if ( {exists /electrodes/draw/{electrode}} )

		//- give diagnostics

		echo {electrode}" is already a recording site"

	//- else

	else
		//- add plot for clicked compartment

		callfunc "XGraphPlotCompartment" /cell {path} {color}

		if ( {bXGraphPlotCompartmentResult} )

			//- add electrode for the compartment

			XCellAddElectrode {path} {electrode} {color}
		end
	end
end


///
/// SH:	XCellCBRemovePlot
///
/// PA:	path..:	path to the clicked compartment
///
/// DE:	Callback to remove compartment from graph
///

function XCellCBRemovePlot(path)

str path

	//- remove the electrode

	callfunc XCellRemoveElectrode {path}

	//- remove plot from the clicked compartment

	callfunc "XGraphRemoveCompartment" /cell {path}
end


///
/// SH:	XCellCreate
///
/// DE:	Create the xcell display widget with all buttons
///	set the update clock to clock 9
///

function XCellCreate

	//- create form container

	create xform /LDS [300,0, 400, 450]

	//- add field for output

	addfield /LDS \
		output -description "Output (toggled widget)"

	//- add field for output source

	addfield /LDS \
		outputSource -description \
				"Output source (compartment subelement)"

	//- add field for output value

	addfield /LDS \
		outputValue -description "Output value (Vm, Ik, Gk, Ek, Ca)"

	//- add field for output flags

	addfield /LDS \
		outputFlags -description "Output flags (1-7)"

	//- add field for output description

	addfield /LDS \
		outputDescription -description "Output description (Title)"

	//- add field for channel mode

	addfield /LDS \
		channelMode -description "Channel display mode (Ik, Gk, Ek)"

	//- add field for registering boundary element

	addfield /LDS \
		boundElement -description "Element with display boundaries"

	//- create the heading at the top

	XCellCreateHeadings

	//- create the draw

	XCellCreateDraw

	//- create color dialog widgets at the bottom

//	XCellCreateColorDialogs

	//- create the buttons and toggles

	XCellCreateButtons

	//- prepare the electrodes

	XCellPrepareElectrodes


	// create a form for configuration

	create xform /LDS/configure [250,250,300,150]

	// make it the current element

	pushe /LDS/configure

	// create label with header

	create xlabel heading \
		-label "Color configuration"

	// create color min dialog

	create xdialog colormin \
		-title "Color minimum : "

	// create color max dialog

	create xdialog colormax \
		-title "Color maximum : "

	// create done button

	create xbutton done \
		-title "Done" \
		-script "XCellSetConfigure"

	// create cancel button

	create xbutton cancel \
		-title "Cancel" \
		-script "XCellCancelConfigure"

	// pop previous element

	pope


	// link the xcell and the graph for button clicks

	setfield /LDS/draw/xcell1 \
		script "XCellCBAddPlot.d1 <v>// ; XCellCBRemovePlot.d3 <v>"


/*	setfield /LDS/draw/xcell1 \
		script "XCellCBRemovePlot.d3 <v>"

	//- show the output form
*/
	xshow /LDS
end


//end
