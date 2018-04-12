%=========================================================================
% waypointGuidance.m
%
%
%=========================================================================

clc
clear
close all


   

   
   
   
   
   uav = UAV();
   uav.plotHeading = false;
   uav.plotCmdHeading = false;
   
   uav.plotUAV = false;
   uav.plotUAVPath = true;
   uav.plotFlightEnv = false;
   uav = uav.setup(-200, 0, 10, 0, 0.1);
   
   obstR = 100;
   obstX = 0;
   obstY = 0;
   
   optPath = genOptPath(uav,obstR,obstX,obstY,10);
 
   wpMan = wpt();
   wpMan = wpMan.setup(optPath);
   wpMan.WPx(end+1)=200;
   wpMan.WPy(end+1) = 0;
   
   while wpMan.currentWP <= length(wpMan.WPx) && wpMan.active
       wpMan = wpMan.getWPT(uav.x,uav.y);
       heading = atan2(wpMan.wpy-uav.y,wpMan.wpx-uav.x);
       uav = uav.update_pos(heading);
       wpMan.currentWP
       
       
       clf
       hold on
       uav.pltUAV();
       wpMan.pltWpts();
        plot(wpMan.WPx,wpMan.WPy,'r*');
        axis equal

   
   
   end
   
   grid on
   
            
            