local t = Def.ActorFrame{};

if IsGoldenLeague() then
	t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			AnimCloseCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
			AnimOpenCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/background"),
			InitCommand=function(s) s:FullScreen():SetAllStateDelays(0.085):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:linear(0.1):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):sleep(0.2):linear(0.1):diffusealpha(0) end,
			AnimStandCommand=function(s) s:diffusealpha(1) end,
		};
		Def.Quad{
			InitCommand=function(s) s:diffuse(color("#1f2e45")):FullScreen():Center():diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:linear(0.1):diffusealpha(1) end,
			AnimFailedOpenCommand=function(s) s:diffusealpha(1):sleep(0.2):linear(0.1):diffusealpha(0) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"),
			InitCommand=function(s) s:Center():diffusealpha(0) end,
			AnimCloseCommand=function(s) 
				s:zoom(1.83):linear(0.2)
				s:zoom(1.63):diffusealpha(1):decelerate(0.7)
				s:zoom(1.33)
			end,
			AnimOpenCommand=function(s) s:zoom(1.33):diffusealpha(1):sleep(0.2):linear(0.1):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
			AnimStandCommand=function(s) s:zoom(1.33):diffusealpha(1) end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/stairs"),
			InitCommand=function(s) s:Center():blend('BlendMode_Add'):diffusealpha(0) end,
			AnimCloseCommand=function(s)
				s:zoom(1.83):linear(0.2)
				s:zoom(1.63):diffusealpha(1):decelerate(0.7)
				s:zoom(1.33):diffusealpha(0)
			end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/shadow"),
			InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
			AnimCloseCommand=function(s) s:linear(0.1):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):sleep(0.2):linear(0.1):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
			AnimStandCommand=function(s) s:diffusealpha(1) end,
		};
		LoadActor(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/circle"))..{
			InitCommand=function(s) s:xy(_screen.cx,_screen.cy-200):zoom(2.5):blend('BlendMode_Add'):spin():effectmagnitude(0,0,-10):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:sleep(0.035):linear(0.3):diffusealpha(0.4) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.4):sleep(0.2):linear(0.1):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.ActorFrame{
			InitCommand=function(s) s:Center():blend('BlendMode_Add'):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:diffusealpha(0):sleep(0.1):linear(0.7):diffusealpha(0.6):linear(0.7):diffusealpha(0) end,
			AnimOpenCommand=function(s) s:diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(100):addy(-60):linear(0.7):addx(100):addy(-60) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(-60):addy(-100):linear(0.7):addx(-60):addy(-100) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(100):addy(100):linear(0.7):addx(100):addy(100) end,
			};
			Def.Sprite{
				Texture=THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/dot"),
				AnimCloseCommand=function(s) s:sleep(0.1):linear(0.7):addx(-100):addy(100):linear(0.7):addx(-100):addy(100) end,
			};
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+119):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8):zoom(0.667) end,
			AnimOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(0.667):linear(0.25):addx(100):zoom(1):diffusealpha(0)
				s:sleep(0.1):addx(-100)
			end,
			AnimFailedCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8):zoom(0.667) end,
			AnimFailedOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(0.667):linear(0.25):addx(100):zoom(1):diffusealpha(0)
				s:sleep(0.1):addx(-100)
			end,
			AnimStandCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high")):zoom(0.667) end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx+186,_screen.cy+119):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
			AnimOpenCommand=function(s) s:zoom(1.167):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+119):rotationy(-180):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8):zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(0.667):linear(0.25):addx(-100):zoom(1):diffusealpha(0)
				s:sleep(0.8):addx(100)
			end,
			AnimFailedCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8):zoom(0.667)
			end,
			AnimFailedOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(0.667):linear(0.25):addx(-100):zoom(1):diffusealpha(0)
				s:sleep(0.8):addx(100)
			end,
			AnimStandCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high")):zoom(0.667) end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx-186,_screen.cy+119):rotationy(-180):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
			AnimOpenCommand=function(s) s:zoom(1.167):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx+347,_screen.cy-174):rotationy(-180):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8)
				s:zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(0.667):linear(0.25):addx(100):zoom(1):diffusealpha(0)
				s:sleep(0.8):addx(-100)
			end,
			AnimFailedCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8)
				s:zoom(0.667)
			end,
			AnimFailedOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(0.667):linear(0.25):addx(100):zoom(1):diffusealpha(0)
				s:sleep(0.8):addx(-100)
			end,
			AnimStandCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high")):zoom(0.667) end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx+347,_screen.cy-174):rotationy(-180):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
			AnimOpenCommand=function(s) s:zoom(1.167):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx-347,_screen.cy-174):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8):zoom(0.667)
			end,
			AnimOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high"))
				s:zoom(0.667):linear(0.25):addx(-100):zoom(1):diffusealpha(0)
				s:sleep(0.2):addx(100)
			end,
			AnimFailedCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8):zoom(0.667)
			end,
			AnimFailedOpenCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots medium"))
				s:zoom(0.667):linear(0.25):addx(-100):zoom(1):diffusealpha(0)
				s:sleep(0.2):addx(100)
			end,
			AnimStandCommand=function(s) s:diffusealpha(1):Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots high")):zoom(0.667) end,
		};
		Def.Sprite{
			InitCommand=function(s) s:xy(_screen.cx-347,_screen.cy-174):rotationz(-180):diffusealpha(0) end,
			AnimCloseCommand = function(s) s:Load(THEME:GetPathG("","_doors/GoldenLeague/"..GoldenLeague().."/boots low"))
				s:zoom(1.167):diffusealpha(1):decelerate(0.8)
				s:zoom(0.667):diffusealpha(0.7):linear(0.3):diffusealpha(0);
			end,
			AnimOpenCommand=function(s) s:zoom(1.167):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Quad{
			InitCommand=cmd(diffusealpha,0);
			AnimCloseCommand=cmd(sleep,2.3);
			AnimOpenCommand=cmd(sleep,1);
			AnimFailedCloseCommand=cmd(sleep,2.3);
			AnimFailedOpenCommand=cmd(sleep,1);
		};
	};
else
	t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			AnimCloseCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorClose")) end,
			AnimOpenCommand=function(s) SOUND:PlayOnce(THEME:GetPathS("","DoorOpen")) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Quad{
			InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:linear(0.1):diffusealpha(1) end,
			AnimOpenCommand=function(s) s:diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			InitCommand=function(s) s:diffusealpha(0) end,
			AnimCloseCommand=function(s) 
				s:Load(BackgroundCleared()):SetAllStateDelays(0.042):FullScreen()
				s:sleep(0.3):linear(0.1):diffusealpha(1) 
			end,
			AnimOpenCommand=function(s) 
				s:Load(BackgroundCleared()):SetAllStateDelays(0.042):FullScreen():diffusealpha(1)
				s:sleep(0.2):linear(0.2):diffusealpha(0)
			end,
			AnimFailedCloseCommand=function(s) 
				s:Load(THEME:GetPathG("","_doors/background_red")):SetAllStateDelays(0.042):FullScreen()
				s:linear(0.1):diffusealpha(1)
			end,
			AnimFailedOpenCommand=function(s) 
				s:Load(THEME:GetPathG("","_doors/background_red")):SetAllStateDelays(0.042):FullScreen():diffusealpha(1)
				s:sleep(0.2):linear(0.2):diffusealpha(0)
			end,
		};
		Def.Quad{
			InitCommand=function(s) s:FullScreen():diffuse(Color.Black):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:linear(0.1):diffusealpha(0.2) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.2):sleep(0.2):linear(0.2):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/lines"),
			InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:linear(0.1):diffusealpha(0.2) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.2):sleep(0.2):linear(0.2):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Sprite{
			Texture=THEME:GetPathG("","_doors/squares"),
			InitCommand=function(s) s:FullScreen():blend(('BlendMode_Add')):diffusealpha(0) end,
			AnimCloseCommand=function(s) s:linear(0.1):diffusealpha(0.14) end,
			AnimOpenCommand=function(s) s:diffusealpha(0.14):sleep(0.2):linear(0.2):diffusealpha(0) end,
			AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
			AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
		};
		Def.Quad{
			InitCommand=cmd(diffusealpha,0);
			AnimCloseCommand=cmd(sleep,2.3);
			AnimOpenCommand=cmd(sleep,1);
			AnimFailedCloseCommand=cmd(sleep,2.3);
			AnimFailedOpenCommand=cmd(sleep,1);
		};
		Def.ActorFrame{
			InitCommand=function(s) s:x(_screen.cx) end,	
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door up"))..{ 
				InitCommand=function(s) s:zoom(0.667):y(SCREEN_TOP+30):diffusealpha(0) end,
				AnimCloseCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_TOP+63):diffusealpha(1) end,
				AnimOpenCommand=function(s) s:y(SCREEN_TOP+63):diffusealpha(1):sleep(0.2):linear(0.2):y(SCREEN_TOP+30):diffusealpha(0) end,
				AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
				AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
			}; 
			LoadActor(THEME:GetPathG("","_doors/"..GetCurrentModel().."/door down"))..{  
				InitCommand=function(s) s:zoom(0.667):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
				AnimCloseCommand=function(s) s:sleep(0.3):linear(0.1):y(SCREEN_BOTTOM-63):diffusealpha(1) end,
				AnimOpenCommand=function(s) s:y(SCREEN_BOTTOM-63):diffusealpha(1):sleep(0.2):linear(0.2):y(SCREEN_BOTTOM-30):diffusealpha(0) end,
				AnimFailedCloseCommand=function(s) s:playcommand("AnimClose") end,
				AnimFailedOpenCommand=function(s) s:playcommand("AnimOpen") end,
			}; 		
		};
	};

end

return t;