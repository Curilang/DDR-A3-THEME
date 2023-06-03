return Def.ActorFrame {
	Def.Quad{
		InitCommand=function(s) s:diffuse(Color("White")):FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:sleep(0.9):linear(0.25):diffusealpha(0) end,
	};
	LoadActor("Pane.png")..{ 
		InitCommand=function(s) s:Center():zoom(0.9):diffusealpha(0) end, 
		OnCommand=function(s) s:sleep(1):linear(0.25):diffusealpha(1) end,
		SOUND:StopMusic()
	};
};