return Def.ActorFrame {
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/background"),
		InitCommand=function(s) s:FullScreen():SetAllStateDelays(0.085) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
		InitCommand=function(s) s:Center():zoom(1.33):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
		InitCommand = function(s) s:FullScreen() end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+186,_screen.cy+119) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx-186,_screen.cy+119):rotationy(-180) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx+347,_screen.cy-174):rotationy(-180):rotationz(-180) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:zoom(0.667):xy(_screen.cx-347,_screen.cy-174):rotationz(-180) end,
	};
};