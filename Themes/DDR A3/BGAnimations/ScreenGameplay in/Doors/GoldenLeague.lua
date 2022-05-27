return Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
	};
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#1f2e45")):FullScreen():Center():diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
		InitCommand=function(s) s:Center():zoom(1.33):diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
		InitCommand = function(s) s:FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/"..GetCurrentModel().."/lines"),
		InitCommand=function(s) s:FullScreen():diffusealpha(0.3) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/circle"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy-200):zoom(2.5):blend('BlendMode_Add'):spin():effectmagnitude(0,0,-10):diffusealpha(0.4) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+90):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.25):addx(100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+90):rotationy(-180):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.25):addx(-100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy-90):rotationy(-180):rotationz(-180):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.25):addx(100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy-90):rotationz(-180):zoom(0.667) end,
		OnCommand=function(s) s:linear(0.25):addx(-100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
		InitCommand = function(s) s:Center():vertalign(bottom):rotationz(0):zoom(0.667):addy(-105):blend('BlendMode_Add'):diffusealpha(0.5) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
		InitCommand = function(s) s:Center():vertalign(bottom):rotationz(90):zoom(0.667):addx(340):blend('BlendMode_Add'):diffusealpha(0.5) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
		InitCommand = function(s) s:Center():vertalign(bottom):rotationz(180):zoom(0.667):addy(105):blend('BlendMode_Add'):diffusealpha(0.5) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
		InitCommand = function(s) s:Center():vertalign(bottom):rotationz(270):zoom(0.667):addx(-340):blend('BlendMode_Add'):diffusealpha(0.5) end,
		OnCommand=function(s) s:linear(0.05):diffusealpha(0) end,
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX);
		Def.ActorFrame{
		OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP-30):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/"..Model().."door up"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+77):diffusealpha(1) end, 
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/squares"))..{
				InitCommand=function(s) s:zoom(0.445):y(SCREEN_TOP+15):diffusealpha(1) end,
			};	
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/light up"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_TOP+61):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_TOP+2):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_TOP+2):diffusealpha(1) end, 
			};
		};
		Def.ActorFrame{
		OnCommand=function(s) s:linear(0.25):y(SCREEN_TOP+30):diffusealpha(0) end,
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/"..Model().."door down"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-77):diffusealpha(1) end, 
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/squares"))..{
				InitCommand=function(s) s:rotationx(180):zoom(0.445):y(SCREEN_BOTTOM-15):diffusealpha(1) end,
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/light down"))..{
				InitCommand=function(s) s:zoom(0.447):y(SCREEN_BOTTOM-61):diffusealpha(0) end, 
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(339):y(SCREEN_BOTTOM-4):diffusealpha(1) end, 
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stars"))..{
				InitCommand=function(s) s:zoom(0.26):x(-339):y(SCREEN_BOTTOM-4):diffusealpha(1) end,
			};
		};
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/flare_center.png"))..{
		InitCommand=cmd(Center;FullScreen;blend,Blend.Add;diffusealpha,0.5);
		OnCommand=cmd(linear,0.25;diffusealpha,0;zoom,6*1);
	};
};