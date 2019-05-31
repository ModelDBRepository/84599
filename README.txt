README file for the simulation of spatio-temporal distribution of
synaptic potentials over an identified nonspiking interneuron in
crayfish using the GENESIS simulator by Akira Takashima, Ryou Hikosaka
and Masakazu Takahata.

1. This GENESIS simulation show how a single or compound excitatory
   synaptic potentials evoked by mechanosensory stimulation spreads
   over the dendrites of the LDS interneuron that is identified in the
   terminal abdominal ganglion of crayfish Procambarus clarkii.

2. The model is based on physiological experiments carried out by
   Akira Takashima using single-electrode voltage clamp techniques and
   3-D morphometry of the interneuron carried out by Ryou Hikosaka
   using confocal laser scanning microscope techniques. The
   physiological and morphological studies were coordinated by
   Masakazu Takahata.

Details on the simulation are described in:

  Takashima, A., Hikosaka, R. and Takahata, M. (2006)
  J. Neurophysiol. 96: 3157-3169.

Details on the physiological characterization of the LDS interneuron
including Hodgkin-Huxley type description of active membrane
conductances are described in:

  Takashima, A. and Takahata, M. (2000) J. Compt. Neurosci. 9:
  187-205.  

Details on the 3-D morphometry of the interneuron are described in:

  Hikosaka, R. Takahashi, M. and Takahata, M. (1996) Zool. Sci. 13:
  69-78

  and

  Hikosaka, R. and Takahata, M. (1998) J. Comp. Neurol. 392: 373-389.


(Raw materials on the 3-D morphometry of the LDS interneuron will be
available in the spring of 2007 at
http://crayfish3.sci.hokudai.ac.jp/index.html.)

3. The input synapses from mechanosensory afferents are
   pre-deterimined in this simulation. Users can choose from one, 5,
   10, 21 and 94 regions for the input sites on the same ipsilateral
   to the cell body of the LDS interneuron. Users then select one
   region of interest to calculate the membrane potential change there
   due to the synaptic activity chosen. The result of calculation will
   be displayed on the window.

4. In order to run the simulation, you will need these:

  1) a fast computer (Pentium 3 or higher) with enough memory (at
     least 256 Mb)
  2) Linux 2.X installed correctly
  3) GENESIS 2.2 or later installed correctly
  4) a graphical display with at least a resolution of 1024 x 768

5. In order to test the simulation, follow these steps:

  1) Make room on the display for he graphical output: move your shell
     window to the bottom of your display.

  2) Change to the directory where the TEST.g scripts reside.

  3) At the shell prompt, type "genesis". If you have not set PATH to
     the directory where the genesis command resides, type whole PATH
     to that directory.

  4) If you can get started GENESIS simulator, then type "TEST". After
     a short period, two windows will appear: "control" window for
     setting parameters and "LDS" window for displaying the
     calculation result.

  5) To further explore the simulation, please read "Instruction.txt".


6. Correspondence e-mail address is: takashim@sci.hokudai.ac.jp (Akira
   Takashima)
