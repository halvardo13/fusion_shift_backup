//Laod Audio Groups
audio_group_load(SFX);
audio_group_load(MUSIC);

time_decay = 250;

SFX_loaded = false;
MUSIC_loaded = false;

global.gain_SFX = 0;
global.gain_MUSIC = 0;

global.SFX_gain = 1;
global.MUSIC_gain = 1;

play_music_timer = 25;
play_music = true;

music_gain_start = 0;
