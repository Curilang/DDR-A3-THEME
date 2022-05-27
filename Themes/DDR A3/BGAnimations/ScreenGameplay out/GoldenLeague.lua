local AnimationSleep = 1.2
-- local Cleared = math.random(1,2);

return Def.ActorFrame{
	Def.ActorFrame{
		StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
	};
	-- Def.ActorFrame{
		-- StartTransitioningCommand=function(s) s:sleep(AnimationSleep+0.035):queuecommand("Play") end,
		-- PlayCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","Announcer/Crowd X"))
								-- SOUND:PlayOnce(THEME:GetPathS("","Announcer/Crowd SN"))
								-- SOUND:PlayOnce(THEME:GetPathS("","Announcer/StageCleared "..Cleared)) 
		-- end,
	-- };
	Def.Sprite{
		Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/background"),
		InitCommand=function(s) s:FullScreen():SetAllStateDelays(0.09):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+0.035):linear(0.1):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
		OnCommand=function(s) 
			s:zoom(1.83):Center():diffusealpha(0):sleep(AnimationSleep+0.035):linear(0.2)
			s:zoom(1.63):diffusealpha(1):decelerate(0.7)
			s:zoom(1.33)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
		OnCommand = function(s) s:blend('BlendMode_Add')
			s:zoom(1.83):Center():diffusealpha(0):sleep(AnimationSleep+0.035):linear(0.2)
			s:zoom(1.63):diffusealpha(1):decelerate(0.7)
			s:zoom(1.33):diffusealpha(0)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
		InitCommand = function(s) s:FullScreen():diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+0.035):linear(0.1):diffusealpha(1) end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/circle"))..{
		InitCommand=function(s) s:xy(_screen.cx,_screen.cy-200):zoom(2.5):blend('BlendMode_Add'):spin():effectmagnitude(0,0,-10):diffusealpha(0) end,
		OnCommand=function(s) s:sleep(AnimationSleep+0.035):linear(0.3):diffusealpha(0.4) end, 
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"))..{
		InitCommand=function(s) s:Center() end,
		OnCommand=function(s) s:blend('BlendMode_Add');
			s:diffusealpha(0):sleep(AnimationSleep+0.035):linear(0.7):addx(100):addy(-60):diffusealpha(0.6):linear(0.7):addx(100):addy(-60):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"))..{
		InitCommand=function(s) s:Center() end,
		OnCommand=function(s) s:blend('BlendMode_Add')
			s:diffusealpha(0):sleep(AnimationSleep+0.035):linear(0.7):addx(-60):addy(-100):diffusealpha(0.6):linear(0.7):addx(-60):addy(-100):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"))..{
		InitCommand=function(s) s:Center() end,
		OnCommand=function(s) s:blend('BlendMode_Add')
			s:diffusealpha(0):sleep(AnimationSleep+0.035):linear(0.7):addx(100):addy(100):diffusealpha(0.6):linear(0.7):addx(100):addy(100):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+129):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):decelerate(0.4):addy(-10)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
		InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+129):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+129):rotationy(-180):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):decelerate(0.4):addy(-10)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
		InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+129):rotationy(-180):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx+347,_screen.cy-184):rotationy(-180):rotationz(-180):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):decelerate(0.4):addy(10)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
		InitCommand=function(s) s:xy(_screen.cx+347,_screen.cy-184):rotationy(-180):rotationz(-180):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
		InitCommand=function(s) s:xy(_screen.cx-347,_screen.cy-184):rotationz(-180):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):decelerate(0.4):addy(10)
		end,
	};
	LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
		InitCommand=function(s) s:xy(_screen.cx-347,_screen.cy-184):rotationz(-180):diffusealpha(0) end,
		OnCommand = function(s)
			s:zoom(1.167):sleep(AnimationSleep+0.035):diffusealpha(1):decelerate(0.8)
			s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
		end,
	};	
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,1.5);
	};
	LoadActor(THEME:GetPathB("ScreenGameplay","ready/bg"))..{
		InitCommand=function(s) s:Center():blend(('BlendMode_Add')) end,
		OnCommand=function(s) s:diffusealpha(0):zoom(1):sleep(AnimationSleep+0.035):linear(0.264):diffusealpha(1):zoom(0.667) end,
	};
	
	Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0):Center():Load(ClearedToLoad()) end,
		OnCommand=function(s) 
			s:sleep(AnimationSleep+0.035):diffusealpha(1):zoom(0)
			s:linear(0.1):zoom(0.418)
			s:linear(0.1):diffusealpha(1):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(1):zoomx(0.69):zoomy(0.71)
			s:linear(0.1):zoom(0.667)
		end,
	};
	Def.Sprite{
		InitCommand=function(s) s:diffusealpha(0):Center():Load(ClearedToLoad()) end,
		OnCommand=function(s) 
			s:sleep(AnimationSleep+0.035):diffusealpha(0):zoom(0)
			s:linear(0.1):zoom(1.2)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.62):zoomy(0.64)
			s:linear(0.1):diffusealpha(0.5):zoomx(0.72):zoomy(0.74)
			s:linear(0.1):diffusealpha(0):zoom(0.92)
		end,
	};
};