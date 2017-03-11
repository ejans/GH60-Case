use <MCAD/boxes.scad>
use <../snappy-reprap/joiners.scad>

$fa = 1;
$fs = 1;
//$fa = .1;
//$fs = .1;

ori_width_ext = 105;
ori_depth_ext = 295;
ori_width_int = 95;
ori_depth_int = 285;

tol = 0;

width_ext = 105 + tol;
depth_ext = 295 + tol;
height_ext = 15.6;
width_int = 95 + tol;
depth_int = 285 + tol;
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
hole_r = .8;

combo();

module combo() {
    case_joiners_left();
    translate([0, -15, 0])
    case_joiners_right();
}
module case_joiners_left() {
    difference() {
        case_left();
        width = width_ext;
        translate([-width/2,0,-7.8])cube([width, 10, 5]);
        translate([(width/2) -5,0,-5])cube([10, 5, 20]);
        translate([-((width/2) +5),0,-5])cube([10, 5, 20]);
    }
    translate([(width_ext/4), 0, -5.3])
    rotate([0,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);

    translate([-(width_ext/4), 0, -5.3])
    rotate([0,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);
    
    translate([-((width_ext/2)-2.5), 0, 2.5])
    rotate([0, 0, 180])
    half_joiner2(h=height_int, w=5, l=5, a=30);
    
    translate([+((width_ext/2)-2.5), 0, 2.5])
    rotate([0, 0, 180])
    half_joiner(h=height_int, w=5, l=5, a=30);
}
module case_joiners_right() {
    difference() {
        case_right();
        width = width_ext;
        translate([-width/2,-10,-7.8])cube([width, 10, 5]);
        translate([(width/2) -5,-5,-5])cube([10, 5, 20]);
        translate([-(width/2) -5,-5,-5])cube([10, 5, 20]);
    }
    translate([(width_ext/4), 0, -5.3])
    rotate([180,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);

    translate([-(width_ext/4), 0, -5.3])
    rotate([180,90,180])
    joiner(h=width_ext/2, w=5, l=10, a=30);
    
    translate([-((width_ext/2)-2.5), 0, 2.5])
    rotate([0, 0, 0])
    half_joiner(h=height_int, w=5, l=5, a=30);
    
    translate([+((width_ext/2)-2.5), 0, 2.5])
    rotate([0, 0, 0])
    half_joiner2(h=height_int, w=5, l=5, a=30);
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

    difference() {
        bak_complete();
        roundening(fillet1, height_ext, (width_ext/2) - fillet1, (depth_ext/2) - fillet1, 0);
        roundening(fillet1, height_ext, -(width_ext/2) +fillet1, (depth_ext/2) - fillet1, 90);
        roundening(fillet1, height_ext, (width_ext/2) -fillet1, -(depth_ext/2) + fillet1, -90);
        roundening(fillet1, height_ext, -(width_ext/2) +fillet1, -(depth_ext/2) + fillet1, -180);
    }
    studs();
    circlestuds();
    squarestuds();
    
}

module bak_complete() {
    difference() {
        bak();
        translate([(ori_width_int/2) + ((ori_width_ext - ori_width_int)/2),(ori_depth_int/2)-18.2,0])
        cube([(width_ext-width_int), 9, 6], center=true);
        translate([-0.7, (ori_depth_int/2) - 29.15, -5])
        cylinder(h=10, r=2, center=true);
    }
}
module bak() {
    difference() {
        //translate([0, 0, -height_ext/2])
        //roundedRect([width_ext, depth_ext, height_ext], fillet1, center=true);
        cube([width_ext, depth_ext, height_ext], center=true);
        translate([0, 0, (height_ext - height_int)/2])
        cube([width_int, depth_int, height_int], center=true);
    }
}
module studs() {
    
    translate([-9, (stud_b/2)-ori_depth_int/2, -1])
    rotate([0,0,90])
    stud(stud_b, stud_r, stud_h);
    
    translate([-9, -((stud_b/2)-ori_depth_int/2), -1])
    rotate([0,0,-90])
    stud(stud_b, stud_r, stud_h);
    
    translate([-((ori_width_int/2) - (stud_b_wide/2)), -48, -1])
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
    width_2 = ori_width_int/2;
    depth_2 = ori_depth_int/2;
    
    sqstd(64, 0, 0);
    sqstd(62, 0, -88);
    sqstd(82, 0, 0, ysign=-1);
    sqstd2(18, 17.6, -12);
    sqstd2(26, 17.6, -36);
    sqstd2(85, 17.6, -90);
    sqstd2(37, 17.6, 45, ysign=-1);
    sqstd2(18, 17.6, 17, ysign=-1);
    sqstd2(233, 17.6 + 19.3, -12);
    sqstd2(15, 17.6 + 19.3, 15, ysign=-1);
    sqstd2(265, 17.6 + 19.3 + 19.3, 20, ysign=-1);
    sqstd2(240, 17.6 + 19.3 + 19.3 + 19.3, 45, ysign=-1);
    sqstd2(17, 17.6 + 19.3 + 19.3 + 19.3, 10, ysign=-1);
}
module sqstd(b, x, y, xsign=+1, ysign=+1) {
    width_2 = ori_width_int/2;
    depth_2 = ori_depth_int/2;
    
    translate([xsign * (-(width_2 - (sstud_width/2))) + x, ysign * ((depth_2 - (b/2)) + y), -1])
    cube([sstud_width, b, stud_h], center=true);
}

module sqstd2(b, x, y, xsign=1, ysign=1) {
    width_2 = ori_width_int/2;
    depth_2 = ori_depth_int/2;
    
    translate([xsign * (-(width_2 - (sstud2_width/2))) + x, ysign * (depth_2 - (b/2)) + y, -1])
    cube([sstud2_width, b, stud_h], center=true);
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
module roundening(r, h, x, y, rot) {
    
    translate([x, y, 0])
    rotate([0, 0, rot])
    difference() {
        translate([(r/2)+1, (r/2)+1, 0])
        cube([r+2, r+2, h], center=true);
        cylinder(h=h, r=r, center=true);
    }
}