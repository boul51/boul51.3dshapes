
module pinheader(black_size=2.56, pin_height=10, pin_count=1)
{
    for (i = [0:pin_count-1]) {
        translate([(i-(pin_count-1)/2)*black_size, 0, 0]) pinheader_1(black_size, pin_height);
    }
}

module pinheader_1(black_size=2.56, pin_height=10)
{
    // Black plastic
    black_w = black_size;
    black_d = black_size;
    black_h = black_size;
    black_cut = 0.5;
    
    black_points = [ [black_cut, 0],
                     [black_w - black_cut, 0],
                     [black_w, black_cut],
                     [black_w, black_d - black_cut],
                     [black_w - black_cut, black_d],
                     [black_cut, black_d],
                     [0, black_d - black_cut],
                     [0, black_cut] ];
    
    color("DarkSlateGray") translate([-black_size/2, -black_size/2, 0]) linear_extrude(black_h) polygon(black_points);
    
    // Metallic part
    pin_w = 1;
    pin_d = 1;
    pin_low_part = 2;
    
    color("Gold") translate([-pin_w/2, -pin_d/2, -pin_low_part]) cube([pin_w, pin_d, pin_height + pin_low_part]);
}