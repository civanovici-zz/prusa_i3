// PRUSA iteration3
// X ends
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <bushing.scad>


module x_end_motor(){
    mirror([0,1,0]) {

        x_end_base([3,3,0,0], thru=false);
        /// motor dummy
        //%translate([21-5,-21-11,25]) cube([42,42,42], center = true);
        difference(){
				union(){
                translate([-14.8,-15,26]) cube_fillet([17.5,14,52], center = true, vertical=[0,0,3,1.5], top=[0,3,6,3]);
					translate([-23.6,-55,0]) cube_fillet([17.5,37,10]);
					translate([-23.6,-55,10]) cube_fillet([17.5,15,10],vertical=[3,3,3,3],top=[3,1,3,1]);
				}
					translate([-15, -32, 30.25]) rotate([90, 0, 0])  rotate([0, 90, 0]) nema17(places=[1,0,1,1],holes=true, shadow=5, h=10);
            // motor screw holes
            translate([21-5,-21-11,30.25]){
                // belt hole
                translate([-30,11,0]) cube([10,26,24], center = true);
                
            }
        }
        //smooth rod caps
        translate([-22, -10, 0]) cube([17, 2, 15]);
        translate([-22, -10, 45]) cube([17, 2, 10]);
    }
}


module x_end_base(vfillet=[3,3,3,3], thru=true, len=40){
    difference(){
        union(){
            difference(){
                translate([-13.75-0.5,-10+len/2,30]) cube_fillet([18.5,len,60], center = true, vertical=vfillet, top=[5,3,5,3]);
					translate([0,17,4])nut(d=m8_nut_diameter,h=6.5);
                bushing_negative(60);
            }
            //rotate([0,0,0]) translate([0,-9.5,0]) 
            if (bearing_choice == 1) {
                linear_bushing(60);
            } else {
                linear_bearing(60);
            }
            // Nut trap
            difference(){
                if ((bearing_choice != 1) || (bushing_type == 2)) {
                translate([-2,17.5,7]) cube_fillet([14,18,14], center = true, vertical=[3,0,0,0]);
                } else {
                translate([-2,17.5,4]) cube_fillet([16,18,8], center = true, vertical=[3,0,0,3]);
                }

                //bottom hole
                
                translate([0,17,-1]) cylinder(h = 10, r=4.6);
                //nut slid in
                translate([0,17,4])nut(d=m8_nut_diameter,h=6.5);
//cube([9.2*2,9.2*sqrt(3/4)+0.4,4.1], center = true);

                translate([0,17,6.5]) cylinder(h = 10, r=4.6);
            }
        }

        // belt hole
        translate([-5.5-10+1.5,22-9,30]) cube([10,55,32], center = true);
			
        // change rod diameter to 8.4 if printing with ABS
        if(thru == true){
            translate([-14,-11,6]) rotate([-90,0,0]) pushfit_rod(8.4,50);
            translate([-14,-11,xaxis_rod_distance+6]) rotate([-90,0,0]) pushfit_rod(8.1,50);
        } else {
            translate([-14,-7,6]) rotate([-90,0,0]) pushfit_rod(8.4,50);
            translate([-14,-7,xaxis_rod_distance+6]) rotate([-90,0,0]) pushfit_rod(8.1,50);
        }


    }

    //threaded rod
    #translate([0,17,0]) %cylinder(h = 70, r=4.2);

}


module x_end_idler(){
    difference() {
        x_end_base(len=42+idler_size_inner_r);
        // idler hole
        translate([0,17+6+idler_size_inner_r,30.25-((bearing_type==0)? 3 : 0)]) rotate([0,-90,0]) cylinder(h = 80, r=idler_size_inner_r-0.2, $fn=30);
        if (bearing_type == 0) 
        translate([-9,17+6+idler_size_inner_r,30.25-3]) {
            rotate([0,-90,0]) cylinder(h = 10, r=idler_size/2+4, $fn=30);
            translate([-5,10,0]) cube([10,20,idler_size+8], center=true);
        }
    }
}

//mirror([0,0,0]) x_end_idler(thru=true);
// translate([40,40,0]) x_end_idler(thru=false);
translate([40,0,0]) x_end_motor();

module pushfit_rod(diameter,length){
    cylinder(h = length, r=diameter/2, $fn=30);
    translate([0,-diameter/4,length/2]) cube([diameter,diameter/2,length], center = true);

    translate([0,-diameter/2-1.2,length/2]) cube([diameter,1,length], center = true);
}
