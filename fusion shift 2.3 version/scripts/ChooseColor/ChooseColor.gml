///@desc FlashShaderChooseColor(r,g,b,flash);
///Choose a RGB color for the shader to use, and set a flash type variable
///@arg Red
///@arg Green
///@arg Blue
///@arg flash
function ChooseColor(argument0, argument1, argument2, argument3) {

	var sh = shColorFlash;
	shader_set(sh);
	var shAlpha = shader_get_uniform(sh,"_alpha");
	shader_set_uniform_f(shAlpha, argument3);
	var _r = shader_get_uniform(sh,"_r");
	shader_set_uniform_f(_r, argument0);
	var _g = shader_get_uniform(sh,"_g");
	shader_set_uniform_f(_g, argument1);
	var _b = shader_get_uniform(sh,"_b");
	shader_set_uniform_f(_b, argument2);


}
