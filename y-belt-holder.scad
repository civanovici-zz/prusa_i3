// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
//y_belt_holder();
rotate([0,90,0])beltholder_nuts();


module y_belt_holder(){
translate([0, -10, 0])rotate([0,0,-90]){
	difference(){
    	union(){
    		translate([-24.5+9.5, 0, 17.5]) cube_fillet([10, 14, 35], center = true, vertical=[3,3,0,0], fn=8 );
    
    		translate([-10, 1.5-9, 17.5]) cube([40, 5, 35], center = true);

    		difference(){        	
            translate([-4.0, 0, 17.5]) cube_fillet([8.5, 14, 35], center = true, vertical = [2,2,0,2], fn=8);        
        		translate([-4.5, 0, 17.5]) cube([10, 10, 10], center = true);       
        
        		intersection() {
            	for (i = [0 : 35/belt_tooth_distance])
            	{
                	translate([-9.0, 0, 1+i*belt_tooth_distance]) cube([3, 10, belt_tooth_distance*belt_tooth_ratio], center = true);
            	}
            	translate([0, 0, 35/2]) cube([20, 10, 35], center = true);
        		}

    		}
		}

		translate([-25, -4, 8]) rotate([90, 0, 0]) screw();
		translate([-25, -4, 28]) rotate([90, 0, 0]) screw();
		translate([5, -4, 8]) rotate([90, 0, 0]) screw();
		translate([5, -4, 28]) rotate([90, 0, 0]) screw();

	}
}
}

module beltholder_nuts(){
	translate([-14, 0, 17.5])rotate([0,0,-90]) {
		difference(){
			cube_fillet([40, 4, 35], center = true,vertical = [0,0,2,2],top=[0,0,2,0],bottom=[0,0,2,0], fn=8);
			translate([-15, 10, -10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([-15, 0, -10]) rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([-15, 10, 10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([-15, 0, 10])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([15, 10, -10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([15, 0, -10])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([15, 10, 10]) rotate([90, 0, 0]) cylinder(r=m3_diameter/2,h=20);
			translate([15, 0, 10])rotate([90,0,0])nut(d=m3_nut_diameter_horizontal,h=2.5);

			translate([0, 5, 0])rotate([90,0,0])cylinder(r=10,h=10);
			
		}
		
	}

}