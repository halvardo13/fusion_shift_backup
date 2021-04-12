alpha += 0.005;
if (alpha == 1.55) instance_destroy();

if (keyboard_check_pressed(vk_space)) instance_destroy();