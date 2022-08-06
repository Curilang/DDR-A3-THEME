return Def.ActorFrame{
	Def.ActorFrame{
		Def.Quad{
			InitCommand=function(s) s:diffuse(color("#1f2e45")):FullScreen():Center():diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
			OnCommand=function(s) 
				s:zoom(1.83):Center():diffusealpha(0):sleep(0.1):linear(0.2)
				s:zoom(1.63):diffusealpha(1):decelerate(0.7)
				s:zoom(1.33)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"))..{
			OnCommand = function(s) s:blend('BlendMode_Add')
				s:zoom(1.83):Center():diffusealpha(0):sleep(0.1):linear(0.2)
				s:zoom(1.63):diffusealpha(1):decelerate(0.7)
				s:zoom(1.33):diffusealpha(0)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"))..{
			InitCommand = function(s) s:FullScreen() end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/"..GetCurrentModel().."/lines"),
			InitCommand=function(s)
				s:FullScreen():diffusealpha(0.3)
				local w = DISPLAY:GetDisplayWidth() / s:GetWidth();
				local h = DISPLAY:GetDisplayHeight() / s:GetHeight();
				s:customtexturerect(2,0.8,w,h);
				s:texcoordvelocity(0,1);
			end;
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/circle"))..{
			InitCommand=function(s) s:xy(_screen.cx,_screen.cy-200):zoom(2.5):blend('BlendMode_Add'):spin():effectmagnitude(0,0,-10) end,
			OnCommand=function(s) s:diffusealpha(0):linear(0.3):diffusealpha(0.4) end, 
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"))..{
			InitCommand=function(s) s:Center() end,
			OnCommand=function(s) s:blend('BlendMode_Add');
				s:diffusealpha(0):sleep(0.1):linear(0.7):addx(100):addy(-60):diffusealpha(0.6):linear(0.7):addx(100):addy(-60):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"))..{
			InitCommand=function(s) s:Center() end,
			OnCommand=function(s) s:blend('BlendMode_Add')
				s:diffusealpha(0):sleep(0.1):linear(0.7):addx(-60):addy(-100):diffusealpha(0.6):linear(0.7):addx(-60):addy(-100):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"))..{
			InitCommand=function(s) s:Center() end,
			OnCommand=function(s) s:blend('BlendMode_Add')
				s:diffusealpha(0):sleep(0.1):linear(0.7):addx(100):addy(100):diffusealpha(0.6):linear(0.7):addx(100):addy(100):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+100) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):decelerate(0.4):addy(-10)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+100) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+100):rotationy(-180) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):decelerate(0.4):addy(-10)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+100):rotationy(-180) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy-100):rotationy(-180):rotationz(-180) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):decelerate(0.4):addy(10)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy-100):rotationy(-180):rotationz(-180) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))..{
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy-100):rotationz(-180) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):decelerate(0.4):addy(10)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))..{
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy-100):rotationz(-180) end,
			OnCommand = function(s)
				s:zoom(1.167):sleep(0.28):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
			InitCommand = function(s) s:Center():vertalign(bottom):rotationz(0):zoom(0.367):blend('BlendMode_Add') end,
			OnCommand=function(s)
				s:sleep(0.06):decelerate(0.6):rotationz(720)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addy(-105):zoom(0.667)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
			InitCommand = function(s) s:Center():vertalign(bottom):rotationz(90):zoom(0.367):blend('BlendMode_Add') end,
			OnCommand=function(s)
				s:sleep(0.06):decelerate(0.6):rotationz(90+720)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addx(340):zoom(0.667)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
			InitCommand = function(s) s:Center():vertalign(bottom):rotationz(180):zoom(0.367):blend('BlendMode_Add') end,
			OnCommand=function(s)
				s:sleep(0.06):decelerate(0.6):rotationz(180+720)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addy(105):zoom(0.667)
			end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/arrow"))..{
			InitCommand = function(s) s:Center():vertalign(bottom):rotationz(270):zoom(0.367):blend('BlendMode_Add') end,
			OnCommand=function(s)
				s:sleep(0.06):decelerate(0.6):rotationz(270+720)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5)
				s:sleep(0.06):diffusealpha(0)
				s:sleep(0.06):diffusealpha(0.5):decelerate(0.2):addx(-340):zoom(0.667)
			end,
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(CenterX);	
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/door"))..{
			InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.68):linear(0.1):y(SCREEN_TOP+75):diffusealpha(1) end, 
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/door"))..{
				InitCommand=function(s) s:rotationz(180):zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
				OnCommand=function(s) s:sleep(0.68):linear(0.1):y(SCREEN_BOTTOM-75):diffusealpha(1) end, 
			};
		
		
		Def.ActorFrame{
			InitCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.9");effectperiod,0.47);
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/light"))..{
				InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
				OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_TOP+61):sleep(0.3):linear(0.2):diffusealpha(1) end, 
			};
			LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/light"))..{
				InitCommand=function(s) s:rotationz(180):zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
				OnCommand=function(s) s:sleep(0.6):linear(0.1):y(SCREEN_BOTTOM-61):sleep(0.3):linear(0.2):diffusealpha(1) end, 
			};
		};
	};
};