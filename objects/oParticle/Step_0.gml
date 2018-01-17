/// @desc Particle going on

//Create particle system
snow = part_system_create();
part_system_depth(snow, 10)

//Create a snowflake particle
snowflake = part_type_create();
//part_type_shape(snowflake,pt_shape_snow);
part_type_sprite(snowflake,sSnow,false,false,false)
part_type_orientation(snowflake,0,0,0,0,1);
part_type_size(snowflake,0.3,0.5,0,0);
part_type_speed(snowflake,6,10,0,0);
part_type_direction(snowflake,270,270,0,1);
part_type_life(snowflake,1500,1900);

//Make it snow!
snow_emitter = part_emitter_create(snow);
part_emitter_region(snow,snow_emitter,-100,2200,-50,-50,ps_shape_ellipse,ps_distr_linear);
part_emitter_stream(snow,snow_emitter,snowflake,-500);
//part_emitter_destroy_all(snow);