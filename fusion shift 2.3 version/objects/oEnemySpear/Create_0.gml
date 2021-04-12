global.enemyCount += 1;

myGun = instance_create_layer(x,y,"Other",oTrowingSpear);
with (myGun) ownerID = other.id;

stun_timer_set = 120;
stun_timer = stun_timer_set;

stunned = false;
for (var i = 0;i <= 2;i++) {
	star[i] = instance_create_layer(x,y,"Other",oStar);
	
	with (star[i]) {
		ownerID = other.id;
		if (i == 0) xPos = -8;
		if (i == 1) {
			xPos = 0; 
			yPos = -4;
		}
		if (i == 2) xPos = 8;
		
	}
}

shoot = false; 

tagged = false;
controled = false;
side_to = 1;

hp = 100;

//ySet = y-16;
//Outline shader
upixelW = shader_get_uniform(shOutline,"pixelW");
upixelH = shader_get_uniform(shOutline,"pixelH");

texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));

flash = 0;

//Control
hsp = 1;
vsp = 0;
grv = 0.125;
spd = 2;
spd2 = 0.5;

jumpHeight = 3.5;
jumpBuff = 0;

slide = 0;
slide_set = 1;
acRate = 0;
acRateSpd = 0.035;

xscale = 1;