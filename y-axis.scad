

include <configuration.scad>
use <y-belt-holder.scad>
use <bearing-guide.scad>
use <bushing.scad>

aluminiu_profile=30.2;
verticalHole=8.7;

y_motor_mount();
//y_axis();
//translate([10,23,-90])color("red",0.3)cube([2,5,90]);
//translate([0,36,0])color("red",0.3)cube([200,2,200],center=true);
//translate([-52,24,-70])rotate([0,0,-90]){
//	y_bearing();
//	color("gray",0.3)cylinder(r=4, h=90);
//}

//translate([52,24,-70])rotate([0,0,-90]){
//	y_bearing();
//	color("gray",0.3)cylinder(r=4, h=90);
//}
//translate([12,25,-80])rotate([0,0,-90])y_belt_holder();

//color("blue",0.3)translate([0,30,0])rotate([90,0,0]){
//	inner();
//	translate([0,0,10])rotate([180,0,0])outer();
//}


//y_motor_mount();
module y_axis(){
	difference(){
		translate([0,12,0])cube([120,aluminiu_profile+10,14], center=true);
		cube([aluminiu_profile,aluminiu_profile,25], center=true);
		smoothbar_support();
		mirror() smoothbar_support();
		translate([0,27,0])cube([40,14.1,25],center=true);
		translate([0,40,0])rotate(a=[90,0,0])polyhole(d=8.2,h=130);
	}
}

module smoothbar_support(){
	translate([20,60,0])cylinder(r=40,h=15, center=true,$fn=100);
		translate([62,-23.4,0])cylinder(r=40,h=15, center=true,$fn=100);
		translate([60.01,16.1,-11])rotate([0,0,-270])roundcorner(6);
		translate([60.01,32.1,-11])rotate([0,0,180])roundcorner(6);
		translate([52,24,-20])polyhole(smooth_bar_diameter,40);
		translate([-52,24,-20])polyhole(smooth_bar_diameter,40);
}
module motor_fix(){
	difference(){
		translate([23.5,6,27])cube([3,28,40],center=true);
		translate([20.1,-27,43])rotate([0,90,0])cylinder(r=40,h=5);
				
	}
}
module y_motor_mount(){
	difference(){
		union(){
			motor_fix();
			mirror() motor_fix();
			y_axis();	
			translate([0,20,30])rotate([90,0,0]){
				difference(){
					union(){
						translate([12,-30,0])cube_fillet([10,50,7]);
						translate([-22,-30,0])cube_fillet([10,50,7]);
						nema17(places=[1,1,1,1], h=7);
					}
					nema17(places=[1,1,1,1], holes=true, h=7, shadow=5);
			
				}
			}
		}
		translate([0,0,-6])cube([aluminiu_profile,aluminiu_profile,25], center=true);
	}
}
