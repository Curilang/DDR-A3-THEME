return Def.ActorFrame{
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/background_red"),
		InitCommand=function(s) s:FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:sleep(0.3):linear(0.1):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/squares"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.14) end,
		OnCommand=function(s) s:sleep(0.3):linear(0.1):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0.14) end,	
		OnCommand=function(s) s:sleep(0.3):linear(0.1):diffusealpha(0) end,
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,1.5);
	};
	Def.ActorFrame{
		InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{ 
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+63):diffusealpha(1) end,
			OnCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_TOP+30):diffusealpha(0) end, 
		}; 
		LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{  
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-63):diffusealpha(1) end,
			OnCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_BOTTOM-30):diffusealpha(0) end, 
		}; 		
	};

	LoadActor(THEME:GetPathB("ScreenGameplay","failed/bg"))..{
		InitCommand=function(s) s:Center():blend(Blend.Add):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.1):zoomy(0)end,
	};
	Def.Sprite{	
		InitCommand=function(s) s:Center():zoom(0.667) end,
		OnCommand=function(s) s:Load(THEME:GetPathB("ScreenGameplay","failed/FAILED")):linear(0.09):zoomx(1):zoomy(0) end,
	};
};