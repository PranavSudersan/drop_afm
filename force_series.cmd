chdir "/home/pranav/Work/Codes/Surface Evolver/drop_afm_diego/";
//run_simulation := {
//	for ( pos_step := -10 ; pos_step <= 20 ; pos_step := pos_step + 0.5 )
//		{
//		defect_posy := 1.28992 + (core_size/20)*pos_step;	
//		replace_load "drop_afm";
//		run; 
//		}
//	}

run_simulation2 := {
	for ( defect_posy := 1.0 ; defect_posy <= 1.2 ; defect_posy := defect_posy + 0.01 )
		{	
		replace_load "drop_afm";
		run; 
		}
	}

run_simulation3 := {
	for ( defect_disp := -0.01 ; defect_disp <= 0.12 ; defect_disp := defect_disp + 0.001 )
		{
		defect_posx := defect_disp*sin(azimuthal_angle*pi/180);
		defect_posy := rad_nodefect+defect_disp*cos(azimuthal_angle*pi/180);
		filecnt++;	
		replace_load "drop_afm";
		run; 
		}
	}
		
run_simulation3;
