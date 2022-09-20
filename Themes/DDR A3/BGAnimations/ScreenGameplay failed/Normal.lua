local AnimationSleep = 0

return Def.ActorFrame{
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
	};
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorFailed")) end,
	};
	LoadActor(THEME:GetPathG("","_doors/background_black"))..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep):linear(0.1):diffusealpha(1):sleep(0.3):linear(0.1):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/background_red"),
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
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,2.5);
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
	LoadActor(THEME:GetPathB("ScreenGameplay","failed/bg"))..{
		InitCommand=cmd(x,_screen.cx;y,_screen.cy;blend,Blend.Add);
		OnCommand=function(s) s:diffusealpha(0):zoom(1):sleep(AnimationSleep+0.035):linear(0.264):diffusealpha(1):zoom(0.667) end,
	};
	Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0):Center():Load(THEME:GetPathB("ScreenGameplay","failed/FAILED")) end,
		OnCommand=function(s) 
			s:sleep(AnimationSleep+0.035):diffusealpha(1):zoom(0)
			s:linear(0.1):zoom(0.418)
			s:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
			s:linear(0.1):zoom(0.667)
		end,
	};
	Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0):Center():Load(THEME:GetPathB("ScreenGameplay","failed/FAILED")) end,
		OnCommand=function(s) 
			s:sleep(AnimationSleep+0.035):diffusealpha(0):zoom(0)
			s:linear(0.1):zoom(1.2)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
			s:linear(0.1):diffusealpha(0):zoom(0.92)
		end,
	};
};