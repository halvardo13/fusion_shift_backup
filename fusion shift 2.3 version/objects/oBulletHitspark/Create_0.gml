image_index = 0;
image_speed = 1;

var range_to_player = point_distance(x,y,oPlayer.x,oPlayer.y);

if (range_to_player <= 180) {
	if (!audio_is_playing(sfx_bullet_impact)) {
		audio_play_sound(sfx_bullet_impact,0,0);
	}
}