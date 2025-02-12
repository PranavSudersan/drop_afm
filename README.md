# Capillary Forces on a Hemispherical Defect

This project simulates a liquid drop attached to a cantilever interacting with a hemispherical defect on a substrate. The Surface Evolver code models the equilibrium drop shape and calculates lateral forces acting on the defect as well as the energy.

## Overview

- **drop_afm.fe:** Main simulation file. Set the physical parameters (e.g., `bottom_angle`, `defect_contact_angle`, `pin_radius`, `height`, etc.)  for the substrate, cantilever, and defect here ([drop_afm.fe](drop_afm/drop_afm.fe)).
- **force_series.cmd:** Command script to automate simulations over a range of defect displacements by updating parameters (`defect_disp`) and saving output data ([force_series.cmd](force_series.cmd)).
- **drop_afm_nodefect.fe:** Alternative simulation file for computing equilibrium parameters without defect effects. Run this first to obtain `rad_nodefect` parameter to be used in [drop_afm.fe](drop_afm/drop_afm.fe) above.
- **drop_simulation_analysis.ipynb:** A Jupyter notebook for post-processing simulation results, converting them to real units, and generating plots.

## Running the Simulation

- **Single Run:**  
  Open [drop_afm.fe](drop_afm/drop_afm.fe) in Surface Evolver and execute the `run` command to simulate and save the data.

- **Batch Simulation:** 
  First open [drop_afm.fe](drop_afm/drop_afm.fe), set the initial defect position (defect_disp) and load the file
```
evolver drop_afm.fe
```
  Next, comment out the four lines defining the defect position (`defect_disp`, `defect_posx`, `defect_posy`, `filecnt`) and save the file. Then open [force_series.cmd](force_series.cmd) script file. Set `defect_disp` limits in the for loop as needed. Save the file and then execute the script in the evolver terminal to iterate over the different defect displacements. 
```
  read "force_series.cmd"
```
  This script updates `defect_disp`, recalculates defect positions, and saves simulation outputs (e.g., figures and data files) in the file specified in outfile variable of the `run` command in [drop_afm.fe](drop_afm/drop_afm.fe).

## License

Licensed under the Creative Commons Attribution 4.0 International License (http://creativecommons.org/licenses/by/4.0/).  
You are free to share and adapt this material with appropriate credit.