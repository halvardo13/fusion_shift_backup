//Create particle system
snow = part_system_create();
part_system_depth(snow,50);

//Create rain particle
snow_part = part_type_create();
part_type_shape(snow_part,part_type_sprite(snow_part,sRainPart,false,true,false));
part_type_size(snow_part,0.75,1.25,0,0);
part_type_speed(snow_part,2,3,0,0);
part_type_direction(snow_part,200,200,0,0);
part_type_orientation(snow_part,200,200,0,0,true);
part_type_life(snow_part,300,340);

//Start emitter
snow_emitter = part_emitter_create(snow);
part_emitter_region(snow,snow_emitter,0,room_width+650,0,0,ps_shape_diamond,ps_distr_linear);
part_emitter_stream(snow,snow_emitter,snow_part,1);


