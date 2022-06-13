return Def.ActorFrame{
	OnCommand=function(s) s:sleep(0.2):linear(0.1):diffusealpha(0) end,
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("#1f2e45")):FullScreen():Center():diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
		InitCommand=function(s) s:Center():zoom(1.33):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
		InitCommand = function(s) s:FullScreen() end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/circle"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy-240):zoom(3):blend('BlendMode_Add'):diffusealpha(0.3):spin():effectmagnitude(0,0,-10) end, 
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+186,_screen.cy+119) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(100):zoom(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx-186,_screen.cy+119):rotationy(-180) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(-100):zoom(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+347,_screen.cy-174):rotationy(-180):rotationz(-180) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(100):zoom(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx-347,_screen.cy-174):rotationz(-180) end,
		OnCommand=function(s) s:sleep(0.2):linear(0.15):addx(-100):zoom(1) end,
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