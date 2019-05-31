//genesis - TEST.g - GENESIS Version 2.1
// This file was developed by De Schutter, Cornelis and Maex
// and modified by     
//       Akira Takashima.
//       Department of Biological Sciences
//       Faculry of Science
//       Hokkaido University
//       Sapporo Japan
//
//       Last update on 22 Jan. 2007





// xgraph.g : xgraph functionality



//v default color for plots

int iDefaultPlotColor = 19 //38

//v bool for communication between XGraphPlotCompartment and others

int bXGraphPlotCompartmentResult = 0

//v normal path for xcell script

str cbXCell


///
/// SH:	XGraphPlotColor
///
/// RE:	color for current plot
///
/// DE:	Give color for current plot
///

function XGraphPlotColor

	//- get next color

	int color = {getfield /xgraphs/graph cNextColor}

	//- modulo 64 to get a legal value

	color = {color} % 64

	//- return result

	return {color}
end


///
/// SH:	XGraphNextColor
///
/// RE:	color for current plot
///
/// DE:	Give color for next plot
///

function XGraphNextColor

	//- get next available color

	int color = {getfield /xgraphs/graph cNextColor}

	//- modulo 64 to get a legal value

	color = {color +19} % 64

	//- increment the color count

	setfield /xgraphs/graph cNextColor {color}

	//- return result

	return {color}
end


///
/// SH:	XGraphPlotTitle
///
/// PA:	comp..:	compartment to be plotted
///	source:	registered output source
///	value.:	registered output value
///	flags.:	registered output flags
///
/// RE:	title for a plot
///
/// DE:	Give title for a plot for given parameters
///

function XGraphPlotTitle(comp,source,value,flags)

str comp
str source
str value
int flags

	//- get tail of compartment

	str compTail = {getpath {comp} -tail}

	//- default plot title is without index

	str plotTitle = {compTail}

	//- default index is none

	str index = ""

	//- find beginning of index

	int iBegin = {findchar {compTail} "["}

	//- if compartment has an index

	if (iBegin != -1)

		//- get index from registered compartement

		index = {substring \
				{compTail} \
				{iBegin + 1} \
				{{findchar {compTail} "]"} - 1}}

		//- set title for plot

		plotTitle = {substring {compTail} 0 {iBegin - 1}} \
				@ "_" \
				@ {index}
	end

	//- if output source is given

	if (source != "")

		//- if first char of output source is '/'

		if ({substring {source} 0 0} == "/")

			//- add output source minus '/' to plot title

			plotTitle = {plotTitle} \
					@ "_" \
					@ {substring {source} 1}

		//- else

		else
			//- add output source to plot title

			plotTitle = {{plotTitle} @ "_" @ {source}}
		end
					
	end

	// return plot title with added value

	return {plotTitle} @ "_" @ {value}

	//- return plot title

	return {plotTitle}
end




///
/// SH:	XGraphPlotCompartment
///
/// PA:	path..:	path with solver
///	comp..:	compartment to be plotted
///	color.:	color for new plot
///
/// RE:	1 if successfull
///	0 if failed
///
/// DE:	Add a plot for the given compartment, reset the simulation
///	The registered xcell output parameters are considered for setting up
///	the message to the graph.
///

function XGraphPlotCompartment(path,comp,color)

str path
str comp
int color

	//- set default result : success

	int bResult = 1

	//- get the registered LDS output

	str xcOutput = {getfield /LDS output}

	//- get the registered LDS output source

	str xcOutputSource = {getfield /LDS outputSource}

	//- get the registered LDS output value

	str xcOutputValue = {getfield /LDS outputValue}

	//- get the registered LDS output flags

	int xcOutputFlags = 1 // {getfield /LDS outputFlags}

	//- get the registered LDS output description

	str xcOutputDescription = {getfield /LDS outputDescription}

	//- get the registered LDS channel mode

	str xcChannelMode = {getfield /LDS channelMode}

	//- get xcell field for registering boundary element

	str xcBoundElement = {getfield /LDS boundElement}

	//- if registered output value is different from LDS output value

	if ({xcOutputValue} != {getfield /xgraphs outputValue})

		//- reset the graph

		callfunc XGraphReset
	end

	//- register new output

	setfield /xgraphs \
		output {xcOutput}

	//- register new output source

	setfield /xgraphs \
		outputSource {xcOutputSource}

	//- register new output value

	setfield /xgraphs \
		outputValue {xcOutputValue}

	//- register new output flags

	setfield /xgraphs \
		outputFlags {xcOutputFlags}

	//- register new output description

	setfield /xgraphs \
		outputDescription {xcOutputDescription}

	//- register new channel mode

	setfield /xgraphs \
		channelMode {xcChannelMode}

	//- register new boundary element

	setfield /xgraphs \
		boundElement {xcBoundElement}

	// reset parameters to compartmental voltage

	xcOutputSource = ""
	xcOutputValue = "Vm"
	xcOutputFlags = 1

	//- get tail of compartment

	str compTail = {getpath {comp} -tail}

	//- get a plot title

	str plotTitle = {XGraphPlotTitle \
				{comp} \
				{xcOutputSource} \
				{xcOutputValue} \
				{xcOutputFlags}}

	//- if flags say compartmental output

	if (xcOutputFlags == 1)

		//- if the specified element exists

		if ( {exists {comp} {xcOutputValue}} )

			//- give an informational message

			echo "Adding plot for "{comp}", " \
				"source is '(compartment)', " \
				"value is '"{xcOutputValue}"'."

			//- add message from solver to graph

			addmsg {path}/solve /xgraphs/graph \
				PLOT \
					{findsolvefield \
						{path}/solve \
						{comp} \
						{xcOutputValue}} \
					*{plotTitle} \
					*{color}

			//echo {comp} {compTail} {index}
			//echo {plotTitle}"_"{xcOutputValue}

		//- else

		else
			//- give an informational message

			echo "No plot for "{comp}", " \
				"source is '(compartment)', " \
				"value is '"{xcOutputValue}"'."
			echo "The element or field does not exist."

			//- set result

			bResult = 0
		end


	//- else we have 'normal' compartmental output

	else

		//- if the specified element exists

		if ( {exists {comp}/{xcOutputSource} {xcOutputValue}} )

			//- give an informational message

			echo "Adding plot for "{comp}", " \
				"source is '"{xcOutputSource}"', " \
				"value is '"{xcOutputValue}"'."

			//- add message from solver to graph

			addmsg {path}/solve /xgraphs/graph \
				PLOT \
					{findsolvefield \
						{path}/solve \
						{comp}/{xcOutputSource} \
						{xcOutputValue}} \
					*{plotTitle} \
					*{color}

			//echo {comp} {compTail} {index}
			//echo {plotTitle}"_"{xcOutputValue}

		//- else

		else
			//- give an informational message

			echo "No plot for "{comp}", " \
				"source is '"{xcOutputSource}"', " \
				"value is '"{xcOutputValue}"'."
			echo "The element or field does not exist."

			//- set result

			bResult = 0
		end
	end

	//- if adding plot was successfull

/*	if (bResult)

		//- reset added plot (makes it visible)

		call /xgraphs/graph/{plotTitle} RESET
	end
*/
	//- set global result

	bXGraphPlotCompartmentResult = {bResult}

	//- return result

	return {bResult}
end


///
/// SH:	XGraphRemoveCompartment
///
/// PA:	path..:	path with solver
///	comp..:	compartment to be removed from plot list
///
/// DE:	Remove the plot for the given compartment
///

function XGraphRemoveCompartment(path,comp)

str path
str comp

	//- get the registered xcell output source

	str xcOutputSource = {getfield /xcell outputSource}

	//- get the registered xcell output value

	str xcOutputValue = {getfield /xcell outputValue}

	//- get the registered xcell output flags

	int xcOutputFlags = {getfield /xcell outputFlags}

	//- get a plot title

	str plotTitle = {XGraphPlotTitle \
				{comp} \
				{xcOutputSource} \
				{xcOutputValue} \
				{xcOutputFlags}}

	//- if the plot exists

	if ( {exists /xgraphs/graph/{plotTitle}} )

		//- give diagnostics

		echo "Removing plot "{plotTitle}

		//- remove the plot

		delete /xgraphs/graph/{plotTitle}

		//- reset the graph

		call /xgraphs/graph RESET

	//- else

	else
		//- give diagnostics

		echo "No plot named "{plotTitle}
	end
end


///
/// SH: XGraphClear
///
/// PA: path..:	parent element to clear all graphs for
///
/// DE:	clear all graphs within the given element tree
///

function XGraphClear(path)

str path

	//- give diagnostics

	echo "Removing all plots"

	//v old status of overlay

	int overlayOld

	//- loop over all plots in the given tree

	str plot

	foreach plot ( {el {path}/##[][TYPE=xplot]} )

		//- delete the plot

		delete {plot}
	end

	//- loop over all graphs in the given tree

	str graph

	foreach graph ( {el {path}/##[][TYPE=xgraph]} )

		//- push the element

		pushe {graph}

		//- remember status of overlay field

		overlayOld = {getfield . overlay}

		//- unset overlay field

		setfield . overlay 0

		//echo RESET for {el .} with overlay {getfield . overlay}

		//- reset the graph

		call . RESET

		//- reset overlay field to previous state

		setfield . overlay {overlayOld}

		//- pop previous current element

		pope
	end

	//- remove all electrodes

	callfunc XCellRemoveElectrodes
end



///
/// SH:	XGraphHideAddPlot
///
/// DE:	Hide the add plot window
///	Resets the xcell call back
///

function XGraphHideAddPlot

	//- restore field for xcell script

	setfield /LDS/draw/xcell1 \
		script {cbXCell}

	//- hide add plot window

	xhide /xgraphs/addPlotForm
end


///
/// SH:	XGraphSetAddPlot
///
/// PA:	name..:	name of compartment to add plot for
///
/// DE:	Add plot for specified compartment name
///	The field and subelement to output are taken from xgraph output mode
///	If the function is successfull, the add plot window will hide.
///

function XGraphSetAddPlot(name)

str name

	//- for empty given name

	if ( {name} == "" )

		//- just return

		return
	end

	//- if name is relative

	if ( {substring {name} 0 0} != "/" )

		//- add cell path to compartment name

		name = {"/cell" @ "/" @ "dend["@{name} @ "]"}
	end

	//- get tail of string

	str tail = {getpath {name} -tail}

	//- find opening bracket

	int iOpen = {findchar {tail} "["}

	//- if name has index

	if ( iOpen != -1 )

		//- find closing bracket

		int iClose = {findchar {tail} "]"}

		//- get index from tail of name

		int iIndex = {substring {tail} {iOpen + 1} {iClose - 1}}

		//- if index count of tail is zero

		if ( iIndex == 0 )

			//- delete index of tail of name

			tail = {substring {tail} 0 {iOpen - 1}}

			//- construct new name

			name = {{getpath {name} -head} @ {tail}}
		end
	end

	// if specified compartment exists

	//if ( {exists {name}} )

	//- call callback script for xcell

	callfunc XCellCBAddPlot {name}

	// else

	//else

		// should inform the user here

	//end
end


///
/// SH:	XGraphShowAddPlot
///
/// DE:	Popup add plot window
///	This function messes with the xcell call back script
///

function XGraphShowAddPlot

	//- store field for xcell script

	cbXCell = {getfield /LDS/draw/xcell1 script}

	//- set field for xcell script

	setfield /LDS/draw/xcell1 \
		script "XCellCBAddPlot <v>"

	//- pop add plot form

	xshow /xgraphs/addPlotForm
end


///
/// SH:	XGraphToggleOverlay
///
/// PA:	widget:	name of widget to toggle overlay for
///	state.:	new state for overlay field
///
/// DE:	Toggle the overlay field for the given widget
///

function XGraphToggleOverlay(widget,state)

str widget
str state

	//- if xoverlay element exists

	if ({exists {widget}/xoverlay})

		//- delete the xoverlay element

		delete {widget}/xoverlay
	end

	//- set the overlay field for the given widget

	setfield {widget} overlay {state}
end


///
/// SH:	XGraphCreate
///
/// DE:	Creates a graph and parent from element.
///	Adds a field for allocation of colors (named cNextColor)
///
///

function XGraphCreate

	//- create container form

	create xform /xgraphs [750, 0, 500, 420]

	//- add field for output

	addfield /xgraphs \
		output -description "Output (toggled widget)"

	//- add field for output source

	addfield /xgraphs \
		outputSource -description "Output source"

	//- add field for output value

	addfield /xgraphs \
		outputValue -description "Output value"

	//- add field for output flags

	addfield /xgraphs \
		outputFlags -description "Output flags"

	//- add field for output description

	addfield /xgraphs \
		outputDescription -description "Output description"

	//- add field for channel mode

	addfield /xgraphs \
		channelMode -description "Channel display mode"

	//- add field for registering boundary element

	addfield /xgraphs \
		boundElement -description "Element with display boundaries"

	//- make the form the current element

	pushe /xgraphs

	//- create graph within the form

	create xgraph graph [1%, 2%, 99%, 90%] \
		-title "Membrane Potential"

	//- set appropriate dimensions for voltage

	setfield ^ \
		xmin 0 \
		xmax 100 \
		ymin -100 \
		ymax 0 \
		bg white \
		XUnits "Time (msec)" 

	//- add a button to clear the graph

	create xbutton clear \
		-xgeom 1% \
		-ygeom 0:graph \
		-wgeom 20% \
		-title "Clear graph" \
		-script "XGraphClear /xgraphs"

	//- add a button to add a plot

	create xbutton addPlot \
		-xgeom 0:last.right \
		-ygeom 0:graph \
		-wgeom 20% \
		-title "Add plot" \
		-script "XGraphShowAddPlot"

	//- add toggle for overlay

	create xtoggle overlay \
		-xgeom 0:last.right \
		-ygeom 0:graph \
		-wgeom 20% \
		-title "" \
		-script "XGraphToggleOverlay /xgraphs/graph <v>"

	//- set on/off labels

	setfield overlay \
		offlabel "Overlay off" \
		onlabel "Overlay on"

	//- add an initialized field for allocated colors

	addfield /xgraphs/graph cNextColor -descr "next color to allocate"
	setfield /xgraphs/graph cNextColor {iDefaultPlotColor}

	//- set clock to use for graph

	useclock /xgraphs/graph 3

	//- create a form for setting scales

	create xform addPlotForm [600,150,350,190]

	//- make it the current element

	pushe ^

	//- create label with header

	create xlabel heading \
		-label "Add plot to graph"

	//- create labels with info msgs and dialog for compartment name input

	create xlabel info1 \
		-ygeom 4:last.bottom \
		-title "Select an area from the LDS cell"
	create xlabel info2 \
		-ygeom 2:last.bottom \
		-title "to plot its output value in the graph,"
	create xlabel info3 \
		-ygeom 2:last.bottom \
		-wgeom 100% \
		-title "or type a compartment number below :"
	create xdialog compartmentname \
		-wgeom 100% \
		-label "Compartment number to plot : " \
		-script "XGraphSetAddPlot <v>"
	create xlabel info4 \
		-ygeom 2:last.bottom \
		-title ""

	//- create cancel button

	create xbutton done \
		-title "Done" \
		-script "XGraphHideAddPlot"

	//- pop previous element

	pope
end


///
/// SH:	XGraphReset
///
/// DE:	Clear the graph and reset the title
///	This functions relies on an xcell form /xcell that has fields for
///	registering output source, value etc.
///

function XGraphReset

	//- clear the graph

	XGraphClear /xgraphs

	//- get the registered LDS output

	str xcOutput = {getfield /LDS output}

	//- get the registered LDS output source

	str xcOutputSource = {getfield /LDS outputSource}

	//- get the registered LDS output value

	str xcOutputValue = {getfield /LDS outputValue}

	//- get the registered LDS output flags

	int xcOutputFlags = {getfield /LDS outputFlags}

	//- get the registered LDS output description

	str xcOutputDescription = {getfield /LDS outputDescription}

	//- get the registered LDS channel mode

	str xcChannelMode = {getfield /LDS channelMode}

	//- get xcell field for registering boundary element

	str xcBoundElement = {getfield /LDS boundElement}

	//- register new output

	setfield /xgraphs \
		output {xcOutput}

	//- register new output source

	setfield /xgraphs \
		outputSource {xcOutputSource}

	//- register new output value

	setfield /xgraphs \
		outputValue {xcOutputValue}

	//- register new output flags

	setfield /xgraphs \
		outputFlags {xcOutputFlags}

	//- register new output description

	setfield /xgraphs \
		outputDescription {xcOutputDescription}

	//- register new channel mode

	setfield /xgraphs \
		channelMode {xcChannelMode}

	//- register new boundary element

	setfield /xgraphs \
		boundElement {xcBoundElement}

	//- if output is comp. Vm

	if (xcOutputFlags == 1)

		//- set title

		setfield /xgraphs/graph \
			title "Compartmental voltage"

	end

	//- set new axes

	callfunc XGraphSetBoundaries {xcBoundElement}

	//- register next output mode

	XGraphNextPlotMode {xcOutputValue}

	// reset next plot color

	//! don't do this, read the comments in XCellCBAddPlot why.

	//setfield /xgraphs/graph cNextColor {iDefaultPlotColor}
end
