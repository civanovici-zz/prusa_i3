// PRUSA Mendel  
// Y bushing holder
// Used for sliding on X axis
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id y-bushing
 * @name Y bushing
 * @category Printed
 * @using 4 m3washer
 * @using 2 m3x15xhex
 * @using 2 m3nut
 */

snap_in_mount = false;
use <bushing.scad>

module ybushing(linear_bearing=true){
if(linear_bearing==false){
	translate(v = [0,0,-2.05]) difference(){
		union(){
			translate(v = [0,0,5.05/2]) cube(size = [33,10,5.05], center = true);
			//translate(v = [0,0,1.5]) cube(size = [16,20,3], center = true);
			translate(v = [0,0,5]) rotate(a=[0,0,0]) standart_bushing();
			}
		translate(v = [12, 0, -2]) polyhole(m3_diameter, 12);
		translate(v = [-12, 0, -2]) polyhole(m3_diameter, 12);

	translate(v = [0,0,2.0/2]) cube(size = [34,120,2.05], center = true);
		}
	}else{
	// Greg Frosts

		y_bearing();
	}
}	

module ybushing_holder(){
	difference(){
		union(){
			translate([3-0.25,15,0]) cube_fillet([4.5,14.5,14], top=[11,0,0,0], center=true);
			mirror([0,1,0]) translate([3-0.25,14.5,0]) cube_fillet([4.5,14,14], top=[11,0,0,0], center=true);
			translate([0.5,-10,-7])cube([2,20,14]);

		}
		translate([7.5,14,0]) rotate([0,-90,0]) cylinder(r=1.5,h=20,$fn=10);
		mirror([0,1,0])translate([7.5,14,0]) rotate([0,-90,0]) cylinder(r=1.5,h=20,$fn=10);
		translate([2.51,14,0])rotate([0,90,0])nut(d=m3_nut_diameter_horizontal,h=2.5);
		mirror([0,1,0])translate([2.51,14,0])rotate([0,90,0])nut(d=m3_nut_diameter_horizontal,h=5);
	}

}


//ybushing(true);
translate([-18,0,10])rotate([0,-90,0])ybushing_holder();

