// PRUSA iteration3
// Z axis
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>


module zmotorholder(thickness=13){
    difference(){
        union(){
            // Motor holding part
            difference(){
                union(){
                    zrodholder(thickness=thickness, xlen=45, ylen=45);
                    translate([board_to_xz_distance, board_to_xz_distance, 0]) {
                        nema17(places=[0,1,1,1], h=thickness);
                    }
                }

                // motor screw holes
                translate([board_to_xz_distance, board_to_xz_distance, thickness]) {
                    mirror([0,0,1]) translate([0,0,thickness-8])
                        nema17(places=[0,1,1,1], holes=true, h=thickness, shadow=5);
                }
            }
        }
translate([14, 20, thickness/2]) rotate([0, -90, 0]) screw_cylinder();
    }
}


module zrodholder(thickness=13, ylen=40, xlen=34){
    difference(){
        union(){
            // Rod holding part
            difference(){
                union(){
                    //piece along the flat side of a board
                    cube_fillet([14, ylen, thickness]);
                    //hole for Z axis is thru this
                    cube_fillet([xlen, 15, thickness]);
                    //piece along cut side of the board
                    translate([-25,0,0]) cube_fillet([30, 5, thickness], radius=2);
                }
                //smooth rod hole
                translate([board_to_xz_distance,5+(smooth_bar_diameter/2),-1]) cylinder(h=board_thickness+2, r=(smooth_bar_diameter_horizontal/2));
                
                //side screw
                translate([-15, -5, 6.5]) rotate([-90, 0, 0]) screw_cylinder();
                //front screw
                
                translate([14, 20, thickness/2]) rotate([0, -90, 0]) screw_cylinder();
            }
        }
//color("red")cube([100,100,14],center=true);
    }
}

translate([0, -2, 0]) mirror([0,1,0]) zmotorholder();
//translate([0,2,0]) zmotorholder();

//translate([21,-59,0]) zrodholder();
translate([20,3,0]) rotate([0,0,180]) mirror([0,1,0]) zrodholder();
