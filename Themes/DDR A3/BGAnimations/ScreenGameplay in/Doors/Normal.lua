return Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
	};
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
		OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP-30):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_TOP+2):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_TOP+2):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/light up"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61):diffusealpha(1) end, 
			};
			LoadActor(THEME:GetPathG("ScreenWithMenuElements","header/"..GetCurrentModel().."/base"))..{
				InitCommand=function(s) s:zoom(0.445):y(15):diffusealpha(1) end,
			};		
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/squares"))..{
				InitCommand=function(s) s:zoom(0.445):y(15):diffusealpha(1) end,
			};
		};
		
		Def.ActorFrame{
			OnCommand=function(s) s:linear(0.15):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/center_circle"))..{
				InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(0.5) end,
			};
			LoadActor(THEME:GetPathG("","_doors/center_outline"))..{
				InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(0.5) end,
			};
			LoadActor(THEME:GetPathG("","_doors/center_lines_up"))..{
				InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/center_lines_center"))..{
				InitCommand=function(s) s:zoom(0.447):y(_screen.cy-2.2):diffusealpha(1) end,
			};
		};
		
		Def.ActorFrame{
			OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_BOTTOM-4):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_BOTTOM-4):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/squares"))..{
				InitCommand=function(s) s:rotationx(180):zoomx(0.38):zoomy(0.3):y(SCREEN_BOTTOM-8):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/light down"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61):diffusealpha(1) end, 
			};
		};
		
	};
	LoadActor(THEME:GetPathG("","_doors/flare_center.png"))..{
			InitCommand=cmd(Center;FullScreen;blend,Blend.Add;diffusealpha,0.5);
			OnCommand=cmd(linear,0.45;diffusealpha,0;zoom,6*1);
		};
};