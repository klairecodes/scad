include <BOSL2/std.scad>
include <hex-grid/hex-grid.scad>

Main_unit = 2; // cm

// Top of shelf dimensions
top_W = 19.5;
top_D = 15;
top_H = 0.5;

// Leg of shelf dimensions
leg_W = 0.5;
leg_D = 15;
leg_H = 13.3;

// Wall thickness
wall = 1;

module leg() {
    create_grid(size=[leg_H,leg_D,leg_W],SW=2,wall=0.5);
}

//mirror([0, 0, 1]) {
// top
color("blue")
translate([0, 0, 0.5 * top_H]) {
    create_grid(size=[top_W,top_D,top_H],SW=2,wall=0.5);
}

// center leg
translate([0,0,-0.5*leg_H]) {
	yrot(90) {
		leg();
	}
}

// right leg
color("green")
translate([top_W/2-0.25, 0, -0.5 * leg_H]) {
	yrot(90) {
		leg();
	}
}

// left leg
color("purple")
translate([-top_W/2+0.25, 0, -0.5 * leg_H]) {
	yrot(90) {
		leg();
	}
}
//}
