
blue_w  = 6.5; // x size
blue_h  = 7;   // y size
blue_d  = 2;   // z size
blue_dx = 1;   // angle cut x size
blue_dy = 1;   // angle cut y size

mobile_d = 2;  // mobile part z size
    
pin_w = 0.3;
rear_pin_offset = 0.5;

delta = (pin_w + blue_h - 5.08 - rear_pin_offset);
tr = 2.54 - (blue_h / 2 - delta + pin_w/2);
translate([0, -tr, 2.5])
{
translate([0, 0, blue_d/2])
    body_part(blue_w, blue_h, blue_d, blue_dx, blue_dy, "blue");
translate([0, 0, blue_d + mobile_d/2])
    mobile_part();

translate([2.54, -(blue_h+pin_w)/2, blue_d])
rotate([0, 0, -90])
pin3(pin_w, -delta, 2, 1, 3.5, 0.5);

translate([-2.54, -(blue_h+pin_w)/2, blue_d])
rotate([0, 0, -90])
pin3(pin_w, -delta, 2, 1, 3.5, 0.5);

translate([0, (blue_h+pin_w)/2 - rear_pin_offset , blue_d])
rotate([0, 0, -90])
pin3(pin_w, 0, 2, 1, 3.5, 0.5);
}

module pin3(w, dx, h1, h2, h3, d)
{
    pin_points = [ 
               [0, 0],
               [h1, 0],
               [h1+h2, dx],
               [h1+h2+h3, dx],
               [h1+h2+h3, dx+w],
               [h1+h2, dx+w],
               [h1, w],
               [0, w] ];
    
    rotate([90, 90, 0]) translate([0, -w/2, -d/2]) linear_extrude(d) polygon(pin_points);
}

module body_part(w, h, d, w_angle, h_angle, c)
{
    translate([-w/2, -h/2, -d/2])
    {
        color(c)
            linear_extrude(d)
                polygon(points=[[0, 0],
                                [0, h - h_angle],
                                [w_angle, h],
                                [w-w_angle, h],
                                [w, h-h_angle],
                                [w, 0]]);
    }
    //cube([5, 8, 2]);
}

module mobile_part()
{
    h = 2;
    r = 3.25;
    y_cut = 5;
    
    hole1_w = 4;
    hole1_h = 1;
    hole1_d = h;
    
    hole2_w = 0.7;
    hole2_h = 3;
    hole2_d = h/2;

    //translate([0, 0, h/2]) cube([hole_w, hole_h, h], true);

    difference() {
        cylinder(h, r, r, $fn=24, center = true);    
        translate([-r, -r - y_cut, -h/2]) cube([r*2, r*2, h]);
        translate([0, 0, (h - hole1_d)/2]) cube([hole1_w, hole1_h, hole1_d], true);
        translate([0, 0, (h - hole2_d)/2]) cube([hole2_w, hole2_h, hole2_d], true);
    }
}