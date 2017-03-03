use <MCAD/boxes.scad>
use <../snappy-reprap/joiners.scad>

//$fa = .01;
//$fs = .01;
$fa = .1;
$fs = .1;

width_ext = 105;
depth_ext = 295;
height_ext = 15.6;
width_int = 95;
depth_int = 285;
height_int = 10.6;
fillet1=5;
fillet2=3;

stud_b = 3.8;
stud_b_wide = 9.8;
stud_r = 3.5;
stud_h = 4;

sstud_width = 3;
sstud2_width = 2;

round_stud_r = 3;
hole_r = 1;

//case_joiners_left();
//translate([0, -15, 0])case_joiners_right();
//joiner_pair(spacing=50, h=10, w=5, l=20, a=30);
//half_joiner(h=15, w=5, l=5, a=30);
//!case_left();
//!case_right();
//case_joiners_left();
case_joiners_right();
module case_joiners_left() {
    difference() {
        case_left();
        width = width_ext;
        translate([-width/2,0,-7.8])cube([width, 5, 5]);
    }
    translate([(width_ext/4), 0, -5.3])
    rotate([0,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);

    translate([-(width_ext/4), 0, -5.3])
    rotate([0,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);
}
module case_joiners_right() {
    difference() {
        case_right();
        width = width_ext;
        translate([-width/2,-5,-7.8])cube([width, 5, 5]);
    }
    translate([(width_ext/4), 0, -5.3])
    rotate([180,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);

    translate([-(width_ext/4), 0, -5.3])
    rotate([180,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);
}
module case_left() {
    difference() {
        case();
        // Right part
        //translate([-250, 0, -250])
        // Left part
        translate([-250, -500, -250])
        cube([500, 500, 500]);
    }
}
module case_right() {
    difference() {
        case();
        // Right part
        translate([-250, 0, -250])
        cube([500, 500, 500]);
    }
}
module case() {

    bak_complete();
    studs();
    circlestuds();
    squarestuds();
    
}

module bak_complete() {
    difference() {
        bak();
        translate([(width_int/2) + ((width_ext - width_int)/2),(depth_int/2)-18.2,0])
        cube([(width_ext-width_int), 9, 6], center=true);
        translate([-0.7, (depth_int/2) - 29.15, -5])
        cylinder(h=10, r=2, center=true);
    }
}
module bak() {
    difference() {
        translate([0, 0, -height_ext/2])
        roundedRect([width_ext, depth_ext, height_ext], fillet1, center=true);
        translate([0, 0, (height_ext - height_int)/2])
        cube([width_int, depth_int, height_int], center=true);
    }
}
module studs() {
    
    translate([-9, (stud_b/2)-depth_int/2, -1])
    rotate([0,0,90])
    stud(stud_b, stud_r, stud_h);
    
    translate([-9, -((stud_b/2)-depth_int/2), -1])
    rotate([0,0,-90])
    stud(stud_b, stud_r, stud_h);
    
    translate([-((width_int/2) - (stud_b_wide/2)), -48, -1])
    stud(stud_b_wide, stud_r, stud_h);
}

module circlestuds() {
    
    translate([19.6, -117.55, -1])
    round_stud(round_stud_r, stud_h);
    
    translate([19.6, 117.3, -1])
    round_stud(round_stud_r, stud_h);
    
    translate([0.5, 14.3, -1])
    round_stud(round_stud_r, stud_h);
}

module squarestuds() {
    translate([-((width_int/2) - (sstud_width/2)), ((depth_int/2) - (64/2)), -1])
    cube([sstud_width, 64, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud_width/2)), ((depth_int/2) - (62/2)) - 88, -1])
    cube([sstud_width, 62, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud_width/2)), -((depth_int/2) - (82/2)), -1])
    cube([sstud_width, 82, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6, ((depth_int/2) - (18/2)) - 12, -1])
    cube([sstud2_width, 18, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6, ((depth_int/2) - (26/2)) - 36, -1])
    cube([sstud2_width, 26, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6, ((depth_int/2) - (85/2)) - 90, -1])
    cube([sstud2_width, 85, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6, -((depth_int/2) - (37/2)) + 45, -1])
    cube([sstud2_width, 37, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6, -((depth_int/2) - (18/2)) + 17, -1])
    cube([sstud2_width, 18, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6 + 19.3, ((depth_int/2) - (233/2)) - 12, -1])
    cube([sstud2_width, 233, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6 + 19.3, -((depth_int/2) - (15/2)) +15, -1])
    cube([sstud2_width, 15, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6 + 19.3 + 19.3, -((depth_int/2) - (265/2)) +20, -1])
    cube([sstud2_width, 265, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6 + 19.3 + 19.3 + 19.3, -((depth_int/2) - (240/2)) +45, -1])
    cube([sstud2_width, 240, stud_h], center=true);
    
    translate([-((width_int/2) - (sstud2_width/2)) + 17.6 + 19.3 + 19.3 + 19.3, -((depth_int/2) - (17/2)) + 10, -1])
    cube([sstud2_width, 17, stud_h], center=true);
}

module roundedRect(size, radius) {
    x = size[0];
    y = size[1];
    z = size[2];
    linear_extrude(height=z)
    hull() {
        // place 4 circles in the corners, with the given radius
        translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
        circle(r=radius);

        translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
        circle(r=radius);

        translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
        circle(r=radius);

        translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
        circle(r=radius);   
    }
}


module stud(b, r, h) {
//    b = 3.8;
//    r = 3.5;
//    h = 4;
    difference() {
        union() {
	    cube([b, r*2, h], center=true);
	    translate([b/2, 0, 0])
	    cylinder(h=h, r=r, center=true);
	}
	translate([b/2, 0, 0])
	cylinder(h=h, r=hole_r, center=true);
    }
}
module round_stud(r, h) {
    difference() {
        cylinder(h=h, r=r, center=true);
        cylinder(h=h, r=hole_r, center=true);
    }
}
