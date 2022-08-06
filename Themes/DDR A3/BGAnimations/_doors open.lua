return Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
	};
	Def.Sprite{
		Texture=BackgroundEntry(),
		InitCommand=function(s) s:FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0.2) end,
		OnCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/squares"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.14) end,
		OnCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.14) end,	
		OnCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,1.5);
	};
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{ 
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+63):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.2):y(SCREEN_TOP+30):diffusealpha(0) end, 
		}; 
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{  
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-63):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.2):y(SCREEN_BOTTOM-30):diffusealpha(0) end, 
		}; 		
	};
};