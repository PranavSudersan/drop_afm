# Capillary Forces on a Hemispherical Defect

This repository contains Surface Evolver files used to simulate a liquid drop attached to a cantilever interacting with a hemispherical defect on a substrate. The simulation obtains the equilibrium drop shape under the given constraints and then calculates lateral forces acting on the defect together with the energy. 

## Overview

- **drop_afm.fe:** Main simulation file. Set the physical parameters (e.g., `bottom_angle`, `defect_contact_angle`, `pin_radius`, `height`, etc.)  for the substrate, cantilever, and defect here ([drop_afm.fe](drop_afm/drop_afm.fe)).
- **force_series.cmd:** Command script to automate simulations over a range of defect displacements by updating parameters (`defect_disp`) and saving output data ([force_series.cmd](force_series.cmd)).
- **drop_afm_nodefect.fe:** Alternative simulation file for computing equilibrium parameters without defect effects. Run this first to obtain `rad_nodefect` parameter to be used in [drop_afm.fe](drop_afm/drop_afm.fe) above.
- **drop_simulation_analysis.ipynb:** A Jupyter notebook for post-processing simulation results, converting them to real units, and generating plots.

## How to run the simulation?

First open [drop_afm.fe](drop_afm/drop_afm.fe), set the initial defect position (`defect_disp`) and load the file
```
evolver drop_afm.fe
```
  Next, comment out the four lines defining the defect position (`defect_disp`, `defect_posx`, `defect_posy`, `filecnt`) and save the file. Then open [force_series.cmd](force_series.cmd) script file. Set `defect_disp` limits in the for loop as needed. Save the file and then execute the script in the evolver terminal to iterate over the different defect displacements. 
```
  read "force_series.cmd"
```
  This script updates `defect_disp`, recalculates defect positions, and saves simulation outputs (e.g., figures and data files) in the file specified in outfile variable of the `run` command in [drop_afm.fe](drop_afm/drop_afm.fe).

## Model definition

Skeleton diagram of model used to define the geometry in [drop_afm.fe](drop_afm/drop_afm.fe)

![Screenshot from 2025-02-12 17-36-40](https://github.com/user-attachments/assets/5876be37-fcfc-4258-8584-1d5d3549ae78)

Schematic showing how azimuthal angle, φ, sets the defect position relative to the central axis. For a finite φ, the defect is moved in the "equivalent" scenario relative to the red point. The lateral forces are then calculated in the direction of motion and the perpendicular direction.
![model_schematic](https://github.com/user-attachments/assets/5a0c3f29-9027-420d-a31f-66f0b1f84527)

## Simulation snapshot video examples

Bottom view on defect

https://github.com/user-attachments/assets/1a262ac2-5379-4d17-86b2-290426bcb390

Side view on defect

https://github.com/user-attachments/assets/e3e74596-94c6-40af-b97f-f269c32acfe2



## License

Licensed under the Creative Commons Attribution 4.0 International License (http://creativecommons.org/licenses/by/4.0/).  
You are free to share and adapt this material with appropriate credit.
