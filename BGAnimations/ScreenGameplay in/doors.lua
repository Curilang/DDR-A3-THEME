return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","DoorOpen")) .. {
		OnCommand=cmd(play);
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background"))..{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(linear,0.05;diffusealpha,0);
	};
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/"..Model().."lines"),
		InitCommand=function(s) s:FullScreen():diffusealpha(0.5) end,
		OnCommand=cmd(linear,0.05;diffusealpha,0);
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX);	
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_up"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end, 
		};
		LoadActor(THEME:GetPathB("","_door/center_circle"))..{
			InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(0.5) end,
			OnCommand=function(s) s:linear(0.15):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathB("","_door/center_line"))..{
			InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.15):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_TOP+2):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP-26):diffusealpha(0) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_TOP+2):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP-26):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."up lines"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end, 
		};
		LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/base"))..{
			InitCommand=function(s) s:zoom(0.445):y(15):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(-16):diffusealpha(0) end, 
		};		
		LoadActor(THEME:GetPathB("","_door/"..Model().."squares"))..{
			InitCommand=function(s) s:zoom(0.445):y(15):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(-16):diffusealpha(0)end, 
		};
		
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_down"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_BOTTOM-30):diffusealpha(0) end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_BOTTOM-4):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_BOTTOM+26):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."stars"))..{
			InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_BOTTOM-4):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_BOTTOM+26):diffusealpha(0) end,
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."squares"))..{
			InitCommand=function(s) s:rotationx(180):zoom(0.39):y(SCREEN_BOTTOM-8):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_BOTTOM+22):diffusealpha(0)end, 
		};
		LoadActor(THEME:GetPathB("","_door/"..Model().."down lines"))..{
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61):diffusealpha(1) end,
			OnCommand=function(s) s:linear(0.25):y(SCREEN_BOTTOM-30):diffusealpha(0) end, 
		};
	};
	LoadActor(THEME:GetPathB("","_door/cosh_burst_flare_blue.png"))..{
			InitCommand=cmd(Center;FullScreen;blend,Blend.Add;diffusealpha,0.5);
			OnCommand=cmd(linear,0.45;diffusealpha,0;zoom,6*1);
		};
};