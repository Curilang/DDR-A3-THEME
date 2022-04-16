return Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
	};
	LoadActor(THEME:GetPathB("","_door/scsh_back_black"))..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(0.3):linear(0.1):diffusealpha(1):sleep(0.6):linear(0.1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathB("","_door/"..Model().."scsh_back_01"))..{
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(0.9):linear(0.1):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathB("","_door/scsh_back_02"))..{
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(0.9):linear(0.1):diffusealpha(0.3) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathB("","_door/"..Model().."lines"),
		InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(0.9):linear(0.1):diffusealpha(0.2) end,
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,1.5);
	};
	Def.ActorFrame{
	InitCommand=function(s) s:x(_screen.cx) end,	
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_up"))..{ 
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_TOP+61):diffusealpha(1) end, 
		}; 
		LoadActor(THEME:GetPathB("","_door/"..Model().."door_down"))..{  
			InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_BOTTOM-61):diffusealpha(1) end, 
		}; 		
	};
};