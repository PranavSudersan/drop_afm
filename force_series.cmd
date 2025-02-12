chdir "/home/pranav/Work/Codes/Surface Evolver/drop_afm/";

run_simulation := {
	for ( defect_disp := -0.01 ; defect_disp <= 0.12 ; defect_disp := defect_disp + 0.001 )
		{
		defect_posx := defect_disp*sin(azimuthal_angle*pi/180);
		defect_posy := rad_nodefect+defect_disp*cos(azimuthal_angle*pi/180);
		filecnt++;	
		replace_load "drop_afm";
		run; 
		}
	}
		
run_simulation;
