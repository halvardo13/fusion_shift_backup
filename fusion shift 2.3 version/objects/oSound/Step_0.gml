//Set SFX Gain
audio_group_set_gain(SFX,global.SFX_gain,time_decay);

//Set MUSIC Gain
audio_group_set_gain(MUSIC,global.MUSIC_gain * (music_gain_start),time_decay);

//Music player
play_music_timer = max(play_music_timer - 1,0);
if (play_music == true) and (play_music_timer <= 0) {
	audio_play_sound(m_song,10,1);
	
	play_music = false;
}
music_gain_start = Approach(music_gain_start,1,0.015);





