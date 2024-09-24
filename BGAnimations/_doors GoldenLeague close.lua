return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx+347,_screen.cy-184):rotationy(-180):rotationz(-180):diffusealpha(0) end,
		AnimCloseCommand = function(s)
			s:zoom(1.167):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):decelerate(0.4):addy(10)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
		InitCommand=function(s) s:xy(_screen.cx+347,_screen.cy-184):rotationy(-180):rotationz(-180):diffusealpha(0) end,
		AnimCloseCommand = function(s)
			s:zoom(1.167):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx-347,_screen.cy-184):rotationz(-180):diffusealpha(0) end,
		AnimCloseCommand = function(s)
			s:zoom(1.167):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):decelerate(0.4):addy(10)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
		InitCommand=function(s) s:xy(_screen.cx-347,_screen.cy-184):rotationz(-180):diffusealpha(0) end,
		AnimCloseCommand = function(s)
			s:zoom(1.167):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
		end,
	};	
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		AnimCloseCommand=cmd(sleep,1.75);
	};
};