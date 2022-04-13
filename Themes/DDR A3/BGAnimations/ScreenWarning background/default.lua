return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#CC0000")):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):Center():sleep(1):linear(0.25):diffusealpha(1) end,
	};
	LoadActor(Model().."warning")..{
		InitCommand=function(s) s:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):Center():sleep(3):linear(0.25):diffusealpha(0) end,
		SOUND:StopMusic()
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(Color("White")):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):Center():sleep(0.5):linear(0.25):diffusealpha(0) end,
	};
};