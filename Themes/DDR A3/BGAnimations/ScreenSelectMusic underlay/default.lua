return Def.ActorFrame{
	LoadActor("background")..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1)  end,
	};
};