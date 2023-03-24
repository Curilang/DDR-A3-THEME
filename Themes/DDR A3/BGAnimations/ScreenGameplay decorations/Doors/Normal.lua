return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background"))..{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(linear,0.05;diffusealpha,0);
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/"..GetCurrentModel().."/lines"),
		InitCommand=function(s) s:FullScreen():diffusealpha(0.5) end,
		OnCommand=cmd(linear,0.05;diffusealpha,0);
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX);	
		
		Def.ActorFrame{
		InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+61):diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP-30):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/top"));
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/upquad"));
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/lightup"));
		};
		
		Def.ActorFrame{
			InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2) end,
			OnCommand=function(s) s:linear(0.15):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/center_circle"))..{
				InitCommand=function(s) s:diffusealpha(0.5) end,
			};
			LoadActor(THEME:GetPathG("","_doors/center_outline"))..{
				InitCommand=function(s) s:diffusealpha(0.5) end,
			};
			LoadActor(THEME:GetPathG("","_doors/center_lines_up"))..{
				InitCommand=function(s) s:diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/center_lines_center"))..{
				InitCommand=function(s) s:diffusealpha(1) end,
			};
		};
		
		Def.ActorFrame{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-61):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_BOTTOM+30):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/bottom"));
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/downquad"));
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/ScreenStageInformation/lightdown"));
		};
		
	};
	LoadActor(THEME:GetPathG("","_doors/flare_center.png"))..{
		InitCommand=cmd(Center;FullScreen;blend,Blend.Add;diffusealpha,0.5);
		OnCommand=cmd(linear,0.45;diffusealpha,0;zoom,6*1);
	};
};