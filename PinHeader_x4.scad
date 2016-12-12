include <openscad/pinheader.scad>

pin_width  = 2.54;
pin_height = 10;
pin_count  = 4;

translate([pin_width/2, 0, 0])
    pinheader(pin_width, pin_height, pin_count);