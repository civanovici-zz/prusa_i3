include <configuration.scad>

//%translate([50,0,50])rotate([0,-90,0])import("stl/x-carriage.stl",center=true);
rotate([-90,0,0])difference(){
	dial_support();
	#translate([8,-14,5])dial();

}

module dial_support(){
	difference(){
		union(){
			translate([-9,-14,-20])cube_fillet([31,4,56]);
			translate([-9,-30,-22.5])cube_fillet([31,20,4]);
		}
		translate([-3,0,30])rotate([90,0,0])cylinder(r=m3_diameter/2,h=50,$fn=20);
		translate([17,0,30])rotate([90,0,0])cylinder(r=m3_diameter/2,h=50,$fn=20);
	}
}

module dial(){
	rotate([90,0,0])cylinder(r=21,h=21);
	translate([0,-7,-34])cylinder(r=4,h=61);
}