return Def.ActorFrame{
	Def.ActorFrame{
		OnCommand=function(s) s:queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
	};
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/background"),
		InitCommand=function(s) s:FullScreen():diffusealpha(1) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
		InitCommand=function(s) s:Center():zoom(1.33):diffusealpha(1) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
		InitCommand = function(s) s:FullScreen() end,
		OnCommand=function(s) s:sleep(0.2):linear(0.1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+186,_screen.cy+119) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx-186,_screen.cy+119):rotationy(-180) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(-100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+347,_screen.cy-174):rotationy(-180):rotationz(-180) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(100):zoom(1):diffusealpha(0) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx-347,_screen.cy-174):rotationz(-180) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(-100):zoom(1):diffusealpha(0) end,
	};
};