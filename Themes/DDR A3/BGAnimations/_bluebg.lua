return Def.ActorFrame {
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/background_purple"),
		InitCommand=function(s) s:FullScreen():SetAllStateDelays(0.085) end,
	};
	Def.Quad{
		InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0.2) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.2) end,	
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/squares"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.14) end,
	};
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx) end,	
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{ 
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61) end, 
		};
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{ 
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61) end, 
		}; 
	};
};