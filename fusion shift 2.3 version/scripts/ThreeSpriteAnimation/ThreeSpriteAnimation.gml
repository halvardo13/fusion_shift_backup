///@desc ThreeSpriteAnimation
///@arg IdleSprite
///@arg	RunSprite
///@arg JumpSprite
function ThreeSpriteAnimation(argument0, argument1, argument2) {


	if (!place_meeting(x,y+1,oWall))
	{
		sprite_index = argument2;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else
	{
		if (sprite_index == argument2)
		{
		
		
		}
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = argument0;
		}
		else
		{
			sprite_index = argument1;
		}
	}



}
