return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenHowToPlay","overlay/music.ogg"))..{
		OnCommand=function(s) s:sleep(0.5):play() end,
		OffCommand=function(s) s:stop() end,
	};
	
	LoadActor(THEME:GetPathB("ScreenHowToPlay","overlay/background"))..{
		InitCommand=function(s) s:FullScreen() end,
	};
	
	LoadActor(THEME:GetPathB("ScreenGameplay","decorations/ScreenFilter/single"))..{
		InitCommand=function(s) s:zoom(0.667):Center():diffusealpha(0.6) end,
	};
};