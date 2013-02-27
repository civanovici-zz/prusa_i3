include <configuration.scad>


table_screw_holder();

module table_screw_holder(){
	difference(){
		union(){
			translate([-8,0,-2])cube([16,14,6]);
			translate([0,12,4])cylinder(r=2,h=5,$fn=12);
		}
		translate([0,m4_nut_diameter/2-2,-0.5])rotate([0,0,90])nut(d=m4_nut_diameter,h=3);
		translate([0,m4_nut_diameter/2-2,-4])cylinder(r=m4_diameter/2,h=10);
		translate([8.01,14.01,-3])rotate(180)roundcorner(8);
		translate([-8.01,14.01,-3])rotate(-90)roundcorner(8);
	}

}