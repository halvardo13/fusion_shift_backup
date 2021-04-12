//Create particle system
rain = part_system_create();
part_system_depth(rain,250);

//Create rain particle
rain_part = part_type_create();
part_type_shape(rain_part,pt_shape_line);
part_type_size(rain_part,0.05,0.1,0,0);
part_type_speed(rain_part,2.5,3.5,0,0);
part_type_direction(rain_part,210,210,0,2);
part_type_orientation(rain_part,210,210,0,0,true);
part_type_life(rain_part,300,340);
part_type_color_rgb(rain_part,192,192,203,203,220,220);

//Start emitter
rain_emitter = part_emitter_create(rain);
part_emitter_region(rain,rain_emitter,0,room_width+650,0,0,pt_shape_line,ps_distr_linear);
part_emitter_stream(rain,rain_emitter,rain_part,3);


