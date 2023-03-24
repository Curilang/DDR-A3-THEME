local AnimationSleep = BeginOutDelay()

return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_doors/background_black"))..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):diffusealpha(1):sleep(0.3):linear(0.1):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=BackgroundCleared(),
		InitCommand=function(s) s:FullScreen():SetAllStateDelays(0.032):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+0.3):linear(0.1):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/squares"))..{
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+0.3):linear(0.1):diffusealpha(0.14) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+0.3):linear(0.1):diffusealpha(0.14) end,
	};
	Def.ActorFrame{
	InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{ 
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):y(SCREEN_TOP+63):diffusealpha(1) end, 
		}; 
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{  
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):y(SCREEN_BOTTOM-63):diffusealpha(1) end, 
		}; 		
	};
};